<%@ Page Title="" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="store_item_images.aspx.cs" Inherits="ASP.net_Project.store.store_item_images" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../assets/style/password_reset.css" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server">    
        <!-- Breadcrumb start-->
        <div id="bradcrumb" class="top-offset-breadcrumb" style="color: black; margin-left: 10px; padding-top: 10px; padding-left: 10px;">
            <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
        </div>
        <!-- breadcrumb end-->
    <asp:Label ID="labelError" runat="server" Text=""></asp:Label>
    </form>
    <!-- KEEP INVISIBLES FROM HERE-->
    <asp:SqlDataSource ID="dsStoreItemImages" runat="server" ConnectionString="<%$ ConnectionStrings:sergios_store_store_items_connection %>" SelectCommand="SELECT * FROM [store_item_img]"></asp:SqlDataSource>

</asp:Content>
