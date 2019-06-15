<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="change-password.aspx.cs" Inherits="Rhino_App.change_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navigation" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <div id="bg">
    <div class="container"> 
    <div class="row justify-content-center">
        <div class="jumbotron col-4 u-margin-top-medium">
                
            <h1 class="u-margin-bottom-medium">Change Password</h1>
            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" Text="Your New Password:" AssociatedControlID="txtPassword"></asp:Label>
                <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
            </div>
             <div class="form-group">
                <asp:Label ID="lblConfirmPass" runat="server" Text="Confirm Your New Password:" AssociatedControlID="txtConfirmPass"></asp:Label>
                <asp:TextBox ID="txtConfirmPass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnChangePassword" CssClass="btn btn-block btn-warning" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" />
            </div>
            <div class="form-group">
                <a href="login.aspx"><i class="fa fa-arrow-left"></i>&nbsp; Go back to login page</a>
            </div>
        </div>
    </div>
    </div>
    </div>
</asp:Content>
