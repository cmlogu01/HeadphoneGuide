<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeBehind="Product.aspx.cs" Inherits="HeadphoneReview.Product" %>
<script runat="server">
    public void Page_Load()
    {
        
    }
</script>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <asp:Image ID="Image" runat="server"  /><br/>
    <asp:Label ID="Model" runat="server" Text="Label"></asp:Label><br/>
    <asp:Label ID="Description" runat="server" Text="Label"></asp:Label><br/>
    <asp:Label ID="SoundType" runat="server" Text="Label"></asp:Label><br/>
    <asp:Label ID="Fit" runat="server" Text="Label"></asp:Label><br/>
    <asp:Label ID="Price" runat="server" Text="Label"></asp:Label><br/>
    <asp:HyperLink ID="PurchaseLink" runat="server">Purchase</asp:HyperLink>

</asp:Content>
