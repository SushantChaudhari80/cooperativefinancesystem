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
<jsp:include page="validation.jsp"/>
	<jsp:include page="alertBox.jsp"/>
	
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
				<h1 style="color: blue;">User Create New Account</h1>
				<form action="UserRegistration" method="POST" name="ureg" enctype="multipart/form-data">
					<div class="table-responsive">
						<table class="table">


							<tr>
								<th>Full Name</th>
								<td><input type="text" class="form-control" onblur="return AllowAlphabet()"
									placeholder="fname" name="fname" required></td>
								<td><input type="text" class="form-control" onblur="return AllowAlphabet()"
									placeholder="mname" name="mname" required></td>
								<td><input type="text" class="form-control" onblur="return valideLname()"
									placeholder="lname" name="lname" required></td>
							</tr>
							<tr>
								<th>Gender</th>
								<td><select class="form-control" name="gender">
										<option value="Male">Male</option>
										<option value="Female">Female</option>
								</select></td>
								<th>Date of Birth</th>
								<td><input type="date" class="form-control" name="dob" 
									required></td>
							</tr>
							<tr>
								<th>Address</th>
								<td><textarea name="address" placeholder="Address in Details with PIN CODE" class="form-control" required></textarea></td>
								<th>Mobile Number</th>
								<td><input type="text" class="form-control" onblur="return Validate()"
									placeholder="Mobile Number" name="mobile" required></td>
							</tr>
							<tr>
								<th>Email ID</th>
								<td><input type="text" class="form-control" onblur="return validEmail()"
									placeholder="Email ID" name="email" required></td>
							</tr>
							<tr>
								<th>Password</th>
								<td><input type="password" class="form-control" onblur="return validuaernameandpass()"AllowAlphabet
									name="password" placeholder="Password" required></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" style="width: 130px;" value="Registration"
									class="btn btn-success"></td>
								<td></td>
								<td>
									<input type="reset" value="Reset" class="btn btn-danger">
								</td>
									
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