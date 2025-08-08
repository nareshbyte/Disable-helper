using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class AddCategory : System.Web.UI.Page
{
    mydb db = new mydb();
    string st = "";
    
    SqlDataReader dr;
    int x;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminId"] == null)
        {
            Response.Redirect("Logout.aspx");
        }
        if (!IsPostBack)
        {
            Fillrpt();
        }
    }
    void Fillrpt()
    {
        st = "Select * from TblCategory";
        db.fill_rptr_ret_sqlda(st, rpt);
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        st = "Select CategoryName from TblCategory where CategoryName='" + txtCategory.Text + "'";
        dr = db.readall(st);
        if (dr.Read())
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Category Name Already Exists');", true);
        }
        else
        {
            st = "Insert into TblCategory(CategoryName) values('" + txtCategory.Text + "')";
            x = db.ExeQuery(st);
            if (x > 0)
            {
                txtCategory.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Added Category');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Try Again');", true);
            }
        }
        Fillrpt();
    }
    protected void rpt_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            st = "Delete from TblCategory where CategoryId=" + e.CommandArgument;
            x = db.ExeQuery(st);
            if (x > 0)
            {
                txtCategory.Text = "";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Deleted');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Try Again');", true);
            }
        }
        Fillrpt();
    }
}