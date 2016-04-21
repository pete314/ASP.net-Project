<%@ Page Title="" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="store_category.aspx.cs" Inherits="ASP.net_Project.store.store_category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form runat="server">
        <asp:Label ID="labelError" runat="server" Text=""></asp:Label>
        <br /><div>
            <asp:GridView ID="gvwProducts" runat="server" Width="860px" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dsStoreItems" PageSize="4" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" DataKeyNames="id" OnSelectedIndexChanged="gvwProducts_SelectedIndexChanged">
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
        <asp:SqlDataSource ID="dsStoreItems" runat="server" ConnectionString="<%$ ConnectionStrings:sergios_store_store_items_connection %>" SelectCommand="SELECT [brand], [model], [release], [description], [price], [id] FROM [store_items] WHERE ([brand] = @brand)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="Samsung" Name="brand" QueryStringField="brand" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        
&nbsp;&nbsp;&nbsp;
    </form>
</asp:Content>
