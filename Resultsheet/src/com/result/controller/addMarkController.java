package com.result.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.result.model.Mark;


@WebServlet("/addMarkController")
public class addMarkController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String roll = request.getParameter("s_roll");
		String reg = request.getParameter("s_reg");
		String name = request.getParameter("s_name");
		String fmid = request.getParameter("s_fmid");
		String smid = request.getParameter("s_smid");
		String ct = request.getParameter("s_ct");
		String att = request.getParameter("s_att");
		String sem = request.getParameter("s_sem");
		String ccode = request.getParameter("s_ccode");
		
//		System.out.print(roll);
		 // Generate random integers in range 0 to 999 
		 Random rand = new Random(); 
	     Integer min = 1000;
	     Integer max = 10000;
         Integer rand_int1 =rand.nextInt((max - min) + 1) + min;
	     String password = String.valueOf(rand_int1);
	
		Mark newMark = new Mark(roll,reg,name,fmid,smid,ct,att,sem,ccode,password);
			
		try {
			mainController.addMark(newMark);
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin_add_mark.jsp");
			dispatcher.forward(request, response);
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
