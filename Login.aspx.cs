using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    mydb db = new mydb();
    string st = "";

    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnsave_Click(object sender, EventArgs e)
    {
        if (txt_Email.Text == "admin@gmail.com" && txt_Password.Text == "admin")
        {
            Session["AdminId"] = "AdminId";
            Response.Redirect("Add_Disable.aspx");
        }
        else
        {
            
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Login Failed');", true);
            
        }
    }
}