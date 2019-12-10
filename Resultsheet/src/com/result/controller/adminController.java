package com.result.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.result.model.Admin;
import com.result.model.Student;


@WebServlet("/adminController")
public class adminController extends HttpServlet {
	
	dbConnection db = new dbConnection();
	ArrayList<Admin> adminList = new ArrayList<Admin>();
	
	public ArrayList<Admin> showAllSubAdmin(){
		
		String sql = "select * from  sub_admin ORDER BY id DESC ";
		Connection con = db.getCon();
		try {

			PreparedStatement ps = con.prepareStatement(sql);
		    ResultSet myRs =	ps.executeQuery(sql);
		    while (myRs.next()) {
		    	
		    
		    	Admin newAdmin =  new Admin();
		    	
		    	String id = myRs.getString("id");
		    	String name  = myRs.getString("name");
		    	String position  = myRs.getString("position");
		    	String password  = myRs.getString("password");
		      	String item1 = myRs.getString("student_information");
		    	String item2 = myRs.getString("insert_result");
		    	String item3 = myRs.getString("update_result");
		    	
		    	newAdmin.setId(id);
		    	newAdmin.setName(name);
		    	newAdmin.setPosition(position);
		    	newAdmin.setPassword(password);
		    	newAdmin.setItem1(item1);
		    	newAdmin.setItem2(item2);
		    	newAdmin.setItem3(item3);
		   
		    	adminList.add(newAdmin);
			}
		    
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return adminList;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String delete_id =request.getParameter("delete_id");
		//System.out.println(delete_id);
		
		try {
			mainController.deleteAdmin(delete_id);
			response.sendRedirect("all_sub_admin.jsp?success"); 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action=request.getParameter("action");  
		
		if(action.equals("login")) {
		
		
		String adminType = request.getParameter("admin_status");
		
		String admin = request.getParameter("admin");
		String password = request.getParameter("password");
		
		
		
		
		Admin login_admin  = new Admin();
		login_admin.setName(admin);
		login_admin.setPassword(password);
		login_admin.setAdminType(adminType);
		
		
		login_admin = mainController.admin_login(login_admin);
	
			
			 if (login_admin.isSuperAdminIsvalid())
			 {
			       
			      HttpSession session = request.getSession(true);       
			      session.setAttribute("currentSessionForSuperAdmin",login_admin); 
			      session.setAttribute("currentSuperAdminName",admin);
			      response.sendRedirect("super-admin.jsp"); //logged-in page           
				  
			 }
			 
			 else if(login_admin.isSubAdminIsvalid()) {
				 
				  HttpSession session = request.getSession(true);
				  session.setAttribute("currentSubAdminName",admin);
			      session.setAttribute("currentSessionForSubAdmin",login_admin); 
			      response.sendRedirect("super-admin.jsp"); //logged-in page           
				 
				 
			 }
			       
			 else 
			      response.sendRedirect("admin-login.jsp"); //error page 
			
		}
		else if(action.equals("addNewAdmin")) {
			
			String newAdminName = request.getParameter("name");
			String position = request.getParameter("position");
			String item1 = request.getParameter("item1");
			String item2 = request.getParameter("item2");
			String item3 = request.getParameter("item3");

			
			//System.out.println(item1+item2+item3);
			
			if(item1==null) {
				item1="0";
			}
			if(item2==null) {
				item2="0";
			}
			if(item3==null) {
				item3="0";
			}
			
			
			System.out.println(item1+item2+item3);
			
			Random rand = new Random(); 
		     Integer min = 1000;
		     Integer max = 10000;
	         Integer rand_int1 =rand.nextInt((max - min) + 1) + min;
		     String password = String.valueOf(rand_int1);
			
			
			if(mainController.addNewAdmin(newAdminName,position,password,item1,item2,item3) == true) {
				
				response.sendRedirect("all_sub_admin.jsp?success"); 
				
				}
				
				else {
					
					response.sendRedirect("adminSettings.jsp?error"); 
				}
			
			/*Admin newadmin  = new Admin();
			
			Random rand = new Random(); 
		     Integer min = 1000;
		     Integer max = 10000;
	         Integer rand_int1 =rand.nextInt((max - min) + 1) + min;
		     String password = String.valueOf(rand_int1);
			
			newadmin.setName(newAdminName);
			newadmin.setPassword(password);
		
			
			
			if(mainController.addNewAdmin(newadmin) == true) {
			
			response.sendRedirect("adminSettings.jsp?success"); 
			
			}
			
			else {
				
				response.sendRedirect("adminSettings.jsp?error"); 
			}*/
			
		
		}
		
		else if(action.equals("editSubAdmin")) {
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String position = request.getParameter("position");
			
			try {
				mainController.updateSubAdmin(id,name,position);
				response.sendRedirect("adminSettings.jsp?updated"); 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	

}
