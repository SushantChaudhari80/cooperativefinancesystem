<%@page import="java.util.Map"%>
<%@page import="com.code.user.GlobalFunction"%>
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

	<%
		if (request.getParameter("login") != null) {
			out.print("<script>alert('Login Successfull...')</script>");
		}
	%>


	<jsp:include page="header/mainMenu.jsp"></jsp:include>

	<section class="services-area section-padding-100-0">
	<div class="container">

		<div class="row">

			<div class="col-md-12" align="center">
				<h1 style="color: blue;">Welcome Clerk</h1>
				<hr />
			</div>

		</div>
		
		<div class="row">
		<div class="col-md-2" align="center"></div>
			<%
				String email=session.getAttribute("email").toString();
				String acc_type=session.getAttribute("u_type").toString();
				Map<String,String> u_details=GlobalFunction.getEmployeeDetails(email, acc_type);
				
			%>
			<hr />
			<div class="col-md-8" align="center">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<th>Name</th>
							<td><%=u_details.get("name")%></td>
						</tr>
						<tr>
							<th>Mobile</th>
							<td><%=u_details.get("mobile")%></td>
						</tr>
						<tr>
							<th>Email ID</th>
							<td><%=u_details.get("email")%></td>
						</tr>
						<tr>
							<th>Account Create Date</th>
							<td><%=u_details.get("c_date")%></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-2" align="center"></div>
		</div>
		
		
		
	</div>
	</section>
	<!-- ##### Services Area End ###### -->
	<br />
	<br />
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