package com.result.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.result.model.Mark;
import com.mysql.fabric.xmlrpc.base.Array;


@WebServlet("/adminShowMarkController")
public class adminShowMarkController extends HttpServlet {
	
	ArrayList<Mark> a3 = new ArrayList<Mark>();
	
	public ArrayList<Mark> showMark(){
		String sql = "select * from result ORDER BY s_Id DESC ";
		Connection con = db.getCon();
		try {
			//Statement stmt = con.createStatement();
			PreparedStatement ps = con.prepareStatement(sql);
		    ResultSet myRs =	ps.executeQuery(sql);
		    while (myRs.next()) {
		    	Mark newMark = new Mark();
		    	
		    	String roll  = myRs.getString("s_Roll");
		    	String reg  = myRs.getString("s_Reg");
		    	String name  = myRs.getString("s_Name");
		    	String fmid  = myRs.getString("s_FristMid");
		    	String smid  = myRs.getString("s_SecondMid");
		    	String ct  = myRs.getString("s_ClassTest");
		    	String att = myRs.getString("s_Attendence");
		    	String sem  = myRs.getString("s_Semester");
		    	String ccode  = myRs.getString("s_CourseCode");
		        System.out.println("Welcome " +name);
		        // login_student.setS_name(name);
		    	
		        newMark.setS_roll(roll);
		        newMark.setS_reg(reg);
		        newMark.setS_name(name);
		        newMark.setS_fmid(fmid);
		        newMark.setS_smid(smid);
		        newMark.setS_ct(ct);
		        newMark.setS_att(att);
		        newMark.setS_sem(sem);
		        newMark.setS_ccode(ccode);
		        newMark.setValid(true);
		        a3.add(newMark);
			}
		    
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a3;
	}
	
	
	dbConnection db = new dbConnection();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		
		RequestDispatcher dispatcher =  request.getRequestDispatcher("admin_show_all_mark.jsp");
		
		dispatcher.forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
