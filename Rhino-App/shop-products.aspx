<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="shop-products.aspx.cs" Inherits="Rhino_App.shop_products" %>
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
            <a class="nav-link page-scroll active" href="index.aspx">Products</a>
        </li>
        <li class="nav-item">
            <asp:Button runat="server" ID="btnLogout" CssClass="btn btn-warning" Text="Logout" OnClick="btnLogout_Click" />
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
				<h1>Products Catalogue</h1>
		</div>
        <div class="row"> 
            <asp:DataList ID="DataList1" runat="server">
                <ItemTemplate>
                <div class="col-md-3 col-sm-6">
			        <figure class="card card-product card--animated">
				        <div class="img-wrap">
					        <img src='<%#Eval("image") %>'>
				        </div>
				        <figcaption class="info-wrap">
					        <a href='<%#Eval("product_id") %>' class="title"><%#Eval("name") %></a>
					        <div class="price-wrap">
						        <span class="price-new"><%#Eval("price") %></span>
						        <%--<del class="price-old">$1980</del>--%>
					        </div><!-- price-wrap.// -->
				        </figcaption>
			        </figure><!-- card // -->
		        </div><!-- col // -->
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
    </section>
</asp:Content>
