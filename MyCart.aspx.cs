using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyCart : System.Web.UI.Page
{
   mydb db = new mydb();
    string st = "";
    int x;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["User_id"] == null)
        {
            Response.Redirect("Logout.aspx");
        }
        if (!IsPostBack)
        {
            divBankDetails.Visible = false;
            divAddress.Visible = false;
            Divbank.Visible = false;
            DivCart.Visible = false;
            divBtn.Visible = false;

            st = @"SELECT TblPurchase.PurchaseId, TblPurchase.UserId, TblPurchase.ProductId, TblPurchase.Qty, TblPurchase.Price, 
                    TblPurchase.Qty * TblPurchase.Price AS SubTotal, TblPurchase.PurchaseDate, 
                         TblPurchase.PurchaseStatus, TblProducts.ProductName, TblProducts.PrdImg
FROM            TblPurchase INNER JOIN
                         TblProducts ON TblPurchase.ProductId = TblProducts.ProductId
WHERE        (TblPurchase.UserId = " + Session["User_id"] + ") AND (TblPurchase.PurchaseStatus = 'Pending')";
            db.fill_rptr_ret_sqlda(st, rpt);
            if (rpt.Items.Count == 0)
            {
                DivCart.Visible = false;
                divstatus.Visible = true;
            }
            else
            {
                DivCart.Visible = true;
                divstatus.Visible = false;
            }
        }
    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        int x = 0;
        if (DivCart.Visible == true)
        {
            divBankDetails.Visible = true;
            DivCart.Visible = false;

        }

    }
    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlType.SelectedItem.Text == "Cash On Delivery")
        {
            divAddress.Visible = true;
            Divbank.Visible = false;
            divBtn.Visible = true;
        }
        else if (ddlType.SelectedItem.Text == "Net Banking")
        {
            divAddress.Visible = false;
            Divbank.Visible = true;
            divBtn.Visible = true;
        }
    }

    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in rpt.Items)
        {
            HiddenField hfProductId = (HiddenField)item.FindControl("hfProductId");
            st = "Update TblPurchase set Address='" + txtAddress.Text + "',PinCode='" + txtCode.Text + "', PurchaseStatus='Confirmed' where PurchaseStatus='Pending' and ProductId=" + hfProductId.Value + "";
            x = db.ExeQuery(st);
        }
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