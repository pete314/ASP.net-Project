<%@ Page Title="" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="store_category.aspx.cs" Inherits="ASP.net_Project.store.store_category" %>
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
        <br /><div>
            <asp:GridView ID="gvwProducts" runat="server" Width="100%" Height="100%" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dsStoreItems" PageSize="4" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="id" OnSelectedIndexChanged="gvwProducts_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="Store Id" SortExpression="id" InsertVisible="False" ReadOnly="True">
                    </asp:BoundField>
                    <asp:BoundField DataField="brand" HeaderText="Brand" SortExpression="brand">
                    </asp:BoundField>
                    <asp:BoundField DataField="model" HeaderText="Model" SortExpression="model">
                    </asp:BoundField>
                    <asp:BoundField DataField="release" HeaderText="Release" SortExpression="release">
                    </asp:BoundField>
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description">
                    </asp:BoundField>
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" DataFormatString="{0:c}">
                    </asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerSettings FirstPageText="&lt;&lt;" LastPageText="&gt;&gt;" NextPageText="&gt;" PreviousPageText="&lt;" />
                <PagerStyle BackColor="#2461BF" HorizontalAlign="Center" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
        <br />
        <asp:SqlDataSource ID="dsStoreItems" runat="server" ConnectionString="<%$ ConnectionStrings:sergios_store_store_items_connection %>" SelectCommand="SELECT [brand], [model], [release], [description], [price], [id] FROM [store_items] WHERE ([brand] = @brand)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="Samsung" Name="brand" QueryStringField="brand" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        
&nbsp;&nbsp;&nbsp;
    </form>
</asp:Content>
