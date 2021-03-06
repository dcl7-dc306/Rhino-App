﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="manage-products.aspx.cs" Inherits="Rhino_App.manage_products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .rhino-card {
            overflow:hidden;
        }

        .rhino-card-delete-button {
            -webkit-transition: all 0.2s ease-in-out;
            -moz-transition: all 0.2s ease-in-out;
            -ms-transition: all 0.2s ease-in-out;
            -o-transition: all 0.2s ease-in-out;
            transition: all 0.2s ease-in-out;
            position: absolute;
            right: -117px;
            bottom: 20px;
        }

        .rhino-card-update-button{
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

        .rhino-card:hover .rhino-card-delete-button{
            right: 15px;
        }
        
        .rhino-card:hover .rhino-card-update-button{
            opacity: 1;
        }
        

    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navigation" runat="server">
    <%-- Navigation list here --%>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar1">
    <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbar1">
                       
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link page-scroll active" href="manage-products.aspx">Product Management</a>
        </li>
        <li class="nav-item">
            <a class="nav-link page-scroll" href="trans-history.aspx">Transaction History</a>
        </li>
        <li class="nav-item">
            <% if (Session["user"] != null){%>
                <asp:Button runat="server" ID="btnLogout" CssClass="btn btn-warning" Text="Logout" OnClick="btnLogout_Click" />
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
    <section class="section-content bg padding-y-sm u-padding-top-medium" >
    <div class="container">
        <div class="u-margin-bottom-medium">
				<h1>
                                       
                   <div class="form-inline">
                    Product Management &nbsp;

                        <a class="btn btn-primary" href="add-product.aspx"><i class="fa fa-plus-circle"></i>&nbsp; Add Product</a> &nbsp;
                        
                        <div class="input-group">
                            <asp:TextBox ID="txtSearch" CssClass="form-control rhino-search" runat="server" placeholder="Search Product"></asp:TextBox>
                            <div class="input-group-append">
                                <asp:Button ID="btnSearch" CssClass="form-control btn btn-warning" runat="server" Text="Search" OnClick="btnSearch_Click"></asp:Button>
                            </div>
                        </div>
                    </div>
				</h1>
		</div>
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                <a href='update-product.aspx?id=<%#Eval("product_id") %>'>
                <div class="col-md-3 col-sm-6">
			        <figure class="card card-product card--animated rhino-card">
				        <div class="img-wrap">
                            <div class="shadower"></div>
					        <img src='<%#Eval("image") %>'>
				        </div>
				        <figcaption class="info-wrap">
					        <a href='update-product-item.aspx?id=<%#Eval("product_id") %>' class="title"><%#Eval("name") %></a>
					        <div class="price-wrap">
						        <span class="price-new">NZ$ <%#Eval("price") %></span>
						        <%--<del class="price-old">$1980</del>--%>
                                <a href="update-product.aspx?id=<%#Eval("product_id") %>" class="btn btn-warning rhino-card-update-button">Update Product</a>
                                <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-outline-danger rhino-card-delete-button" CommandArgument='<%#Eval("product_id") %>' OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you wish to DELETE this product?');">Delete</asp:LinkButton>
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
