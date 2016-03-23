<%@ Page Title="Sergio's store - Set new password" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="set_password.aspx.cs" Inherits="ASP.net_Project.user.set_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../assets/style/password_reset.css" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server">
    <div id="login-wrapper">
        <center>
        <asp:Label ID="labelError" runat="server" Text=""></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary1" 
            ForeColor="Red" runat="server" />
        </center>
            <div id="reset-pass-panel">
                <center>Set a new password</center>
                    <div style="padding: 0.5em;">
                        <span class="input-group-addon"><i class="fa fa-key-o fa-fw"></i>New Password</span>
                        <asp:TextBox ID="txtNewPassword" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtNewPassword" runat="server" ErrorMessage="Password is required in order to reset" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
                    </div>
                    <div style="padding: 0.5em;">
                        <span class="input-group-addon"><i class="fa fa-key-o fa-fw"></i>Repeat Password</span>
                        <asp:TextBox ID="txtNewPasswordRepeat" TextMode="Password" runat="server"></asp:TextBox>
                    </div>
                    <div style="padding: 0.5em;">
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ErrorMessage="The two entries have to match" 
                            ControlToValidate="txtNewPasswordRepeat" 
                            ForeColor="Red" 
                            ControlToCompare="txtNewPassword"
                            Display="Dynamic" 
                            Type="String" 
                            Operator="Equal" 
                            Text="*">

                        </asp:CompareValidator>
                        <asp:Button ID="btnPassReset" runat="server" Text="Set Password" CssClass="button special" OnClick="btnPassReset_Click" />
                    </div>
                Need help with login?<br>
                <a href="~/users/login.aspx">Login</a> | 
                <a href="~/users/register.aspx">Register</a>
            </div>
        
        </div>
    </form>
    <!-- KEEP INVISIBLES FROM HERE-->
    <br />
    <asp:SqlDataSource ID="dsStoreUsers" runat="server" ConnectionString="<%$ ConnectionStrings:sergiosStoreConnectionStringUsers %>" SelectCommand="SELECT * FROM [users]">
    </asp:SqlDataSource>
</asp:Content>
