using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeadphoneReview
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Roles.IsUserInRole(HttpContext.Current.User.Identity.Name, "Administrator"))
                Response.Redirect("~/");
        }

        protected void SelectedProductChanged(object sender, EventArgs e)
        {
            GridView gv = sender as GridView;
            if (gv != null)
            {
                ProductDetailView.PageIndex = gv.SelectedIndex;
            }
        }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView gv = sender as GridView;
            if (gv != null)
            {
                TableCell cell = gv.SelectedRow.Cells[0];
                if (cell != null)
                {
                    if (!Roles.IsUserInRole(cell.Text, "Administrator"))
                    {
                        Roles.AddUserToRole(cell.Text, "Administrator");
                        Response.Redirect("Administration.aspx");
                    }
                }
            }
        }
    }
}