<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="shop-product-item.aspx.cs" Inherits="Rhino_App.shop_product_item" %>
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
            <a class="nav-link page-scroll" href="shop-cart.aspx"><i class="fas fa-shopping-cart icon--small"></i> Check Cart</a>
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
    </ul>
    </div>
    <%--// Navigation list here --%>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <!-- ========================= SECTION SINGLE PRODUCT ========================= -->
	<section class="section-content bg padding-y-sm">
		<div class="container">
            <ol class="breadcrumb u-margin-bottom-small">
					<li class="breadcrumb-item"><a class="btn btn-warning" href="shop-products.aspx"><i class="fa fa-arrow-left"></i> Back to Product Catalogue</a></li>
			</ol>
			<div class="row">
                <asp:Repeater ID="Repeater1" runat="server"> 
                    <ItemTemplate>
				    <div class="col-xl-12 col-md-12 col-sm-12">

					    <main class="card">
						    <div class="row no-gutters">
							    <aside class="col-sm-6 border-right">
								    <article class="gallery-wrap">
									    <div class="img-big-wrap">
										    <div>
											    <a href='<%#Eval("image")%>' data-fancybox="">
                                               
												    <img src='<%#Eval("image") %>'>

											    </a>
										    </div>
									    </div>

								    </article>
								    <!-- gallery-wrap .end// -->
							    </aside>
							    <aside class="col-sm-6">
								    <article class="card-body">
									    <!-- short-info-wrap -->
									    <h3 class="title mb-3"><%#Eval("name") %></h3>

									    <div class="mb-3">
										    <var class="price h3 text-warning">
											    <span class="currency">NZ $</span><span class="num"><%#Eval("price") %></span>
										    </var>
									    </div>
									    <!-- price-detail-wrap .// -->
									    <dl>
										    <dt>Description</dt>
										    <dd>
											    <p>
												    <%#Eval("description") %>
											    </p>
										    </dd>
									    </dl>
									    <!-- rating-wrap.// -->
									    <hr>
									    <div class="row">
										    <div class="col-sm-5">
											    <dl class="dlist-inline">
												    <dt>Quantity: </dt>
												    <dd>
                                                        <asp:DropDownList ID="drpQuantity" CssClass="form-control form-control-sm" runat="server">
                                                            <asp:ListItem Selected="True" Value="1"> 1 </asp:ListItem>
                                                            <asp:ListItem Value="2"> 2 </asp:ListItem>
                                                            <asp:ListItem Value="3"> 3 </asp:ListItem>
                                                        </asp:DropDownList>
												    </dd>
											    </dl>
											    <!-- item-property .// -->
										    </div>
										    <!-- col.// -->
									    </div>
									    <!-- row.// -->
									    <hr>
									    <!--<a href="#" class="btn  btn-warning"><i class='fa fa-plus'></i>&nbsp;Add to Cart </a>-->
                                        <asp:LinkButton ID="btnAddToCart" runat="server" CssClass="btn btn-warning rhino-card-add-button" CommandArgument='<%#Eval("product_id")%>' OnCommand="btnAddToCart_Click" OnClientClick="return confirm('ADD TO CART this product?');">Add To Cart</asp:LinkButton>
									    <a href="#" class="btn  btn-outline-warning">Checkout </a>
									    <!-- short-info-wrap .// -->
								    </article>
								    <!-- card-body.// -->
							    </aside>
							    <!-- col.// -->
						    </div>
						    <!-- row.// -->
					    </main>
					    <!-- card.// -->

					    <!-- PRODUCT DETAIL -->
					    <article class="card mt-3">
						    <div class="card-body">
							    <h4>Product Description</h4>
							    <p>
								    <%#Eval("description") %>
							    </p>
						    </div>
						    <!-- card-body.// -->
					    </article>
					    <!-- card.// -->
					    <!-- PRODUCT DETAIL .// -->

				    </div>
                    </ItemTemplate>
                </asp:Repeater>
			</div>
			<!-- row.// -->

		</div>
		<!-- container // -->
	</section>
</asp:Content>
