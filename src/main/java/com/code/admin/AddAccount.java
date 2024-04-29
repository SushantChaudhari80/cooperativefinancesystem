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
 * Servlet implementation class AddAccount
 */
@WebServlet("/AddAccount")
public class AddAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static Connection con;
	public void init(ServletConfig config) throws ServletException 
	{
		try 
		{
			con=ConnectionProvider.getConnection();
		}
		catch (Exception e) 
		{
			System.out.println("Exc init block "+e);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String password=request.getParameter("password");
		String acc_type=request.getParameter("acc_type");
		
		
		System.out.println("Name "+name);
		System.out.println("Email "+email);
		System.out.println("Mobile "+mobile);
		System.out.println("Password "+password);
		System.out.println("Acc Type "+acc_type);
		
		
		HttpSession session=request.getSession();
		try
		{
			String at="m";
			if (acc_type.equals("Clerk"))
			{
				at="c";
			}
			
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `account_details` where email='"+email+"' AND acc_type='"+acc_type+"'");
			System.out.println("PS "+ps);
			ResultSet rs = ps.executeQuery();
			if(!rs.next())
			{
				
				PreparedStatement ps1=con.prepareStatement("INSERT INTO `account_details`(`acc_type`, `name`, `mobile`, `email`, `password`) VALUES ('"+acc_type+"','"+name+"','"+mobile+"','"+email+"','"+password+"')");
				int i = ps1.executeUpdate();
				if(i>0)
				{
					session.setAttribute("acc_type",acc_type);
					System.out.println("Login Done...!");
					response.sendRedirect("admiAddAccount.jsp?at="+at+"&addac=done");
				}
				else
				{
					System.out.println("Registration Fail..!");
					response.sendRedirect("admiAddAccount.jsp?at="+at+"&addacf=fail");
				}
			}
			else
			{
				System.out.println("Incorrect Login Details");
				response.sendRedirect("admiAddAccount.jsp?at="+at+"&addf=fail");
			}
		}
		catch(Exception e)
		{
			System.out.println("Exc "+e);
		}
	}
}