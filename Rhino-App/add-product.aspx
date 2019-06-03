<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="add-product.aspx.cs" Inherits="Rhino_App.add_product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navigation" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <div id="register">
    <div class="container"> 
    <div class="row justify-content-center">
        <div class="jumbotron col-6">

            <h1 class="u-margin-bottom-small">Add Product</h1>
            
            <div class="form-group">
                <asp:Label ID="lblProdName" runat="server" Text="Name:" AssociatedControlID="txtProdName"></asp:Label>
                <asp:TextBox ID="txtProdName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblProdDesc" runat="server" Text="Description" AssociatedControlID="txtProdDesc"></asp:Label>
                <asp:TextBox ID="txtProdDesc" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblProdPrice" runat="server" Text="Price" AssociatedControlID="txtPrice"></asp:Label>
                <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblImage" runat="server" Text="Upload Image" AssociatedControlID="flProdImage"></asp:Label>
                <asp:FileUpload ID="flProdImage" runat="server" />
                <asp:Label ID="lblStatusImage" runat="server" Text=""></asp:Label>
            </div>

            <div class="form-group">
                <asp:Button ID="btnAddProduct" CssClass="ml-auto btn btn-block btn-warning" runat="server" Text="Add Product" OnClick="btnAddProduct_Click"  />
            </div>
        </div>
    </div>
    </div>
    </div>
</asp:Content>
