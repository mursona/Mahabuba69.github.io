package com.result.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class checkValidityController
 */
@WebServlet("/checkValidityController")
public class checkValidityController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public checkValidityController() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String semester = request.getParameter("semester");
		String feeType = request.getParameter("fee_type");

		
		
		try {
			String res = mainController.checkValidity(feeType,semester);
			
			if(res.equals("dev_page")){
				RequestDispatcher dispatcher =  request.getRequestDispatcher("devFees.jsp");
		    	dispatcher.forward(request, response);
			}
			else if(res.equals("semester_page")){
				RequestDispatcher dispatcher =  request.getRequestDispatcher("semesterFees.jsp");
		    	dispatcher.forward(request, response);
				
			}
			
			else if(res.equals("formfillup_page")){
				RequestDispatcher dispatcher =  request.getRequestDispatcher("formFillUp.jsp");
		    	dispatcher.forward(request, response);
				
			}
			else{
				
				//RequestDispatcher dispatcher =  request.getRequestDispatcher("index.jsp");
		    	//dispatcher.forward(request, response);
				response.sendRedirect("index.jsp?date_expire"); 
			}
		} catch (SQLException | ParseException e) {

			e.printStackTrace();
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
