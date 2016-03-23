<%@ Page Title="Segoio's store - administer store items" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="store_items.aspx.cs" Inherits="ASP.net_Project.store_items" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/style/store_items.css" type="text/css" media="screen" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server">
    <!-- Breadcrumb start-->
    <div id="bradcrumb" class="top-offset-breadcrumb" style="color: black; margin-left: 10px; padding-top: 10px; padding-left: 10px;">
        <a href="index.html"><i class="fa fa-home"></i>Home</a>
        >>
        <a href="#">Some Page</a>
    </div>
    <!-- breadcrumb end-->
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
        </Columns>
        <PagerSettings Mode="NextPreviousFirstLast" />
    </asp:GridView>
        </form>
<!-- KEEP INVISIBLES FROM HERE-->
<asp:SqlDataSource ID="sqlDSSstore_items" runat="server" ConnectionString="<%$ ConnectionStrings:sergios_store_store_items_connection %>" SelectCommand="SELECT [id], [brand], [model], [release], [description], [price] FROM [store_items] ORDER BY [id]" DeleteCommand="DELETE FROM [store_items] WHERE [id] = @original_id AND (([brand] = @original_brand) OR ([brand] IS NULL AND @original_brand IS NULL)) AND (([model] = @original_model) OR ([model] IS NULL AND @original_model IS NULL)) AND (([release] = @original_release) OR ([release] IS NULL AND @original_release IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL))" InsertCommand="INSERT INTO [store_items] ([brand], [model], [release], [description], [price]) VALUES (@brand, @model, @release, @description, @price)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [store_items] SET [brand] = @brand, [model] = @model, [release] = @release, [description] = @description, [price] = @price WHERE [id] = @original_id AND (([brand] = @original_brand) OR ([brand] IS NULL AND @original_brand IS NULL)) AND (([model] = @original_model) OR ([model] IS NULL AND @original_model IS NULL)) AND (([release] = @original_release) OR ([release] IS NULL AND @original_release IS NULL)) AND (([description] = @original_description) OR ([description] IS NULL AND @original_description IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL))" ViewStateMode="Enabled" ConflictDetection="CompareAllValues">
    <DeleteParameters>
        <asp:Parameter Name="original_id" Type="Int32" />
        <asp:Parameter Name="original_brand" Type="String" />
        <asp:Parameter Name="original_model" Type="String" />
        <asp:Parameter Name="original_release" Type="String" />
        <asp:Parameter Name="original_description" Type="String" />
        <asp:Parameter Name="original_price" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="brand" Type="String" />
        <asp:Parameter Name="model" Type="String" />
        <asp:Parameter Name="release" Type="String" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="price" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="brand" Type="String" />
        <asp:Parameter Name="model" Type="String" />
        <asp:Parameter Name="release" Type="String" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="price" Type="String" />
        <asp:Parameter Name="original_id" Type="Int32" />
        <asp:Parameter Name="original_brand" Type="String" />
        <asp:Parameter Name="original_model" Type="String" />
        <asp:Parameter Name="original_release" Type="String" />
        <asp:Parameter Name="original_description" Type="String" />
        <asp:Parameter Name="original_price" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>

