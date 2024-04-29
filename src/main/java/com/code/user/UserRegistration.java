package com.code.user;

import java.io.File; 
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

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


@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {
	
	final static String ImgPath="C:/Users/khamk/OneDrive/Documents/photoC:/Users/khamk/OneDrive/Documents/photo";
	
	static Connection con;
	public void init(ServletConfig config) throws ServletException 
	{
		try {
			con=ConnectionProvider.getConnection();
		} catch (Exception e) {
			System.out.println("Exc init block "+e);
		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		if (ServletFileUpload.isMultipartContent(request)) 
  		{
			try 
			{
				@SuppressWarnings("unchecked")
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				 
				String FileName = ""; 

				for (FileItem item1 : multiparts) 
				{
					if (!item1.isFormField()) 
					{

						String name = new File(item1.getName()).getName();
						item1.write(new File(ImgPath + File.separator + name));
						FileName = item1.getName(); 
					}
				}
				
				String fname="",mname="",lname="",gender="",dob="",address="",email="",password="";
				String mobile="";
				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("fname")) {
						fname = (String) item.getString();
					}
				} 
				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("mname")) {
						mname = (String) item.getString();
					}
				} 
				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("lname")) {
						lname = (String) item.getString();
					}
				} 
				
				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("gender")) {
						gender = (String) item.getString();
					}
				} 
				
				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("dob")) {
						dob= (String) item.getString();
					}
				} 
				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("address")) {
						address = (String) item.getString();
					}
				} 
				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("email")) {
						email= (String) item.getString();
					}
				} 
				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("mobile")) {
						mobile= (String) item.getString();
					}
				} 
				
				
				for (FileItem item : multiparts) 
				{
					if ((item.getFieldName()).equals("password")) {
						password = (String) item.getString();
					}
				} 
				
				
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
				Date dateobj = new Date();
				String c_date = df.format(dateobj);
				System.out.println("Current Date "+c_date);

				
				PreparedStatement ps=con.prepareStatement("INSERT INTO `user_details`(`fname`, `mname`, `lname`, `gender`, `dob`, `address`, `mobile` , `email`, `password`, `c_date`) VALUES ('"+fname+"','"+mname+"','"+lname+"','"+gender+"','"+dob+"','"+address+"','"+mobile+"','"+email+"','"+password+"','"+c_date+"')");
				int i=ps.executeUpdate();
				PreparedStatement ps1=con.prepareStatement("select * from user_details where fname=? and lname=?");
				ps1.setString(1, fname);
				ps1.setString(2,lname);
				
				ResultSet rs = ps1.executeQuery();
				rs.next();
				 String u_id = rs.getString(1);
				 Random random = new Random();
		 	       long min = 10000000000L; // 11-digit minimum value
		 	       long max = 99999999999L; // 11-digit maximum value
		 	       long acc_no = min + ((long) (random.nextDouble() * (max - min)));
		 	      PreparedStatement ps2=con.prepareStatement("insert into bank_account_details values(?,?,?)");
		 	      ps2.setString(1, u_id);
		 	      ps2.setString(2, String.valueOf(acc_no));
		 	      ps2.setString(3, "500");
		 	      ps2.executeUpdate();
		 	       
				if(i>0)
				{
					System.out.println("Done");
					response.sendRedirect("userLogin.jsp?reg=done");
				}
				else
				{
					System.out.println("Fail");
					response.sendRedirect("userRegistration.jsp?reg=fail");
				}
			} catch (Exception e) {
				// TODO: handle exception
	  			System.out.println("Exception "+e);
			}
		}
  		else 
		{
				System.out.println("Condition False");
				response.sendRedirect("userRegistration.jsp?reg=fail");
		}
	}

}