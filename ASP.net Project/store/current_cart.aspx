<%@ Page Title="Sergios store - current cart" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="current_cart.aspx.cs" Inherits="ASP.net_Project.store.current_cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <form runat="server">
        
    <!-- Breadcrumb start-->
        <div id="bradcrumb" class="top-offset-breadcrumb" style="color: black; margin-left: 10px; padding-top: 10px; padding-left: 10px;">
            <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
        </div>
        <!-- breadcrumb end-->
        <center>
        <asp:Label ID="labelError" runat="server" Text=""></asp:Label>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" Width="461px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">
            <EditItemTemplate>
                brand:
                <asp:TextBox ID="brandTextBox" runat="server" Text='<%# Bind("brand") %>' />
                <br />
                model:
                <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
                <br />
                release:
                <asp:TextBox ID="releaseTextBox" runat="server" Text='<%# Bind("release") %>' />
                <br />
                description:
                <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                <br />
                price:
                <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                brand:
                <asp:TextBox ID="brandTextBox" runat="server" Text='<%# Bind("brand") %>' />
                <br />
                model:
                <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
                <br />
                release:
                <asp:TextBox ID="releaseTextBox" runat="server" Text='<%# Bind("release") %>' />
                <br />
                description:
                <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                <br />
                price:
                <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <strong>Brand:</strong>
                <asp:Label ID="brandLabel" runat="server" Text='<%# Bind("brand") %>' />
                <br />
                <strong>Model:</strong>
                <asp:Label ID="modelLabel" runat="server" Text='<%# Bind("model") %>' />
                <br />
                <strong>Release:</strong>
                <asp:Label ID="releaseLabel" runat="server" Text='<%# Bind("release") %>' />
                <br />
                <strong>Description:</strong>
                <asp:Label ID="descriptionLabel" runat="server" Text='<%# Bind("description") %>' />
                <br />
                <strong>Price:</strong>
                <asp:Label ID="priceLabel" runat="server" Text='<%# Bind("price") %>' />
                Eur
            </ItemTemplate>
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        </asp:FormView>
        <asp:Button ID="buyBtn" runat="server" OnClick="buyBtn_Click" Text="Buy" />
        <asp:Button ID="clearBtn" runat="server" OnClick="clearBtn_Click" Text="Clean cart" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sergios_store_store_items_connection %>" SelectCommand="SELECT [brand], [model], [release], [description], [price] FROM [store_items] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:CookieParameter CookieName="product_id" Name="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
            </center>
    </form>
</asp:Content>
