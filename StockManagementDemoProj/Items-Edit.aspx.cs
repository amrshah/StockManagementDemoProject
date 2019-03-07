using SMDPBusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagementDemoProj.Pages.InventoryItems
{
    public partial class Items_Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {

                int id = int.Parse(Request["id"]);
                SMDPDataAccess.Item editItem = new ItemHandler().GetById(id);
                txtItemName.Text = editItem.Name;
                txtItemDescription.Text = editItem.Description;
            }
        }
        protected void Save_Item_Click(object sender, EventArgs e)
        {
            SMDPDataAccess.Item updateItem = new SMDPDataAccess.Item();
            updateItem.Id = int.Parse(Request["id"]);
            updateItem.Name = txtItemName.Text;
            updateItem.Description = txtItemDescription.Text;
            new ItemHandler().UpdateItem(updateItem);
        }
    }
}