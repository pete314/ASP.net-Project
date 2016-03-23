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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">     
    <table class="tableLogin">
            <tr>
                <td colspan="3">Username</td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:TextBox ID="txtUsername" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="3">Password</td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:TextBox ID="txtPassword" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" id="noPassword">
                    <asp:LinkButton ID="lbtnForgotPassword" PostBackUrl="~/user/forgotten_password.aspx" runat="server">Forgot Password?</asp:LinkButton>
                </td>
                <td align="center" id="noPassword">
                    <asp:LinkButton ID="lbtnLogin" runat="server">Login</asp:LinkButton>
                </td>
                <td align="center" id="noPassword">
                    <asp:LinkButton ID="lbtnRegisterUser" PostBackUrl="~/user/Register.aspx" runat="server">Register</asp:LinkButton>
                </td>
            </tr>
        </table>
</asp:Content>
