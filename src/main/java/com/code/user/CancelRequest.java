package com.code.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.conn.ConnectionProvider;

/**
 * Servlet implementation class CancelRequest
 */
@WebServlet("/CancelRequest")
public class CancelRequest extends HttpServlet {
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
		
		String id=request.getParameter("id");
		
		
		try
		{
			PreparedStatement ps=con.prepareStatement("");
			int i=ps.executeUpdate();
			if(i>0)
			{
				System.out.println("Update Done");
				response.sendRedirect("clerkViewUserRequest.jsp?update=done");
			}
			else
			{
				System.out.println("update Fail");
				response.sendRedirect("clerkViewUserRequest.jsp?fail=update");
			}
			
		}
		catch(Exception e)
		{
			System.out.println("Exc "+e);
		}
		
	}

}
