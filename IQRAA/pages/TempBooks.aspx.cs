using System;
using System.Collections.Generic;
using System.Data;
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
			if (!IsPostBack)
			{
				string A = null;
				Session.Timeout = 1;
				if (Request.Cookies["user_email"] != null)
				{
					A = Request.Cookies["user_email"].Value.ToString();
				}
				if (Session["email_session"] == null)
				{
					Response.Redirect("../Index.aspx?Err=Please Sign Up");
				}
			}
		}
		protected void Add_book_Click(object sender, EventArgs e)
		{
			SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text;
			SqlDataSource1.SelectCommand = "SELECT [book_id], [ISBN_13], [ISBN_10], [title], [url], [author], [num_of_pages], " +
				"[cover_small], [publish_date], [cover_medium], [cover_large], [translated], [language] FROM [Books] WHERE book_id = 3";
			DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
			if (dv != null)
			{
				if (dv.Count > 0)
				{
					
				}
			}
	}
}