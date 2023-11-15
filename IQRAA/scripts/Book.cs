using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IQRAA
{
	public class Book
	{
		public int book_Id { get; set; }
		public string ISBN_13 { get; set; }
		public string ISBN_10 { get; set; }
		public string Title { get; set; }
		public string Url { get; set; }
		public int Num_of_pages { get; set; }
		public string Author { get; set; }
		public string Publish_date { get; set; }
		public string Description { get; set; }
		public string ImageUrl_small { get; set; }
		public string ImageUrl_medium { get; set; }
		public string ImageUrl_large { get; set; }
		public string Language { get; set; }
		public bool IsTranslated { get; set; }
		public Book() { 
		
		}

		

	}
}