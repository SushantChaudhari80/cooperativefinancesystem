package com.code.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.code.conn.ConnectionProvider;

/**
 * Servlet implementation class LoanRequest
 */
@WebServlet("/LoanRequest")
public class LoanRequest extends HttpServlet {
	static Connection con;
	public void init(ServletConfig config) throws ServletException 
	{
		try 
		{
			con=ConnectionProvider.getConnection();
		} catch (Exception e) {
			System.out.println("Exc init block "+e);
		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String loan_amount=request.getParameter("loan_amount");
		String reason=request.getParameter("reason");
		
		HttpSession session=request.getSession();
		String u_id=session.getAttribute("u_id").toString();
		
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		Date dateobj = new Date();
		String c_date = df.format(dateobj);
		
		System.out.println("C Date " + c_date);

		try
		{
			PreparedStatement ps=con.prepareStatement("INSERT INTO `loan_request_details`(`u_id`, `loan_amount`, `loan_reason`, `req_date`) VALUES ('"+u_id+"','"+loan_amount+"','"+reason+"','"+c_date+"')");
			
			int i=ps.executeUpdate();
			if(i>0)
			{
				System.out.println("Update Done");
				response.sendRedirect("userLoanRequest.jsp?req=send");
			}
			else
			{
				System.out.println("update Fail");
				response.sendRedirect("userLoanRequest.jsp?fail=req");			}
			
		}
		catch(Exception e)
		{
			System.out.println("Exc "+e);
		}
		
	}

}
