using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IQRAA
{
	public partial class Index : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void SignUptUser(object sender, EventArgs e)
		{
			SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text;
			SqlDataSource1.SelectCommand = "SELECT email FROM Users WHERE email = @Email";
			DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
			if (dv != null)
			{ 
				if (dv.Count > 0)
				{
					lbl_err.Text = "Email already exist";
					return;
				}
				else
				{
					SqlDataSource1.InsertCommandType = SqlDataSourceCommandType.Text;
					SqlDataSource1.InsertCommand = "INSERT INTO Users(password, email) VALUES (@Password, @Email)";
					SqlDataSource1.InsertParameters.Add("Email", txt_email.Text);
					SqlDataSource1.InsertParameters.Add("Password", txt_psw.Text);
					SqlDataSource1.Insert();

					txt_email.Text = "";
					txt_psw.Text = "";
					
					Response.Redirect("~/pages/UserProfile.aspx");
					
				}
			}
			
		}
	}
}