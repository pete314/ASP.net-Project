using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.net_Project.store
{
    public partial class store_category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvwProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Whenever new item is selected from the grid, get its product id
            GridViewRow row = gvwProducts.SelectedRow;
            String productID = row.Cells[1].Text;

            //Can add the product id to a cookie or session state variable here
            //Then redirect to Cians page. Cian should then use his page load event to retrieve this cookie and use the 
            //product id it holds to get product data from the database.
            Response.Cookies["product_id"].Value = productID;
            Response.Redirect("~/store/current_cart.aspx");
        }
    }
}