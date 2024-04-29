package com.code.manager;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.conn.ConnectionProvider;

/**
 * Servlet implementation class UpdateLoanDetails
 */
@WebServlet("/UpdateLoanDetails")
public class UpdateLoanDetails extends HttpServlet {
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
		String sts=request.getParameter("sts");
		String c_date=request.getParameter("c_date");
		String resp=request.getParameter("resp");
		String apr_amnt=request.getParameter("apr_amnt");
		
		HttpSession session=request.getSession();
		String email=session.getAttribute("email").toString();
		
		try
		{
			PreparedStatement ps=con.prepareStatement("UPDATE `loan_request_details` SET `status`='"+sts+"',`response_by`='Manager',`rsp_date`='"+c_date+"',`aproved_amnt`='"+apr_amnt+"',`reason`='"+resp+"',update_by='"+email+"' WHERE id='"+id+"'");
			System.out.println("PS "+ps);
			int i=ps.executeUpdate();
			if(i>0)
			{
				System.out.println("Update Done");
				response.sendRedirect("viewLoanRequest.jsp?sts=waiting&update=done");
			}
			else
			{
				System.out.println("update Fail");
				response.sendRedirect("viewLoanRequest.jsp?sts=waiting&fail=update");
			}
			
		}
		catch(Exception e)
		{
			System.out.println("Exc "+e);
		}
		
	}

}
