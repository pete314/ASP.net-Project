<%@ Page Title="" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ASP.net_Project.user.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        .tableLogin 
        {
            width: 100%;
            text-align: center;
        }

        #noPassword
        {
            width: 33%;
        }

        #loginValidation
        {
            color: red;
        }

        #loginHeader
        {
            font-size: 200%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">  
    <form runat="server" id="masterForm">   
    <table class="tableLogin">
            <tr>
                <td id="loginHeader" colspan="3">User Login</td>
            </tr>
            <tr>
                <td colspan="3">Username</td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:TextBox ID="txtUsername" runat="server" Width="250px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="loginUsernameValidator" runat="server" Display="None" ErrorMessage="Username is required" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3">Password</td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:TextBox ID="txtPassword" runat="server" Width="250px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="loginPasswordValidator" runat="server" Display="None" ErrorMessage="Password is required" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="center" id="noPassword">
                    <asp:LinkButton ID="lbtnForgotPassword" PostBackUrl="~/user/forgotten_password.aspx" runat="server" CausesValidation="False">Forgot Password?</asp:LinkButton>
                </td>
                <td align="center" id="noPassword">
                    <asp:LinkButton ID="lbtnLogin"  ValidationGroup="login" runat="server" OnClick="lbtnLogin_Click">Login</asp:LinkButton>
                </td>
                <td align="center" id="noPassword">
                    <asp:LinkButton ID="lbtnRegisterUser" PostBackUrl="~/user/Register.aspx" runat="server" CausesValidation="False" EnableViewState="False">Register</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td id="loginValidation" colspan="3">
                    <asp:RequiredFieldValidator ID="usernameLoginValidator" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required" ValidationGroup="login"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:RequiredFieldValidator ID="passwordLoginValidator" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" ValidationGroup="login"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    
                    <asp:Label ID="lblLoginValid" runat="server"></asp:Label>
                    
                </td>
            </tr>
        </table>
        </form>
</asp:Content>
