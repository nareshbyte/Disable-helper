using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Donation : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    SqlDataReader dr;
    int x;
    string no;
    Random rnd = new Random();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    Fillrpt();


        //}

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string donateid = Request.QueryString["donation"].ToString();
        string handcp = Request.QueryString["handid"].ToString();
        st = "Insert into tbl_donatiom(Donation_des,Donation_req_id,Handicap_id,User_id) values";
        st += "('" + txtfname.Text + "','" + donateid.ToString() + "','" + handcp.ToString() + "','" + Session["User_id"] + "')";
        x = db.ExeQuery(st);
        if (x > 0)
        {
            txtfname.Text = "";


            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Thak You For Your Help');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Try Again');", true);
        }
    }
}