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
        {;
            string user_email = null;
            if (!IsPostBack)
            {
                if (Request.Cookies["user_email"] != null)
                {
					HttpCookie cookie = Request.Cookies["user_email"];
                    user_email = cookie.Value;
                }
                
            }


            SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text;
            SqlDataSource1.SelectCommand = "SELECT username, phone_number, email, image, user_id, bio FROM Users WHERE email = @USEREMAIL";
            SqlDataSource1.SelectParameters.Add("USEREMAIL", DbType.String, user_email);
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv != null)
            {
                if (dv.Count > 0)
                {
                    email.Text = dv[0]["email"].ToString();
                    generated_id.Text = dv[0]["user_id"].ToString();
					phone_num.Text = dv[0]["phone_number"].ToString();
					username.Text = dv[0]["username"].ToString();
					bio.Text = dv[0]["bio"].ToString();
					/*if (username.Text == "" && phone_num.Text == "")
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
                    if (dv[0]["image"] != DBNull.Value)
                    {
                        ProfilePicture.ImageUrl = dv[0]["image"].ToString();
                    }
                    else
                    {
                        // Set a default image if the imagePath is empty or null
                        ProfilePicture.ImageUrl = "media/images/default-image.png"; // Replace with your default image path
                    }*/
                    //media/images/Book100px.png
                }
            }
        }
        protected void update_profile(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            SqlDataSource1.UpdateCommand = "UPDATE Users SET username = @Username, phone_number = @Phone_Numbe, bio = @Bio WHERE (email = @Email)";

            if (username.Text != "" && phone_num.Text == "")
            {
                SqlDataSource1.UpdateCommand = "UPDATE Users SET username = @Username WHERE (email = @Email)";
                SqlDataSource1.Update();

            }
            else if (username.Text == "" && phone_num.Text != "")
            {
                SqlDataSource1.UpdateCommand = "UPDATE Users SET phone_number = @Phone_Number WHERE (email = @Email)";
                SqlDataSource1.Update();

            }

            SqlDataSource1.Update();

        }
        protected void ImageUploadButton_Click(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            if ((ImageUpload.PostedFile != null) && (ImageUpload.PostedFile.ContentLength > 0))
            {
                string fn = System.IO.Path.GetFileName(ImageUpload.PostedFile.FileName);
                string SaveLocation = "upload\\" + fn;
                string SaveAsLocation = Server.MapPath("upload") + "\\" + fn;
                try
                {
                    ImageUpload.PostedFile.SaveAs(SaveAsLocation);
                    FileUploadStatus.Text = "The image has been uploaded.";
                }
                catch (Exception ex)
                {
                    FileUploadStatus.Text = "Error: " + ex.ToString();
                }
                try
                {
                    SqlDataSource1.UpdateCommand = "UPDATE Users SET image = @ImageTest WHERE email = @Email";
                    SqlDataSource1.UpdateParameters.Add("ImageTest", DbType.String, SaveLocation);
                    SqlDataSource1.Update();
                    ProfilePicture.ImageUrl = SaveLocation;
                }
                catch (Exception ex)
                {
                    FileUploadStatus.Text = "Error: " + ex.Message;

                }
            }
            else
            {
                FileUploadStatus.Text = "Please select a image to upload.";
            }
        }
    }
}