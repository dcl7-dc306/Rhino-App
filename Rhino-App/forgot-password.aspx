<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="forgot-password.aspx.cs" Inherits="Rhino_App.forgot_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navigation" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <div id="bg">
    <div class="container"> 
    <div class="row justify-content-center">
        <div class="jumbotron col-4 u-margin-top-medium">
                
            <h1 class="u-margin-bottom-medium">Forgot Password</h1>
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Enter your e-mail address:" AssociatedControlID="txtEmail"></asp:Label>
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSendPassword" CssClass="btn btn-block btn-warning" runat="server" Text="Send Password" OnClick="btnSendPassword_Click" />
            </div>
            <div class="form-group">
                <a href="login.aspx"><i class="fa fa-arrow-left"></i>&nbsp; Go back to login page</a>
            </div>
        </div>
    </div>
    </div>
    </div>
</asp:Content>
