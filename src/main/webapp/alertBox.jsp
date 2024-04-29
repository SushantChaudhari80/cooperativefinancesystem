<%

if(request.getParameter("logout")!=null)
{
	out.print("<script>alert('Logout Successfully..!')</script>");
}

if(request.getParameter("update")!=null)
{
	out.print("<script>alert('Update Successfully..!')</script>");
}


if(request.getParameter("pwd")!=null)
{
	out.print("<script>alert('New Password Update Successfully...!')</script>");
}

if(request.getParameter("pwdf")!=null)
{
	out.print("<script>alert('Current Password Not Match...!')</script>");
}

if(request.getParameter("addac")!=null)
{
	out.print("<script>alert('Account Add Successfully...!')</script>");
}
if(request.getParameter("addacf")!=null)
{
	out.print("<script>alert('Account Not Add...!')</script>");
}





if(request.getParameter("login")!=null)
{
	out.print("<script>alert('Login Successfully..!')</script>");
}

if(request.getParameter("loginf")!=null)
{
	out.print("<script>alert('Incorrect Login Credentials..!')</script>");
}

if(request.getParameter("email")!=null)
{
	out.print("<script>alert('Email ID Already Exist Please try again..!')</script>");
}
if(request.getParameter("reg")!=null)
{
	out.print("<script>alert('Registration Successfully..!')</script>");
}
if(request.getParameter("emp")!=null)
{
	out.print("<script>alert('Employee Account Create Successfully..!')</script>");
}

if(request.getParameter("failreg")!=null)
{
	out.print("<script>alert('Registration Fails..!,  Please try again..!')</script>");
}

if(request.getParameter("reqa")!=null)
{
	out.print("<script>alert('Request Accept Successfully..!')</script>");
}
if(request.getParameter("reqr")!=null)
{
	out.print("<script>alert('Request Reject..!')</script>");
}

if(request.getParameter("pay")!=null)
{
	out.print("<script>alert('Payment Complete Successfully..!')</script>");
}



%>
