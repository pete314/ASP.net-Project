using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.net_Project.user
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //First we get value to indicate if welcome popup was shown
            int alreadyLoggedIn = (int)Session["userValidPopup"];

            //If it was shown then user is alread logged in hence this page isnt needed, we dont need to register a user thats already
            //logged in.
            if (alreadyLoggedIn == 1)
            {
                //Output message to alert user they do not need to register as they are logged in already
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Already Registered", "<script>alert('You are already logged in');</script>");
                txtName.Enabled = false;    //Then disable all related controls which stops the user from registering again
                txtEmail.Enabled = false;
                txtPassword.Enabled = false;
                txtStreet.Enabled = false;
                txtCity.Enabled = false;
                txtCounty.Enabled = false;
                txtCountry.Enabled = false;
                txtZipCode.Enabled = false;
                lbtnRegisterUser.Enabled = false;
            }
        }

        //Register user button click event
        protected void lbtnRegisterUser_Click(object sender, EventArgs e)
        {
            //retrieve values from all the input fields
            String name = txtName.Text;
            String email = txtEmail.Text;
            String password = txtPassword.Text;
            String street = txtStreet.Text;
            String city = txtCity.Text;
            String county = txtCounty.Text;
            String country = txtCountry.Text;
            String zip = txtZipCode.Text;

            //Create the Connection String
            String conString = "Data Source=KIERANSPC\\SQLEXPRESS;Initial Catalog=sergios_store;Integrated Security=True";
            SqlConnection connection = new SqlConnection(); //Create connection object
            connection.ConnectionString = conString;    //Give the conection objects, connection property the required connection string

            //Create an SQL insert statement
            String insertStmnt = "INSERT users (name, email, password, address_street, address_city, address_state, address_country,"+
                                    " address_code) VALUES ('"+name+"', '"+email+"', '"+password+"', '"+street+"', '"+city+"', '"+county+"', '"+country+"', '"+zip+"')";


            //create command object
            SqlCommand insertCmnd = new SqlCommand();
            insertCmnd.Connection = connection;         //set its Connection and CommandText properties
            insertCmnd.CommandText = insertStmnt;

            connection.Open();//open connection
            int rowsAffected = insertCmnd.ExecuteNonQuery();//perform insert query
            connection.Close();//close connection

            if (rowsAffected > 0)//if we had an affected row
            {
                Response.Cookies["username"].Value = name.ToString();//we can add the new username and password to cookies
                Response.Cookies["password"].Value = email.ToString();
                Response.Redirect("~/Index.aspx");                          //redirect user back to homepage
            }
            else//otherwise
            {
                lblError.Text = "There was a problem adding this user, please try again";//output a relavant error message
            }
        }
    }
}
