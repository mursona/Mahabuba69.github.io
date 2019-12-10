<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.result.model.Student"
     import="com.result.model.Mark"
    %>
     <%@include file="header.jsp" %>
     <% 
    response.setHeader("Cache-Control","no-store,must-revalidate"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", -1); 
    new java.util.Date();
    if(session.getAttribute("currentSessionStudent")!=null)
    {
    	Student currentUser = (Student)(session.getAttribute("currentSessionStudent"));
    	
    	
    %>
    
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%= currentUser.getS_name() %></title>
<style>
.pcolor{
	color:black
	}

</style>
</head>
<body>
           <input type="hidden" name ="s_Roll" value="<%= currentUser.getS_roll() %>" >
           <input type="hidden" name ="s_Reg" value="<%= currentUser.getS_reg() %>" >
           <input type="hidden" name ="s_Name" value="<%= currentUser.getS_name() %>" >
           <input type="hidden" name ="s_Father_name" value="<%= currentUser.getS_father_name() %>" >
           <input type="hidden" name ="s_Mother_name" value="<%= currentUser.getS_mother_name() %>" >
           <input type="hidden" name ="s_Email" value="<%= currentUser.getS_email() %>" >
           <input type="hidden" name ="s_Phone" value="<%= currentUser.getS_phone() %>" >
           <input type="hidden" name ="s_Department" value="<%= currentUser.getS_department() %>" >
           <input type="hidden" name ="s_Semester" value="<%= currentUser.getS_semester() %>" >
           <input type="hidden" name ="s_Session" value="<%= currentUser.getS_session() %>" >
           
      
 
           
<div class="container emp-profile pt-4">
            <form method="post">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="images/default-profile-picture-gmail-2.png" style="width:250px" alt="default image"/>
                           
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                                    <h5>
                                        <%= currentUser.getS_name() %>
                                    </h5>
                                    <h6>
                                        <%= currentUser.getS_department() %>
                                    </h6>
                                    <p class="proile-rating">University of Barishal</p>
                            <ul class="nav nav-tabs" id="myTab" role="tablist" style="background-color: #F4ECF7;">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"><span class="pcolor">About</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-selected="true"><span class="pcolor">Result</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                            <p>Contact Info:</p>
                            <a href=""><span class="pcolor"><%= currentUser.getS_email() %></span></a><br/>
                            <a href=""><span class="pcolor"><%= currentUser.getS_phone() %></span></a><br/>
                      
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6" style="background-color: #F4ECF7;">
                                                <label>Mother's Name:</label>
                                            </div>
                                            <div class="col-md-6"style="background-color: #F4ECF7;">
                                                <p><%= currentUser.getS_mother_name() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6"style="background-color: #F7FAFF ;">
                                                <label>Father's Name:</label>
                                            </div>
                                            <div class="col-md-6"style="background-color: #F7FAFF ;">
                                                <p><%= currentUser.getS_father_name() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6"style="background-color: #F4ECF7;">
                                                <label>Roll No:</label>
                                            </div>
                                            <div class="col-md-6"style="background-color: #F4ECF7;">
                                                <p><%= currentUser.getS_roll() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6"style="background-color: #F7FAFF ;">
                                                <label>Registration No:</label>
                                            </div>
                                            <div class="col-md-6"style="background-color: #F7FAFF ;">
                                                <p><%= currentUser.getS_reg() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6"style="background-color: #F4ECF7;">
                                                <label>Semester:</label>
                                            </div>
                                            <div class="col-md-6"style="background-color: #F4ECF7;">
                                                <p><%= currentUser.getS_semester() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6"style="background-color: #F7FAFF ;">
                                                <label>Faculty</label>
                                            </div>
                                            <div class="col-md-6"style="background-color: #F7FAFF ;">
                                                <p><%= currentUser.getS_session() %></p>
                                            </div>
                                        </div>
                                       
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            
                                
                            </div>
                        </div>
                    </div>
                </div>
            </form>           
        </div>

</body>
</html>

<br><br>
<%@include file="footer.jsp" %>

<%}
else
response.sendRedirect("login.jsp");%>
