using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class User_login : System.Web.UI.Page
{
    mydb db = new mydb();
    string st = "";

    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        string st = "Select * from Tbl_User where Email_id='" + txt_Email.Text + "' and Password='" + txt_Password.Text + "'";
        dr = db.readall(st);
        if (dr.Read())
        {
            Session["User_id"] = dr["User_id"].ToString();
            //Session["Email"] = dr["Email"].ToString();
            Response.Redirect("Donation_req_to_user.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Login Failed');", true);
        }
    }
}