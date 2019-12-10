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


<style>

a {
    text-decoration: none !important;
}
h3.inline {
    margin-left: 40%;
    margin-right: 50%;
    width: 100%;
}

.table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    margin-bottom: 16px;
	float:left;
	width:70%;

}
.table th{
	color:#241B4C;
}


.table th:nth-child(even) {
    background-color: #E0EEE6;
}
.table th:nth-child(odd) {
    background-color: #F1F5F2;

}
.table tr{
	color:#241B4C;
}
.table tr:nth-child(even) {
    background-color: #ECF2EF;
}
.table tr:nth-child(odd) {
    background-color: #F1F5F2;

}

.pagination {
  display: inline-block;
  background-color:#6CBDF1;
  color: white;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: #91C3E2 ;
  color: white;
  border: 1px solid #4CAF50;
}


</style>

        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="super-admin.jsp">Home</a>
          </li>
          <li class="breadcrumb-item active">All Sub-Admin</li>
        </ol>
        
        <script>
        
              $('.item1false').on('click', function () {
       
            	$.ajax
                ({ 
                    url: 'privilegeEditController?value="0"',
                  
                    type: 'get',
                    success: function(result)
                    {
                        alert("worked");
                    }
                });
            });
      

        </script>


	<div class="row ml-5 mt-5">
	
		
		<div class="col-md-12">
		
		<table>
			<a href="adminSettings.jsp">Add new Sub Admin <i class='fas fa-plus' style='font-size:20px;color:#6BB8E9'></i></a>
		</table>
		<br>
			<table border='1' cellpadding='4' cellspacing='4' class='table table-hove' id='myTa5ble'>
				<thead>
					<tr>
						<th>Admin name</th>
						<th>Admin Position</th>
						<th>Password</th>
						<th>Students Information</th>
						<th>Insert Result</th>
						<th>Update Result</th>
						<th>Remove</th>
					</tr>
				
				</thead>
				<tbody>
					
						<%

						adminController newAdmin = new adminController();
						ArrayList<Admin> totalAdmin= new ArrayList<Admin>();
						totalAdmin = newAdmin.showAllSubAdmin();

					for (int i = 0; i < totalAdmin.size(); i++) {
			%>
			<tr>
				
	
				<td>
				<%
					out.println(totalAdmin.get(i).getName());
				%>
				</td>
					
				<td>
				<%
					out.println(totalAdmin.get(i).getPosition());
				%>
				</td>
				<td>
					<%
						out.println(totalAdmin.get(i).getPassword());
					%>
				</td>
				<td>
					<% if(totalAdmin.get(i).getItem1().equals("0")){ %>
						<i class='fas fa-user-times' style='font-size:20px;color:red'></i>	
					<% 	} else {  %>	
					<i class='fas fa-user-check' style='font-size:20px;color:#6BB8E9'></i>	
					<% 	}   %>
				</td>
				<td>
					<% if(totalAdmin.get(i).getItem2().equals("0")){ %>
						<i class='fas fa-user-times' style='font-size:20px;color:red'></i>	
					<% 	} else {  %>	
					<i class='fas fa-user-check' style='font-size:20px;color:#6BB8E9'></i>		
					<% 	}   %>
				</td>
				<td>
					<% if(totalAdmin.get(i).getItem3().equals("0")){ %>
						<i class='fas fa-user-times' style='font-size:20px;color:red'></i>	
					<% 	} else {  %>	
					<i class='fas fa-user-check' style='font-size:20px;color:#6BB8E9'></i>		
					<% 	}   %>
				</td>
				
				<td>
					<a class="btn btn-primary"
					href="adminController?delete_id=<%
						out.println(totalAdmin.get(i).getId());
					%>">Remove</a>
				</td>


			</tr>

			<%
				}
			%>					
				
				</tbody>
			
			
			</table>
		
		</div>

	</div>



<%@include file="admin-footer.jsp"%>

<% 
	} else {
    
		
		response.sendRedirect("admin-login.jsp");


	}
%>
