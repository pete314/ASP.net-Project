﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.net_Project
{
    public partial class forgotten_password : System.Web.UI.Page
    {
        //Holding the link to the password reset page
        const string PASSWORD_SET_PAGE= "/user/set_password.aspx?token=";
        const string DEFAULT_SENDER_ACCOUNT = "segios.gmit@gmail.com";
        const string DEFAULT_SENDER_PASSWORD = "Hfl8375uQ4nRJfdvy54mueG";
        const Boolean DEBUG = true;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        /// <summary>
        /// Author: Peter Nagy
        /// Description: Handle password reset button click, if valid send reset token to registered email
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnPassReset_Click(object sender, EventArgs e)
        {
            if (!validEmail(email.Text)) {
                labelReset.ForeColor = System.Drawing.Color.Red;
                labelReset.Text = "Not valid email!";
                return;
            }

            //Insted complex try cache :)
            using (SqlConnection connection = new SqlConnection(@dsStoreUsers.ConnectionString))
            {
                SqlCommand sqlCmd = new SqlCommand("spResetPassword", connection);
                sqlCmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramUsername = new SqlParameter("@UserEmail", email.Text);
                sqlCmd.Parameters.Add(paramUsername);
                connection.Open();

                SqlDataReader sqlDataReader = sqlCmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    if (Convert.ToBoolean(sqlDataReader["ReturnCode"]))
                    {
                        sendEmailNotification(sqlDataReader["Email"].ToString(), sqlDataReader["Name"].ToString(), sqlDataReader["Token"].ToString());
                        labelReset.ForeColor = System.Drawing.Color.Green;
                        labelReset.Text = "Email sent to you with instructions";
#if DEBUG
                        labelReset.Text = "<br>Token: " + sqlDataReader["Token"].ToString();
#endif
                    }
                    else
                    {
                        labelReset.ForeColor = System.Drawing.Color.Red;
                        labelReset.Text = "Email not found!";
                    }
                }
            }
        }

        /// <summary>
        /// Author: Peter Nagy
        /// Description: Simple validation of email address
        /// </summary>
        /// <param name="email">Address to check</param>
        /// <returns>true if valid</returns>
        protected bool validEmail(string email) {
            try{
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }catch{
                return false;
            }
        }

        /// <summary>
        /// Author: Peter Nagy
        /// Description: Send user notification email for password reset
        /// </summary>
        /// <param name="userEmailAddress">Registered user email address</param>
        /// <param name="userName">The user name belonging to email</param>
        /// <param name="token">The generated password reset token</param>
        protected void sendEmailNotification(string userEmailAddress, string userName, string token) {
            MailMessage mailMessage = new MailMessage(DEFAULT_SENDER_ACCOUNT, userEmailAddress);
            mailMessage.IsBodyHtml = true;
            mailMessage.Body = createEmailPasswordTokenTemplate(userName, token, true);
            mailMessage.Subject = "Sergio's store - password reset token";
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = DEFAULT_SENDER_ACCOUNT,
                Password = DEFAULT_SENDER_PASSWORD
            };

            smtpClient.EnableSsl = true;
            try
            {
                smtpClient.Send(mailMessage);
            }
            catch {
                 //Most likely there is no usable network connection or wrong credentials
            }
        }

        /// <summary>
        /// Author: Peter Nagy
        /// Description: Generate html email template with dynamic values
        /// </summary>
        /// <param name="userName">User the email is sent to</param>
        /// <param name="token">Token issed to user</param>
        /// <param name="withLink">True - link will be generated from the current site</param>
        /// <returns>String email template</returns>
        protected String createEmailPasswordTokenTemplate(string userName, string token, Boolean withLink = false) {
            StringBuilder emailTemplate = new StringBuilder();
            emailTemplate.Append("Hello ").Append(userName).Append("!").Append("<br>");
            emailTemplate.Append("You started a password reset, a token was issued to you:").Append("<br>");
            emailTemplate.Append("<strong>").Append(token).Append("</strong><br><br>");
            emailTemplate.Append("<i>In order to set a new password use this token on the set password page</i><br>");
            if (withLink)
                emailTemplate.Append("Password set is available on: ")
                    .Append(HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority))
                    .Append(PASSWORD_SET_PAGE).Append("?token=").Append(token).Append("<br>");

            emailTemplate.Append("<i>If you feel that this was generated by mistake, please ignore it, and use your current password on next login.</i><br>");
            emailTemplate.Append("Best reagrds,<br><strong>Sergio's Store team</strong>");

            return emailTemplate.ToString();
        } 
    }
}