<%@page import="com.code.conn.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
	<jsp:include page="header/mainMenu.jsp"></jsp:include>

	<!-- ##### Notification ###### -->
	<!-- 
	<section class="cta-2-area wow fadeInUp" data-wow-delay="100ms">
	<div class="container">
		<div class="row">
			<div class="col-12">
				Cta Content
				<div
					class="cta-content d-flex flex-wrap align-items-center justify-content-between">
					<div class="cta-text">
						<h4>Notifications.</h4>
					</div>
					<div class="cta-btn">
						<a href="#" class="btn credit-btn box-shadow">Read More</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section> -->
	<!-- ##### Call To Action End ###### -->

	<!-- ##### Services Area Start ###### -->
	<section class="services-area section-padding-100-0">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Section Heading -->

			</div>
		</div>
		<%
			if (request.getParameter("auth") != null) {
				out.print("<script>alert('Authentication is Not Provide By Clerk..!')</script>");
			}
		%>
		<div class="row">
			<div class="col-md-5" align="center">
				<h1 style="color: blue;">Send Loan Request to Bank</h1>

				<hr />
				<%
					String u_id = session.getAttribute("u_id").toString();
					GlobalFunction gf = new GlobalFunction();
					int remaining_loan = gf.getLoanAmount(u_id);
					if (remaining_loan == 0) 
					{
				%>
					<h1>No Loan Pending</h1>
				<%
					} else 
					{
				%>
				<h2>
					Loan Amount:
					<%=remaining_loan%></h2>
				<hr />
				<form action="PayAmmount" method="POST">
					<div class="table-responsive">
						<table class="table">
							<tr>
								<th>Amount</th>
								<td>
								<input type="hidden" value="">
								<input type="number" class="form-control"
									placeholder="Amount" name="amount" required></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" value="PayAmount"
									class="btn btn-success"></td>
							</tr>
						</table>
					</div>
				</form>
				<%
					}
				%>

			</div>
			<div class="col-md-2" align="center"></div>
			<div class="col-md-5" align="center">
				<div class="table-responsive">
					<h2 style="color: blue;">Pay Amount Details</h2>
					<table class="table">
						<tr align="center">
							<td>Sr.No</td>
							<td>Amount</td>
							<td>Pay Date</td>
						</tr>

						<%
							Connection con = ConnectionProvider.getConnection();

							PreparedStatement ps = con.prepareStatement("SELECT * FROM `pay_amount` where u_id='"+ u_id + "' ORDER BY id DESC");
							ResultSet rs = ps.executeQuery();
							int i = 0;

							while (rs.next()) {
								++i;
						%>
						<tr align="center">
							<td><%=i%></td>
							<td><%=rs.getInt("amount")%></td>
							<td><%=rs.getString("c_date")%></td>
						</tr>
						<%
							}
						%>
					</table>
				</div>

			</div>


		</div>
	</div>
	</section>
	<!-- ##### Services Area End ###### -->
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