package com.code.user;

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
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");

		
		HttpSession session=request.getSession();
		try
		{
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `user_details` where email='"+email+"'");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				if(!"waiting".equals(rs.getString("status")))
				{
					GlobalFunction gf=new GlobalFunction();
					String newPassword = gf.generatePassword();
					PreparedStatement ps1=con.prepareStatement("UPDATE user_details SET password='"+newPassword+"' where email='"+email+"'");
					int i=ps1.executeUpdate();
					if(i>0)
					{
						
						response.sendRedirect("userLogin.jsp?pwd=chnage");
					}
					else
					{
						response.sendRedirect("userLogin.jsp?pwd=chnage");
					}
					
				}
				else
				{
					System.out.println("Authentication is Not Provide By Clerk");
					response.sendRedirect("userLogin.jsp?auth=fail");	
				}
			}
			else
			{
				System.out.println("Incorrect Login Details");
				response.sendRedirect("userLogin.jsp?login=fail");
			}
			
		}
		catch(Exception e)
		{
			System.out.println("Exc "+e);
		}
		
	}

}
