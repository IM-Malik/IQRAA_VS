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
	/// <summary>
	/// Summary description for WebService1
	/// </summary>
	[WebService(Namespace = "http://IQRAA_API.com/")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
	[System.ComponentModel.ToolboxItem(false)]

	// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
	// [System.Web.Script.Services.ScriptService]
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
				connection.Open();

				string query = "SELECT book_id, ISBN_13, ISBN_10, title, url, author, num_of_pages, publish_date, cover_small, " +
					"cover_medium, cover_large FROM Books WHERE ISBN_13 = @ISBN";

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
		public void insertUser(string email, string password)
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
