using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IQRAA.pages
{
	public partial class TempBooks : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		protected void Add_to_List(string author, string isbn13, string pages)
		{
			DataTable dt;
			if (Session["temp_list"] == null)
			{
				dt = createTable();
				DataRow dr = dt.NewRow();
				dr["author"] = author;
				dr["ISBN_13"] = isbn13;
				dr["num_of_pages"] = pages;
				dt.Rows.Add(dr);
			}
			else
			{
				dt = (DataTable)Session["temp_list"];
				DataRow dr = dt.NewRow();
				dr["author"] = author;
				dr["ISBN_13"] = isbn13;
				dr["num_of_pages"] = pages;
				dt.Rows.Add(dr);
			}
			Session["temp_list"] = dt;

		}
		protected DataTable createTable()
		{
			DataTable dt = new System.Data.DataTable();
			DataColumn ISBN_13 = new DataColumn("ISBN_13");
			DataColumn author = new DataColumn("author");
			DataColumn num_of_pages = new DataColumn("num_of_pages");

			dt.PrimaryKey = new DataColumn[] { dt.Columns["ISBN_13"] };

			dt.Columns.Add(ISBN_13);
			dt.Columns.Add(author);
			dt.Columns.Add(num_of_pages);
			return dt;
		}
		protected void CartCount()
		{
			if (Session["temp_list"] != null)
			{
				DataTable dt = (DataTable)Session["temp_list"];
				if (dt != null)
				{
					lbl_add_err.Text = dt.Rows.Count + " : Items Added";
				}
			}
			else
			{
				lbl_add_err.Text = "No Items Added";
			}
		}

		protected void List_book_command(object source, EventArgs e)
		{
			if(((Button)source).ID == "Add_book1")
			{
				Add_to_List(author_C1.Text, ISBN_13_C1.Text, num_of_pages_C1.Text);
			} else
			{
				Add_to_List(author_C2.Text, ISBN_13_C2.Text, num_of_pages_C2.Text);
			}
			Response.Redirect("TempList.aspx");
		}
	}
}
