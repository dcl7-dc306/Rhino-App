<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="trans-history.aspx.cs" Inherits="Rhino_App.trans_history" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .navbar{
            background: #343a40;
        }

    </style>
    <script>
        $(document).ready(function () {  // when the page loads is done run this script

            // write your javascript here
            $( ".datepicker" ).datepicker(); // loads datepicker

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navigation" runat="server">
     <%-- Navigation list here --%>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar1">
    <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbar1">
                       
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link page-scroll" href="manage-products.aspx">Product Management</a>
        </li>
        <li class="nav-item">
            <a class="nav-link page-scroll active" href="trans-history.aspx">Transaction History</a>
        </li>
        <% if (Session["user"] == null){%>
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
               <asp:Button runat="server" ID="btnLogout" CssClass="btn btn-warning" Text="Logout" OnClick="btnLogout_Click"/>
            </li>
        <%} %>
    </ul>
    </div>
    <%--// Navigation list here --%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <div class="rhino-forms bg u-padding-top-medium">
    <div class="container">
        <%--// ADMIN VIEW --%>
       <asp:Panel runat="server" ID="AdminPanel" Visible="true">
        <div class="row">
             
            <div class="col-4 jumbotron">
                <h1 class="u-margin-bottom-medium">Search Transaction</h1>
                <div class="form-group form-row">
                    <div class="col">
                        <asp:Label ID="lblOrderId" runat="server" Text="Order ID:" AssociatedControlID="txtOrderId"></asp:Label>
                        <asp:TextBox ID="txtOrderId" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col">
                        <asp:Label ID="lblCustomerId" runat="server" Text="Customer ID:" AssociatedControlID="txtCustomerId"></asp:Label>
                        <asp:TextBox ID="txtCustomerId" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group form-row">
                    <div class="col">
                        <asp:Label ID="lblCustomerName" runat="server" Text="Customer Username:" AssociatedControlID="txtCustomerName"></asp:Label>
                        <asp:TextBox ID="txtCustomerName" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col">
                        <asp:Label ID="lblProdName" runat="server" Text="Product Name:" AssociatedControlID="txtProdName"></asp:Label>
                        <asp:TextBox ID="txtProdName" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblProdPrice" runat="server" Text="Price" AssociatedControlID="txtPrice"></asp:Label>
                    <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                </div>
                <hr/>
                <div class="form-group form-row">
                    <div class="col">
                        <asp:Label ID="lblFrom" runat="server" Text="Transaction From:" AssociatedControlID="txtFrom"></asp:Label>
                        <asp:TextBox ID="txtFrom" CssClass="form-control datepicker" runat="server"></asp:TextBox>
                    </div>
                    <div class="col">
                        <asp:Label ID="lblTo" runat="server" Text="Transaction To:" AssociatedControlID="txtTo"></asp:Label>
                        <asp:TextBox ID="txtTo" CssClass="form-control datepicker" runat="server"></asp:TextBox>
                    </div>
                </div>
                <hr />
                <div class="form-group">
                    <asp:Button ID="btnSearch" CssClass="ml-auto btn btn-block btn-warning" OnClick="btnSearch_Click" runat="server" Text="Search" />
                </div>

            </div>                         
            <div class="col-8">
                
                <asp:Panel runat="server" ID="Orders_tb" Visible="true">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Order Id</th>
                        <th>Customer Id</th>
                        <th>Customer Name</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Total</th>
                        <th></th>
                    </tr>
                    </thead>                    
                    <tbody>
							<asp:Repeater ID="RepeaterOrders" runat="server">
							<ItemTemplate>
                                <tr>							
                                    <td>
                                       <p><%#Eval("order_id") %></p>
                                    </td>
                                    <td>
                                        <p><%#Eval("user_id") %></p>
                                    </td>
                                    <td>
                                        <p><%#Eval("username") %></p>
                                    </td>
                                    <td>
                                        <p><%#String.Format("{0:dd/MM/yyyy}",Eval("create_at")) %></p>
                                    </td>
                                    <td>
                                        <p><%#Eval("status") %></p>
                                    </td>
                                    <td>                                        
                                        <p>NZ$<%#String.Format("{0:n2}",Eval("total")) %></p>                                                                                   
                                    </td> 
                                    <td>                                        
                                        <asp:LinkButton ID="btnDetails" runat="server" CssClass="btn btn-warning rhino-card-add-button" CommandArgument='<%#Eval("order_id")%>' OnClick="btnDetails_Click" >Details</asp:LinkButton>                                                                              
                                    </td>                                    

                                </tr>	
							    </ItemTemplate>
							    </asp:Repeater>								
                            </tbody>  
                    <tfoot>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>TOTAL:</td>
                                <td>NZ$<%=String.Format("{0:n2}",SumTotal)%></td>
                                <td></td>
                            </tr>
                        </tfoot>
                </table>
                </asp:Panel>

                <asp:Panel runat="server" ID="Itens_tb" Visible="false">

                    <table class="table">
                        <thead>
                            <tr>
                                <th>Order Id</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>SubTotal</th>
                                <th>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-warning rhino-card-add-button" OnClick="btnBack_Click">Back</asp:LinkButton>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="RepeaterItens" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <p><%#Eval("order_id") %></p>
                                        </td>
                                        <td>
                                            <p><%#Eval("name") %></p>
                                        </td>
                                        <td>
                                            <p><%#Eval("quantity") %></p>
                                        </td>
                                        <td>
                                            <p>NZ$<%#String.Format("{0:n2}",(Convert.ToDecimal(Eval("total_price"))/Convert.ToInt64(Eval("quantity")))) %></p>
                                        </td>
                                        <td>
                                            <p>NZ$<%#String.Format("{0:n2}",Eval("total_price")) %></p>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>TOTAL:</td>
                                <td>NZ$<%=String.Format("{0:n2}",SumTotal)%></td>
                            </tr>
                        </tfoot>
                    </table>
                </asp:Panel>
                               
            </div>
        </div>
        </asp:Panel>
        <%--//END ADMIN VIEW --%>
        <%--//Client VIEW --%>
       <asp:Panel runat="server" ID="CLientOrders" Visible="false">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Order Id</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Total</th>
                        <th></th>
                    </tr>
                    </thead>                    
                    <tbody>
							<asp:Repeater ID="RepeaterClientOrders" runat="server">
							<ItemTemplate>
                                <tr>							
                                    <td>
                                       <p><%#Eval("order_id") %></p>
                                    </td>                                   
                                    <td>
                                        <p><%#String.Format("{0:dd/MM/yyyy}",Eval("create_at")) %></p>
                                    </td>
                                    <td>
                                        <p><%#Eval("status") %></p>
                                    </td>
                                    <td>                                        
                                        <p>NZ$<%#String.Format("{0:n2}",Eval("total")) %></p>                                                                                   
                                    </td> 
                                    <td>                                        
                                        <asp:LinkButton ID="btnDetailsClient" runat="server" CssClass="btn btn-warning rhino-card-add-button" CommandArgument='<%#Eval("order_id")%>' OnClick="btnDetailsClient_Click" >Details</asp:LinkButton>                                                                              
                                    </td>                                    
                                </tr>	
							    </ItemTemplate>
							    </asp:Repeater>								
                            </tbody>                    
                </table>
                </asp:Panel>
        <asp:Panel runat="server" ID="ClientItems" Visible="false">
            <table class="table">
                <thead>
                    <tr>
                        <th>Order Id</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>SubTotal</th>
                        <th>
                            <asp:LinkButton ID="btnBack" runat="server" CssClass="btn btn-warning rhino-card-add-button" OnClick="btnBack_Click">Back</asp:LinkButton>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="RepeaterItensClient" runat="server">
                        <ItemTemplate>                            
                            <tr>
                                <td>
                                    <p><%#Eval("order_id") %></p>
                                </td>
                                <td>
                                    <p><%#Eval("name") %></p>
                                </td>
                                <td>
                                    <p><%#Eval("quantity") %></p>
                                </td>
                                <td>
                                    <p>NZ$<%#String.Format("{0:n2}",(Convert.ToDecimal(Eval("total_price"))/Convert.ToInt64(Eval("quantity")))) %></p>
                                </td>
                                <td>
                                    <p>NZ$<%#String.Format("{0:n2}",Eval("total_price")) %></p>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
                <tfoot>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>TOTAL:</td>
                        <td>NZ$<%=String.Format("{0:n2}",SumTotal)%></td>
                    </tr>
                </tfoot>
            </table>
        </asp:Panel>
        <%--//END Client VIEW --%>
    </div>
    </div>
</asp:Content>
