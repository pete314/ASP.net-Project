<%@ Page Title="Sergio's store - home" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ASP.net_Project.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Index page</title>

     <style type="text/css">
        
        .tableLogin 
        {
            width: 100%;
            text-align: center;
        }

        #noPassword
        {
            width: 33%;
        }

        #loginValidation
        {
            color: red;
        }

        #productHeader
        {
            font-size: 150%;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server" id="masterForm">
        <!-- Breadcrumb start-->
        <div id="bradcrumb" class="top-offset-breadcrumb" style="color: black; margin-left: 10px; padding-top: 10px; padding-left: 10px;">
            <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
        </div>
        <!-- breadcrumb end-->
        
        <center>
            <h2 class="center-all">Welcome to Sergio's store</h2>
            <h1 id="productHeader" align="left">Our Products</h1>
        </center>

        <div>
            <asp:GridView ID="gvwProducts" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dsStoreItems" Height="100%" Width="100%" PageSize="4" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" DataKeyNames="id" OnSelectedIndexChanged="gvwProducts_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="Product Id" InsertVisible="False" ReadOnly="True" SortExpression="id">
                        <HeaderStyle ForeColor="White" />
                    </asp:BoundField>
                    <asp:BoundField DataField="brand" HeaderText="Brand" SortExpression="brand">
                     <HeaderStyle ForeColor="White"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="model" HeaderText="Model" SortExpression="model">
                     <HeaderStyle ForeColor="White" /> 
                    </asp:BoundField>
                    <asp:BoundField DataField="release" HeaderText="Release" SortExpression="release">
                        <HeaderStyle ForeColor="White" />
                    </asp:BoundField>
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description">
                        <HeaderStyle ForeColor="White" />
                    </asp:BoundField>
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="Price"  DataFormatString="{0:c}">
                      <HeaderStyle ForeColor="White" />
                    </asp:BoundField>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" SelectText="Select Item">
                    <ControlStyle BorderStyle="Inset" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerSettings FirstPageText="&lt;&lt;" LastPageText="&gt;&gt;" Mode="NextPreviousFirstLast" NextPageText="&gt;" PreviousPageText="&lt;" />
                <PagerStyle BackColor="White" HorizontalAlign="Right" ForeColor="#CC6699" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </div>
        <br />
        <asp:SqlDataSource ID="dsStoreItems" runat="server" ConnectionString="<%$ ConnectionStrings:sergios_store_store_items_connection %>" SelectCommand="SELECT [brand], [model], [release], [description], [price], [id] FROM [store_items]" ProviderName="<%$ ConnectionStrings:sergios_store_store_items_connection.ProviderName %>"></asp:SqlDataSource>
        
&nbsp;&nbsp;&nbsp;
    </form>
</asp:Content>
