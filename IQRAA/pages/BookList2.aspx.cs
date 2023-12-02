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
				var bookLists = Fetch_Book_lists(cookie.Value);
                var jsonBookListData = Newtonsoft.Json.JsonConvert.SerializeObject(bookLists);
                hdnBookListData.Value = jsonBookListData;

            }
            else
			{
				Response.Redirect("../Index.aspx?Err=Please Login or Sign up");
			}
		}

       
        protected List<Dictionary<string, object>> Fetch_Book_lists(string user_email)
        {
            List<Dictionary<string, object>> bookListsCollection = new List<Dictionary<string, object>>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT Book_list_id, user_email, name, rank, progress FROM Book_list WHERE user_email = @Email";
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Email", user_email);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Dictionary<string, object> bookListInfo = new Dictionary<string, object>();
                            bookListInfo.Add("Book_list_id", reader["Book_list_id"]);
                            bookListInfo.Add("user_email", reader["user_email"]);
                            bookListInfo.Add("name", reader["name"]);
                            bookListInfo.Add("rank", reader["rank"]);
                            bookListInfo.Add("progress", reader["progress"]);

                            int bookListId = Convert.ToInt32(reader["Book_list_id"]);
                            List<Dictionary<string, object>> booksCollection = new List<Dictionary<string, object>>();

                            string query2 = "SELECT book_id, priority FROM Booklist_Books WHERE book_list_id = @ListId";
                            using (SqlCommand cmd2 = new SqlCommand(query2, connection))
                            {
                                cmd2.Parameters.AddWithValue("@ListId", bookListId);

                                using (SqlDataReader reader2 = cmd2.ExecuteReader())
                                {
                                    while (reader2.Read())
                                    {
                                        Dictionary<string, object> bookInfo = new Dictionary<string, object>();
                                        bookInfo.Add("book_id", reader2["book_id"]);
                                        bookInfo.Add("priority", reader2["priority"]);
                                        booksCollection.Add(bookInfo);
                                    }
                                }
                            }

                            bookListInfo.Add("books", booksCollection);
                            bookListsCollection.Add(bookListInfo);
                        }
                    }
                }
            }return bookListsCollection;

          
        }


    }
}