<%@ Page Title="Sergio's - store checkout" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="ASP.net_Project.store.checkout" %>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="orderHistoryDataSource" CellPadding="4" ForeColor="#333333" GridLines="None"  Height="100%" Width="100%">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="order_id" HeaderText="Order Id" SortExpression="order_id" />
                <asp:BoundField DataField="brand" HeaderText="Brand" SortExpression="brand" />
                <asp:BoundField DataField="model" HeaderText="Model" SortExpression="model" />
                <asp:BoundField DataField="release" HeaderText="Release" SortExpression="release" />
                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                <asp:BoundField DataField="id" HeaderText="Item id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="qty" HeaderText="Quantity" SortExpression="qty" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="orderHistoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:sergios_store_store_items_connection %>" SelectCommand="SELECT store_orders.id, store_orders.created, store_items.brand, store_items.model, store_items.release, store_items.price, store_order_items.order_id, store_order_items.qty FROM store_items INNER JOIN store_orders ON store_items.id = store_orders.id CROSS JOIN store_order_items WHERE (store_orders.id = @order_success)">
            <SelectParameters>
                <asp:CookieParameter CookieName="order_success" Name="order_success" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
