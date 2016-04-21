using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.net_Project.store
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["order_success"] != null)
                {
                    labelError.ForeColor = System.Drawing.Color.Green;
                    labelError.Text = "Thanks for shoping at Sergio's, we received you order!";
                }
                else {
                    Response.Redirect("~/index.aspx");
                }
                Page.LoadComplete += new EventHandler(Page_LoadComplete);
                
            }
        }
        /// <summary>
        /// Remove the cookie after page is loaded so the checkout want be visible again
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        void Page_LoadComplete(object sender, EventArgs e)
        {
            Response.Cookies["order_success"].Expires = DateTime.Now.AddDays(-1d);
        }

    }
}