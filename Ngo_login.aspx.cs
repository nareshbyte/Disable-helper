using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Ngo_login : System.Web.UI.Page
{
    mydb db = new mydb();
    string st = "";

    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        string st = "Select * from Tbl_handicap where Email='" + txt_Email.Text + "' and Password='" + txt_Password.Text + "' ";
        dr = db.readall(st);
        if (dr.Read())
        {
            Session["Handicap_id"] = dr["Handicap_id"].ToString();
            //Session["Email"] = dr["Email"].ToString();
            Response.Redirect("Add_donation_req.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Login Failed');", true);
        }
    }
}