<%@ Page Title="" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ASP.net_Project.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Index page</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server" id="masterForm"> 
        <center>
            <h2 class="center-all">Welcome to Sergio's store</h2>
            <h1>Most popular items</h1>
        </center>

        <div>
            <asp:GridView ID="gvwProducts" runat="server" Width="805px" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dsStoreItems">
                <Columns>
                    <asp:BoundField DataField="brand" HeaderText="brand" SortExpression="brand" />
                    <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
                    <asp:BoundField DataField="release" HeaderText="release" SortExpression="release" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                </Columns>
            </asp:GridView>
        </div>


        <br />
        <asp:SqlDataSource ID="dsStoreItems" runat="server" ConnectionString="<%$ ConnectionStrings:sergios_storeConnectionString %>" SelectCommand="SELECT [brand], [model], [release], [description], [price] FROM [store_items]"></asp:SqlDataSource>


    </form>
</asp:Content>
