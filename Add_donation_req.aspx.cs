using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Add_donation_req : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    SqlDataReader dr;
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
        st = @"SELECT Donation_req_id,Donation_type,Description,Desc_pic,Handicap_id from Tbl_description where Handicap_id='" + Session["Handicap_id"] + "' ";
        db.fill_rptr_ret_sqlda(st, rpt);
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {

        string imgname = "";
        if (file.HasFile)
        {
            string ext = Path.GetExtension(file.PostedFile.FileName);
            file.SaveAs(Server.MapPath("~/Disable_image") + "\\" + DateTime.Now.ToString("ddMMyyyyhhmmss") + ext);
            imgname = "Disable_image/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + ext;
        }
        else
        {
            imgname = "Not Available";
        }


        st = "Insert into Tbl_description(Donation_type,Desc_pic,Description,Handicap_id)values";
        st += "('" + txtfname.Text + "','" + imgname + "','" + txtdescr.Text + "','" + Session["Handicap_id"] + "')";
        x = db.ExeQuery(st);
        if (x > 0)
        {
            txtfname.Text = txtdescr.Text = "";


            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Resgister Sucessfully');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Try Again');", true);
        }
        Fillrpt();
    }

    protected void rpt_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            st = "Delete from Tbl_description where Donation_req_id=" + e.CommandArgument;
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