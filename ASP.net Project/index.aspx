<%@ Page Title="" Language="C#" MasterPageFile="~/store_core.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ASP.net_Project.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Index page</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="item-wrapper">
        <img src="assets/img/s3-sample-pic.jpg" />
        <div class="item-details-wrapper">
            <a href="#"> Samsung Galaxy S3</a><br><br>
            <u><strong style="color:black;">Description:</strong></u><br>
            <p class="item-details-desc">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam consequat tincidunt congue. Sed posuere ex arcu, vitae egestas tellus sollicitudin ac. Duis bibendum felis libero, id egestas erat aliquam ut. Fusce vel felis mollis ipsum faucibus fringilla vel vitae urna. In hac habitasse platea dictumst. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse quis elementum purus. 
                <br><br>
                <strong style="color:black; height: 2em; line-height: 2em;">Tags:</strong>
                    <a href="#" alt="Android OS"><i class="fa fa-android"></i> Android</a>
                    <a href="#" alt="Android OS" class="button-special">Samsung</a>
                    <a href="#" alt="Android OS" class="button-special">Phone</a>
                <strong style="color:black;  height: 2em; line-height: 2em;"> | Price: 500Eur</strong>
                <a href="#" class="button special" style="text-align: right; float: right; height: 2em; line-height: 2em; padding: 0 1.25em; background-color: green;"><i class="fa fa-plus-square-o fa-lg"></i>Buy</a>
            </p>
        </div>
    </section>
</asp:Content>
