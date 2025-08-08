using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class view_donation : System.Web.UI.Page
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
        st = @"SELECT        tbl_donatiom.Donation_id, tbl_donatiom.Donation_des, tbl_donatiom.Donation_req_id, tbl_donatiom.Handicap_id, tbl_donatiom.User_id, Tbl_description.Donation_type, Tbl_description.Description, Tbl_description.Desc_pic, 
                         Tbl_handicap.Name, Tbl_handicap.Mobilenumber, Tbl_User.First_Name, Tbl_User.Last_Name, Tbl_User.Mob_no
FROM            tbl_donatiom INNER JOIN
                         Tbl_description ON tbl_donatiom.Donation_req_id = Tbl_description.Donation_req_id INNER JOIN
                         Tbl_handicap ON tbl_donatiom.Handicap_id = Tbl_handicap.Handicap_id INNER JOIN
                         Tbl_User ON tbl_donatiom.User_id = Tbl_User.User_id";
        db.fill_rptr_ret_sqlda(st, rpt);
    }
}