using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IQRAA.pages
{
	public partial class BookList2 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			
		}

		void FetchBook(object sender, EventArgs e)
		{
			/*string ConnectionString = ConfigurationManager.ConnectionStrings["IQRAAConnectionString"].ConnectionString;
			SqlConnection DbConnection = new SqlConnection(ConnectionString);
			DbConnection.Open();
			SqlCommand SqlCmd = new SqlCommand("SELECT * FROM Book WHERE BookID = 3", DbConnection);//@BookID
			SqlDataAdapter SqlDA = new SqlDataAdapter(SqlCmd);
			DataTable dt = new DataTable();
			SqlDA.Fill(dt);*/

			DataView dv = SqlDataSourceBook.Select(DataSourceSelectArguments.Empty) as DataView;
			Book k = Mapper.MapBook(dv);

			int g = (int)dv[0]["book_id"];
			
			//Book FetchedBook = new Book(dv[0]["book_id"], dv.);
			/*if (dv != null)
			{
				if(dv.Count > 0)
				{
					ISBN_13.Text = dv[0]["ISBN_13"].ToString();
					ISBN_10.Text = dv[0]["ISBN_10"].ToString();
				}
			}*/

			/*SqlDA.Dispose();
			SqlCmd.Dispose();
			DbConnection.Close();*/
		}

		protected void Unnamed1_Click(object sender, EventArgs e)
		{
			FetchBook(sender, e);
		}
	}
}