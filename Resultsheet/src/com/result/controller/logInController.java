package com.result.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;
import com.result.model.Student;


@WebServlet("/logInController")
public class logInController extends HttpServlet {
	
	static dbConnection db = new dbConnection();
	private static final long serialVersionUID = 2562294252731783855L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("student_id");
		String password = request.getParameter("password");
		
		
		Student login_student  = new Student();
		login_student.setS_roll(id);
		login_student.setS_password(password);
		
		login_student = mainController.login(login_student);
		 if (login_student.isValid())
		 {
		       
		      HttpSession session = request.getSession(true);       
		      session.setAttribute("currentSessionStudent",login_student); 
		      response.sendRedirect("index.jsp?user=id.login-successfully"); //logged-in page            
		 }
		       
		 else 
			 response.sendRedirect("login.jsp?failed-login"); //error page 
		
		
	}

}
