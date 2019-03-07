using SMDPBusinessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagementDemoProj
{
    public partial class ItemsWebFrm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack==false)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            gvItems.DataSource = new ItemHandler().GetAll();
            gvItems.DataBind();
        }
    }
}