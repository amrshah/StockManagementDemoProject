using SMDPBusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagementDemoProj
{
    public partial class Items_New : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Add_Item_Click(object sender, EventArgs e)
        {
            SMDPDataAccess.Item newItem = new SMDPDataAccess.Item();

            newItem.Name = txtItemName.Text;
            newItem.Description = txtItemDescription.Text;
            if(new ItemHandler().AddNewItem(newItem))
                txtItemName.Text = txtItemDescription.Text = "";
            
        }
    }
}