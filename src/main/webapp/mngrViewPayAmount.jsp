<%@page import="java.util.Map"%>
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
		<div class="row">
			<div class="col-md-12" align="center">
				<h1 style="color: blue;">View Received Payment Details</h1>
				<hr />
			</div>
		</div>
		<%
		GlobalFunction gf=new GlobalFunction();
		String uid=request.getParameter("uid");
		if(uid.equals("0"))
		{
		
			%>
			<form action="mngrViewPayAmount.jsp" method="get">
			<table class="table">
						<tr>
							<th>Select User Name</th>
							<td>
								<select name="uid" class="form-control">
								<%
								ResultSet rs=gf.getLoanUserId();
								while(rs.next())
								{
									String u_id=rs.getString("u_id");
									Map<String,String> u_d=gf.getUserDetails(u_id);
								%>
									<option value="<%=u_id%>"><%=u_d.get("fname")%>&nbsp;<%=u_d.get("mname")%>&nbsp;<%=u_d.get("lname")%></option>
								
								<%} %>
								</select>
							</td>
							<td><input type="submit" value="Search" class="btn btn-success"></td>
						</tr>
					</table>
			</form>
			<%			
		}
		else
		{
			
		
		
		//GlobalFunction gf=new GlobalFunction();
		Map<String,String> u_details =gf.getUserDetails(uid);
		int amount=gf.getLoanAmount(uid);
		
		%>
		
		<div class="row">
			<div class="col-md-4" align="center">
				<table class="table">
						<tr>
							<th>Sr.No</th>
							<th>Loan Amount</th>
							<th>Loan Reason	</th>
							<th>Request Date</th>
						</tr>
						<%
						ResultSet rs1=GlobalFunction.getLoanDetails(uid);
						int sr=0;
						int r_loan=0;
						while(rs1.next())
						{
							++sr;
						 	r_loan=r_loan+Integer.parseInt(rs1.getString("loan_amount"));
						%>
						<tr>
							<td><%=sr %></td>
							<td><%=rs1.getString("loan_amount")%></td>
							<td><%=rs1.getString("loan_reason")%></td>
							<td><%=rs1.getString("req_date")%></td>
						</tr>
						
						
						<%} %>
						<tr>
							<td></td>
							<th style="color: red;">Total Received_Loan: <%=r_loan %>/-</th>
							<th></th>
							<td></td>
						</tr>
						
					</table>
			</div>
			<div class="col-md-8" align="center">
				<div class="table-responsive">
					<table class="table">
						<tr style="color: red;">
							<th>Total Pending Loan Amount</th>
							<td><%=amount %>/-</td>
						</tr>
					</table>
					
					<table class="table">
						<tr align="center">
							<th>Sr.No</th>
							<th>Amount</th>
							<th>Payment Date</th>
						</tr>

						<%
							Connection con = ConnectionProvider.getConnection();
						
							PreparedStatement ps = con.prepareStatement("SELECT * FROM `pay_amount` where u_id='"+uid+"' ORDER BY id DESC");
							ResultSet rs = ps.executeQuery();
							int i = 0;
							int total_pay_amount=0;
							while (rs.next()) 
							{
								total_pay_amount=total_pay_amount+Integer.parseInt(rs.getString("amount"));
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
						<tr align="center">
							<th>Total Pay</th>
							<td><%=total_pay_amount %></td>
							<td></td>
						</tr>
						
						
						
					</table>
				</div>
			</div>

		</div>
	</div>
	<%} %>
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