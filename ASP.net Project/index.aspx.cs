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

        }

        protected void gvwProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvwProducts.SelectedRow;
            String productID = row.Cells[0].Text;
        }
    }
}