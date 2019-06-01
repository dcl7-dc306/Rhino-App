<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Rhino_App.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- CSS --%>
    <style>
        #register{
            background: url("../images/banners/register.jpg") no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            padding-top: 20px;
        }
    </style>

    <%-- JQUERY --%>
    <script type="text/javascript">

        $(document).ready(function () {  // when the page loads is done run this script

            // write your javascript here
            $( ".datepicker" ).datepicker(); // loads datepicker

        });
     </script>
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
            <a class="btn btn-warning" href="login.aspx">
                <i class="fas fa-user icon--small <%--icon--medium--cta--%>"></i> Login 
            </a>
        </li>
    </ul>
    </div>
    <%-- Navigation here --%>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="content" runat="server">
    <div id="register">
    <div class="container"> 
    <div class="row justify-content-center">
        <div class="jumbotron col-6">

            <h1 class="u-margin-bottom-small">Create an Account</h1>
            <div class="form-group form-row">
                <div class="col">
                    <asp:Label ID="lblFirst" runat="server" Text="First Name" AssociatedControlID="txtFirst"></asp:Label>
                    <asp:TextBox ID="txtFirst" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col">
                    <asp:Label ID="lblLast" runat="server" Text="Last Name" AssociatedControlID="txtLast"></asp:Label>
                    <asp:TextBox ID="txtLast" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group form-row">
                <div class="col">
                    <asp:Label ID="lblGender" runat="server" Text="Gender" AssociatedControlID="drpGender"></asp:Label>
                    <asp:DropDownList ID="drpGender" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                <div class="col">
                    <asp:Label ID="lblBirth" runat="server" Text="Birth of Date" AssociatedControlID="calBirth"></asp:Label>
                    <asp:TextBox ID="calBirth" CssClass="datepicker form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Email Address" AssociatedControlID="txtEmail"></asp:Label>
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
            </div>
            <hr />
            <p class="alert alert-dark" role="alert"><i class="fas fa-exclamation-triangle icon--medium"></i>&nbsp; &nbsp; Remember to keep this information, this is your login information</p>
            <div class="form-group">
                <asp:Label ID="lblUser" runat="server" Text="Username" AssociatedControlID="txtUser"></asp:Label>
                <asp:TextBox ID="txtUser" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-row">
                <div class="col-6">
                <div class="form-group">
                    <%--<input type="password" class="form-control" id="password-login" name="password" placeholder="Enter Password"/>--%>
                     <asp:Label ID="lblPass" runat="server" Text="Password" AssociatedControlID="txtPass"></asp:Label>
                    <asp:TextBox ID="txtPass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                </div>

               
                </div>
                <div class="col-6">
                <div class="form-group">
                    <%--<input type="password" class="form-control" id="password-login" name="password" placeholder="Enter Password"/>--%>
                    <asp:Label ID="lblConfirmPass" runat="server" Text="Confirm Password" AssociatedControlID="txtConfirmPass"></asp:Label>
                    <asp:TextBox ID="txtConfirmPass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                </div>
            </div>

            <div class="form-group">
                <a class="user-form__forgot-password " href="login.aspx">Have an account? Login here</a>
            </div>
            <div class="form-group">
                <asp:Button ID="btnRegister" CssClass="ml-auto btn btn-block btn-warning" runat="server" Text="Register" OnClick="btnRegister_Click" />
            </div>

           
            

           

        </div>
    </div>
    </div>
    </div>
</asp:Content>
