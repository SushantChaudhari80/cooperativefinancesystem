<%@page import="java.util.Date"%>
<%@page import="javax.xml.crypto.Data"%>
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

<body>
	<!-- Preloader -->
	<div class="preloader d-flex align-items-center justify-content-center">
	</div>
	<jsp:include page="header/mainMenu.jsp"></jsp:include>

	<section class="services-area section-padding-100-0">
	<div class="container">

		<div class="row">
			<div class="col-md-12" align="center">
				<h1 style="color: blue;">Waiting users for Loan Status</h1>
			</div>
		</div>
		<hr />
		<%
		GlobalFunction gf=new GlobalFunction();
		String u_id1=request.getParameter("u_id");
						String l_id=request.getParameter("l_id");
		HashMap<String,String> user_details=gf.getUserDetails(u_id1);
		
		%>
		
		<div class="row">
			<div class="col-md-6" align="center">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<td></td>
							<td><img alt="" src="img/<%=user_details.get("filename")%>" style="width: 50%"></td>
						</tr>
						<tr>
							<th>UserName</th>
							<td><%=user_details.get("fname") %>&nbsp;<%=user_details.get("mname") %>&nbsp;<%=user_details.get("lname") %></td>
						</tr>
						<tr>
							<th>Address</th>
							<td><%=user_details.get("address") %></td>
						</tr>
						<tr>
							<th>Gender</th>
							<td><%=user_details.get("gender") %></td>
						</tr>
						<tr>
							<th>Mobile</th>
							<td><%=user_details.get("mobile") %></td>
						</tr>
						<tr>
							<th>Email</th>
							<td><%=user_details.get("email") %></td>
						</tr>
						
					</table>
				</div>
			</div>
		
		
			<div class="col-md-6" align="center">
				<div class="table-responsive">
						<%
						String c_date=new Date().toString();
							Connection con = ConnectionProvider.getConnection();
							String status=request.getParameter("sts");

							PreparedStatement ps = con.prepareStatement("SELECT * FROM `loan_request_details` where id='"+l_id+"'");
							ResultSet rs = ps.executeQuery();
							int i = 0;
							while (rs.next()) 
							{
								i++;
								String id=rs.getString("id");
								
								String u_id=rs.getString("u_id");								 
								String status1=rs.getString("status");
								
						%>
					<form action="UpdateLoanDetails" method="POST">
						<table class="table">
						<tr>
							<tr>
								<th>Request Date<input type="hidden" value="<%=id%>" name="id"></th><td><%=rs.getString("req_date") %></td>
							</tr>
							<tr>
							<th>Amount</th>	<td><%=rs.getString("loan_amount") %></td></tr>						
							<tr><th>Reason</th><td><%=rs.getString("loan_reason") %></td>
							<tr><th>Status</th><td><select name="sts" class="form-control">
									<option value="Accept">Accept</option>
									<option value="Reject">Reject</option>
							</select></td>
							<tr><th>Response Date</th><td><input type="text" class="form-control" readonly="readonly" value="<%=c_date %>" name="c_date"></td>
							<tr><th>Response</th><td><textarea rows="2" cols="20" name="resp"required  class="form-control"> </textarea></td>
							<tr><th>Approved Amount</th><td><input type="number" name="apr_amnt" required class="form-control"> </td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" class="btn btn-success" value="Submit"></td>
							</tr>
						
					</table>
					</form>
						<%
						}
						%>
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