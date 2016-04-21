using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.net_Project.user
{
    public partial class order_history : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["order_success"] != null)
                {
                    Request.Cookies["order_success"].Value = null;
                    labelError.ForeColor = System.Drawing.Color.Green;
                    labelError.Text = "Thanks for shoping at Sergio's, we received you order!";
                }
            }
        }
    }
}