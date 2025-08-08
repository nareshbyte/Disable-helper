using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Add_Disable : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    SqlDataReader dr;
    int x;
    string no;
    Random rnd = new Random();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Fillrpt();


        }
    }
    void Fillrpt()
    {
        st = @"SELECT * from Tbl_handicap";
        db.fill_rptr_ret_sqlda(st, rpt);
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        st = "Select Email from Tbl_handicap where Email='" + txtemailid.Text + "'";
        dr = db.readall(st);
        if (dr.Read())
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Email Id  Already Exists');", true);
        }
        else
        {
            st = "Insert into Tbl_handicap(Name,Mobilenumber,Email,Password,Address,Gender) values";
            st += "('" + txtfname.Text + "','" + txtmbnumber.Text + "','" + txtemailid.Text + "','" + txtpwd.Text + "','" + txtadress.Text + "','" + ddlgender.SelectedValue + "')";
            x = db.ExeQuery(st);
            if (x > 0)
            {
                txtfname.Text  = txtemailid.Text = txtmbnumber.Text = txtadress.Text = txtpwd.Text = "";
                ddlgender.ClearSelection();


                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Registration Sucessfully');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Try Again');", true);
            }
        }
    }

    protected void rpt_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            st = "Delete from Tbl_handicap where Handicap_id=" + e.CommandArgument;
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