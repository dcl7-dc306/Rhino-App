<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Rhino_App.index" %>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
	<title>Home</title>
	<style>
		.rhino-card {
			overflow:hidden;
		}

		.rhino-card-add-button {
			-webkit-transition: all 0.2s ease-in-out;
			-moz-transition: all 0.2s ease-in-out;
			-ms-transition: all 0.2s ease-in-out;
			-o-transition: all 0.2s ease-in-out;
			transition: all 0.2s ease-in-out;
			position: absolute;
			right: -117px;
			bottom: 20px;
		}

		.rhino-card-view-button{
			-webkit-transition: all 0.2s ease-in-out;
			-moz-transition: all 0.2s ease-in-out;
			-ms-transition: all 0.2s ease-in-out;
			-o-transition: all 0.2s ease-in-out;
			transition: all 0.2s ease-in-out;
			position: absolute;
			top: 34%;
			left: 50px;
			right: 50px;
			opacity: 0;
		}

		.rhino-card:hover .rhino-card-add-button{
			right: 15px;
		}
		
		.rhino-card:hover .rhino-card-view-button{
			opacity: 1;
		}
	</style>
</asp:Content>

 <%-- Call navigation classes here --%>
<%--<asp:Content ID="navClass" ContentPlaceHolderID="navClass" runat="server">navbar navbar-landing navbar-expand-lg navbar-dark bg-dark</asp:Content>--%>

<asp:Content ID="navigation" ContentPlaceHolderID="navigation" runat="server">
	<%-- Navigation list here --%>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar1">
	<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbar1">
					   
	<ul class="navbar-nav ml-auto">
		<li class="nav-item">
			<a class="nav-link page-scroll active" href="index.aspx">Home</a>
		</li>
		<li class="nav-item">
			<a class="nav-link page-scroll" href="shop-products.aspx"><i class="fas fa-shopping-bag icon--small"></i> Product Catalogue</a>
		</li>
		<li class="nav-item">
			<a class="nav-link page-scroll" href="shop-cart.aspx"><i class="fas fa-shopping-cart icon--small"></i> Check Cart</a>
		</li>
		<% if (Session["user"] == null)
			{%>
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


<asp:Content ID="content" ContentPlaceHolderID="content" runat="server">

	<%--======================= BANNER SECTION ============================--%>

	<section id="intro" class="section-intro bg-secondary">
		<div class="container">
			<div class="row d-flex" style="min-height:600px;">
				<div class="col-sm-6 d-flex align-items-center">
					<header class="intro-wrap text-white">
						<h2 class="display-3"> Reach your limits and take on the world </h2>
						<p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse feugiat tortor at posuere varius. Aenean mi ligula, interdum et nisl at, dignissim vehicula justo. Nunc augue lectus, fringilla non vulputate in, ornare id nunc.</p>
						<a href="shop-products.aspx" class="btn btn-warning">Shop Now</a>
						<%--<a href="#" class="btn btn-light">Learn more</a>--%>
					</header>  <!-- intro-wrap .// -->
				</div> <!-- col.// -->
				<%--<div class="col-sm-6 text-right">
					<img src="images/items/comp.png" class="img-fluid my-5" width="500">	
				</div> <!-- col.// -->--%>
			</div> <!-- row.// -->
		</div> <!-- container .//  -->
	</section>

	<%--======================= PRODUCTS SECTION ============================--%>

	<section class="section-content bg padding-y-sm u-padding-top-medium" >
		<div class="container">

			<div class="u-margin-bottom-medium">
				<h1>Our Products</h1>
			</div>
			<div class="row">
			 <asp:Repeater ID="Repeater1" runat="server">
				<ItemTemplate>
				<a href='shop-product-item.aspx?id=<%#Eval("product_id") %>'>
				<div class="col-md-3 col-sm-6">
					<figure class="card card-product card--animated rhino-card">
						<div class="img-wrap">
							<img src='<%#Eval("image") %>'>
						</div>
						<figcaption class="info-wrap">
							<a href='shop-product-item.aspx?id=<%#Eval("product_id") %>' class="title"><%#Eval("name") %></a>
							<div class="price-wrap">
								<span class="price-new">NZ$  <%#String.Format("{0:n2}", Eval("price"))%></span> 
								<a href="shop-product-item.aspx?id=<%#Eval("product_id") %>" class="btn btn-warning rhino-card-view-button"> View Product Details</a>
								<asp:LinkButton ID="btnAddToCart" runat="server" CssClass="btn btn-warning rhino-card-add-button" CommandArgument='<%#Eval("product_id")%>' OnCommand="btnAddToCart_Command" OnClientClick="return confirm('ADD TO CART this product?');">Add To Cart</asp:LinkButton>
							</div><!-- price-wrap.// -->
						</figcaption>
					</figure><!-- card // -->
				</div><!-- col // -->
				</a>
				</ItemTemplate>
			</asp:Repeater>
			</div>

		</div><!-- container // -->
	</section>
</asp:Content>

