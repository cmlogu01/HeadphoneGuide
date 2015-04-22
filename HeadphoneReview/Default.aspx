<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HeadphoneReview._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>Headphone Buying Guide (Pending Title)</h2>
            </hgroup>
            <p>
                
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>What fit are you looking for?</h3>
 
           <a href="PricesInEar.aspx">In Ear</a><br />
           <a href="PricesOnEar.aspx">On Ear</a><br />
           <a href="PricesOverEar.aspx">Over Ear</a><br />

</asp:Content>
