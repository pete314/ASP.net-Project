using System;
using System.Collections.Generic;
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
            string query = "INSERT INTO store_orders (user_id)" +
                            "VALUES(@USERID)";

        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            Request.Cookies["product_id"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("~/index.aspx");
        }
    }
}