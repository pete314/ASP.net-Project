using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.net_Project.user
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Login page so first get value to indicate if welcome popup was shown
            int alreadyLoggedIn = (int)Session["userValidPopup"];

            //If it was shown then user is already logged in
            if (alreadyLoggedIn == 1)
            {
                //Output message and disable related controls
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Welcome", "<script>alert('You are already logged in');</script>");
                txtUsername.Enabled = false;
                txtPassword.Enabled = false;
                lbtnLogin.Enabled = false;
            }
        }

        //Login button click event
        protected void lbtnLogin_Click(object sender, EventArgs e)
        {
            String username = txtUsername.Text; //Get username and password from input controls
            String password = txtPassword.Text;
            bool validLogin = false;

            //Establish a connection object using the connection string to the database
            String conString = "Data Source=KIERANSPC\\SQLEXPRESS;Initial Catalog=sergios_store;Integrated Security=True";
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = conString;
            
            connection.Open();                                                    //open connection
            String selectStmnt = "SELECT email, password FROM users";             //create select statement
            SqlCommand selectCmnd = new SqlCommand();                             //create command object and pass it the connection and command
            selectCmnd.Connection = connection;
            selectCmnd.CommandText = selectStmnt;
            SqlDataReader reader = selectCmnd.ExecuteReader();                    //Excute command and get reader object back

            while(reader.Read())//loop over the data and search for valid username and password
            {
                if(reader["email"].ToString().Equals(username) && reader["password"].ToString().Equals(password))//if match is found
                {
                    username = reader["email"].ToString();
                    password = reader["password"].ToString();//set variables to those values
                    validLogin = true;                       //set boolean to true
                    break;
                }
            }

            connection.Close();//close connection

            if(validLogin == true)//if we found a match
            {
                Response.Cookies["username"].Value = username.ToString();//Set cookies to new username and password
                Response.Cookies["password"].Value = password.ToString();
                Response.Redirect("~/Index.aspx");
            }
            else//otherwise output a error message
            {
                lblLoginValid.Text = "Username and Password combination is not valid";
            }
        }
    }
}