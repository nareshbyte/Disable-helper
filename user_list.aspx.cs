using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class user_list : System.Web.UI.Page
{
    mydb db = new mydb();
    string st = "";
    int x;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Fillrpt();
        }

    }
    void Fillrpt()
    {
        st = "select * from Tbl_User";
        db.fill_rptr_ret_sqlda(st, rpt);
    }

    protected void rpt_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            st = "Delete from Tbl_User where User_id=" + e.CommandArgument;
            x = db.ExeQuery(st);
            if (x > 0)
            {

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