using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class User_registration : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    SqlDataReader dr;
    int x;
    string no;
    Random rnd = new Random();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        st = "Select Email_id from Tbl_User where Email_id='" + txtemailid.Text + "'";
        dr = db.readall(st);
        if (dr.Read())
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Email Id  Already Exists');", true);
        }
        else
        {
            st = "Insert into Tbl_User(First_Name,Last_Name,Mob_no,Email_id,Password,Address,Gender) values";
            st += "('" + txtfname.Text + "','" + txtlname.Text + "','" + txtmbnumber.Text + "','" + txtemailid.Text + "','" + txtpwd.Text + "','" + txtadress.Text + "','" + ddlgender.SelectedValue + "')";
            x = db.ExeQuery(st);
            if (x > 0)
            {
                txtfname.Text = txtlname.Text = txtemailid.Text = txtmbnumber.Text = txtadress.Text = txtpwd.Text = "";
                ddlgender.ClearSelection();


                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Registration Sucessfully');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Try Again');", true);
            }
        }
    }
}