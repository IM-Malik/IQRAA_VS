using System;
using System.Collections.Generic;
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

		protected void insertUser(object sender, EventArgs e)
		{
			SqlDataSource1.InsertCommandType = SqlDataSourceCommandType.Text;
			SqlDataSource1.InsertCommand = "INSERT INTO Users(password, email) VALUES (@Password, @Email)";
			SqlDataSource1.InsertParameters.Add("Email", txt_email.Text);
			SqlDataSource1.InsertParameters.Add("Password", txt_psw.Text);
			SqlDataSource1.Insert();

			txt_email.Text = "";
			txt_psw.Text = "";
		}

		
	}
}