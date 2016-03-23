using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ASP.net_Project.App_Code
{
    class StoreItemImgEntity
    {
        private int id;

        public int ID
        {
            get { return id; }
            set { id = value; }
        }
        private int storeItemId;

        public int StoreItemId
        {
            get { return storeItemId; }
            set { storeItemId = value; }
        }

        private string imagePath;

        public string ImagePath
        {
            get { return imagePath; }
            set { imagePath = value; }
        }

        private bool isDefault;

        public bool IsDefault
        {
            get { return isDefault; }
            set { isDefault = value; }
        }

    }
}
