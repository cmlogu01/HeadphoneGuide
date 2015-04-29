<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="HeadphoneReview.Contact" %>
<%@ Import Namespace="System.ComponentModel" %>

    <script runat="server">
        public void Page_Load()
        {
            if (!Page.IsPostBack)
            {
                //productCatalog.DataSource = ProductsDB;
                //productCatalog.DataBind();
            }
        }
    </script>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

   <%-- <asp:TextBox ID="Fit" runat="server" />
    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="submit" />--%>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ModelID" DataSourceID="ProductsDB" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ModelID" DataNavigateUrlFormatString="~/Product.aspx?ModelID={0}" Text="See Review" />
            <asp:ImageField DataImageUrlField="Image">
                <ControlStyle Height="100px" Width="100px" />
            </asp:ImageField>
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Fit" HeaderText="Fit" SortExpression="Fit" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#00AFF0" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#00AFF0" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#00AFF0" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#007AA8" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#00AFF0" />
    </asp:GridView>


    <asp:SqlDataSource ID="ProductsDB" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ModelID], [Model], [Image], [Price], [Description], [Fit], [Type] FROM [Products] P LEFT JOIN SoundTypes ST on P.SoundTypeID = ST.TypeID LEFT JOIN Fits F on P.FitID = F.FitID">

    </asp:SqlDataSource>

</asp:Content>