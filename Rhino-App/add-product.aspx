<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="add-product.aspx.cs" Inherits="Rhino_App.add_product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .navbar{
            background: #343a40;
        }

        .rhino-forms{
            padding-top: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navigation" runat="server">
    <%-- Navigation list here --%>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar1">
    <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbar1">
                       
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link page-scroll active" href="manage-products.aspx">Product Management</a>
        </li>
        <li class="nav-item">
            <a class="nav-link page-scroll" href="trans-history.aspx">Transaction History</a>
        </li>
        <% if (Session["user"] == null){%>
            <li class="nav-item">
                 <a class="btn btn-warning" href="login.aspx">
                        <i class="fas fa-user icon--small <%--icon--medium--cta--%>"></i> Login 
                 </a>   
            </li>
        <% } else { %>
            <li class="nav-item">
               <div class="rhino-user">
                    <i class="fa fa-user-circle"></i> Hello, <asp:Label ID="lblUser" runat="server" Text=""></asp:Label>
               </div>
            </li>
            <li class="nav-item">
               <asp:Button runat="server" ID="Button1" CssClass="btn btn-warning" Text="Logout" OnClick="btnLogout_Click" />
            </li>
        <%} %>
    </ul>
    </div>
    <%--// Navigation list here --%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <div class="rhino-forms bg">
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
                <asp:TextBox ID="txtProdDesc" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
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
            <div class="form-group">
                <br>
                <a href="manage-products.aspx"><i class="fa fa-arrow-left"></i> Back to Product Management</a>
            </div>
        </div>
    </div>
    </div>
    </div>
</asp:Content>
