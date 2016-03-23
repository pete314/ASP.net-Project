using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel;

namespace ASP.net_Project.App_Code
{
    [DataObject(true)]
    public static class StoreItemImages
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IEnumerable GetImagesByItemId(int storeItemId)
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            string sel = "SELECT id, store_item_id, image_path, is_default "
                        + "FROM store_item_img where store_item_id = @STORE_ITEM_ID";
            SqlCommand cmd = new SqlCommand(sel, con);
            cmd.Parameters.AddWithValue("STORE_ITEM_ID", storeItemId);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            return dr;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IEnumerable GetImageById(string storeItemImageId)
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            string sel = "select id, store_item_id, image_path, is_default "
                + "from store_item_img where id = @ID";
            SqlCommand cmd = new SqlCommand(sel, con);
            cmd.Parameters.AddWithValue("ID", storeItemImageId);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            return dr;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IEnumerable GetProductsAboveBallance(int OnHand)
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            string sel = "SELECT ProductID, Name, "
                + "UnitPrice, OnHand "
                + "FROM Products "
                + "WHERE OnHand >= @OnHand "
                + "ORDER BY ProductID";
            SqlCommand cmd = new SqlCommand(sel, con);
            cmd.Parameters.AddWithValue("OnHand", OnHand);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            return dr;
        }
        /*
        private static List<StoreItemImgEntity> storeItemImagesList;

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<StoreItemImgEntity> GetProductsByPage(int startIndex, int maxRows)
        {
            storeItemImagesList = new List<StoreItemImgEntity>();
            SqlConnection con = new SqlConnection(GetConnectionString());
            string sel = "SELECT ProductID, Name, CategoryID, UnitPrice, OnHand "
                + "FROM Products ORDER BY Name";
            SqlCommand cmd = new SqlCommand(sel, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            StoreItemImgEntity storeItemImage;
            while (dr.Read())
            {
                storeItemImage = new StoreItemImgEntity();
                storeItemImage.ID = Convert.ToInt32(dr["id"].ToString());
                storeItemImage.StoreItemId = Convert.ToInt32(dr["store_item_id"].ToString());
                storeItemImage.ImagePath = dr["image_path"].ToString();
                storeItemImage.IsDefault = (Boolean)dr["is_default"];

                storeItemImagesList.Add(storeItemImage);
            }
            dr.Close();

            int rowCount = storeItemImagesList.Count;
            if (startIndex + maxRows > rowCount)
                maxRows = rowCount - startIndex;

            List<StoreItemImgEntity> storeItemList = new List<StoreItemImgEntity>();

            int rowIndex;

            for (int i = 0; i <= maxRows - 1; i++)
            {
                rowIndex = i + startIndex;
                storeItemList.Add(storeItemImagesList[rowIndex]);
            }

            return storeItemList;
        }

        public static int SelectCount()
        {
            return storeItemImagesList.Count;
        }
        
        */
        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings
                ["sergios_store_store_items_connection"].ConnectionString;
        }
    }
}