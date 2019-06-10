<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="shop-cart.aspx.cs" Inherits="Rhino_App.shop_cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navigation" runat="server">
    <%-- Navigation list here --%>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar1">
    <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbar1">
                       
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link page-scroll" href="index.aspx">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link page-scroll active" href="shop-products.aspx"><i class="fas fa-shopping-bag icon--small"></i> Product Catalogue</a>
        </li>
        <li class="nav-item">
            <a class="nav-link page-scroll" href="shop-cart.aspx"><i class="fas fa-shopping-cart icon--small"></i> Check Cart</a>
        </li>
        <% if (Session["user"] == null){%>
        <li class="nav-item">
            <a class="nav-link page-scroll" href="register.aspx">
                <i class="fas fa- icon--small <%--icon--medium--cta--%>"></i> Create an Account 
            </a>
        </li>
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
           <asp:Button runat="server" ID="btnLogout" CssClass="btn btn-warning" Text="Logout" OnClick="btnLogout_Click" />
        </li>
        <%} %>
    </ul>
    </div>
    <%--// Navigation list here --%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <!-- ========================= SECTION CONTENT ========================= -->
    <section class="section-content bg padding-y border-top">
        <div class="container">

            <div class="row">
                <main class="col-sm-9">
                    <h1 class="u-margin-bottom-medium">
                        Shopping Cart
                        <a class="btn btn-primary" style="float: right;" href="shop-products.aspx"><i class="fa fa-arrow-left"></i>&nbsp; Back to Product Catalogue</a>
                    </h1>
                    <div class="card">
                        <table class="table table-hover shopping-cart-wrap">
                            <thead class="text-muted">
                                <tr>
                                    <th scope="col">Product</th>
                                    <th scope="col" width="120">Quantity</th>
                                    <th scope="col" width="120">Price</th>
                                    <th scope="col" class="text-right" width="200">Action</th>
                                </tr>
                            </thead>
                            <tbody>
							<asp:Repeater ID="Repeater1" runat="server">
							<ItemTemplate>
                                <tr>							
                                    <td>
                                        <figure class="media">
                                            <div class="img-wrap">
                                                <img src='<%#Eval("image") %>' class="img-thumbnail img-sm"></div>
                                            <figcaption class="media-body">
                                            <a   href="shop-product-item.aspx?id=<%#Eval("product_id") %>"><h6 class="title text-truncate"><%#Eval("name") %></h6></a>
                                                <dl class="dlist-inline small">
                                                    <dt>Size: </dt>
                                                    <dd>XXL</dd>
                                                </dl>
                                                <dl class="dlist-inline small">
                                                    <dt>Color: </dt>
                                                    <dd>Orange color</dd>
                                                </dl>
                                            </figcaption>
                                        </figure>
                                    </td>
                                    <td>
                                        <p><%#Eval("quantity") %></p>
                                    </td>
                                    <td>
                                        <div class="price-wrap">
                                            <var class="price">NZ$<%#String.Format("{0:n2}",Eval("ItemTotal")) %></var>
                                            <small class="text-muted">(NZ$ <%#String.Format("{0:n2}", Eval("price"))%> each)</small>
                                        </div>
                                        <!-- price-wrap .// -->
                                    </td>
                                    <td class="text-right">
                                        <!--<a href="" class="btn btn-outline-danger">× Remove</a>-->
                                        <asp:LinkButton Text="remove" runat="server" CssClass="btn btn-outline-danger" CommandArgument='<%#Eval("product_id")%>' OnClick="btnRmvToCart_Click" ></asp:LinkButton>
                                    </td>
                                    </tr>	
							    </ItemTemplate>
							    </asp:Repeater>								
                            </tbody>
                        </table>
                    </div>
                    <!-- card.// -->

                </main>
                <!-- col.// -->
                <aside class="col-sm-3">
                    <p class="alert alert-success">You pay using your debit card, credit cards with unionpay and american express.</p>
                   <!-- <dl class="dlist-align">
                        <dt>Total price: </dt>
                        <dd class="text-right">USD 568</dd>
                    </dl>
                    <dl class="dlist-align">
                        <dt>Discount:</dt>
                        <dd class="text-right">USD 658</dd>
                    </dl>--><!-- discuss if we going to use it now -->
                    <dl class="dlist-align h4">
                        <dt>Total:</dt>
                        <dd class="text-right"><strong>USD <%=String.Format("{0:n2}",total) %></strong></dd>
                    </dl>
                    <hr>
                    <div class="form-group">
                        <asp:Label ID="lblCreditCart" runat="server" Text="Credit Card No." AssociatedControlID="txtCreditCard"></asp:Label>
                        <asp:TextBox ID="txtCreditCard" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group form-row">
                       <div class="col-6">
                           <asp:Label ID="lblExpiration"  runat="server" Text="Expiration" AssociatedControlID="txtExpiration"></asp:Label>
                           <asp:TextBox ID="txtExpiration" CssClass="form-control rhino-expiration" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-6">
                           <asp:Label ID="lblCVC"  runat="server" Text="CVC" AssociatedControlID="txtCVC"></asp:Label>
                           <asp:TextBox ID="txtCVC" CssClass="form-control rhino-expiration" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                      <asp:LinkButton ID="btnCheckout" CssClass="btn btn-warning btn-block" OnClick="btnCheckout_Click" runat="server">Proceed to Checkout</asp:LinkButton>
                    </div>
                    <figure class="itemside mb-3">
                        <aside class="aside">
                            <img src="images/icons/pay-visa.png"></aside>
                        <div class="text-wrap small text-muted">
                           Pay by using ADCB Cards Get Lorem Ipsum Promo
                        </div>
                    </figure>
                    <figure class="itemside mb-3">
                        <aside class="aside">
                            <img src="images/icons/pay-mastercard.png">
                        </aside>
                        <div class="text-wrap small text-muted">
                            Pay by MasterCard Get Lorem Ipsum Promo
                            <br>
                           
                        </div>
                    </figure>

                </aside>
                <!-- col.// -->
            </div>

        </div>
        <!-- container .//  -->
    </section>
<!-- ========================= SECTION CONTENT END// ========================= -->

<!-- ========================= SECTION  ========================= -->
<section class="section-name bg-white padding-y">
<div class="container">
<header class="section-heading">
<h2 class="title-section">Agreements and Terms</h2>
</header><!-- sect-heading -->

<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</div><!-- container // -->
</section>
<!-- ========================= SECTION  END// ========================= -->

</asp:Content>
