<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="ProductsPage.aspx.cs" Inherits="A3WebApplication.ProductsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    
    <asp:DataList ID="dlProducts" runat="server"   RepeatColumns="3" OnItemCommand="dlProducts_ItemCommand" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <asp:Image   ID="Image1" runat="server"  ImageUrl='<%#Eval("PrimaryImagePath","Images/{0}") %>'   Height="250px" Width="250px"  /><br />
            <br />
            Name:
            <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /><br />
            <br />
            Price:
            <asp:Label Text='<%# Eval("Price") %>' runat="server" ID="PriceLabel" /><br />
            <br />
            <asp:Button ID="btnAdd" CommandArgument='<%#Eval("ProductID") %>' CommandName="Addtocart" runat="server" Text="Add to Cart" />
            
         
        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbA3ConnStr %>' SelectCommand="SELECT  [PrimaryImagePath], [Name], [Price], [ProductID] FROM [tbProduct]"></asp:SqlDataSource>
</asp:Content>
