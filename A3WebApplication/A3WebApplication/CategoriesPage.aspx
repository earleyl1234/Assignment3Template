<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="CategoriesPage.aspx.cs" Inherits="A3WebApplication.CategoriesPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
      <asp:DataList ID="dlCategory" RepeatColumns="1" DataKeyField="CategoryID" runat="server" DataSourceID="SqlDataSource1">
          <ItemTemplate>       
              Name:<asp:LinkButton ID="lbName"  runat="server"><%# Eval("Name") %></asp:LinkButton>
              
                      
              <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("ImagePath","Images/{0}") %>' Height="250px" Width="250px"  />
              <br />
          </ItemTemplate>
      </asp:DataList>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbA3ConnStr %>' SelectCommand="SELECT * FROM [tbCategory]"></asp:SqlDataSource>
</asp:Content>
