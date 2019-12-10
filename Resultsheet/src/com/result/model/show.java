package com.result.model;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.result.controller.*;
public class show {

	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost/development" +
					"?user=root&password=");
		}catch(Exception e){System.out.println(e);}
		return con;
	}

	public static List<studentshow> getRecords(int start,int total){
		
		List<studentshow> list=new ArrayList<studentshow>();
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from student limit "+(start-1)+","+total);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				studentshow e=new studentshow();
				e.sets_Id(rs.getInt(1));
				e.sets_Roll(rs.getString(2));
				e.sets_Reg(rs.getString(3));
				e.sets_Name(rs.getString(4));
				e.sets_Father_name(rs.getString(5));
				e.sets_Mother_name(rs.getString(6));
				e.sets_Email(rs.getString(7));
				e.sets_Phone(rs.getString(8));
				e.sets_Semester(rs.getString(9));
				e.sets_Department(rs.getString(10));
				e.sets_Session(rs.getString(11));
				list.add(e);
			}
			con.close();
		}catch(Exception e){System.out.println(e);}
		return list;
	}
}
