using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class mysale : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            st = @"SELECT        TblPurchase.PurchaseId, TblPurchase.UserId, TblPurchase.Qty, TblPurchase.Price, TblPurchase.PurchaseDate, TblPurchase.PurchaseStatus, TblPurchase.Address, TblPurchase.PinCode, TblProducts.ProductName, 
                         TblPurchase.Qty * TblPurchase.Price AS SubTotal, TblProducts.Handicap_id, TblProducts.PrdImg
FROM            TblProducts INNER JOIN
                         TblPurchase ON TblProducts.ProductId = TblPurchase.ProductId
                   WHERE (TblProducts.Handicap_id = " + Session["Handicap_id"] + ") AND (TblPurchase.PurchaseStatus = 'Confirmed')";
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