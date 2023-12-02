using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IQRAA.pages
{
    public partial class Communities : System.Web.UI.Page
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["IQRAA_dbConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
			if (!IsPostBack)
			{
				var communityData = FetchCommunityData();
				var jsonCommunityData = Newtonsoft.Json.JsonConvert.SerializeObject(communityData);
				hdnCommunityData.Value = jsonCommunityData;
			}
		}

        private List<Community> FetchCommunityData()
        {
            List<Community> communities = new List<Community>();


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Communities";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Community community = new Community
                            {
                                Id = Convert.ToInt32(reader["community_id"]),
                                OwnerUserId = Convert.ToInt32(reader["owner_user_id"]),
                                Name = reader["name"].ToString(),
                                Base = reader["base"]?.ToString(),
                                Rating = reader["rating"] == DBNull.Value ? (float?)null : Convert.ToSingle(reader["rating"]),
                                Description = reader["description"]?.ToString(),
                                MemberCount = Convert.ToInt32(reader["member_count"])
                            };

                            communities.Add(community);
                        }
                    }
                }
            }

            return communities;
        }
    }

    public class Community
    {
        public int Id { get; set; }
        public int OwnerUserId { get; set; }
        public string Name { get; set; }
        public string Base { get; set; }
        public float? Rating { get; set; }
        public string Description { get; set; }
        public int MemberCount { get; set; }
    }
}