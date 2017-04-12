<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="beans.UserBean"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.text.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="beans.PostBean"%>
    <%@page import="beans.ProductsBean"%>
    <%@page import="beans.ProductBean" %>
  
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

    <title>E-Store</title>

    <!-- Bootstrap core CSS -->
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		<link href="ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
			<link href="cover.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
   
	<script type="text/javascript" src="js/modernizr-1.5.min.js"></script>

	
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
   
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


	<!-- Latest compiled and minified JavaScript -->
	
    

    <!-- Bootstrap core CSS -->
   

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
			<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/assets/js/ie-emulation-modes-warning.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<style>
				a,
			a:focus,
			a:hover {
			  color: #fff;
			}

			/* Custom default button */
			.btn-default,
			.btn-default:hover,
			.btn-default:focus {
			  color: #333;
			  text-shadow: none; /* Prevent inheritance from `body` */
			  background-color: #fff;
			  border: 1px solid #fff;
			}


			html,
			body {
			  height: 100%;
			  background-image: url("https://c2.staticflickr.com/6/5509/30803966521_7d8f42e957_b.jpg") ;
			  background-color: #333;
			  background-size: 100% auto;
			  -webkit-background-size: 100% auto;
			  -moz-background-size: 100% auto;
			  -o-background-size: 100% auto;
			  background-position: center 0px; 
	


			}
			body {
			  color: #fff;
			  text-align: center;
			  text-shadow: 0 1px 3px rgba(0,0,0,.5);
			}

			/* Extra markup and styles for table-esque vertical and horizontal centering */
			.site-wrapper {
			  display: table;
			  width: 100%;
			  height: 100%; /* For at least Firefox */
			  min-height: 100%;
			  -webkit-box-shadow: inset 0 0 100px rgba(0,0,0,.5);
					  box-shadow: inset 0 0 100px rgba(0,0,0,.5);
			}
			.site-wrapper-inner {
			  display: table-cell;
			  vertical-align: top;
			}
			.cover-container {
			  margin-right: auto;
			  margin-left: auto;
			}

			/* Padding for spacing */
			.inner {
			  padding: 30px;
			}


			/*
			 * Header
			 */
			.masthead-brand {
			  margin-top: 10px;
			  margin-bottom: 10px;
			}

			.masthead-nav > li {
			  display: inline-block;
			}
			.masthead-nav > li + li {
			  margin-left: 20px;
			}
			.masthead-nav > li > a {
			  padding-right: 0;
			  padding-left: 0;
			  font-size: 16px;
			  font-weight: bold;
			  color: #fff; /* IE8 proofing */
			  color: rgba(255,255,255,.75);
			  border-bottom: 2px solid transparent;
			}
			.masthead-nav > li > a:hover,
			.masthead-nav > li > a:focus {
			  background-color: transparent;
			  border-bottom-color: #a9a9a9;
			  border-bottom-color: rgba(255,255,255,.25);
			}
			.masthead-nav > .active > a,
			.masthead-nav > .active > a:hover,
			.masthead-nav > .active > a:focus {
			  color: #fff;
			  border-bottom-color: #fff;
			}

			@media (min-width: 768px) {
			  .masthead-brand {
				float: left;
			  }
			  .masthead-nav {
				float: right;
			  }
			}


			/*
			 * Cover
			 */

			.cover {
			  padding: 0 20px;
			}
			.cover .btn-lg {
			  padding: 10px 20px;
			  font-weight: bold;
			}


			/*
			 * Footer
			 */

			.mastfoot {
			  color: #999; /* IE8 proofing */
			  color: rgba(255,255,255,.5);
			}


			/*
			 * Affix and center
			 */

			@media (min-width: 768px) {
			  /* Pull out the header and footer */
			  .masthead {
				position: fixed;
				top: 0;
			  }
			  .mastfoot {
				position: fixed;
				bottom: 0;
			  }
			  /* Start the vertical centering */
			  .site-wrapper-inner {
				vertical-align: middle;
			  }
			  /* Handle the widths */
			  .masthead,
			  .mastfoot,
			  .cover-container {
				width: 100%; /* Must be percentage or pixels for horizontal alignment */
			  }
			}

			@media (min-width: 992px) {
			  .masthead,
			  .mastfoot,
			  .cover-container {
				width: 700px;
			  }
			}

	</style>
  </head>

  <body background-image= "url("")">
  <input type="hidden" name="location" id="location">
  <% 
	String user="";
	if (session == null)
  	{
    	String address = "/login-error.jsp";
    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
    	dispatcher.forward(request,response);
  	} 
	
	if (session != null)
	{
		UserBean userBean =(UserBean)session.getAttribute("USER");
		//UserBean bean=(UserBean)request.getAttribute("bean");
		if(userBean.getUserName() == null || userBean == null )
		{
	    	String address = "/login-error.jsp";
	    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
	    	dispatcher.forward(request,response);
		}
		//out.print("Welcome, "+bean.getName());
		user = userBean.getUserName();
	}
	
	
	/*if (session != null)
	{
		String name=(String)session.getAttribute("USER");
		UserBean bean=(UserBean)request.getAttribute("bean");
		if(name == null || bean == null || name.compareTo(bean.getUserName()) != 0)
		{
	    	String address = "/login-error.jsp";
	    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
	    	dispatcher.forward(request,response);
		}
		//out.print("Welcome, "+bean.getName());
		user=bean.getUserName();
	}*/
