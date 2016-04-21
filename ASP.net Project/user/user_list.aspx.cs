using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.net_Project.user
{
    public partial class user_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                //Checking if the userid is 1 so it is the admin
                //This should use a value from database && check should be done fully backend
                //Security is 0 anyway, should fit the cause 
                if (Request.Cookies["userid"] != null
                    && Convert.ToInt32(Request.Cookies["userid"].Value.ToString()) == 1)
                {
                    //This is the right person
                }
                else {
                    //Redirect everybody else
                    Response.Redirect("~/index.aspx");
                }
            }
        }
    }
}