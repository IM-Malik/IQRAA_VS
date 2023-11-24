using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IQRAA.pages
{
	public partial class TempList : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				string A = null;
				Session.Timeout = 1;
				if (Session["temp_list"] != null)
				{
					//A = Request.Cookies["temp_list"].Value.ToString();
					Label1.Text = "yes session";
					Bind();
				}
				if (Session["temp_list"] == null)
				{
					Label1.Text = "no session";
					//----
					//Response.Redirect("../Index.aspx?Err=Please Sign Up");
				}
			}
		}
		protected void Bind()
		{
			//lbl_author.Text = "asdf";
			if (Session["temp_list"] != null)
			{
				//GridView1.DataSource = Session["reading_list"];
				DataTable dt = (DataTable)Session["temp_list"];
				lbl_author.Text = dt.Rows[0]["author"].ToString();
				lbl_isbn13.Text = dt.Rows[0]["ISBN_13"].ToString();
				lbl_pages.Text = dt.Rows[0]["num_of_pages"].ToString();
				//GridView1.DataBind();
			}
				
		}

	}
}