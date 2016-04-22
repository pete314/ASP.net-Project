using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.net_Project
{
    public partial class store_items : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            string brand = brandTb.Text;
            string release = releaseTb.Text;
            string desc = descTb.Text;
            string model = modelTb.Text;
            string price = priceTb.Text;

            if (string.IsNullOrEmpty(brand) || string.IsNullOrEmpty(release) || string.IsNullOrEmpty(desc) || string.IsNullOrEmpty(model) || string.IsNullOrEmpty(price))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Insert item", "<script>alert('All fileds require valid values!');</script>");
            }
            else {
                //Create the Connection String
                using (SqlConnection connection = new SqlConnection())
                { //Create connection object
                    connection.ConnectionString = DBGateway();    //Give the conection objects, connection property the required connection string

                    //Create an SQL insert statement
                    String insertStmnt = "INSERT store_items ( brand, model, release, description, price, created) " +
                                            " VALUES ('" + brand + "', '" + model + "', '" + release + "', '" + desc + "', '" + price + "', (getdate()))";
                    
                    //create command object
                    SqlCommand insertCmnd = new SqlCommand();
                    insertCmnd.Connection = connection;         //set its Connection and CommandText properties
                    insertCmnd.CommandText = insertStmnt;

                    connection.Open();//open connection
                    int rowsAffected = insertCmnd.ExecuteNonQuery();//perform insert query
                    if (rowsAffected == 1)
                    {
                        Response.Redirect("~/store/store_items.aspx");
                    }
                    else {
                        labelReset.ForeColor = System.Drawing.Color.Red;
                        labelReset.Text = "Error while saving";
                    }
                }
            }
        }

        protected string DBGateway()
        {
            ConnectionStringSettings mySetting = ConfigurationManager.ConnectionStrings["sergios_store_store_items_connection"];
            if (mySetting == null || string.IsNullOrEmpty(mySetting.ConnectionString))
                throw new Exception("Fatal error: missing connecting string in web.config file");
            return mySetting.ConnectionString;
        }
    }
}