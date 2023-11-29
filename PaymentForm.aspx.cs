using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using Telerik.Web.UI;
using System.Data.SqlClient;
using Telerik.Documents.Media;

namespace Online_Payment_System
{
    public partial class PaymentForm : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                txtAmount.Text = Session["selectedPrice"].ToString();
            }
            catch (Exception ex)
            { }
        }
        protected void btnProcessPayment_Click(object sender, EventArgs e)
        {
            try
            {
                var _processPayment = ProcessPayment(txtCardNumber.Text, txtExpirationDate.Text, txtCVV.Text, Convert.ToDecimal(txtAmount.Text));
            }
            catch (Exception ex)
            { }
        }

        // Simulated payment processing (Replace this with your actual payment gateway integration)
        public async Task<bool> ProcessPayment(string cardNumber, string expirationDate, string cvv, decimal amount)
        {

            // Payment processing logic using hypothetical payment gateway API
            cardNumber = txtCardNumber.Text;
            expirationDate = txtExpirationDate.Text;
            cvv = txtCVV.Text;
            amount = Convert.ToDecimal(Session["selectedPrice"].ToString());
            // Call payment gateway API (simulated)
            PempoPaymentService PPS = new PempoPaymentService();

            bool paymentSuccess = await PPS.ProcessPayment(amount, cardNumber, expirationDate, cvv);


            if (paymentSuccess)
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Payment Successful!";

                string connectionString = "Data Source=.;Initial Catalog=OnlinePaymentSystemDB;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string insertQuery = "INSERT INTO Transactions (TransactionDate, Amount, Description) VALUES (@TransactionDate, @Amount, @Description)";
                    SqlCommand command = new SqlCommand(insertQuery, connection);
                    command.Parameters.AddWithValue("@TransactionDate", DateTime.Now.ToString());
                    command.Parameters.AddWithValue("@Amount", Session["selectedPrice"].ToString());
                    command.Parameters.AddWithValue("@Description", Session["selectedProductName"].ToString());

                    connection.Open();
                    int result = command.ExecuteNonQuery();
                }
                return true;

            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Payment Failed. Please try again.";
                return false;
            }
        }

    }
}
