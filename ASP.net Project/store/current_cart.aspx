﻿<%@ Page Title="Sergios store - current cart" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="current_cart.aspx.cs" Inherits="ASP.net_Project.store.current_cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server">
        <asp:Label ID="labelError" runat="server" Text=""></asp:Label>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" Width="461px">
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
                brand:
                <asp:Label ID="brandLabel" runat="server" Text='<%# Bind("brand") %>' />
                <br />
                model:
                <asp:Label ID="modelLabel" runat="server" Text='<%# Bind("model") %>' />
                <br />
                release:
                <asp:Label ID="releaseLabel" runat="server" Text='<%# Bind("release") %>' />
                <br />
                description:
                <asp:Label ID="descriptionLabel" runat="server" Text='<%# Bind("description") %>' />
                <br />
                price:
                <asp:Label ID="priceLabel" runat="server" Text='<%# Bind("price") %>' />
                <br />
            </ItemTemplate>
        </asp:FormView>
        <asp:Button ID="buyBtn" runat="server" OnClick="buyBtn_Click" Text="Buy" />
        <asp:Button ID="clearBtn" runat="server" OnClick="clearBtn_Click" Text="Clean cart" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sergios_store_store_items_connection %>" SelectCommand="SELECT [brand], [model], [release], [description], [price] FROM [store_items] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:CookieParameter CookieName="product_id" Name="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />

    </form>
</asp:Content>