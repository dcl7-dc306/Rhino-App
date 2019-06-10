<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Rhino_App.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #login{
            background:  linear-gradient(to bottom right,   rgba(38, 60, 81, .7), rgba(141, 0, 0, 0.7)), url(../images/banners/login.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            padding-top: 20px;
        }
    </style>
</asp:Content>

<%-- Call navigation classes here --%>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="navClass" runat="server">
    navbar navbar-expand-lg navbar-dark bg-dark
</asp:Content>--%>

<asp:Content ID="Content3" ContentPlaceHolderID="navigation" runat="server">
     <%-- Navigation here --%>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar1">
    <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbar1">
                       
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link page-scroll active" href="index.aspx">Back to Home</a>
        </li>
        <li class="nav-item">
            <a class="btn btn-warning" href="register.aspx">
                <i class="fas fa- icon--small <%--icon--medium--cta--%>"></i> Create an Account 
            </a>
        </li>
    </ul>
    </div>
    <%-- Navigation here --%>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="content" runat="server">
    <div id="login">
    <div class="container"> 
    <div class="row justify-content-center">
        <div class="jumbotron col-4">
                
            <h1 class="u-margin-bottom-medium">Login</h1>
            <div class="form-group">
                <asp:Label ID="lblUser" runat="server" Text="Username" AssociatedControlID="txtUser"></asp:Label>
                <asp:TextBox ID="txtUser" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                 <asp:Label ID="lblPass" runat="server" Text="Password" AssociatedControlID="txtPass"></asp:Label>
                <asp:TextBox ID="txtPass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <a class="user-form__forgot-password" href="forgot-password.aspx">I forgot my password</a>
            </div>
            <div class="form-group">
                <asp:Button ID="btnLogin" CssClass="btn btn-block btn-warning" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </div>

            <div class="form-group">
                Don't Have an account?&nbsp;<a class="user-form__forgot-password" href="register.aspx">Create an Account</a>
            </div>
        </div>
    </div>
    </div>
    </div>
</asp:Content>
