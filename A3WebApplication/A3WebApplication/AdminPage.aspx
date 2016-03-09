<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="A3WebApplication.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">

     
    <div class="w3-topnav w3-Large w3-center w3-blue">
        <asp:LinkButton ID="lbCategory" runat="server" OnClick="lbCategory_Click">Edit Category</asp:LinkButton>
        <asp:LinkButton ID="lbCustomer" runat="server" OnClick="lbCustomer_Click">Edit Customer</asp:LinkButton>
        <asp:LinkButton ID="lbProduct" runat="server" OnClick="lbProduct_Click">Edit Product</asp:LinkButton>
        </div>
    <asp:Panel ID="pnlCategoryAdmin"  runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CategoryID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" ReadOnly="True" InsertVisible="False" SortExpression="CategoryID"></asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
             <asp:ImageField DataImageUrlField="ImagePath" ControlStyle-Width="100px" ControlStyle-Height="100px" DataImageUrlFormatString="Images/{0}"></asp:ImageField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbA3ConnStr %>' DeleteCommand="DELETE FROM [tbCategory] WHERE [CategoryID] = @CategoryID" InsertCommand="INSERT INTO [tbCategory] ([Name], [ImagePath]) VALUES (@Name, @ImagePath)" SelectCommand="SELECT * FROM [tbCategory]" UpdateCommand="UPDATE [tbCategory] SET [Name] = @Name, [ImagePath] = @ImagePath WHERE [CategoryID] = @CategoryID">
            <DeleteParameters>
                <asp:Parameter Name="CategoryID" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="ImagePath" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="ImagePath" Type="String"></asp:Parameter>
                <asp:Parameter Name="CategoryID" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="pnlCustomer" Visible="false" runat="server">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" InsertVisible="False" SortExpression="CustomerID"></asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName"></asp:BoundField>
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"></asp:BoundField>
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName"></asp:BoundField>
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber"></asp:BoundField>
                <asp:CheckBoxField DataField="AccessLevel" HeaderText="AccessLevel" SortExpression="AccessLevel"></asp:CheckBoxField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:dbA3ConnStr %>' DeleteCommand="DELETE FROM [tbCustomer] WHERE [CustomerID] = @CustomerID" InsertCommand="INSERT INTO [tbCustomer] ([UserName], [Password], [FirstName], [LastName], [Address], [City], [PhoneNumber], [AccessLevel]) VALUES (@UserName, @Password, @FirstName, @LastName, @Address, @City, @PhoneNumber, @AccessLevel)" SelectCommand="SELECT * FROM [tbCustomer]" UpdateCommand="UPDATE [tbCustomer] SET [UserName] = @UserName, [Password] = @Password, [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address, [City] = @City, [PhoneNumber] = @PhoneNumber, [AccessLevel] = @AccessLevel WHERE [CustomerID] = @CustomerID">
            <DeleteParameters>
                <asp:Parameter Name="CustomerID" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserName" Type="String"></asp:Parameter>
                <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
                <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
                <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                <asp:Parameter Name="City" Type="String"></asp:Parameter>
                <asp:Parameter Name="PhoneNumber" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="AccessLevel" Type="Boolean"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserName" Type="String"></asp:Parameter>
                <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
                <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
                <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                <asp:Parameter Name="City" Type="String"></asp:Parameter>
                <asp:Parameter Name="PhoneNumber" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="AccessLevel" Type="Boolean"></asp:Parameter>
                <asp:Parameter Name="CustomerID" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="pnlProducts" Visible="false" runat="server">
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" InsertVisible="False" SortExpression="ProductID"></asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price"></asp:BoundField>
               <asp:ImageField DataImageUrlField="PrimaryImagePath" ControlStyle-Width="100px" ControlStyle-Height="100px" DataImageUrlFormatString="Images/{0}"></asp:ImageField>
                <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:dbA3ConnStr %>' DeleteCommand="DELETE FROM [tbProduct] WHERE [ProductID] = @ProductID" InsertCommand="INSERT INTO [tbProduct] ([Name], [Price], [PrimaryImagePath], [CategoryID]) VALUES (@Name, @Price, @PrimaryImagePath, @CategoryID)" SelectCommand="SELECT * FROM [tbProduct]" UpdateCommand="UPDATE [tbProduct] SET [Name] = @Name, [Price] = @Price, [PrimaryImagePath] = @PrimaryImagePath, [CategoryID] = @CategoryID WHERE [ProductID] = @ProductID">
            <DeleteParameters>
                <asp:Parameter Name="ProductID" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="PrimaryImagePath" Type="String"></asp:Parameter>
                <asp:Parameter Name="CategoryID" Type="Int32"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="Price" Type="Decimal"></asp:Parameter>
                <asp:Parameter Name="PrimaryImagePath" Type="String"></asp:Parameter>
                <asp:Parameter Name="CategoryID" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="ProductID" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>
