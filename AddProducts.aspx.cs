using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
public partial class AddProducts : System.Web.UI.Page
{
    string st = "";
    mydb db = new mydb();
    SqlDataReader dr;
    int x;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Handicap_id"] == null)
        {
            Response.Redirect("Logout.aspx");
        }
        if (!IsPostBack)
        {
            Fillrpt();

            st = "Select CategoryId,CategoryName from TblCategory";
            db.fill_drop_with_id(st, ddlCategory);
        }
    }
    void Fillrpt()
    {
        st = @"SELECT        TOP (200) TblProducts.ProductId, TblProducts.ProductName, TblProducts.CategoryId,TblProducts.Handicap_id,TblProducts.Price, TblProducts.Qty, TblProducts.ProductDesc, TblProducts.PrdImg, TblCategory.CategoryName
FROM            TblProducts INNER JOIN
                         TblCategory ON TblProducts.CategoryId = TblCategory.CategoryId where TblProducts.Handicap_id='" + Session["Handicap_id"] + "'";
        db.fill_rptr_ret_sqlda(st, rpt);
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string imgname = "";
        if (file.HasFile)
        {
            string ext = Path.GetExtension(file.PostedFile.FileName);
            file.SaveAs(Server.MapPath("~/PrdImg") + "\\" + DateTime.Now.ToString("ddMMyyyyhhmmss") + ext);
            imgname = "PrdImg/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + ext;
        }
        else
        {
            imgname = "Not Available";
        }
        st = "Insert into TblProducts(ProductName,CategoryId,Price,ProductDesc,PrdImg,Handicap_id) values";
        st += "('" + txtPrdName.Text + "'," + ddlCategory.SelectedValue + "," + txtPrice.Text + ",'" + txtProdescri.Text + "','" + imgname + "'," + Session["Handicap_id"] + ")";
        x = db.ExeQuery(st);
        if (x > 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Product Added');", true);
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
            st = "Delete from TblProducts where ProductId=" + e.CommandArgument;
            x = db.ExeQuery(st);
            if (x > 0)
            {
                Image img = (Image)e.Item.FindControl("img");
                File.Delete(Server.MapPath(img.ImageUrl));

                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Product Deleted');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Try Again');", true);
            }
        }
        Fillrpt();
    }
}