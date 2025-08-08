using System;
using System.Data;
using System.Collections;
using System.Configuration;
using System.Web;
using System.Drawing;
using System.Web.SessionState;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Collections.Generic;
using System.ComponentModel;
//using Microsoft.Office.Interop.Excel;
/// <summary>
/// Summary description for mydb
/// </summary>
public class mydb
{
    List<ListItem> list = new List<ListItem>();
    SqlDataAdapter sqlda;
    SqlCommand cm;
    public SqlConnection db;
    string cn = "";
    public static DataSet ds = new DataSet();
    SqlDataReader dr;
    int x;
    public mydb()
    {
        try
        {
            // cn = ConfigurationManager.AppSettings["con"];
            //db = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=" + HttpContext.Current.Server.MapPath("~/App_Data/") + "OnlineFood.mdf;Integrated Security=True;User Instance=True");
            //db = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\liberty\Documents\karthik.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
            //db = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\liberty\Documents\event.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
            //db = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\per\Documents\Digitalparking.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
            //db = new SqlConnection(@"Data Source=.;Initial Catalog=Handicap_proj;Integrated Security=True;MultipleActiveResultSets=true;");
            db = new SqlConnection(@"Data Source=.;Initial Catalog=Handicap_proj;Integrated Security=True;MultipleActiveResultSets=true;");
            if (db.State == ConnectionState.Open)
            {
                db.Close();
            }
            db.Open();
        }
        catch (Exception) { }
    }
   

    public void fill_grid(string st, GridView g1)
    {
        try
        {
            cm = new SqlCommand(st, db);
            sqlda = new SqlDataAdapter(cm);
            ds = new DataSet();
            ds.Tables.Clear();
            g1.DataSource = null;
            g1.DataBind();
            sqlda.Fill(ds, "tbl");
            g1.DataSource = ds.Tables["tbl"];
            g1.DataBind();
            db.Close();
        }
        catch (Exception) { }
    }
    
    public int filldl(string st, DataList d1)
    {
        try
        {
            cm = new SqlCommand(st, db);
            sqlda = new SqlDataAdapter(cm);
            ds = new DataSet();
            ds.Tables.Clear();
            d1.DataSource = null;
            d1.DataBind();
            sqlda.Fill(ds, "tbl");
            d1.DataSource = ds.Tables["tbl"];
            d1.DataBind();
        }
        catch (Exception ex)
        {
            string message = ex.Message.ToString();
        }
        return 1;

    }
    public int ExeQuery(string st)
    {
        try
        {
            if (db.State == ConnectionState.Closed)
            {
                db.Open();
            }
            cm = new SqlCommand(st, db);
            x = cm.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            string message = ex.Message.ToString();
        }
        return x;

    }

    public SqlDataReader fill_dropdown(string st, DropDownList drop)
    {
        try
        {
            if (db.State == ConnectionState.Closed)
            {
                db.Open();
            }
            cm = new SqlCommand(st, db);
            dr = cm.ExecuteReader();
            if (dr.HasRows == true)
            {
                while (dr.Read() == true)
                {
                    if (dr[0].ToString().Trim() != "" || dr[0].ToString().Trim().Length != 0)
                    {
                        drop.Items.Add(dr[0].ToString().Trim());
                    }
                }

            }
            dr.Dispose();
        }
        catch (Exception ex)
        {
            string message = ex.Message.ToString();
        }
        return dr;

    }
    
    public int chk_data(string st)
    {
        try
        {
            if (db.State == ConnectionState.Closed)
            { db.Open(); }
            cm = new SqlCommand(st, db);
            dr = cm.ExecuteReader();
            if (dr.Read() == true)
            {

                x = 1;
            }
            else
            {

                x = 0;
            }

            dr.Dispose();
        }
        catch (Exception ex)
        {
            string message = ex.Message.ToString();
        }
        return x;
    }
    public SqlDataReader readall(string st)
    {
        try
        {
            if (db.State == ConnectionState.Closed)
            { db.Open(); }
            cm = new SqlCommand(st, db);
            dr = cm.ExecuteReader();

        }
        catch (Exception ex)
        {
            string message = ex.Message.ToString();
        }
        return dr;

    }
    public SqlDataAdapter fill_rptr_ret_sqlda(string st, Repeater r1)
    {
        try
        {
            cm = new SqlCommand(st, db);
            sqlda = new SqlDataAdapter(cm);
            ds = new DataSet();
            ds.Tables.Clear();
            sqlda.Fill(ds, "tbl");
            r1.DataSource = null;
            r1.DataBind();
            r1.DataSource = ds.Tables["tbl"];
            r1.DataBind();
            db.Close();

        }
        catch (Exception ex)
        {
            string message = ex.Message.ToString();
        }
        return sqlda;
    }
    
   
    public void fill_drop_with_id(string st, DropDownList drop)
    {
        try
        {
            if (db.State == ConnectionState.Closed)
            { db.Open(); }
            cm = new SqlCommand(st, db);
            dr = cm.ExecuteReader();
            //try
            //{
            list.Clear();
            drop.Items.Clear();
            //}
            //catch (Exception ex) { } 
            while (dr.Read() == true)
            {
                if (dr[1].ToString() != "" || dr[1].ToString().Length != 0)
                {
                    list.Add(new ListItem(dr[1].ToString(), dr[0].ToString()));
                }
            }
            drop.DataSource = list;
            drop.DataTextField = "Text";
            drop.DataValueField = "Value";
            drop.DataBind();
            drop.Items.Insert(0, "Select");
            dr.Dispose();

        }
        catch (Exception ex)
        {
            string message = ex.Message.ToString();
        }
        db.Close();
    }
    public void fill_listbox_with_id(string st, ListBox drop)
    {
        try
        {
            if (db.State == ConnectionState.Closed)
            { db.Open(); }
            cm = new SqlCommand(st, db);
            dr = cm.ExecuteReader();
            list.Clear();
            drop.Items.Clear();
            while (dr.Read() == true)
            {
                if (dr[1].ToString() != "" || dr[1].ToString().Length != 0)
                {
                    list.Add(new ListItem(dr[1].ToString(), dr[0].ToString()));
                }
            }
            drop.DataSource = list;
            drop.DataTextField = "Text";
            drop.DataValueField = "Value";
            drop.DataBind();

            dr.Dispose();
            db.Close();
        }
        catch (Exception) { }
    }
   
}