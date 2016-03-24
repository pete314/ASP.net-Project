using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.net_Project
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int allowed = Convert.ToInt32(Session["userValidPopup"].ToString());//retreived value indicting if welcome popup was outputted

            //if the popup was outputted and we have a username and password in cookies
            if (Request.Cookies["username"] != null && Request.Cookies["password"] != null && allowed == 0)
            {
                //Output welcom message containing users username
                String username = Request.Cookies["username"].Value.ToString();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Welcome", "<script>alert('Successful Login - Welcome "+username+"');</script>");
                Session["userValidPopup"] = 1;
            }
        }

        protected void gvwProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Whenever new item is selected from the grid, get its product id
            GridViewRow row = gvwProducts.SelectedRow;
            String productID = row.Cells[0].Text;

            //can add the productt id to a cookie or session state variable 
            //then redirect to Cians page
        }
    }
}