%>
  

    <div class="site-wrapper"  >

      
	  <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand">E-Store.com</h3>
              <nav>
                <ul class="nav masthead-nav">
				  <li class="active"><a href="MainPage.jsp">Home</a></li>
                  <li>
					  <form method="post" action="ViewCartServlet" class="inline">
					   <input type="hidden" name="users" value="<% out.print(user); %>" >
					  <button type="submit" name="submit_param" value="submit_value" class="link-button,btn btn-success">Shopping Cart</button>
					</form></li>
                   <li><a href="ProfilePage.jsp">Profile</a></li>
                  <li><a href="LogoutPage.jsp">Log Out</a></li>
                </ul>
              </nav>
            </div>
          </div>
		</div>  
		<div class="cover-container">
          <div class="inner cover">
            <h1 class="cover-heading">Do you want to Bid for an Item?</h1>
            <p class="lead">Earn the Best Price for an Item you Dont want. </p>
            <p class="lead">
            <form method="post" action="ViewBidsServlet">
              <!-- <a href="Selling.html" class="btn btn-lg btn-warning">Go Bidding</a>-->
           <!--   <input type="text" name="users" value= readonly> -->
          <input type="hidden" name="users" value=<% out.print(user); %> >
         	 <input class="btn btn-lg btn-warning" name="" type="submit" value="Go Bidding"></input>
          </form>
            </p>
          </div>
		</div> 
		<div class="cover-container">
		<div class="inner cover">
            <h1 class="cover-heading">Do you want to Post or have already posted an Item?</h1>
            <p class="lead">Get the Best Product for your needs. </p>
            <p class="lead">
              <a href="Bidding.jsp"  class="btn btn-lg btn-default">Go Posting</a>
            </p>
          </div>
		</div>
			<!--<div class="cover-container">
		<div class="inner cover" >
            <h1 class="cover-heading">Do you want to Buy?</h1>
            <p class="lead">Get your Favourite Item here </p>
            <p class="lead">
              <a href="Bidding.html" class="btn btn-lg btn-success">Go Buying</a>
            </p>
          </div>
		</div>-->

 <div class="mastfoot">
            <div class="inner">
              <p>Site Maintained By- <a href="http://getbootstrap.com">Raghav Mathur</a>, at <a href="https://twitter.com/mdo">EStore.com</a>.</p>
            </div>
          </div>
        </div>
		

      </div>
      
		

  
	  

  

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    </body>
</html>
