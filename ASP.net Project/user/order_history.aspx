<%@ Page Title="Sergios's - order history" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="order_history.aspx.cs" Inherits="ASP.net_Project.user.order_history" %>
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="orderHistoryDataSource" Height="100%" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Store item id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="brand" HeaderText="Brand" SortExpression="brand" />
                <asp:BoundField DataField="model" HeaderText="Model" SortExpression="model" />
                <asp:BoundField DataField="release" HeaderText="Release" SortExpression="release" />
                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" DataFormatString="{0:c}" />
                <asp:BoundField DataField="order_id" HeaderText="Order id" SortExpression="order_id" />
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
        <asp:SqlDataSource ID="orderHistoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:sergios_store_store_items_connection %>" SelectCommand="SELECT store_orders.id, store_orders.created, store_items.brand, store_items.model, store_items.release, store_items.price, store_order_items.order_id, store_order_items.qty FROM store_items INNER JOIN store_orders ON store_items.id = store_orders.id CROSS JOIN store_order_items WHERE (store_orders.user_id = @user_id)">
            <SelectParameters>
                <asp:CookieParameter CookieName="userid" DefaultValue="1" Name="user_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
