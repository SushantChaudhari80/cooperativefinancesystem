package com.code.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.code.conn.ConnectionProvider;


@WebServlet("/transferMoney")
public class TransferMoney extends HttpServlet{
	static Connection con;
	public void init(ServletConfig config) throws ServletException 
	{
		try {
			con=ConnectionProvider.getConnection();
		} catch (Exception e) {
			System.out.println("Exc init block "+e);
		}

	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException
	  {
	
		if (ServletFileUpload.isMultipartContent(req)) 
  		{
			try 
			{
				@SuppressWarnings("unchecked")
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(req);
				  
				String amount ="", u_id="" , b_acc="" , b_iefc="" ,b_name="";
				String mobile="";
				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("amount")) {
						amount = (String) item.getString();
						System.out.println(amount);
					}
				} 
				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("u_id")) {
						u_id = (String) item.getString();
						System.out.println(u_id);
					}
				}
				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("be_acc")) {
						b_acc= (String) item.getString();
						System.out.println(b_acc);
					}
				}
				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("iefc")) {
						b_iefc= (String) item.getString();
						System.out.println(b_iefc);
					}
				}
				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("b_name")) {
						b_name= (String) item.getString();
						System.out.println(b_name);
					}
				}
				
				PreparedStatement ps=con.prepareStatement("insert into transaction values(?,?,?,?,?)");
				ps.setString(1, u_id);
				ps.setString(2, amount);
				ps.setString(3, b_acc);
				ps.setString(4, b_iefc);
				ps.setString(5, b_name);
				
				int i = ps.executeUpdate();
				if(i>0)
				{
					System.out.println("Done");
					PreparedStatement ps2=con.prepareStatement("select amount from bank_account_details where u_id=?");
					ps2.setString(1,u_id);
					ResultSet rs = ps2.executeQuery();
					System.out.println("fetch balance query done");
					if( rs.next()) {
					Integer blc= Integer.valueOf(rs.getString("amount"));
					System.out.println("available amount"+blc);
					Integer bl1= Integer.valueOf(amount);
					PreparedStatement ps1=con.prepareStatement("update bank_account_details set amount=? where u_id=?");
					System.out.println("setting parameter for update");
					ps1.setString(1, String.valueOf(blc-bl1));
					ps1.setString(2, u_id);
					ps1.executeUpdate();
					System.out.println("update Done");
					res.sendRedirect("transferMoney.jsp?reg=done");
					}
				}
			}catch(Exception e) {
				System.out.println(e.getLocalizedMessage());
			}
	  }
}
}
