<%@page import="java.util.HashMap"%>
<%@page import="com.code.user.GlobalFunction"%>
<%@page import="com.code.conn.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title><jsp:include page="header/projectTitle.jsp" /></title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet" href="style.css">

</head>
<%
	String acc_type="Manager";
	if(request.getParameter("at").equals("c"))
	{
		acc_type="Clerk";
	}
%>

<body>
	<!-- Preloader -->
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="lds-ellipsis">
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
	<jsp:include page="header/mainMenu.jsp"></jsp:include>

	<section class="services-area section-padding-100-0">
	<div class="container">

		<div class="row">
			<div class="col-md-12" align="center">
				<h1 style="color: blue;">Add View All <%=acc_type %> Details</h1>
			</div>
		</div>
		<hr />
		<div class="row">
		<div class="col-md-2"></div>
			<div class="col-md-8" align="center">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<th>Sr.No</th>
							<th>Name</th>
							<th>Mobile</th>
							<th>Email-Id</th>
							<th>Password</th>
							<th>A/c Create Date</th>
						</tr>
						<%
							Connection con = ConnectionProvider.getConnection();
							PreparedStatement ps = con.prepareStatement("SELECT * FROM `account_details` where acc_type='"+acc_type+"'");
							ResultSet rs = ps.executeQuery();
							int i = 0;
							GlobalFunction gf=new GlobalFunction();
							while (rs.next()) 
							{
								i++;
								String id=rs.getString("id");
								
								 
								
						%>
						<tr>
							<td><%=i %></td>
							<td><%=rs.getString("name") %></td>
							<td><%=rs.getString("mobile") %></td>
							<td><%=rs.getString("email") %></td>
							<td><%=rs.getString("password") %></td>
							<td><%=rs.getString("c_date") %></td>
						</tr>
						<%
						}
						%>
					</table>
				</div>


			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	</section>
	<!-- ##### Services Area End ###### -->
	<br />
	<br />
	<br />
	

	<!-- ##### Footer Area Start ##### -->
	<footer class="footer-area section-padding-100-0"> <!-- Copywrite Area -->
	<div class="copywrite-area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div
						class="copywrite-content d-flex flex-wrap justify-content-between align-items-center">
						<!-- Copywrite Text -->
						<p>Learning And Project Development Support</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</footer>
	<!-- ##### Footer Area Start ##### -->

	<!-- ##### All Javascript Script ##### -->
	<!-- jQuery-2.2.4 js -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="js/active.js"></script>
</body>

</html>