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
<%
if(request.getParameter("req")!=null)
{
	out.print("<script>alert('Request Send Successfully..!')</script>");
}

%>

	<jsp:include page="header/mainMenu.jsp"></jsp:include>

	<section class="services-area section-padding-100-0">
	<div class="container">

<%
String sts="Un-Athorized";
if(request.getParameter("at").equals("Accept"))
{
	sts="Authorized";
}
%>

		<div class="row">
			<div class="col-md-12" align="center">
				<h1 style="color: blue;">View <%=sts %> Users</h1>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-md-12" align="center">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<th>Sr.No</th>
							<th>Photo</th>
							<th>User Information</th>
							<th>Gender</th>
							<th>DOB</th>
							<th>Address</th>
							<th>A/C Create</th>
						</tr>
						<%
							String status=request.getParameter("at");
							String email=session.getAttribute("email").toString();
							Connection con = ConnectionProvider.getConnection();
							PreparedStatement ps = con.prepareStatement("SELECT * FROM `user_details` where status='"+status+"' ORDER BY u_id DESC");
							ResultSet rs = ps.executeQuery();
							int i = 0;
							
							//GlobalFunctions gf=new GlobalFunctions();
							while (rs.next()) 
							{
								i++;
								String u_id=rs.getString("u_id");
								Map<String,String> u_details=GlobalFunction.getEmployeeDetails(email, "Clerk");
								
						%>
						<tr>
							<td><%=i %></td>
							<td style="width: 60%;height: 60%;"><img style="width: 60%;height: 60%;" alt="" src="img/<%=rs.getString("filename") %>" ></td>
							<td style="width: 100%;height: 100%;">Name: <%=rs.getString("fname") %>&nbsp;<%=rs.getString("mname") %>&nbsp;<%=rs.getString("lname") %><br/>
								Email: <%=rs.getString("email") %><br/>
								Mobile: <%=rs.getString("mobile") %><br/> 
								<h6>status: <%=rs.getString("status") %><br/></h6>
								<h6 style="color: red;">UpdateBy: <%=u_details.get("name") %></h6>
							
							</td>
							<td><%=rs.getString("gender") %></td>
							<td><%=rs.getString("dob") %></td>
							<td><%=rs.getString("address") %></td>
							<td><%=rs.getString("c_date") %></td>
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