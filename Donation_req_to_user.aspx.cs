using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


public partial class Donation_req_to_user : System.Web.UI.Page
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
        st = @"SELECT        Tbl_description.Donation_req_id, Tbl_description.Donation_type, Tbl_description.Description, Tbl_description.Desc_pic, Tbl_description.Handicap_id, Tbl_handicap.Name, Tbl_handicap.Mobilenumber, Tbl_handicap.Email, Tbl_handicap.Address, 
                         Tbl_handicap.Gender
FROM            Tbl_description INNER JOIN
                         Tbl_handicap ON Tbl_description.Handicap_id = Tbl_handicap.Handicap_id";
        db.fill_rptr_ret_sqlda(st, rpt);
    }
}