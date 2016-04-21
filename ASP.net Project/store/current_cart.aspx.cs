using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.net_Project.store
{
    public partial class current_cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["product_id"] != null)
                {
                    string product_id = Request.Cookies["product_id"].Value.ToString();

                }
                else {
                    buyBtn.Visible = false;
                    clearBtn.Visible = false;
                    labelError.ForeColor = System.Drawing.Color.Red;
                    labelError.Text = "No items in cart";
                }
            }
        }

        protected void buyBtn_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["userid"] != null)
            {
                int user_id = Convert.ToInt32(Request.Cookies["userid"].Value.ToString());
                if (checkUser(user_id))
                {
                    //@todo: should validate that the product id actually exists
                    int product_id = Convert.ToInt32(Request.Cookies["product_id"].Value.ToString());

                    string insert_so_query = "INSERT INTO store_orders (user_id) " +
                                    "OUTPUT INSERTED.ID " +
                                    "VALUES(@USERID)";
                    string insert_soi_query = "insert into store_order_items (order_id, item_id, qty) " +
                                    "values(@ORDERID, @ITEMID, 1)";

                    using (SqlConnection connection = new SqlConnection())
                    {
                        connection.ConnectionString = DBGateway();
                        connection.Open();                                                    //open connection

                        SqlCommand insertCmd = new SqlCommand();                             //create command object and pass it the connection and command
                        insertCmd.Connection = connection;
                        insertCmd.CommandText = insert_so_query;
                        insertCmd.Parameters.AddWithValue("USERID", user_id);
                        var order_id = insertCmd.ExecuteScalar();

                        insertCmd = new SqlCommand();                             //create command object and pass it the connection and command
                        insertCmd.Connection = connection;
                        insertCmd.CommandText = insert_soi_query;
                        insertCmd.Parameters.AddWithValue("ORDERID", order_id);
                        insertCmd.Parameters.AddWithValue("ITEMID", product_id);
                        insertCmd.ExecuteNonQuery();
                        notifySuccess();// redirect the user to the checkout page which will confirm the order
                    }
                }
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "Welcome", "<script>alert('Please login to make a purchace');</script>");
        }

        protected void notifySuccess() {
            Request.Cookies["product_id"].Value = null;
            Response.Redirect("~/store/checkout.aspx");
        }

        protected bool checkUser(int user_id) {
            using (SqlConnection connection = new SqlConnection())
            {
                connection.ConnectionString = DBGateway();

                connection.Open();                                                    //open connection
                String selectStmnt = "SELECT id FROM users where id=@USERID";             //create select statement
                SqlCommand selectCmnd = new SqlCommand();                             //create command object and pass it the connection and command
                selectCmnd.Connection = connection;
                selectCmnd.CommandText = selectStmnt;
                selectCmnd.Parameters.AddWithValue("USERID", user_id);
                SqlDataReader reader = selectCmnd.ExecuteReader();                    //Excute command and get reader object back

                while (reader.Read())//loop over the data and search for valid username and password
                {
                    if (Convert.ToInt32(reader["id"].ToString()) == user_id)//if match is found
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        protected string DBGateway()
        {
            ConnectionStringSettings mySetting = ConfigurationManager.ConnectionStrings["sergios_store_store_items_connection"];
            if (mySetting == null || string.IsNullOrEmpty(mySetting.ConnectionString))
                throw new Exception("Fatal error: missing connecting string in web.config file");
            return mySetting.ConnectionString;
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            Request.Cookies["product_id"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("~/index.aspx");
        }
    }
}