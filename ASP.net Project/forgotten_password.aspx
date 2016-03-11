﻿<%@ Page Title="Password reset - Sergios's store" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="forgotten_password.aspx.cs" Inherits="ASP.net_Project.forgotten_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/style/password_reset.css" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    
    <div id="login-wrapper">
            <div id="reset-pass-panel" text="your@email.here">
                <center> Reset password</center>
                <form runat="server" id="ForgottenPassForm">
                    <div style="padding: 0.5em;">
                        <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i>Your account email</span>
                        <asp:textbox runat="server" id="email" /> 
                    </div>
                    <div style="padding: 0.5em;">
                        <asp:Button ID="btnPassReset" runat="server" Text="Reset Password" CssClass="button special" OnClick="btnPassReset_Click" />
                    </div>
                </form>
                Need help with login?<br>
                <a href="login.aspx">Login</a> | 
                <a href="register.aspx">Register</a>
            </div>
        <center>
        <asp:Label ID="labelReset" runat="server" Text=""></asp:Label>
        </center>
        </div>
    
    <!-- KEEP INVISIBLES FROM HERE-->
    <asp:SqlDataSource ID="dsStoreUsers" runat="server" ConnectionString="<%$ ConnectionStrings:sergiosStoreConnectionStringUsers %>" SelectCommand="SELECT * FROM [users]">
    </asp:SqlDataSource>
</asp:Content>