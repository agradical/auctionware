<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.text.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="beans.PostBean"%>
    <%@page import="beans.ProductsBean"%>
    <%@page import="beans.ProductBean" %>
    <%@page import="beans.UserBean" %>
<%@page import="beans.RegisterBidsBean" %>
    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">

    <title>
        Online Bidding
    </title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.css" rel="stylesheet">

    <!-- theme stylesheet -->
    <link href="css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="css/custom.css" rel="stylesheet">

    <script src="js/respond.min.js"></script>

    <link rel="shortcut icon" href="favicon.png">



</head>

<body>
<% 
	RegisterBidsBean products = new RegisterBidsBean();
	UserBean user = new UserBean();
	String itemName="";
	String price="";
	String itemCount ="";
	String postUserEmail ="";
	String bidUserEmail = "";
		
	if (session == null)
  	{
    	String address = "/Error.jsp";
    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
    	dispatcher.forward(request,response);
  	} 
	
	if (session != null)
	{
		products=(RegisterBidsBean)session.getAttribute("PRODUCT1");
		user=(UserBean)session.getAttribute("USER");
		System.out.println("*************** " + user.getUserName());
		System.out.println("*************** " + products.getITEMID(0));
		
		if(user.getUserName() == null )
		{
	    	String address = "/login-error.jsp";
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
	    dispatcher.forward(request,response);
		}
		System.out.println("the jsp page has the data now: ");
		System.out.println("product list size:  " + products.getListSize());
		//products.getBooks();
	}
	//itemName=products.getIT();
	//price= products.getActPrice();
	//itemCount=products.getItemCount();
	//postUserEmail=products.getPostUserEmail();
	//bidUserEmail=products.getBidUserEmail();
	
	
%>



    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="MainPage.jsp">Home</a>
                        </li>
                        <li>Shopping cart</li>
                    </ul>
                </div>

                <div class="col-md-9" id="basket">

                    <div class="box">

                         
                            <h1>Shopping cart</h1>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                     		<th>Total Quantity</th>
                                            <th>Unit price</th>
                                            <th >Total</th>
                                            <th >Remove</th>
                                            <th >Final Deal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                      <% for(int index = 0; index < products.getListSize(); index++)
	    {
            	   
	    	%>
	    		
	
	    		<tr class="table">
	    				
	    	      <td  name ="itemname" value=<%products.getITEMNAME(index);%> ><%out.print(products.getITEMNAME(index)); %></td>
	    	      <td name="itemcount">
	    	      	<form method="post" action="UpdateCountServlet" class="inline">
		    	      	<input type="hidden" name="users" value="<% out.print(user.getUserName()); %> ">
		    	      	<input type="hidden" name="itemname" value="<%out.print(products.getITEMNAME(index)); %>" >
		    	      	<select name="itemcount1" onchange="this.form.submit()">
	  						<option value="1">1</option>
	  						<option value="2">2</option>
	  						<option value="3">3</option>
	  						<option value="4">4</option>
	  						<option value="5">5</option>
						</select>
					</form>
				  </td>
				  <td name="itemcount2" value=<%products.getITEMCOUNT(index); %>><%out.print(products.getITEMCOUNT(index)); %></td>
	    	      <td  name="itemprice" value=<%products.getACTPRICE(index);%>><%out.print(products.getACTPRICE(index)); %></td>
	    	      <td name="totalprice"><%out.print(Integer.parseInt(products.getITEMCOUNT(index)) * Integer.parseInt(products.getACTPRICE(index)));%></td>
	    	      <td><a>
	    	      	<form method="post" action="DeleteCartItemServlet" class="inline">
	    	      		<input type="hidden" name="users" value="<% out.print(user.getUserName()); %> ">
					  <input type="hidden" name="itemname" value="<%out.print(products.getITEMNAME(index)); %>" >
					  <input type="submit" name="submit_param" value="Delete" >
					</form></a>
	    	      </td>
	    	      <td>
	    	      	 <form name="modelDetail1" method="post" action="EmailCartServlet">
	    	      		<input type="hidden" name="postuser" value=<% out.print(user.getUserName()); %> >
	    	      		<input type="hidden" name="biduser" value=<% out.print(products.getBIDDERID(index)); %> >
	    	      		<input type="hidden" name="itemid" value=<% out.print(products.getITEMID(index)); %> >
	    	      		<input type="hidden" name="itemname" value=<% out.print(products.getITEMNAME(index)); %> >
                  		<input type="hidden" name="itemcount" value=<% out.print(products.getITEMCOUNT(index)); %> >
	    	      		<input type="hidden" name="itemprice" value=<%out.print(products.getACTPRICE(index)); %> >
	    	      		<input type="hidden" name="biduseremail" value=<%out.print(products.getBIDUSEREMAIL(index)); %>>
	    	      		<input type="hidden" name="postuseremail" value=<%out.print(products.getPOSTUSEREMAIL(index)); %>>
        				<input class="btn btn-lg btn-primary btn-block" type="submit" name="action" value="Place Order"  style="width:150px;">
        			 </form>
        		  </td>
        		  
        	 </tr>
        	  
        	 <%
	     }
    	%>     </tbody>
    	 <tfoot>
                <tr>
                  <th colspan="5">Total</th>
                <th colspan="2"> <% int sum = 0;
                for(int index = 0; index < products.getListSize(); index++)
	    {
            sum = sum + (Integer.parseInt(products.getITEMCOUNT(index)) * Integer.parseInt(products.getACTPRICE(index)));
	    }
	    	%><%=sum%></th>
                </tr>
          </tfoot>     
            </table>
            	</div>
            		<div class="box-footer">
                    	<div class="pull-right">
                        	<button type="submit" class="btn btn-primary">Proceed to checkout <i class="fa fa-chevron-right"></i>
                            </button>
                        </div>
                    </div>
                </div>
                </div>

                <div class="col-md-3">
                    <div class="box" id="order-summary">
                        <div class="box-header">
                            <h3>Order summary</h3>
                        </div>
                        
                           <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr class="total">
                                        <td>Total</td>
                                        <th><%=sum%></th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        
     


    </div>
    <!-- /#all -->


    

    <!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script src="js/bootstrap-hover-dropdown.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/front.js"></script>



</body>

</html>