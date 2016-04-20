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
            int allowed = Convert.ToInt32(Session["userValidPopup"].ToString());//retreived value from session variable indicting if welcome popup was outputted

            //Check the cookies for username and password are set and that allowed is 0 (Meaning we havent shown any welcome popup)
            if (Request.Cookies["username"] != null && Request.Cookies["password"] != null && allowed == 0)
            {
                //If all is true then we can ouptu the welcome message with username retrieved from the cookie
                String username = Request.Cookies["username"].Value.ToString();     //Request the cookies value and show a popup
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Welcome", "<script>alert('Successful Login - Welcome "+username+"');</script>");
                Session["userValidPopup"] = 1;  //Update session variable to show popup was shown. It should not be shown again.
            }
        }

        protected void gvwProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Whenever new item is selected from the grid, get its product id
            GridViewRow row = gvwProducts.SelectedRow;
            String productID = row.Cells[0].Text;

            //Can add the product id to a cookie or session state variable here
            //Then redirect to Cians page. Cian should then use his page load event to retrieve this cookie and use the 
            //product id it holds to get product data from the database.
        }
    }
}
