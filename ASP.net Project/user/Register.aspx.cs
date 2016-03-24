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
            //Register page so first get value to indicate if welcome popup was shown
            int alreadyLoggedIn = (int)Session["userValidPopup"];

            //If it was shown then user is alread logged in
            if (alreadyLoggedIn == 1)
            {
                //Output message and disable related controls
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Welcome", "<script>alert('You are already logged in');</script>");
                txtName.Enabled = false;
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
            //retrieve values from input fields
            String name = txtName.Text;
            String email = txtEmail.Text;
            String password = txtPassword.Text;
            String street = txtStreet.Text;
            String city = txtCity.Text;
            String county = txtCounty.Text;
            String country = txtCountry.Text;
            String zip = txtZipCode.Text;

            //Connection String
            String conString = "Data Source=KIERANSPC\\SQLEXPRESS;Initial Catalog=sergios_store;Integrated Security=True";
            SqlConnection connection = new SqlConnection(); //get connection
            connection.ConnectionString = conString;

            //insert statement
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
                lblError.Text = "There was a problem adding this user, please try again";//otuput a relavant error message
            }
        }
    }
}