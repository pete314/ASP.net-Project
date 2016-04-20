<%@ Page Title="Segoio's store - administer store items" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="store_items.aspx.cs" Inherits="ASP.net_Project.store_items" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/style/store_items.css" type="text/css" media="screen" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server">
    
    <h2 class="center-all">Current store items</h2>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="sqlDSSstore_items" AutoGenerateColumns="False" DataKeyNames="id" ViewStateMode="Enabled">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="brand" HeaderText="brand" SortExpression="brand" />
            <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
            <asp:BoundField DataField="release" HeaderText="release" SortExpression="release" />
            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="created" HeaderText="created" SortExpression="created" />
            <asp:BoundField DataField="updated" HeaderText="updated" SortExpression="updated" />
        </Columns>
        <PagerSettings Mode="NextPreviousFirstLast" />
    </asp:GridView>
        </form>
<!-- KEEP INVISIBLES FROM HERE-->
<asp:SqlDataSource ID="sqlDSSstore_items" runat="server" ConnectionString="<%$ ConnectionStrings:sergios_store_store_items_connection %>" SelectCommand="SELECT * FROM [store_items]" DeleteCommand="DELETE FROM [store_items] WHERE [id] = @original_id" InsertCommand="INSERT INTO [store_items] ([brand], [model], [release], [description], [price], [created], [updated]) VALUES (@brand, @model, @release, @description, @price, @created, @updated)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [store_items] SET [brand] = @brand, [model] = @model, [release] = @release, [description] = @description, [price] = @price, [created] = @created, [updated] = @updated WHERE [id] = @original_id" ViewStateMode="Enabled">
    <DeleteParameters>
        <asp:Parameter Name="original_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="brand" Type="String" />
        <asp:Parameter Name="model" Type="String" />
        <asp:Parameter Name="release" Type="String" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="price" Type="String" />
        <asp:Parameter Name="created" Type="DateTime" />
        <asp:Parameter Name="updated" Type="DateTime" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="brand" Type="String" />
        <asp:Parameter Name="model" Type="String" />
        <asp:Parameter Name="release" Type="String" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="price" Type="String" />
        <asp:Parameter Name="created" Type="DateTime" />
        <asp:Parameter Name="updated" Type="DateTime" />
        <asp:Parameter Name="original_id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>

