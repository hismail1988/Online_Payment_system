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
    public partial class UserRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                string username = txtUsername.Text;
                string password = txtPassword.Text;
                string email = txtEmail.Text;

                //string connectionString = ConfigurationManager.ConnectionStrings["Data Source=.;Initial Catalog=OnlinePaymentSystemDB;Integrated Security=True"].ConnectionString;
                string connectionString = "Data Source=.;Initial Catalog=OnlinePaymentSystemDB;Integrated Security=True";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string insertQuery = "INSERT INTO Users (Username, Password, Email) VALUES (@Username, @Password, @Email)";
                    SqlCommand command = new SqlCommand(insertQuery, connection);
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);
                    command.Parameters.AddWithValue("@Email", email);

                    connection.Open();
                    int result = command.ExecuteNonQuery();

                    if (result > 0)
                    {
                        // Registration successful, redirect to login page or any other page
                        Response.Redirect("UserAuthentication.aspx");
                    }
                    else
                    {
                        // Registration failed
                        // Handle the error or display a message
                    }
                }
            }
            catch (Exception ex)
            { }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserAuthentication.aspx");

        }
    }
}