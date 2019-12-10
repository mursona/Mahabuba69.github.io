<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.result.model.Admin"
	import="com.result.controller.*" import="com.result.model.*"
	import="java.util.ArrayList"%>



<%
	response.setHeader("Cache-Control", "no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
	new java.util.Date();
	if (session.getAttribute("currentSessionForSuperAdmin") != null) {
%>

<%@include file="admin-header.jsp"%>




        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="super-admin.jsp">Home</a>
          </li>
          <li class="breadcrumb-item active">Update Sub-Admin</li>
        </ol>
        
        
	<%
              	String id = request.getParameter("edit_id");
				String name = request.getParameter("name");
				String position = request.getParameter("position");
              	
              	%>

	<div class="row ml-5 mt-5">
		<div class="col-md-12">
			<label>Admin Name:</label>
				<form class="form-controll" action="adminController?action=editSubAdmin"  method="post">
              	
              	<input type="hidden" name="id" class="form-control" value="<% out.print(id); %>" > 
              	
                  <div class="md-form mb-2">
                    	<input type="text" name="name" class="form-control" value="<% out.print(name); %>" required> 
                    	<input type="text" name="position" class="form-control" value="<% out.print(position); %>" required>   
                  </div>
                  
                  
                  <div class="text-center">
                    <input type="submit" class="btn btn-primary" value="Update" > 
   				 </div>      

				</form>
		
		</div>
		
		
		

	</div>



<%@include file="admin-footer.jsp"%>
<%
	} else {
%>

<%@include file="admin-login.jsp"%>
<%
	}
%>

