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
				Session.Timeout = 1;
				if (Session["temp_list"] != null)
				{
					Bind();
				} else if (Session["temp_list"] == null)
				{
					Response.Redirect("../Index.aspx?Err=no session available");
				}
			}
		}
		protected void Bind()
		{
			if (Session["temp_list"] != null)
			{
				DataTable dt = (DataTable)Session["temp_list"];
				lbl_author.Text = dt.Rows[0]["author"].ToString();
				lbl_isbn13.Text = dt.Rows[0]["ISBN_13"].ToString();
				lbl_pages.Text = dt.Rows[0]["num_of_pages"].ToString();
			}	
		}
	}
}