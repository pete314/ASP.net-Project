<%@ Page Title="Sergio's - store orders ADMIN" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="store_orders.aspx.cs" Inherits="ASP.net_Project.store.store_orders" %>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="storeOrdersDS" Height="100%" Width="100%" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Order id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="User Name" SortExpression="name" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="brand" HeaderText="Brand" SortExpression="brand" />
                <asp:BoundField DataField="model" HeaderText="Model" SortExpression="model" />
                <asp:BoundField DataField="price" DataFormatString="{0:c}" HeaderText="Item Price" SortExpression="price" />
                <asp:BoundField DataField="qty" HeaderText="Quantity" SortExpression="qty" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="storeOrdersDS" runat="server" ConnectionString="<%$ ConnectionStrings:sergios_store_store_items_connection %>" SelectCommand="SELECT users.name, users.email, store_items.brand, store_items.model, store_items.price, store_orders.id, store_order_items.qty, store_orders.created FROM store_orders INNER JOIN store_items ON store_orders.id = store_items.id INNER JOIN users ON store_orders.id = users.id CROSS JOIN store_order_items"></asp:SqlDataSource>
        <br />

    </form>
</asp:Content>
