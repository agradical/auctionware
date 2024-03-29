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


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Post Product</title>

    <!-- Bootstrap core CSS -->
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
	<script type="text/javascript" src="sorttable.js"></script>
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/assets/js/ie-emulation-modes-warning.js"></script>
	<script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script>
			$(document).ready(function(){
			$("#click").click(function(){
					$("#myTable").append('<tr id="td"><td><div contenteditable></div></td><td><div contenteditable></div></td><td><div contenteditable></div></td><td><div contenteditable></div></td><td><input type="button" onClick="$(this).parent().parent().remove();" value="Delete"></td></tr>');
				});
				
			});
			
	</script>
  </head>

  <body>
		<% 
	ProductsBean products = new ProductsBean();
	UserBean user = new UserBean();
	
	if (session == null)
  	{
    	String address = "/login-error.jsp";
    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
    	dispatcher.forward(request,response);
  	} 
	
	if (session != null)
	{
		products=(ProductsBean)session.getAttribute("PRODUCTS");
		user=(UserBean)session.getAttribute("USER");
		System.out.println("*************** " + user.getUserName());
		//System.out.println("*************** " + products.getUserName());
		
		//if(products == null )
		//{
	    //	String address = "/login-error.jsp";
	    	//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
	    	//dispatcher.forward(request,response);
		//}
		System.out.println("the jsp page has the data now: ");
		//System.out.println("product list size:  " + products.getListSize());
		//products.getBooks();
	}
%>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="MainPage.jsp">Home</a></li>
            <li><a href="ProfilePage.jsp">Profile</a></li>
            <li><a href="LoginPage.jsp">Sign Out</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        
        <div class="col-sm-12 col-md-12 main">
			<h2 class="sub-header" align="center">Post an Item </h2>
          <h3 class="page-header" align="center">Categories You May Be Looking For</h3>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-4 placeholder">
             <a href="AddProduct.jsp"> <img src="img/mobile.jpeg" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail"></a>
              <a href="AddProduct.jsp"><h4>Mobiles</h4></a>
             <a href="AddProduct.jsp"> <span class="text-muted">Select to Bid</span></a>
            </div>
            <div class="col-xs-6 col-sm-4 placeholder">
              <a href="AddProduct.jsp"><img src="img/laptop.jpeg" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail"></a>
              <a href="AddProduct.jsp"><h4>Laptops</h4></a>
              <a href="AddProduct.jsp"><span class="text-muted">Select to Bid</span></a>
            </div>
            <div class="col-xs-6 col-sm-4 placeholder">
              <a href="AddProduct.jsp"><img src="img/tablet.png" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail"></a>
              <a href="AddProduct.jsp"><h4>Tablets</h4></a>
              <a href="AddProduct.jsp"><span class="text-muted">Select to Bid</span></a>
            </div>
            
          </div>
			 <h2 class="sub-header" align="center">Have Existing Posts?</h2>
          <h3 class="sub-header" align="center">Check Bids on Your Existing Posts</h3>
          <form action="ViewPostsServlet" method="post">
          	<input type="hidden" name="users" value=<% out.print(user.getUserName()); %> >
         	 <input class="btn btn-lg btn-primary btn-block" type="submit" value="View Your Posts"></input>
          
          
          <div class="table-responsive">
            <table class="table table-striped, sortable">
              
                <tr>
                  <th>User name</th>
                  <th>Item Name</th>
                  <th>Price</th>
                  <th>Description</th>
                  <th>Category</th>
                  <th>Quality</th>
                  <th>City</th>
				  <th>State</th>
                  <td></td>				  
                </tr>
      
             
            
            </table>
            </div>
            </form>
          </div>
        </div>
      </div>
 

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
