using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace IQRAA
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request["Err"] != null)
                {
                    lbl_err.Text = Request["Err"].ToString();
                }

            }
        }

        protected void SignUptUser(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text;
            SqlDataSource1.SelectCommand = "SELECT email FROM Users WHERE email = @Email";
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv != null)
            {
                if (dv.Count > 0)
                {
                    lbl_err.Text = "Email already exist";
                    return;
                }
                else
                {
                    SqlDataSource1.InsertCommandType = SqlDataSourceCommandType.Text;
                    SqlDataSource1.InsertCommand = "INSERT INTO Users(password, email) VALUES (@Password, @Email)";
                    SqlDataSource1.InsertParameters.Add("Email", txt_email.Text);
                    string psw = txt_psw.Text;

                   /* byte[] psw_bytes = Encoding.ASCII.GetBytes(psw);
                    
                    SHA256 mySHA256 = SHA256.Create();
                    psw_bytes = mySHA256.ComputeHash(psw_bytes, 0, psw_bytes.Length);
                    string hashed_psw = BitConverter.ToString(psw_bytes);*/
                    

					SqlDataSource1.InsertParameters.Add("Password", psw);
                    SqlDataSource1.Insert();
                    try
                    {
                        HttpCookie cookie = new HttpCookie("user_email");
                        cookie.Value = txt_email.Text;
                        cookie.Expires = DateTime.Now.AddMinutes(1445);
                        //Response.Cookies.Add;
                        Response.Cookies.Add(cookie);

                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);

                    }
                    /*try
                    {
                        Session["email_session"] = txt_email.Text;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);

                    }*/
                    txt_email.Text = "";
                    txt_psw.Text = "";
                    Response.Redirect("~/pages/UserProfile.aspx");

                }
            }

        }
    }
}