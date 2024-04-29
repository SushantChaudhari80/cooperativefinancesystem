
<header class="header-area">
	<!-- Top Header Area -->
	<div class="top-header-area">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12 d-flex justify-content-between">
					<div class="logo">
					  <h1 align="center" style="color: blue;"><jsp:include page="projectTitle.jsp"/></h1> 
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Navbar Area -->
	<div class="credit-main-menu" id="sticker">
		<div class="classy-nav-container breakpoint-off">
			<div class="container">
				<!-- Menu -->
				<nav class="classy-navbar justify-content-between" id="creditNav">

					<!-- Navbar Toggler -->
					<div class="classy-navbar-toggler">
						<span class="navbarToggler"><span></span><span></span><span></span></span>
					</div>

					<!-- Menu -->
					<div class="classy-menu">

						<!-- Close Button -->
						<div class="classycloseIcon">
							<div class="cross-wrap">
								<span class="top"></span><span class="bottom"></span>
							</div>
						</div>
						<!-- Nav Start -->
						<div class="classynav">

						<%
						//System.out.print(session.getAttribute("u_type").toString()); staus
						if(session.getAttribute("u_type").toString().equals("Admin"))
						{
						%>
						<ul>
							<li><a href="adminHome.jsp">Home</a></li>
							<li><a href="#">Add Members</a>
								<ul class="dropdown">
									<li><a href="admiAddAccount.jsp?at=m">Manager</a></li>
									<li><a href="admiAddAccount.jsp?at=c">Clerk</a></li>
								</ul></li>
							<li><a href="#">View Members</a>
									<ul class="dropdown">
										<li><a href="adminViewAcc.jsp?at=m">Manager</a></li>
										<li><a href="adminViewAcc.jsp?at=c">Clerk</a></li>
										<li><a href="viewAllUser.jsp">View Users</a></li>
										
									</ul></li>
							<li><a href="adminViewLoanRequest.jsp">Loan Details</a></li>
							<li><a href="#">Payment</a>
									<ul class="dropdown">
										<li><a href="mngrViewPayAmount.jsp?uid=0">Search By User</a></li>
									</ul></li>	
							<li><a href="index.jsp">Logout</a></li>
						</ul>
						<%
						}
						if(session.getAttribute("u_type").toString().equals("Clerk"))
						{
						%>	
						<ul>
								<li><a href="clerkHome.jsp">Home</a></li>
								
								
								<li><a href="clerkViewUserRequest.jsp">New Request</a></li>
								<li><a href="#">Users</a>
								<ul class="dropdown">
									<li><a href="clerkViewAuthUser.jsp?at=Accept">Authorized User</a></li>
									<li><a href="clerkViewAuthUser.jsp?at=Reject">Non-Authorized user</a></li>
								</ul></li>
								<li><a href="index.jsp">Logout</a></li>
							</ul>
						<%}
						if(session.getAttribute("u_type").toString().equals("Manager"))
						{
						%>
						<ul>
								<li><a href="managerHome.jsp">Home</a></li>
								<li><a href="viewAllUser.jsp">View Users</a></li>
								<li><a href="#">Loan</a>
									<ul class="dropdown">
										<li><a href="viewLoanRequest.jsp?sts=waiting">New Request</a></li>
										<li><a href="viewLoanRequest.jsp?sts=Accept">Approved</a></li>
										<li><a href="viewLoanRequest.jsp?sts=Reject">Reject</a></li>
									</ul></li>
								<li><a href="#">Payment</a>
									<ul class="dropdown">
										<li><a href="mngrViewPayAmount.jsp?uid=0">Search By User</a></li>
									</ul></li>								
								<li><a href="index.jsp">Logout</a></li>
							</ul>
						<%}
						if(session.getAttribute("u_type").toString().equals("User"))
						{
						%>
						<ul>
								<li><a href="userHome.jsp">Home</a></li>
								<li><a href="#">Loan</a>
									<ul class="dropdown">
										<li><a href="userLoanRequest.jsp">New Request</a></li>
										<li><a href="userViewLoanResponse.jsp">Request Status</a></li>
									</ul></li>								
								<li><a href="userPayAmount.jsp">Loan Details</a></li>
								<li><a href="viewProfile.jsp">Profile</a></li>
								<li><a href="#">Account/fund Details</a>
									<ul class="dropdown">
										<li><a href="AccountDetails.jsp">Account Details</a></li>
										<li><a href="transferMoney.jsp">Transfer Money</a></li>
										<li><a href="viewStatement.jsp">Statement</a></li>
									</ul></li>
								<li><a href="index.jsp">Logout</a></li>
						</ul>
						<%
						}
						if(session.getAttribute("u_type").toString()=="Geust")
						{
						%>

							<ul>
								<li><a href="index.jsp">Home</a></li>
								<li><a href="adminLogin.jsp">Admin Login</a></li>
								<li><a href="userLogin.jsp">User Login</a></li>
								<li><a href="managerLogin.jsp">Manager Login</a></li>
								<li><a href="clerkLogin.jsp">Clerk Login</a></li>
							</ul>
						<%}

%>

						</div>
						<!-- Nav End -->
					</div>

					<!-- Contact -->
					<div class="contact">
						<a href="#"><img src="img/core-img/call2.png" alt="">
							HelpLine: +91 9370637150 </a>
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
<!-- ##### Header Area End ##### -->
