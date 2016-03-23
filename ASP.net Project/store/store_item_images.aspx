<%@ Page Title="" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="store_item_images.aspx.cs" Inherits="ASP.net_Project.store.store_item_images" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../assets/style/password_reset.css" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <asp:Label ID="labelError" runat="server" Text=""></asp:Label>
        
    <!-- KEEP INVISIBLES FROM HERE-->
    <asp:SqlDataSource ID="dsStoreItemImages" runat="server" ConnectionString="<%$ ConnectionStrings:sergios_store_store_items_connection %>" SelectCommand="SELECT * FROM [store_item_img]"></asp:SqlDataSource>

</asp:Content>
