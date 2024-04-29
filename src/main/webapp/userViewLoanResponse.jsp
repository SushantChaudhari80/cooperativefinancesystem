<%@page import="java.util.Map"%>
<%@page import="com.code.user.GlobalFunction"%>
<%@page import="com.code.conn.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdk.nashorn.internal.runtime.GlobalFunctions"%>
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
				<h1 style="color: blue;">User View Loan Request Status</h1>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-md-12" align="center">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<th>Sr.No</th>
							<th>Request Date</th>
							<th>Amount</th>
							<th>Reason</th>
							<th>Status</th>
							<th>Response Date</th>
							<th>Response</th>
							<th>Approved Amount</th>
							<th>Operation</th>
						</tr>
						<%
							String u_id=session.getAttribute("u_id").toString();
							Connection con = ConnectionProvider.getConnection();

							PreparedStatement ps = con.prepareStatement("SELECT * FROM `loan_request_details` where u_id='"+u_id+"'");
							ResultSet rs = ps.executeQuery();
							int i = 0;

							while (rs.next()) 
							{
								i++;
								String id=rs.getString("id");
								
								/* String loan_amount=rs.getString("loan_amount");
								String loan_reason=rs.getString("loan_reason");
								String req_date=rs.getString("req_date");
								 */
								 
								 String status=rs.getString("status");
								
								 /* 
								String response_by=rs.getString("response_by");
								String rsp_date=rs.getString("rsp_date");
								String reason=rs.getString("reason");
								String aproved_amnt=rs.getString("aproved_amnt"); */
								
						%>
						<tr>
							<td><%=i %></td>
							<td><%=rs.getString("req_date") %></td>
							<td><%=rs.getString("loan_amount") %></td>
							<td><%=rs.getString("loan_reason") %></td>
							<td><%=rs.getString("status") %></td>
							<%-- <td><%=rs.getString("response_by") %></td>
							 --%>
							<td><%=rs.getString("rsp_date") %></td>
							<td><%=rs.getString("reason") %> <br />
								<%
								Map<String,String> u_details=GlobalFunction.getEmployeeDetails(rs.getString("update_by"),"Manager");
								if(!rs.getString("update_by").equals("None")) 
								{%>
								<h6>
									Response From:<br/><u>
									<%=u_details.get("name") %></u></h6>
								<% } %>
									</td>
							<td><%=rs.getString("aproved_amnt") %></td>
							<td>
								<%
							if(status.equals("waiting"))
							{
							%> <a style="color: blue;" href="CancelRequest?id=<%=id %>">Cancel
									Request</a> <%}else
							{
								%> <%=status %> <%
							}
								%>
							</td>
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