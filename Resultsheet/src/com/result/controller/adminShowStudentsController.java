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

import com.result.model.Student;



@WebServlet("/adminShowStudentsController")
public class adminShowStudentsController extends HttpServlet {
	
	ArrayList<Student> al = new ArrayList<Student>();
	
	public ArrayList<Student> showData(){
		String sql = "select * from student ORDER BY s_Id DESC ";
		Connection con = db.getCon();
		try {

			PreparedStatement ps = con.prepareStatement(sql);
		    ResultSet myRs =	ps.executeQuery(sql);
		    while (myRs.next()) {
		    	Student newStudent = new Student();
		    	
		    	String d_roll  = myRs.getString("s_Roll");
		    	String d_reg  = myRs.getString("s_Reg");
		    	String d_name  = myRs.getString("s_Name");
		    	String d_fname  = myRs.getString("s_Father_name");
		    	String d_mname  = myRs.getString("s_Mother_name");
		    	String d_email = myRs.getString("s_Email");
		    	String d_phone  = myRs.getString("s_Phone");
		    	String d_semester  = myRs.getString("s_Semester");
		    	String d_dept  = myRs.getString("s_Department");
		    	String d_session  = myRs.getString("s_Session");
		    	String d_pass  = myRs.getString("s_Pass");
		        //System.out.println("Welcome " + d_name);
		        // login_student.setS_name(name);
		    	
		        newStudent.setS_roll(d_roll);
		        newStudent.setS_reg(d_reg);
		        newStudent.setS_name(d_name);
		        newStudent.setS_father_name(d_fname);
		        newStudent.setS_mother_name(d_mname);
		        newStudent.setS_email(d_email);
		        newStudent.setS_phone(d_phone);
		        newStudent.setS_session(d_session);
		        newStudent.setS_semester(d_semester);
		        newStudent.setS_department(d_dept);
		        newStudent.setS_password(d_pass);
		        newStudent.setValid(true);
		        al.add(newStudent);
			}
		    
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}
	
	
	dbConnection db = new dbConnection();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		
		RequestDispatcher dispatcher =  request.getRequestDispatcher("admin_show_all_student.jsp");
		
		dispatcher.forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
