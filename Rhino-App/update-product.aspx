<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="update-product.aspx.cs" Inherits="Rhino_App.update_product" %>
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
            <a class="nav-link page-scroll active" href="shop-products.aspx">Product Management</a>
        </li>
        <li class="nav-item">
            <a class="nav-link page-scroll" href="shop-products.aspx">Transaction History</a>
        </li>
        <li class="nav-item">
            <% if (Session["user"] != null){%>
                <asp:Button runat="server" ID="btnLogout" CssClass="btn btn-warning" Text="Logout" />
            <%} %>
            <% else{ %>
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
    <section class="section-content bg padding-y-sm">
		<div class="container">

			<div class="row">
				<div class="col-xl-12 col-md-12 col-sm-12">


					<main class="card">
						<div class="row no-gutters">
							<aside class="col-sm-6 border-right">
								<article class="gallery-wrap">
									<div class="img-big-wrap">
										<div>
											<a href='<%=lblStatusImage.Text %>' data-fancybox="">
												<img src='<%=lblStatusImage.Text %>'>
											</a>
										</div>
									</div>

								</article>
								<!-- gallery-wrap .end// -->
							</aside>
							<aside class="col-sm-6">
								<article class="card-body">
									<h1 class="u-margin-bottom-small">Update Product</h1>
                                    
                                    <div class="form-group">
                                        <asp:Label ID="ProdIdDisplayer" runat="server" Text="ID:"></asp:Label>
                                        <asp:Label ID="lblProdId" runat="server" Text=""></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblProdName" runat="server" Text="Name:" AssociatedControlID="txtProdName"></asp:Label>
                                        <asp:TextBox ID="txtProdName" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblProdDesc" runat="server" Text="Description" AssociatedControlID="txtProdDesc"></asp:Label>
                                        <asp:TextBox ID="txtProdDesc" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblProdPrice" runat="server" Text="Price(NZD)" AssociatedControlID="txtPrice"></asp:Label>
                                        <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblCurrent" runat="server" Text="Current Image:"></asp:Label><br/>
                                        <asp:Label ID="lblStatusImage" runat="server" Text=""></asp:Label>
                                    </div>
                                    <div class="form-group">
                                        
                                        <asp:Label ID="lblImage" runat="server" Text="Update New Image:" AssociatedControlID="flProdImage"></asp:Label>
                                        <br />
                                        <asp:FileUpload ID="flProdImage" runat="server" />
                                    </div>


                                    <div class="form-group">
                                        <asp:Button ID="btnUpdateProduct" CssClass="ml-auto btn btn-block btn-warning" runat="server" Text="Update Product" OnClick="btnUpdateProduct_Click" />
                                    </div>
                                    <div class="form-group">
                                        <br>
                                        <a href="manage-products.aspx"><i class="fa fa-arrow-left"></i> Back to Product Management</a>
                                    </div>
								</article>
								<!-- card-body.// -->
							</aside>
							<!-- col.// -->
						</div>
						<!-- row.// -->
					</main>
					<!-- card.// -->

				</div>
			</div>
			<!-- row.// -->



		</div>
		<!-- container // -->
	</section>

</div>
</asp:Content>
