using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Payment_System
{
    public partial class UserAuthentication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string username = txtLoginUsername.Text;
                string password = txtLoginPassword.Text;

                string connectionString = "Data Source=.;Initial Catalog=OnlinePaymentSystemDB;Integrated Security=True";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string selectQuery = "SELECT COUNT(*) FROM Users WHERE Username = @Username AND Password = @Password";
                    SqlCommand command = new SqlCommand(selectQuery, connection);
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);

                    connection.Open();
                    int count = (int)command.ExecuteScalar();

                    if (count > 0)
                    {
                        // Authentication successful, redirect to another page or dashboard
                        Response.Redirect("PaymentForm.aspx");
                    }
                    else
                    {
                        // Authentication failed
                        // Handle the error or display a message
                    }

                }
            }
            catch (Exception ex)
            { }
        }
    }
}
