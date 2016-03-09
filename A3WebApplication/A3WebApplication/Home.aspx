<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="A3WebApplication.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    
    <div class="w3-container w3-margin w3-center w3-margin-bottom">
        <asp:Panel ID="pnlselectcat" runat="server">
  <div class="w3-row-padding">
      
    <div class="w3-third">
      <div class="w3-card-2 w3-light-grey w3-padding w3-round-medium" >
        <h3>
            <asp:LinkButton ID="lbHoodie" runat="server" OnClick="lbHoodie_Click">Hoodie</asp:LinkButton></h3> 
        <img src="/Images/Hoodies.jpg" class="img-responsive w3-hover-opacity "  style="width:100%" alt="Image">  
        <p>Available with any size</p>
      </div>
    </div>
    <div class="w3-third">
      <div class="w3-card-2 w3-light-grey w3-padding">
        <h3> 
            <asp:LinkButton ID="lbLadies" runat="server">Ladies & Junior</asp:LinkButton> </h3>
        <img src="/Images/Ladies&Junior.jpg" class="img-responsive w3-hover-opacity" style="width:100%" alt="Image">  
        <p>Available with any size</p>
      </div>
    </div>

    <div class="w3-third">
      <div class="w3-card-2 w3-light-grey w3-padding">
        <h3>
            <asp:LinkButton ID="lbPolo" runat="server">Polos</asp:LinkButton></h3>
        <img src="/Images/Polos.jpg" class="img-responsive w3-hover-opacity" style="width:100%" alt="Image">  
        <p>Available with any size</p>
      </div>
    </div>
  </div>
  <br>
  
  <div class="w3-row-padding">
    <div class="w3-third">
      <div class="w3-card-2 w3-light-grey w3-padding">
        <h3>
            <asp:LinkButton ID="lbTshirt" runat="server">T-shirt</asp:LinkButton></h3>
        <img src="/Images/tshirt.jpg" class="img-responsive w3-hover-opacity" style="width:100%" alt="Image">  
        <p>Available with any size</p>
      </div>
    </div>
        </asp:Panel>
     <asp:Panel ID="pnlHoodie" Visible="false" runat="server">
         <div class="w3-third">
      <div class="w3-card-2 w3-light-grey w3-padding w3-round-medium" >
        <img src="/Images/Hoodies.jpg" class="img-responsive w3-hover-opacity "  style="width:100%" alt="Image">  
        <p>Available with any size</p>
      </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="pnlLadies" Visible="false" runat="server">
        <div class="w3-third">
      <div class="w3-card-2 w3-light-grey w3-padding">     
        <img src="/Images/Ladies&Junior.jpg" class="img-responsive w3-hover-opacity" style="width:100%" alt="Image">  
        <p>Available with any size</p>
      </div>
    </div>
    </asp:Panel>
  </div>

       

    

</asp:Content>
