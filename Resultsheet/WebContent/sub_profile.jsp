<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.result.model.Admin"
    %>
     <%@include file="admin-header.jsp" %>
     <% 
    response.setHeader("Cache-Control","no-store,must-revalidate"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", -1); 
    new java.util.Date();
    if (session.getAttribute("currentSessionForSubAdmin") != null )
    {
    	Admin currentsubAdmin = (Admin)(session.getAttribute("currentSessionForSubAdmin"));
    	
    	
    %>
    
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%= currentsubAdmin.getName() %></title>
<style>
                body {
                    box-sizing: border-box;
                    background-color: white ;
                }

                header {
                    background-color: #0A5727;

                }

                .licolor {
                    color: green;
                }

</style>
</head>
<body>
     
           <input type="hidden" name ="name" value="<%= currentsubAdmin.getName() %>" >
           <input type="hidden" name ="position" value="<%= currentsubAdmin.getPosition() %>" >
          
         
           
      
 
           
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
                                        <%= currentsubAdmin.getName() %>
                                    </h5>
                                
                                    <p class="proile-rating">University of Barishal</p>
                            <ul class="nav nav-tabs" id="myTab" role="tablist" style="background-color: #F4ECF7;">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"><span class="pcolor">About</span></a>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                    
                </div>
                
                                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                            <p>Contact Info:</p>
                              </div>
                    </div>
              
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6" style="background-color: #F7FAFF;">
                                                <label>Name:</label>
                                            </div>
                                            <div class="col-md-6"style="background-color: #F7FAFF;">
                                                <p><%= currentsubAdmin.getName() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6"style="background-color: #F4ECF7 ;">
                                                <label>Position:</label>
                                            </div>
                                            <div class="col-md-6"style="background-color: #F4ECF7 ;">
                                                <p><%= currentsubAdmin.getPosition() %></p>
                                            </div>
                                        </div>
                                     
                                       
                            </div>
                        
                        </div>
                    </div>
                </div>
            </form>           
        </div>

</body>
</html>

<br><br>
<%@include file="admin-footer.jsp" %>

<%}
else
response.sendRedirect("admin-login.jsp");%>
