using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.net_Project.user
{
    public partial class set_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (0 == validPasswordToken())
                {
                    labelError.ForeColor = System.Drawing.Color.Red;
                    labelError.Text = "Invalid token";
                }
            }

        }

        protected void btnPassReset_Click(object sender, EventArgs e)
        {
            if (1 == changeUserPassword())
            {
                labelError.ForeColor = System.Drawing.Color.Green;
                labelError.Text = "Password changed, please use new password on next login!";
            }
            else
            {
                labelError.ForeColor = System.Drawing.Color.Red;
                labelError.Text = "Internal error, the token may be invalid";
            }
        }
        /// <summary>
        /// Author: Peter Nagy
        /// Description: Validate the token parameter passed in url
        /// </summary>
        /// <returns>0 if not valid or user_id</returns>
        private int validPasswordToken() {
            if (string.IsNullOrEmpty(Request.QueryString["token"]))
                return 0;

            List<SqlParameter> paramList = new List<SqlParameter>()
            {
                new SqlParameter()
                {
                    ParameterName = "@TOKEN",
                    Value = Request.QueryString["token"]
                }
            };

            return runStoredProcedure("spTokenLookup", paramList);
        }

        /// <summary>
        /// Author: Peter Nagy
        /// Description: Execute set_password.aspx specific stored procedures
        /// </summary>
        /// <param name="SPName"></param>
        /// <param name="SPParameters"></param>
        /// <returns></returns>
        private int runStoredProcedure(string SPName, List<SqlParameter> SPParameters)
        {
            using (SqlConnection con = new SqlConnection(@dsStoreUsers.ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(SPName, con);
                cmd.CommandType = CommandType.StoredProcedure;

                foreach (SqlParameter parameter in SPParameters)
                {
                    cmd.Parameters.Add(parameter);
                }

                con.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());//returns (int)user_id || 1 if true or else 0
            }
        }

        /// <summary>
        /// Author: Peter Nagy
        /// Description: Change user password
        /// </summary>
        /// <returns></returns>
        private int changeUserPassword() {
            int user_id = validPasswordToken();//this makes an extra round to the database but it does validate that the current token is valid
            if (user_id == 0)
                return 0;

            List<SqlParameter> paramList = new List<SqlParameter>(){
                new SqlParameter(){
                    ParameterName = "@GUID",
                    Value = Request.QueryString["token"]
                },
                new SqlParameter()
                {
                    ParameterName = "@Password",
                    Value = txtNewPassword.Text
                },
                new SqlParameter()
                {
                    ParameterName = "@UserId",
                    Value = user_id
                }
            };

            return runStoredProcedure("spChangeUserPassword", paramList);
        }
    }
}