<%@ Page Title="Sertgio's - sitemap" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="site_map.aspx.cs" Inherits="ASP.net_Project.site_map" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server">
        <!-- Breadcrumb start-->
        <div id="bradcrumb" class="top-offset-breadcrumb" style="color: black; margin-left: 10px; padding-top: 10px; padding-left: 10px;">
            <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
        </div>
        <!-- breadcrumb end-->
        <asp:Label ID="labelError" runat="server" Text=""></asp:Label>
        <br />

        <asp:Menu ID="Menu1" runat="server" BackColor="#F7F6F3" DataSourceID="SiteMapDataSource1" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Medium" ForeColor="#7C6F57" StaticSubMenuIndent="10px">
            <DynamicHoverStyle BackColor="#7C6F57" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#F7F6F3" />
            <DynamicSelectedStyle BackColor="#5D7B9D" />
            <StaticHoverStyle BackColor="#7C6F57" ForeColor="White" />
            <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#5D7B9D" />
        </asp:Menu>
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />

        <br />
    </form>
</asp:Content>
