<%@ Page Title="Administration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Administration.aspx.cs" Inherits="HeadphoneReview.About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="row">
        <asp:GridView ID="ProductsGrid" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ModelID" DataSourceID="ProductDB" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="SelectedProductChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ModelID" HeaderText="ModelID" InsertVisible="False" ReadOnly="True" SortExpression="ModelID" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:BoundField DataField="SoundTypeID" HeaderText="SoundTypeID" SortExpression="SoundTypeID" />
                <asp:BoundField DataField="FitID" HeaderText="FitID" SortExpression="FitID" />
                <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="PurchaseLink" HeaderText="PurchaseLink" SortExpression="PurchaseLink" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:DetailsView ID="ProductDetailView" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ModelID" DataSourceID="ProductDB" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="ModelID" HeaderText="ModelID" InsertVisible="False" ReadOnly="True" SortExpression="ModelID" />
                <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                <asp:BoundField DataField="SoundTypeID" HeaderText="SoundTypeID" SortExpression="SoundTypeID" />
                <asp:BoundField DataField="FitID" HeaderText="FitID" SortExpression="FitID" />
                <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="PurchaseLink" HeaderText="PurchaseLink" SortExpression="PurchaseLink" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="ProductDB" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Products] WHERE [ModelID] = @original_ModelID AND [Model] = @original_Model AND (([SoundTypeID] = @original_SoundTypeID) OR ([SoundTypeID] IS NULL AND @original_SoundTypeID IS NULL)) AND (([FitID] = @original_FitID) OR ([FitID] IS NULL AND @original_FitID IS NULL)) AND (([Image] = @original_Image) OR ([Image] IS NULL AND @original_Image IS NULL)) AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([PurchaseLink] = @original_PurchaseLink) OR ([PurchaseLink] IS NULL AND @original_PurchaseLink IS NULL))" InsertCommand="INSERT INTO [Products] ([Model], [SoundTypeID], [FitID], [Image], [Price], [Description], [PurchaseLink]) VALUES (@Model, @SoundTypeID, @FitID, @Image, @Price, @Description, @PurchaseLink)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Products]" UpdateCommand="UPDATE [Products] SET [Model] = @Model, [SoundTypeID] = @SoundTypeID, [FitID] = @FitID, [Image] = @Image, [Price] = @Price, [Description] = @Description, [PurchaseLink] = @PurchaseLink WHERE [ModelID] = @original_ModelID AND [Model] = @original_Model AND (([SoundTypeID] = @original_SoundTypeID) OR ([SoundTypeID] IS NULL AND @original_SoundTypeID IS NULL)) AND (([FitID] = @original_FitID) OR ([FitID] IS NULL AND @original_FitID IS NULL)) AND (([Image] = @original_Image) OR ([Image] IS NULL AND @original_Image IS NULL)) AND (([Price] = @original_Price) OR ([Price] IS NULL AND @original_Price IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL)) AND (([PurchaseLink] = @original_PurchaseLink) OR ([PurchaseLink] IS NULL AND @original_PurchaseLink IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ModelID" Type="Int64" />
                <asp:Parameter Name="original_Model" Type="String" />
                <asp:Parameter Name="original_SoundTypeID" Type="Int64" />
                <asp:Parameter Name="original_FitID" Type="Int64" />
                <asp:Parameter Name="original_Image" Type="String" />
                <asp:Parameter Name="original_Price" Type="Decimal" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_PurchaseLink" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Model" Type="String" />
                <asp:Parameter Name="SoundTypeID" Type="Int64" />
                <asp:Parameter Name="FitID" Type="Int64" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="PurchaseLink" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Model" Type="String" />
                <asp:Parameter Name="SoundTypeID" Type="Int64" />
                <asp:Parameter Name="FitID" Type="Int64" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="PurchaseLink" Type="String" />
                <asp:Parameter Name="original_ModelID" Type="Int64" />
                <asp:Parameter Name="original_Model" Type="String" />
                <asp:Parameter Name="original_SoundTypeID" Type="Int64" />
                <asp:Parameter Name="original_FitID" Type="Int64" />
                <asp:Parameter Name="original_Image" Type="String" />
                <asp:Parameter Name="original_Price" Type="Decimal" />
                <asp:Parameter Name="original_Description" Type="String" />
                <asp:Parameter Name="original_PurchaseLink" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    
    <div class="row">
        <asp:GridView ID="SoundTypesGrid" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TypeID" DataSourceID="SoundTypesDB" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                <asp:BoundField DataField="TypeID" HeaderText="TypeID" InsertVisible="False" ReadOnly="True" SortExpression="TypeID" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SoundTypesDB" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [SoundTypes] WHERE [TypeID] = @original_TypeID AND [Type] = @original_Type" InsertCommand="INSERT INTO [SoundTypes] ([Type]) VALUES (@Type)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [SoundTypes]" UpdateCommand="UPDATE [SoundTypes] SET [Type] = @Type WHERE [TypeID] = @original_TypeID AND [Type] = @original_Type">
            <DeleteParameters>
                <asp:Parameter Name="original_TypeID" Type="Int64" />
                <asp:Parameter Name="original_Type" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Type" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="original_TypeID" Type="Int64" />
                <asp:Parameter Name="original_Type" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    
    <div class="row">
        <asp:GridView ID="FitsGrid" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="FitID" DataSourceID="FitTypesDB" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                <asp:BoundField DataField="FitID" HeaderText="FitID" InsertVisible="False" ReadOnly="True" SortExpression="FitID" />
                <asp:BoundField DataField="Fit" HeaderText="Fit" SortExpression="Fit" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="FitTypesDB" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Fits] WHERE [FitID] = @original_FitID AND [Fit] = @original_Fit" InsertCommand="INSERT INTO [Fits] ([Fit]) VALUES (@Fit)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Fits]" UpdateCommand="UPDATE [Fits] SET [Fit] = @Fit WHERE [FitID] = @original_FitID AND [Fit] = @original_Fit">
            <DeleteParameters>
                <asp:Parameter Name="original_FitID" Type="Int64" />
                <asp:Parameter Name="original_Fit" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Fit" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Fit" Type="String" />
                <asp:Parameter Name="original_FitID" Type="Int64" />
                <asp:Parameter Name="original_Fit" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="UsersGrid" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Users" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="IsAdmin" HeaderText="IsAdmin" ReadOnly="True" SortExpression="IsAdmin" />
                <asp:CommandField ButtonType="Button" ShowHeader="True" ShowSelectButton="True" SelectText="Make Admin"/>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="Users" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT UserName, ISNULL((SELECT 'Yes' AS IsAdmin FROM UsersInRoles WHERE (UserId = U.UserId) AND (RoleId = (SELECT TOP (1) RoleId FROM Roles WHERE (RoleName = 'Administrator')))), 'No') AS IsAdmin FROM Users AS U"></asp:SqlDataSource>
    </div>
</asp:Content>