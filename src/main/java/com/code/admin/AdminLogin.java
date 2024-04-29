package com.code.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.conn.ConnectionProvider;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	static Connection con;
	public void init(ServletConfig config) throws ServletException 
	{
		try {
			con=ConnectionProvider.getConnection();
		} catch (Exception e) {
			System.out.println("Exc init block "+e);
		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		HttpSession session=request.getSession();
		try
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `admin_details` where username='"+username+"' AND password='"+password+"'");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				session.setAttribute("u_type", "Admin");
				System.out.println("Login Done");
				response.sendRedirect("adminHome.jsp?login=done");
			}
			else
			{
				System.out.println("Incorrect Login Details");
				response.sendRedirect("adminLogin.jsp?login=fail");
			}
			
		}
		catch(Exception e)
		{
			System.out.println("Exc "+e);
		}
		
	}

}
