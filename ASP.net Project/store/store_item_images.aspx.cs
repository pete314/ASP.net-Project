using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using ASP.net_Project.App_Code;

namespace ASP.net_Project.store
{
    public partial class store_item_images : System.Web.UI.Page
    {
        private Dictionary<String, String> queries;

        private List<StoreItemImgEntity> storeItemImageList = new List<StoreItemImgEntity>();
        private int secureStoreItemId = 0;//code will be more fluent

        public int SecureStoreItemId
        {
            get { return secureStoreItemId; }
            set { secureStoreItemId = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            initDefaults();
            if (!IsPostBack)
            {
                if (0 == tryLoadItemPictures())
                {
                    labelError.ForeColor = System.Drawing.Color.Red;
                    labelError.Text = "Store item not found";
                }
            }
        }

        private void initDefaults() {
            queries = new Dictionary<string, string>();
            queries.Add("getItemImages", "SELECT id, store_item_id, image_path, is_default FROM store_item_img where store_item_id = @STORE_ITEM_ID");
            queries.Add("getStoreItem", "SELECT id FROM store_items where id = @STORE_ITEM_ID");
        }

        private int tryLoadItemPictures()
        {
            if (string.IsNullOrEmpty(Request.QueryString["pid"]))
                return 0;
            
            loadProductImages(Convert.ToInt32(Request.QueryString["pid"]));
            return tryLoadStoreItem(Convert.ToInt32(Request.QueryString["pid"]));
        }

        private int tryLoadStoreItem(int store_item_id)
        {
            string select = "";
            queries.TryGetValue("getStoreItem", out select);
            SqlConnection con = new SqlConnection(getConnectionString());
            SqlCommand cmd = new SqlCommand(select, con);
            cmd.Parameters.AddWithValue("STORE_ITEM_ID", store_item_id);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            
            while (dr.Read())
            {
                this.secureStoreItemId = Convert.ToInt32(dr["id"].ToString());
            }

            return secureStoreItemId;
        }

        private int loadProductImages(int store_item_id) {
            SqlConnection con = new SqlConnection(getConnectionString());
            //string sel = "SELECT id, store_item_id, image_path, is_default "
            //            + "FROM store_item_img where store_item_id = @STORE_ITEM_ID";
            string select = "";
            queries.TryGetValue("getItemImages", out select);
            SqlCommand cmd = new SqlCommand(select, con);
            cmd.Parameters.AddWithValue("STORE_ITEM_ID", store_item_id);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            StoreItemImgEntity sie;
            while (dr.Read()) {
                sie = new StoreItemImgEntity();
                sie.ID = Convert.ToInt32(dr["id"].ToString());
                sie.StoreItemId = Convert.ToInt32(dr["store_item_id"].ToString());
                sie.ImagePath = dr["image_path"].ToString();
                sie.IsDefault = (Boolean)dr["is_default"];
                storeItemImageList.Add(sie);
            }
            //if there are no items it means there are no images so nothing to show
            //does not mean there is no such store item :(
            return storeItemImageList.Count;
        }

        private String getConnectionString() {
            return @dsStoreItemImages.ConnectionString;
        }

    }
}