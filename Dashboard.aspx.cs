using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Payment_System
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRecentTransactions();
            }
        }
        protected void BindRecentTransactions()
        {
            try
            {
                //string connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
                string connectionString = "Data Source=.;Initial Catalog=OnlinePaymentSystemDB;Integrated Security=True";

                string query = "SELECT TOP 10 TransactionID, TransactionDate, Amount, Description FROM Transactions ORDER BY TransactionDate DESC";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();

                    adapter.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        rgRecentTransactions.DataSource = dt;
                        rgRecentTransactions.DataBind();
                    }
                    else
                    {
                        // No transactions found
                        // Handle accordingly, e.g., display a message
                    }
                }
            }
            catch(Exception ex)
            {

            }
        }

        protected void btngotoProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product.aspx");
        }

        protected void btngotoallTransactions_Click(object sender, EventArgs e)
        {
            Response.Redirect("Transactions.aspx");

        }
    }
}