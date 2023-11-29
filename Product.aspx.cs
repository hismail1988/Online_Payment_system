using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Telerik.Web.UI.Skins;

namespace Online_Payment_System
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts(); // Load products on initial page load
            }
        }

        protected void BindProducts()
        {
            try
            { 
            // Retrieve products from the database
            string connectionString = "Data Source=.;Initial Catalog=OnlinePaymentSystemDB;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("SELECT ProductId, ProductName, Price FROM Products", connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                radGridProducts.DataSource = dt;
                radGridProducts.DataBind();
            }
            }
            catch (Exception ex)
            { }
        }
  

        protected void radGridProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            { 
            GridDataItem selectedItem = radGridProducts.SelectedItems[0] as GridDataItem;

            if (selectedItem != null)
            {
                string selectedID = selectedItem["ProductId"].Text;
                string selectedProductName = selectedItem["ProductName"].Text;
                string selectedPrice = selectedItem["Price"].Text;
                Session["selectedProductName"] = selectedProductName;
                Session["selectedPrice"] = selectedPrice;

                // Do something with the selected row data (e.g., display in a label)
                // Label1.Text = "Selected ID: " + selectedID + "<br/>" + "Selected Product: " + selectedProductName + "<br/>" + "Selected Price: $" + selectedPrice;
                txtPrice.Text = selectedPrice;
                txtProductName.Text = selectedProductName;
            }
            }
            catch (Exception ex)
            { }
        }

        protected void btnPurchase_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserRegistration.aspx");
        }
    }
}