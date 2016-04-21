<%@ Page Title="Sergio's - user list ADMIN" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="user_list.aspx.cs" Inherits="ASP.net_Project.user.user_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server">
        <asp:Label ID="labelError" runat="server" Text=""></asp:Label>
        
        <br />
        <asp:ListView ID="userList" runat="server" DataKeyNames="id" DataSourceID="ulDataSource" Height="100%" Width="100%">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;">
                    <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address_streetLabel" runat="server" Text='<%# Eval("address_street") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address_cityLabel" runat="server" Text='<%# Eval("address_city") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address_stateLabel" runat="server" Text='<%# Eval("address_state") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address_countryLabel" runat="server" Text='<%# Eval("address_country") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address_codeLabel" runat="server" Text='<%# Eval("address_code") %>' />
                    </td>
                    <td>
                        <asp:Label ID="createdLabel" runat="server" Text='<%# Eval("created") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="address_streetTextBox" runat="server" Text='<%# Bind("address_street") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="address_cityTextBox" runat="server" Text='<%# Bind("address_city") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="address_stateTextBox" runat="server" Text='<%# Bind("address_state") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="address_countryTextBox" runat="server" Text='<%# Bind("address_country") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="address_codeTextBox" runat="server" Text='<%# Bind("address_code") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="createdTextBox" runat="server" Text='<%# Bind("created") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="address_streetTextBox" runat="server" Text='<%# Bind("address_street") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="address_cityTextBox" runat="server" Text='<%# Bind("address_city") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="address_stateTextBox" runat="server" Text='<%# Bind("address_state") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="address_countryTextBox" runat="server" Text='<%# Bind("address_country") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="address_codeTextBox" runat="server" Text='<%# Bind("address_code") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="createdTextBox" runat="server" Text='<%# Bind("created") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;">
                    <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address_streetLabel" runat="server" Text='<%# Eval("address_street") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address_cityLabel" runat="server" Text='<%# Eval("address_city") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address_stateLabel" runat="server" Text='<%# Eval("address_state") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address_countryLabel" runat="server" Text='<%# Eval("address_country") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address_codeLabel" runat="server" Text='<%# Eval("address_code") %>' />
                    </td>
                    <td>
                        <asp:Label ID="createdLabel" runat="server" Text='<%# Eval("created") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                    <th runat="server"></th>
                                    <th runat="server">id</th>
                                    <th runat="server">email</th>
                                    <th runat="server">name</th>
                                    <th runat="server">address_street</th>
                                    <th runat="server">address_city</th>
                                    <th runat="server">address_state</th>
                                    <th runat="server">address_country</th>
                                    <th runat="server">address_code</th>
                                    <th runat="server">created</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                    <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address_streetLabel" runat="server" Text='<%# Eval("address_street") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address_cityLabel" runat="server" Text='<%# Eval("address_city") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address_stateLabel" runat="server" Text='<%# Eval("address_state") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address_countryLabel" runat="server" Text='<%# Eval("address_country") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address_codeLabel" runat="server" Text='<%# Eval("address_code") %>' />
                    </td>
                    <td>
                        <asp:Label ID="createdLabel" runat="server" Text='<%# Eval("created") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />
        <br />
        <asp:SqlDataSource ID="ulDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:sergios_store_store_items_connection %>" SelectCommand="SELECT [id], [email], [name], [address_street], [address_city], [address_state], [address_country], [address_code], [created] FROM [users]" DeleteCommand="DELETE FROM [users] WHERE [id] = @id" InsertCommand="INSERT INTO [users] ([email], [name], [address_street], [address_city], [address_state], [address_country], [address_code], [created]) VALUES (@email, @name, @address_street, @address_city, @address_state, @address_country, @address_code, @created)" UpdateCommand="UPDATE [users] SET [email] = @email, [name] = @name, [address_street] = @address_street, [address_city] = @address_city, [address_state] = @address_state, [address_country] = @address_country, [address_code] = @address_code, [created] = @created WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="address_street" Type="String" />
                <asp:Parameter Name="address_city" Type="String" />
                <asp:Parameter Name="address_state" Type="String" />
                <asp:Parameter Name="address_country" Type="String" />
                <asp:Parameter Name="address_code" Type="String" />
                <asp:Parameter Name="created" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="address_street" Type="String" />
                <asp:Parameter Name="address_city" Type="String" />
                <asp:Parameter Name="address_state" Type="String" />
                <asp:Parameter Name="address_country" Type="String" />
                <asp:Parameter Name="address_code" Type="String" />
                <asp:Parameter Name="created" Type="DateTime" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
    </form>
</asp:Content>
