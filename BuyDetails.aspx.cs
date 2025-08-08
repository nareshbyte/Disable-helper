using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
public partial class BuyDetails : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    SqlDataReader dr;
    int x;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_id"] == null)
        {
            Response.Redirect("Login.aspx?Id=" + Request.QueryString["Id"]);
        }
        if (Session["User_id"] != null)
        {
            divBankDetails.Visible = false;
            if (!IsPostBack)
            {
                st = @"Select * from TblProducts where ProductId=" + Request.QueryString["Id"];
                db.fill_rptr_ret_sqlda(st, rpt);
            }


            foreach (RepeaterItem item in rpt.Items)
            {
                Button BtnCart = (Button)item.FindControl("BtnCart");
                st = "Select * from TblPurchase where UserId=" + Session["User_id"] + " and ProductId=" + Request.QueryString["Id"] + " and PurchaseStatus='Pending'";
                dr = db.readall(st);
                if (dr.Read())
                {
                    BtnCart.Enabled = false;
                }
            }
        }
    }
    protected void rpt_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        DropDownList ddlQty = (DropDownList)e.Item.FindControl("ddlQty");
        Label lblPrice = (Label)e.Item.FindControl("lblPrice");
        if (e.CommandName == "Buy")
        {
            divBankDetails.Visible = true;
            divmenu.Visible = false;
        }

        if (e.CommandName == "Cart")
        {
            st = "Insert into TblPurchase(UserId,ProductId,Qty,Price,PurchaseDate,PurchaseStatus) values";
            st += "(" + Session["User_id"] + "," + Request.QueryString["Id"] + "," + ddlQty.SelectedValue + "," + lblPrice.Text + ",GETDATE(),'Pending')";
            x = db.ExeQuery(st);
            if (x > 0)
            {
                Response.Redirect("MyCart.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Try again');", true);
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        st = "Insert into TblPurchase(ProductId,UserId,PurchaseDate,Pincode,Address) values";
        st += "(" + Request.QueryString["Id"] + "," + Session["User_id"] + ",GETDATE()," + txtPinCode.Text + ",'" + txtAddress.Text + "')";
        int x = db.ExeQuery(st);
        if (x > 0)
        {
            Response.Redirect("MyPurchaseDetails.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Try again');", true);
        }
    }
}