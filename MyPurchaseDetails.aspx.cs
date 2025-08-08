using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class MyPurchaseDetails : System.Web.UI.Page
{
    string st = "";
  mydb db = new mydb();
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_id"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (!IsPostBack)
        {
            st = @"SELECT TblPurchase.PurchaseId, TblPurchase.UserId, TblPurchase.ProductId, TblPurchase.Qty, TblPurchase.Price,TblPurchase.Qty * TblPurchase.Price as SubTotal, TblPurchase.PurchaseDate, TblPurchase.PurchaseStatus, TblProducts.ProductName,TblProducts.PrdImg 
                   FROM TblPurchase INNER JOIN   TblProducts ON TblPurchase.ProductId = TblProducts.ProductId
                   WHERE (TblPurchase.UserId = " + Session["User_id"] + ") AND (TblPurchase.PurchaseStatus = 'Confirmed')";
            db.fill_rptr_ret_sqlda(st, rpt);
            if (rpt.Items.Count == 0)
            {
                divresult.Visible = true;
                rpt.Visible = false;
            }
            else
            {
                divresult.Visible = false;
                rpt.Visible = true;
            }
        }
    }
}