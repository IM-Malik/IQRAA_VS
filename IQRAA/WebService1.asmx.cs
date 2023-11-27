using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;

namespace IQRAA
{
	[WebService(Namespace = "http://IQRAA_API.com/")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
	[System.ComponentModel.ToolboxItem(false)]
	public class WebService1 : System.Web.Services.WebService
	{
		private string connectionString =
			System.Configuration.ConfigurationManager.ConnectionStrings["IQRAA_dbConnectionString"]
			.ConnectionString;

		[WebMethod]
		public string HelloWorld()
		{
			return "Hello World";
		}
		[WebMethod]
		public int Add(int a, int b)
		{
			return a + b;
		}

		[WebMethod]
		[ScriptMethod(ResponseFormat = ResponseFormat.Json)]

		public void FetchBook(string ISBN)
		{
			Dictionary<string, object> result = new Dictionary<string, object>();

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				string query = "";
				connection.Open();
				if (ISBN.Length == 13)
				{
					query = "SELECT book_id, ISBN_13, ISBN_10, title, url, author, num_of_pages, publish_date, cover_small, " +
						"cover_medium, cover_large FROM Books WHERE ISBN_13 = @ISBN";
				} else if (ISBN.Length == 10)
				{
					query = "SELECT book_id, ISBN_13, ISBN_10, title, url, author, num_of_pages, publish_date, cover_small, " +
						"cover_medium, cover_large FROM Books WHERE ISBN_10 = @ISBN";
				}

				using (SqlCommand command = new SqlCommand(query, connection))
				{
					command.Parameters.AddWithValue("@ISBN", ISBN);

					using (SqlDataReader reader = command.ExecuteReader())
					{
						if (reader.Read())
						{
							for (int i = 0; i < reader.FieldCount; i++)
							{
								result.Add(reader.GetName(i), reader.GetValue(i));
							}

							// Use Newtonsoft.Json to serialize the result dictionary to JSON
							string json = Newtonsoft.Json.JsonConvert.SerializeObject(result);

							// Set content type to JSON
							HttpContext.Current.Response.ContentType = "application/json";

							// Write the JSON string directly to the response
							HttpContext.Current.Response.Write(json);
						}
						else
						{
							HttpContext.Current.Response.Write("not found");
						}
					}
				}
			}
		}

		[WebMethod]
		public void FetchBooks_ByName(string book_name)
		{
			Dictionary<string, object> result = new Dictionary<string, object>();

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				connection.Open();

				string query = "SELECT book_id, ISBN_13, ISBN_10, title, url, author, num_of_pages, publish_date, cover_small, " +
					"cover_medium, cover_large FROM Books WHERE title LIKE @BookName";

				using (SqlCommand command = new SqlCommand(query, connection))
				{
					command.Parameters.AddWithValue("@BookName", book_name);

					using (SqlDataReader reader = command.ExecuteReader())
					{
						if (reader.Read())
						{
							for (int i = 0; i < reader.FieldCount; i++)
							{
								result.Add(reader.GetName(i), reader.GetValue(i));
							}

							// Use Newtonsoft.Json to serialize the result dictionary to JSON
							string json = Newtonsoft.Json.JsonConvert.SerializeObject(result);

							// Set content type to JSON
							HttpContext.Current.Response.ContentType = "application/json";

							// Write the JSON string directly to the response
							HttpContext.Current.Response.Write(json);
						}
						else
						{
							HttpContext.Current.Response.Write("not found");
						}
					}
				}
			}
		}

		[WebMethod]
		public void FetchCommunities_ByName(string community_name)
		{

		}
		[WebMethod]
		public void login_user(string email, string password)
		{
			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				connection.Open();

				string query = "insert";

				using (SqlCommand command = new SqlCommand(query, connection))
				{

				}
			}
		}



	}
}
