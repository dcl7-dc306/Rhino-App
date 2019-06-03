﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="shop-products.aspx.cs" Inherits="Rhino_App.shop_products" %>
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
            <a class="nav-link page-scroll active" href="shop-products.aspx">Product Catalogue</a>
        </li>
        <li class="nav-item">
            <% if (Session["user"] != null){%>
               <asp:Button runat="server" ID="btnLogout" CssClass="btn btn-warning" Text="Logout" OnClick="btnLogout_Click" />    
            <% } %>
            <% else { %>
                <a class="btn btn-warning" href="login.aspx">
                    <i class="fas fa-user icon--small <%--icon--medium--cta--%>"></i> Login 
                </a>
            <%} %>
        </li>
        <li class="nav-item">
            <a class="nav-link page-scroll" href="orders.aspx"><i class="fas fa-shopping-cart icon--small"></i> Check Cart</a>
        </li>
    </ul>
    </div>
    <%--// Navigation list here --%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    
	<section class="section-content bg padding-y-sm u-padding-top-big" >
    <div class="container">
        <div class="u-margin-bottom-medium">
				<h1>Product Catalogue</h1>
		</div>
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                <a href='shop-product-item.aspx?id=<%#Eval("product_id") %>'>
                <div class="col-md-3 col-sm-6">
			        <figure class="card card-product card--animated">
				        <div class="img-wrap">
					        <img src='<%#Eval("image") %>'>
				        </div>
				        <figcaption class="info-wrap">
					        <a href='shop-product-item.aspx?id=<%#Eval("product_id") %>' class="title"><%#Eval("name") %></a>
					        <div class="price-wrap">
						        <span class="price-new">NZ$ <%#Eval("price") %></span>
						        <%--<del class="price-old">$1980</del>--%>
					        </div><!-- price-wrap.// -->
				        </figcaption>
			        </figure><!-- card // -->
		        </div><!-- col // -->
                </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    </section>
</asp:Content>
