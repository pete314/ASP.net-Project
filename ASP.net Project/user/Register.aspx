<%@ Page Title="" Language="C#" MasterPageFile="~/store_core.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Register.aspx.cs" 
    Inherits="ASP.net_Project.user.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
       
         .tableMainLayout 
        {
            width: 80%;
        }

        #registerTable
        {
            width: 50%;
        }

        #regTableHead
        {
           font-size: 240%;
        }

        #regButton
        {
           font-size: 150%;
        }

        #regValidation
        {
            color: red;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server" id="masterForm"> 
    <div align="center">
    <table class="tableMainLayout">
        <tr>
            <td id="regTableHead" align="center" colspan="2">&nbsp;&nbsp; Register New User</td>
        </tr>
        <tr>
            <td id="registerTable" align="center">Name</td>
            <td id="registerTable" align="center">
                <asp:TextBox ID="txtName" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td id="registerTable" align="center">Email</td>
            <td id="registerTable" align="center">
                <asp:TextBox ID="txtEmail" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td id="registerTable" align="center">Password</td>
            <td id="registerTable" align="center">
                <asp:TextBox ID="txtPassword" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td id="registerTable" align="center">Street</td>
            <td id="registerTable" align="center">
                <asp:TextBox ID="txtStreet" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td id="registerTable" align="center">City</td>
            <td id="registerTable" align="center">
                <asp:TextBox ID="txtCity" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td id="registerTable" align="center">County</td>
            <td id="registerTable" align="center">
                <asp:TextBox ID="txtCounty" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td id="registerTable" align="center">Country</td>
            <td id="registerTable" align="center">
                <asp:TextBox ID="txtCountry" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td id="registerTable" align="center">Zip Code</td>
            <td id="registerTable" align="center">
                <asp:TextBox ID="txtZipCode" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" id="regButton">
                <asp:LinkButton ID="lbtnRegisterUser" ValidationGroup="registration" runat="server">Register</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" id="regValidation">
                <asp:RequiredFieldValidator ID="regNameValidator" runat="server" ControlToValidate="txtName" ErrorMessage="Name Required" ValidationGroup="registration"></asp:RequiredFieldValidator>
&nbsp;
                <asp:RequiredFieldValidator ID="regEmailValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email Required" ValidationGroup="registration"></asp:RequiredFieldValidator>
&nbsp;
                <asp:RequiredFieldValidator ID="regPassValidator" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password Required" ValidationGroup="registration"></asp:RequiredFieldValidator>
&nbsp;
                <asp:RequiredFieldValidator ID="regStreetValidator" runat="server" ControlToValidate="txtStreet" ErrorMessage="Street Required" ValidationGroup="registration"></asp:RequiredFieldValidator>
                <br />
                <asp:RequiredFieldValidator ID="regCityValidator" runat="server" ControlToValidate="txtCity" ErrorMessage="City Required" ValidationGroup="registration"></asp:RequiredFieldValidator>
&nbsp;
                <asp:RequiredFieldValidator ID="regCountyValidator" runat="server" ControlToValidate="txtCounty" ErrorMessage="County Required" ValidationGroup="registration"></asp:RequiredFieldValidator>
&nbsp;
                <asp:RequiredFieldValidator ID="regCountryValidator" runat="server" ControlToValidate="txtCountry" ErrorMessage="Country Required" ValidationGroup="registration"></asp:RequiredFieldValidator>
&nbsp;
                <asp:RequiredFieldValidator ID="regZipValidator" runat="server" ControlToValidate="txtZipCode" ErrorMessage="Zip Code Required" ValidationGroup="registration"></asp:RequiredFieldValidator>
            </td>
        </tr>
        </table>
        </form>
    </div>
</asp:Content>
