package com.code.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Random;

import com.code.conn.ConnectionProvider;

public class GlobalFunction
{
	
	public int getLoanAmount(String u_id)
	{
		int remaining_amount=0;
		
		try 
		{
		 Connection con=ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `loan_request_details` where u_id='"+u_id+"' AND status='Accept'");
			ResultSet rs = ps.executeQuery();
			int amount = 0;
			
			while (rs.next()) 
			{
				amount=amount+rs.getInt("aproved_amnt");
			}
			
			System.out.println("Total Loan Amount");
			

			PreparedStatement ps1 = con.prepareStatement("SELECT * FROM `pay_amount` where u_id='"+u_id+"'");
			ResultSet rs1= ps1.executeQuery();
			int pay_amount = 0;
			while(rs1.next())
			{
				pay_amount=pay_amount+rs1.getInt("amount");
			}
			
			remaining_amount=amount-pay_amount;

		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		
		return remaining_amount;
	}
	
	public HashMap<String, String> getAccountDeatils(String u_id)
	{
		HashMap<String,String> user_details=new HashMap<>();
		
		try 
		{
			Connection con=ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `bank_account_details` where u_id='"+u_id+"'");
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) 
			{
				user_details.put("accountNumber", rs.getString("account_number"));
				user_details.put("amount", rs.getString("amount"));
			}			
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		
		return user_details;
	}
	
	public HashMap<String, String> getUserDetails(String u_id)
	{
		HashMap<String,String> user_details=new HashMap<>();
		
		try 
		{
			Connection con=ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `user_details` where u_id='"+u_id+"'");
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) 
			{
				user_details.put("c_date", rs.getString("c_date"));
				user_details.put("filename", rs.getString("filename"));
				user_details.put("fname", rs.getString("fname"));
				user_details.put("mname", rs.getString("mname"));
				user_details.put("lname", rs.getString("lname"));
				user_details.put("gender", rs.getString("gender"));
				user_details.put("dob", rs.getString("dob"));
				user_details.put("email", rs.getString("email"));
				user_details.put("address", rs.getString("address"));
				user_details.put("mobile", rs.getString("mobile"));
			}			
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		
		return user_details;
	}
	
	
	public static HashMap<String, String> getEmployeeDetails(String email, String ac_type)
	{
		HashMap<String,String> user_details=new HashMap<>();
		
		
		try 
		{
			Connection con=ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `account_details` where email='"+email+"' AND acc_type='"+ac_type+"'");
			ResultSet rs = ps.executeQuery();
			if(rs.next()) 
			{
				user_details.put("name", rs.getString("name"));
				user_details.put("email", rs.getString("email"));
				user_details.put("mobile", rs.getString("mobile"));
				user_details.put("c_date", rs.getString("c_date"));
			}			
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		
		return user_details;
	}
	

	public String generatePassword() 
	{
		char[] chars = "1234567890".toCharArray();
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < 6; i++) {
		    char c = chars[random.nextInt(chars.length)];
		    sb.append(c);
		}
		String output = sb.toString();
		return output;
	}
	
	public static ResultSet getLoanDetails(String u_id)
	{
		ResultSet rs =null;
		try 
		{
			Connection con=ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `loan_request_details` where u_id='"+u_id+"' AND status='Accept'");
			rs = ps.executeQuery();
			
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		
		return rs;
	}
	
	public ResultSet getLoanUserId()
	{
		ResultSet rs =null;
		
		try 
		{	
			Connection con=ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT Distinct(u_id) FROM `loan_request_details` where status='Accept'");
			rs = ps.executeQuery();
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		
		return rs;
	}
	
	public HashMap<String, String> transferMoney(String u_id , String amount)
	{
		HashMap<String,String> user_details=new HashMap<>();
		
		try 
		{
			Connection con=ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM `bank_account_details` where u_id='"+u_id+"'");
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) 
			{
				user_details.put("accountNumber", rs.getString("account_number"));
				user_details.put("amount", rs.getString("amount"));
			}			
		}
		catch (Exception e) 
		{
			System.out.println("Exc "+e);
		}
		
		return user_details;
	}
	

}
