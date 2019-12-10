
	<%@include file="admin-header.jsp"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" 
	import="com.result.model.Admin"
	import="com.result.controller.*" import="com.result.model.*"
	import="java.util.ArrayList"
	
	%>

<%
	response.setHeader("Cache-Control", "no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
	new java.util.Date();
	

	if( (session.getAttribute("currentSessionForSuperAdmin") != null) || (session.getAttribute("currentSessionForSubAdmin") != null ) ) {
%>





        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Home</a>
          </li>
          <li class="breadcrumb-item active">Overview</li>
        </ol>


        <!-- Icon Cards-->
        <div class="row">
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                </div>
                <div class="mr-5">Total Students</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="view.jsp?page=1">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
       
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-danger o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                </div>
                <div class="mr-5">Department</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="session.jsp">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
        </div>




<%@include file="admin-footer.jsp"%>


<% }else{ %>

<%@include file="admin-login.jsp"%>

<% } %>






