<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.result.model.Admin"
	import="com.result.controller.*" 
	import="com.result.model.*"
	import="java.util.ArrayList"
    %>
    
     <% 
    response.setHeader("Cache-Control","no-store,must-revalidate"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", -1); 
    new java.util.Date();
   if (session.getAttribute("currentSessionForSuperAdmin") != null) {
    %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>BUresult</title>

  <!-- Custom fonts for this template-->
  <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="assets/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="assets/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

  <nav class="navbar navbar-light" style="color: #168344;">

    <a class="navbar-brand mr-1 " href="super-admin.jsp">BU Result</a>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         
          <a class="nav-link waves-effect waves-light" href="teacher_profile.jsp">
                                        <span class="licolor">
                                              <% out.print(session.getAttribute("currentSuperAdminName")) ;%>
                                        </span>
                                    </a>

        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
        	<a class="dropdown-item" href="all_sub_admin.jsp">All Sub Admin</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="adminLogout" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav" style="background-color: #10582F;">
      <li class="nav-item active">
        <a class="nav-link" href="super-admin.jsp">
          <b><span>Home</span></b>
        </a>
      </li>    
      
      <li class="nav-item">
        <a class="nav-link" href="adminShowStudentsController">
          <span>Students Information</span></a>
      </li>
      
     <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span>All Department</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="">CSE</a>
          <a class="dropdown-item" href="">EEE</a>
          <a class="dropdown-item" href="">MATH</a>

        </div>
      </li> 



	   <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

          <span>Update Information</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="">CSE</a>
          <a class="dropdown-item" href="">EEE</a>
          <a class="dropdown-item" href="">MATH</a>

        </div>
      </li>
      
      
      
    
    </ul>

    <div id="content-wrapper">

      <div class="container-fluid">
      
      
<% }
   
   
   else if  (session.getAttribute("currentSessionForSubAdmin") != null ){
	   Admin currentsubAdmin = (Admin)(session.getAttribute("currentSessionForSubAdmin"));
   %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Result analysis</title>

  <!-- Custom fonts for this template-->
  <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="assets/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="assets/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

  <nav class="navbar navbar-light" style="color: #168344;">

    <a class="navbar-brand mr-1 " href="super-admin.jsp">BU Result</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
     
      <li class="nav-item dropdown no-arrow mx-1">
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#"><%= currentsubAdmin.getName() %></a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <a class="nav-link waves-effect waves-light" href="sub_profile.jsp">
                                        <span class="licolor">
                                              <% out.print(session.getAttribute("currentSubAdminName")) ;%>
                                        </span>
                                    </a>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="adminLogout" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
     <ul class="sidebar navbar-nav" style="background-color: #10582F;">
      <li class="nav-item active">
        <a class="nav-link" href="super-admin.jsp">
          <b><span>Home</span></b>
        </a>
      </li>
 

   
      
    <% if(currentsubAdmin.getItem1().equals("1")){
    	
    	session.setAttribute("show_student_table","show_student_table"); 
    	
    	%>
       
      <li class="nav-item">
        <a class="nav-link" href="adminShowStudentsController">
          <span>Students Information</span></a>
      </li>
       
					<% 	} else{;}  %>
							
					
      
       <% if(currentsubAdmin.getItem2().equals("1")){ 
       
    	   session.setAttribute("show_mark_table","show_mark_table");
       %>
       
         <li class="nav-item">
        	<a class="nav-link" href="adminShowMarkController">
          <span>Show Result</span></a>
      </li>
       
					<% 	} else {  ; }   %>
					
					
					
	       <% if(currentsubAdmin.getItem3().equals("1")){ 
	       
	       
	    	   session.setAttribute("admin_all_application","admin_all_application");
	       
	       %>
       
             <li class="nav-item">
        <a class="nav-link" href="">
          <span>Update Result</span></a>
      </li>
       
					<% 	} else {  ; }   %>

      
      
      	   <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span>Update Information</span>
        </a>
      </li>
      
      
     <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span>All Information</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="adminShowMarkController">Show Mark</a>
          <a class="dropdown-item" href=""></a>
          <a class="dropdown-item" href=""></a>
        </div>
      </li> 
    
    </ul>

    <div id="content-wrapper">
    <div class="container-fluid">
      
      <% } else{ %>
    	  
    	  <h1>Opps! have a greate problem.</h1>
    	  
    <% } %>	





     