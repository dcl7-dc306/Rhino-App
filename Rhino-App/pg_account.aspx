<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="pg_account.aspx.cs" Inherits="Rhino_App.account" %>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title>Account</title>
</asp:Content>
<asp:Content ID="content" ContentPlaceHolderID="content" runat="server">
    <section class="section-user u-margin-top-huge">
        <form class="user-form" runat="server">
        <div class="container">
            <div class="row">
                
                <div class="col">
                    <h1 class="u-margin-bottom-medium">Log In</h1>
                    <div class="form-group">
                        <label for="emailLogin">Email</label>
                        <%--<input type="email" class="form-control" id="email-login" name="email" placeholder="Enter Email"/>--%>
                        <asp:TextBox type="email" ID="emailLogin" CssClass="form-control" runat="server" placeholder="Enter Email" name="email"></asp:TextBox>
                    
                    </div>

                    <div class="form-group">
                        <label for="passwordLogin">Password</label>
                        <%--<input type="password" class="form-control" id="password-login" name="password" placeholder="Enter Password"/>--%>
                        <asp:TextBox type="password" ID="passwordLogin" CssClass="form-control" runat="server" placeholder="Enter Password" name="password"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <a class="user-form__forgot-password" href="#">I forgot my password</a>
                    </div>  

                    <%--<button type="button" class="btn btn-primary">Log in</button>--%>
                    <asp:Button ID="buttonLogIn" CssClass="btn btn-warning" runat="server" Text="Log in" />
                </div>

                <div class="col">
                    <h1 class="u-margin-bottom-medium">Sign Up</h1>
                    <div class="form-group">
                        <label for="nameSignUp">Name</label>
                        <%--<input type="text" class="form-control" id="name-sing-up" name="name" placeholder="Enter Name"/>--%>
                        <asp:TextBox type="text" ID="nameSignUp" CssClass="form-control" runat="server" placeholder="Enter Name" name="name"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="lastNameSignUp">Last Name</label>
                        <%--<input type="text" class="form-control" id="last-name-sing-up" name="last-name" placeholder="Enter Last Name"/>--%>
                        <asp:TextBox type="text" ID="lastNameSignUp" CssClass="form-control" runat="server" placeholder="Enter Last Name" name="last-name"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="emailSignUp">Email</label>
                        <%--<input type="email" class="form-control" id="email-sing-up" name="email" placeholder="Enter Email"/>--%>
                        <asp:TextBox type="email" ID="emailSignUp" CssClass="form-control" runat="server" placeholder="Enter Email" name="email"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="passwordSignUp">Password</label>
                        <%--<input type="password" class="form-control" id="password-sing-up" name="password" placeholder="Enter Password"/>--%>
                        <asp:TextBox type="password" ID="passwordSignUp" CssClass="form-control" runat="server" placeholder="Enter Password" name="password"></asp:TextBox>
                    </div>
                        
                    <%--<button type="button" class="btn btn-primary">Sign Up</button>--%>
                    <asp:Button ID="buttonSignUp" CssClass="btn btn-warning" runat="server" Text="Sign up" />
                </div>
            </div>
        </div>
        </form>
    </section>
</asp:Content>
