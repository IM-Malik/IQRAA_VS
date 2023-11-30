using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Text;
using System.Net;

namespace IQRAA.pages
{
	public partial class BookList2 : System.Web.UI.Page
	{
		private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["IQRAA_dbConnectionString"].ConnectionString;
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.Cookies["user_email"] != null)
			{
				HttpCookie cookie = Request.Cookies["user_email"];
				Fetch_Book_list(cookie.Value);
			}
			else
			{
				Response.Redirect("../Index.aspx?Err=Please Login or Sign up");
			}
		}

		protected void Fetch_Book_list(string user_email)
		{
			Dictionary<string, object> result = new Dictionary<string, object>();

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				connection.Open();
				string query = "SELECT Book_list_id, user_email, name, rank, progress FROM Book_list WHERE user_email = @Email";

				using (SqlCommand command = new SqlCommand(query, connection))
				{
					command.Parameters.AddWithValue("@Email", user_email);

					using (SqlDataReader reader = command.ExecuteReader())
					{
						if (reader.Read())
						{
							for (int i = 0; i < reader.FieldCount; i++)
							{
								result.Add(reader.GetName(i), reader.GetValue(i));
							}
							reader.Close();
							// Use Newtonsoft.Json to serialize the result dictionary to JSON
							string json = Newtonsoft.Json.JsonConvert.SerializeObject(result);

							// Set content type to JSON
							HttpContext.Current.Response.ContentType = "application/json";

							string books_in_Booklist = "SELECT book_list_id, book_id, priority FROM Booklist_Books WHERE book_list_id = @List_id";
							SqlCommand cmd = new SqlCommand(books_in_Booklist, connection);
							cmd.Parameters.AddWithValue("@List_id", 2/*result.ElementAt(0).Value*/);

							SqlDataReader rdr = cmd.ExecuteReader();

							var collection = new Dictionary<int, Dictionary<string, object>>();

							int counter = 0;
							while (rdr.Read())
							{
								collection[counter] = new Dictionary<string, object>();
								for (int i = 1; i < rdr.FieldCount; i++)
								{
									collection[counter].Add(rdr.GetName(i), rdr.GetValue(i));

								}
								counter++;

							}
								Console.WriteLine(collection.ToString());

							//HttpContext.Current.Response.Write("not found");

						}
					}
				}
			}
		}

	}
}