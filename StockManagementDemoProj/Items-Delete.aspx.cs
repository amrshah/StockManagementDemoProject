using SMDPBusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagementDemoProj
{
    public partial class Items_Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request["id"]);

            bool success = new ItemHandler().DeleteItem(id);
            if (success)
                Response.Redirect("Items-List");

            throw new Exception("There was an error deleting this Item");

        }
    }
}