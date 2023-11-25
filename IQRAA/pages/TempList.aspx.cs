using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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
				}
				else if (Session["temp_list"] == null)
				{
					Response.Redirect("../Index.aspx?Err=no session available");
				}
			}
		}
		protected void Bind()
		{
			DataTable dt = (DataTable)Session["temp_list"];
			if (Session["temp_list"] != null)
			{


				for (int i = 0; i < dt.Rows.Count; i++)
				{
					HtmlGenericControl div = new HtmlGenericControl("div");
					
					TextBox textBoxAuthor = new TextBox();
					textBoxAuthor.ID = "lbl_author" + i;
					textBoxAuthor.Text = dt.Rows[i]["author"].ToString();

					TextBox textBoxIsbn = new TextBox();
					textBoxIsbn.ID = "lbl_isbn13" + i;
					textBoxIsbn.Text = dt.Rows[i]["ISBN_13"].ToString();

					TextBox textBoxPages = new TextBox();
					textBoxPages.ID = "lbl_pages" + i;
					textBoxPages.Text = dt.Rows[i]["num_of_pages"].ToString();

					div.Controls.Add(textBoxAuthor);
					div.Controls.Add(textBoxIsbn);
					div.Controls.Add(textBoxPages);

					form1.Controls.Add(div);
				}
			}


		}
	}
}
