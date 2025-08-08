using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
public partial class GuestImages : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {



        if (!IsPostBack)
        {
            st = @"Select * from TblProducts";
            db.fill_rptr_ret_sqlda(st, rpt);
            divSearch.Visible = false;


            st = "Select CategoryId,CategoryName  from TblCategory";
            db.fill_drop_with_id(st, ddlCategory);

            ddlCategory.Items.Insert(0, "All");
            ddlCategory.Items.Remove("Select");
        }
    }
  
    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddlCategory.SelectedItem.Text == "All")
        {
            st = "Select * from TblProducts";
            db.fill_rptr_ret_sqlda(st, rpt);
            if (rpt.Items.Count == 0)
            {
                divSearch.Visible = true;
                rpt.Visible = false;
            }
            else
            {
                divSearch.Visible = false;
                rpt.Visible = true;
            }
        }
        else
        {
            st = "Select * from TblProducts where CategoryId=" + ddlCategory.SelectedValue + "";
            db.fill_rptr_ret_sqlda(st, rpt);
            if (rpt.Items.Count == 0)
            {
                divSearch.Visible = true;
                rpt.Visible = false;
            }
            else
            {
                divSearch.Visible = false;
                rpt.Visible = true;
            }
        }
    }
}
