using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.net_Project.user
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cookies["username"].Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies["userid"].Expires = DateTime.Now.AddDays(-1d);
            Response.Redirect("~/user/Login.aspx");
        }
    }
}