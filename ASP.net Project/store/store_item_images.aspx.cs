using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.net_Project.store
{
    public partial class store_item_images : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (0 == validPasswordToken())
                {
                    labelError.ForeColor = System.Drawing.Color.Red;
                    labelError.Text = "Store item not found";
                }
            }
        }

        private int tryLoadItemPictures() {

        }
    }
}