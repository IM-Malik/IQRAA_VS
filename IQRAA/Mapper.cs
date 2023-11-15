using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace IQRAA
{
	public class Mapper
	{
		public static Book MapBook(DataView dv)
		{
			Book book = new Book();
			book.book_Id = (int)dv[0]["book_id"];
			book.ISBN_13 = dv[0]["ISBN_13"].ToString();
			book.ISBN_10 = dv[0]["ISBN_10"].ToString();
			book.Title = dv[0]["title"].ToString();
			book.Url = dv[0]["url"].ToString();
			book.Num_of_pages = (int)dv[0]["num_of_pages"];
			book.Author = dv[0]["author"].ToString();
			book.Publish_date = dv[0]["publish_date"].ToString();
			//book.Description = dv[0]["description"].ToString();
			book.ImageUrl_small = dv[0]["cover_small"].ToString();
			book.ImageUrl_medium = dv[0]["cover_medium"].ToString();
			book.ImageUrl_large = dv[0]["cover_large"].ToString();
			//book.Language = dv[0]["language"].ToString();
			//book.IsTranslated = (bool)dv[0]["is_translated"];
			return book;
		}
	}
}