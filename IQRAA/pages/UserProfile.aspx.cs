using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IQRAA.pages
{
	public partial class UserProfile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text;
			SqlDataSource1.SelectCommand = "SELECT username, phone_number, email, image, user_id, bio FROM Users WHERE user_id = 2";//id = 1 is for testing purposes
			DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
			if (dv != null)
			{
				if (dv.Count > 0)
				{
					email.Text = dv[0]["email"].ToString();
					generated_id.Text = dv[0]["user_id"].ToString();
					//bio.Text = dv[0]["bio"].ToString();
					if (username.Text == "" && phone_num.Text == "")
					{
						if (dv[0]["username"] != DBNull.Value && dv[0]["phone_number"] != DBNull.Value)
						{
							phone_num.Text = dv[0]["phone_number"].ToString();
							username.Text = dv[0]["username"].ToString();
						}
					}
					else if (username.Text != "" && phone_num.Text == "")
					{

						if (dv[0]["phone_number"] != DBNull.Value)
						{
							phone_num.Text = dv[0]["phone_number"].ToString();
						}
					}
					else if (username.Text == "" && phone_num.Text != "")
					{
						if (dv[0]["username"] != DBNull.Value)
						{
							username.Text = dv[0]["username"].ToString();
						}
					}
					if (bio.Text == "")
					{
						if (dv[0]["bio"] != DBNull.Value)
						{
							bio.Text = dv[0]["bio"].ToString();
						}
					}
				}
			}
		}
		protected void update_profile(object sender, EventArgs e)
		{
			DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
			SqlDataSource1.UpdateCommand = "UPDATE Users SET username = @Username, phone_number = @Phone_Numbe, bio = @Bio WHERE (user_id = 2)";

			if (username.Text != "" && phone_num.Text == "")
			{
				SqlDataSource1.UpdateCommand = "UPDATE Users SET username = @Username WHERE user_id = 2";
				SqlDataSource1.Update();

			}
			else if (username.Text == "" && phone_num.Text != "")
			{
				SqlDataSource1.UpdateCommand = "UPDATE Users SET phone_number = @Phone_Number WHERE user_id = 2";
				SqlDataSource1.Update();

			}

			SqlDataSource1.Update();

		}
	}
}