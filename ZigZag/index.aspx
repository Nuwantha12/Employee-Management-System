<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ZigZag.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        
      <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                    <!-- Background image -->
            <asp:Image ID="Image1" runat="server" ImageUrl="imgs/home-logo.png" />
          <!-- Background image -->
          </div>
      </div>
        <div class="row mt-3 mb-5">
            <div class="col-12 text-center">
                <h4 class="display-1 text-center font-weight-bold"><span class="text-warning">E</span>MPLOYEE<span class="text-warning"> M</span>ANAGEMENT</h4>
                <h4 class="display-2 text-center font-weight-bold"><span class="text-warning">S</span>YSTEM</h4>
                <asp:Button class="btn btn-dark btn-lg mt-4 text-warning" ID="Button1" runat="server" Text="ADD EMPLOYEE" OnClick="Button1_Click" />
            </div>
          
      </div>

   </div>
</asp:Content>
