<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Rhino_App.index" %>
<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
	<title>Home</title>
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
						<a href="#" class="btn btn-warning">Shop Now</a>
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

	<section class="section-content bg padding-y-sm u-padding-top-big" >
		<div class="container">
			<%--<div class="card">
				<div class="card-body">
					<div class="row">
						<div class="col-md-3-24"><strong>Your are here:</strong></div>

						<!-- col.// -->
						<nav class="col-md-18-24">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item"><a href="#">Category name</a></li>
								<li class="breadcrumb-item"><a href="#">Sub category</a></li>
								<li class="breadcrumb-item active" aria-current="page">Items</li>
							</ol>
						</nav> <!-- col.// -->

						<div class="col-md-3-24 text-right">
							<a href="#" data-toggle="tooltip" title="List view"><i class="fa fa-bars"></i></a>
							<a href="#" data-toggle="tooltip" title="Grid view"><i class="fa fa-th"></i></a>
						</div> <!-- col.// -->

					</div> <!-- row.// -->
					<hr>

					<div class="row">
						<div class="col-md-3-24"><strong>Filter by:</strong></div> <!-- col.// -->
						<div class="col-md-21-24">
							<ul class="list-inline">
								<li class="list-inline-item dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Supplier type </a>
									<div class="dropdown-menu p-3" style="max-width: 400px;">
										<label class="form-check">
											<a href="#">
												<input type="checkbox" class="form-check-input">
												Good supplier
											</a>
										</label>
										<label class="form-check">
											<a href="#">
												<input type="checkbox" class="form-check-input">
												Best supplier
											</a>
										</label>
										<label class="form-check">
											<a href="#">
												<input type="checkbox" class="form-check-input">
												New supplier
											</a>
										</label>
									</div>
									<!-- dropdown-menu.// -->
								</li>
								<li class="list-inline-item dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Country </a>
									<div class="dropdown-menu p-3" style="max-width: 400px;">
										<label class="form-check">
											<a href="#">
												<input type="checkbox" class="form-check-input">
												China
											</a>
										</label>
										<label class="form-check">
											<a href="#">
												<input type="checkbox" class="form-check-input">
												Japan
											</a>
										</label>
										<label class="form-check">
											<a href="#">
												<input type="checkbox" class="form-check-input">
												Uzbekistan
											</a>
										</label>
										<label class="form-check">
											<a href="#">
												<input type="checkbox" class="form-check-input">
												Russia
											</a>
										</label>
									</div>
									<!-- dropdown-menu.// -->
								</li>
								<li class="list-inline-item"><a href="#">Product type</a></li>
								<li class="list-inline-item"><a href="#">Brand name</a></li>
								<li class="list-inline-item"><a href="#">Color</a></li>
								<li class="list-inline-item"><a href="#">Size</a></li>
								<li class="list-inline-item">
									<div class="form-inline">
										<label class="mr-2">Price</label>
										<input class="form-control form-control-sm" placeholder="Min" type="number">
										<span class="px-2">- </span>
										<input class="form-control form-control-sm" placeholder="Max" type="number">
										<button type="submit" class="btn btn-sm ml-2">Ok</button>
									</div>
								</li>
							</ul>
						</div> <!-- col.// -->
					</div> <!-- row.// -->
				</div> <!-- card-body .// -->
			</div> <!-- card.// -->

			<div class="padding-y-sm">
				<span>3897 results for "Item"</span>
			</div>--%>

			<%--================================== PRODUCTS ==================================--%>
			<div class="u-margin-bottom-medium">
				<h1>Our Selection Of Products</h1>
			</div>

			<div class="row-sm">
				<div class="col-md-3 col-sm-6">
					<figure class="card card-product card--animated">
						<div class="img-wrap">
							<img src="images/products/tank-top-e.jpg">
						</div>
						<figcaption class="info-wrap">
							<a href="#" class="title">Good item name</a>
							<div class="price-wrap">
								<span class="price-new">$1280</span>
								<del class="price-old">$1980</del>
							</div><!-- price-wrap.// -->
						</figcaption>
					</figure><!-- card // -->
				</div><!-- col // -->

				<div class="col-md-3 col-sm-6">
					<figure class="card card-product card--animated">
						<div class="img-wrap">
							<img src="images/products/hoodie-e.jpg"></div>
						<figcaption class="info-wrap">
							<a href="#" class="title">The name of product</a>
							<div class="price-wrap">
								<span class="price-new">$280</span>
							</div><!-- price-wrap.// -->
						</figcaption>
					</figure><!-- card // -->
				</div><!-- col // -->

				<div class="col-md-3 col-sm-6">
					<figure class="card card-product card--animated">
						<div class="img-wrap">
							<img src="images/products/joggers-e.jpg"></div>
						<figcaption class="info-wrap">
							<a href="#" class="title">Good item name</a>
							<div class="price-wrap">
								<span class="price-new">$280</span>
							</div><!-- price-wrap.// -->
						</figcaption>
					</figure><!-- card // -->
				</div><!-- col // -->

				<div class="col-md-3 col-sm-6">
					<figure class="card card-product card--animated">
						<div class="img-wrap">
							<img src="images/products/tank-top-e.jpg"></div>
						<figcaption class="info-wrap">
							<a href="#" class="title">Good item name</a>
							<div class="price-wrap">
								<span class="price-new">$280</span>
							</div><!-- price-wrap.// -->
						</figcaption>
					</figure><!-- card // -->
				</div><!-- col // -->

				<div class="col-md-3 col-sm-6">
					<figure class="card card-product card--animated">
						<div class="img-wrap">
							<img src="images/products/joggers-e.jpg"></div>
						<figcaption class="info-wrap">
							<a href="#" class="title">Good item name</a>
							<div class="price-wrap">
								<span class="price-new">$1280</span>
								<del class="price-old">$1980</del>
							</div><!-- price-wrap.// -->
						</figcaption>
					</figure><!-- card // -->
				</div><!-- col // -->

				<div class="col-md-3 col-sm-6">
					<figure class="card card-product card--animated">
						<div class="img-wrap">
							<img src="images/products/t-shirt-e.jpg"></div>
						<figcaption class="info-wrap">
							<a href="#" class="title">The name of product</a>
							<div class="price-wrap">
								<span class="price-new">$280</span>
							</div>
							<!-- price-wrap.// -->
						</figcaption>
					</figure><!-- card // -->
				</div> <!-- col // -->

				<div class="col-md-3 col-sm-6">
					<figure class="card card-product card--animated">
						<div class="img-wrap">
							<img src="images/products/hoodie-e.jpg"></div>
						<figcaption class="info-wrap">
							<a href="#" class="title">The name of product</a>
							<div class="price-wrap">
								<span class="price-new">$280</span>
							</div> <!-- price-wrap.// -->
						</figcaption>
					</figure> <!-- card // -->
				</div><!-- col // -->

				<div class="col-md-3 col-sm-6">
					<figure class="card card-product card--animated">
						<div class="img-wrap">
							<img src="images/products/joggers-e.jpg"></div>
						<figcaption class="info-wrap">
							<a href="#" class="title">The name of product</a>
							<div class="price-wrap">
								<span class="price-new">$280</span>
							</div> <!-- price-wrap.// -->
						</figcaption>
					</figure> <!-- card // -->
				</div><!-- col // -->

				<div class="col-md-3 col-sm-6">
					<figure class="card card-product card--animated">
						<div class="img-wrap">
							<img src="images/products/t-shirt-e.jpg"></div>
						<figcaption class="info-wrap">
							<a href="#" class="title">The name of product</a>
							<div class="price-wrap">
								<span class="price-new">$1280</span>
								<del class="price-old">$1980</del>
							</div> <!-- price-wrap.// -->
						</figcaption>
					</figure><!-- card // -->
				</div><!-- col // -->

				<div class="col-md-3 col-sm-6">
					<figure class="card card-product card--animated">
						<div class="img-wrap">
							<img src="images/products/tank-top-e.jpg"></div>
						<figcaption class="info-wrap">
							<a href="#" class="title">The name of product</a>
							<div class="price-wrap">
								<span class="price-new">$280</span>
							</div> <!-- price-wrap.// -->
						</figcaption>
					</figure><!-- card // -->
				</div><!-- col // -->

				<div class="col-md-3 col-sm-6">
					<figure class="card card-product card--animated">
						<div class="img-wrap">
							<img src="images/products/joggers-e.jpg"></div>
						<figcaption class="info-wrap">
							<a href="#" class="title">The name of product</a>
							<div class="price-wrap">
								<span class="price-new">$280</span>
							</div>  <!-- price-wrap.// -->
						</figcaption>
					</figure> <!-- card // -->
				</div><!-- col // -->

				<div class="col-md-3 col-sm-6">
					<figure class="card card-product card--animated">
						<div class="img-wrap">
							<img src="images/products/tank-top-e.jpg"></div>
						<figcaption class="info-wrap">
							<a href="#" class="title">The name of product</a>
							<div class="price-wrap">
								<span class="price-new">$280</span>
							</div> <!-- price-wrap.// -->
						</figcaption>
					</figure> <!-- card // -->
				</div> <!-- col // -->

			</div> <!-- row.// -->
		</div><!-- container // -->
	</section>
</asp:Content>

