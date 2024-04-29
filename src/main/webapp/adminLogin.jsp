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
			<div class="col-md-8" align="center">
				<img alt="" src="images/bank.jpg">
			</div>
			<div class="col-md-4" align="center">
				<h1 style="color: blue;">Admin Login</h1>
				<hr/>
				<form action="AdminLogin" method="POST">
					<div class="table-responsive">
						<table class="table">
							<tr>
								<th>username</th>
								<td><input type="username" class="form-control"
									placeholder="username" name="username" required></td>
							</tr>
							<tr>
								<th>Password</th>
								<td><input type="password" class="form-control"
									name="password" placeholder="Password" required></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" value="Login"
									class="btn btn-success"></td>
							</tr>
						</table>
					</div>
				</form>
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
						<p>Learning And Project Development SupportP</p>
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