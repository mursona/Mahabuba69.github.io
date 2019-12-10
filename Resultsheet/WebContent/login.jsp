<%@include file="header.jsp" %>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.result.model.Student"
    %>

        <% 
    response.setHeader("Cache-Control","no-store,must-revalidate"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", -1); 
    new java.util.Date();
    if(session.getAttribute("currentSessionStudent")==null)
    {
    	
    Student currentUser = (Student)(session.getAttribute("currentSessionStudent"));
    
    %>
<style>
                    
                    .form-control:focus {border-color:rgba(100,100,100,1)!important;
-webkit-box-shadow: none!important;
    -moz-box-shadow: none!important;
    box-shadow: none!important;
}


                body {
                    box-sizing: border-box;
                    background-color: #F7F8FA ;
                }

                header {
                    background-color: #0A5727;

                }

                .licolor {
                    color: white
                }



</style>

            <body>
                <div class="row">
                    <div class="col-md-4 m-auto pt-4">
                        <form action="logInController" method="post">
                            <div class="card">
                                <div class="card-body m-5">
                                    <div class="form-header  text-center ">
                                        <h3 class="font-weight-500 my-2 py-1">Login</h3>
                                    </div>

                                    <div class="md-form mb-2">
                                        <label for="orangeForm-email" class="">Your Student Id</label>
                                        <input type="text" id="orangeForm-email" name="student_id" id="student_id" class="form-control">
                                    </div>

                                    <div class="md-form mb-2">
                                        <label for="orangeForm-pass" class="">Your password</label>
                                        <input type="password" id="orangeForm-pass" name="password" id="password" class="form-control">
                                    </div>

                                    <div class="text-center mb-2">
                                        <input type="submit" class=" btn btn-primary" value="Login">
                                      
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </body>

            </html>

            <%@include file="footer.jsp" %>

                <% }

    else{ %>

                    <div class="col-md-6  mt-5">

                        <h1>Already logged!</h1>
                    </div>

                    <%@include file="footer.jsp" %>

                        <%     }

%>