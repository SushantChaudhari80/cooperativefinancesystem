package com.code.clerk;

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
 * Servlet implementation class UpdateRequest
 */
@WebServlet("/UpdateRequest")
public class UpdateRequest extends HttpServlet {
	static Connection con;
	public void init(ServletConfig config) throws ServletException 
	{
		try {
			con=ConnectionProvider.getConnection();
		} catch (Exception e) {
			System.out.println("Exc init block "+e);
		}

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String u_id=request.getParameter("u_id");
		String sts=request.getParameter("sts");
		
		HttpSession session=request.getSession();
		String email = session.getAttribute("email").toString();
		
		String status="Reject";
		if(sts.equals("A"))
		{
			status="Accept";
		}
		
		try
		{
			PreparedStatement ps=con.prepareStatement("UPDATE `user_details` SET status='"+status+"',update_by='"+email+"' where u_id='"+u_id+"'");
			int i=ps.executeUpdate();
			if(i>0)
			{
				System.out.println("Update Done");
				response.sendRedirect("clerkViewUserRequest.jsp?reqa=done");
			}
			else
			{
				System.out.println("update Fail");
				response.sendRedirect("clerkViewUserRequest.jsp?rer=update");
			}
			
		}
		catch(Exception e)
		{
			System.out.println("Exc "+e);
		}
		
	}

}
