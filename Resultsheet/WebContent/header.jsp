<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
import="com.result.model.Student"
%>

    <% 
response.setHeader("Cache-Control","no-store,must-revalidate"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
new java.util.Date();
if(session.getAttribute("currentSessionStudent")!=null)
{
    
Student currentUser = (Student)(session.getAttribute("currentSessionStudent"));

%>

        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <title>Result analysis</title>

            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
            <link href="assets/css/bootstrap.min.css" rel="stylesheet">
            <link href="assets/css/style.css" rel="stylesheet">
            <link href="assets/css/index_style.css" rel="stylesheet">

            <style>
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

        </head>


        <body>
            <header>
                <nav class="navbar navbar-expand-lg ">
                    <div class="container">
                        <a class="navbar-brand" href="index.jsp">
                            <span class="licolor">Result analysis</span>
                        </a>
                        <button class="navbar-toggler text-white" type="button" data-toggle="collapse" data-target="#basicExampleNav" aria-controls="basicExampleNav"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-bars"></i>
                        </button>


                        <div class="collapse navbar-collapse" id="basicExampleNav">

                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a class="nav-link waves-effect waves-light" href="stu_profile.jsp">
                                        <span class="licolor">
                                            <%= currentUser.getS_name() %>
                                        </span>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link waves-effect waves-light" href="logoutController">
                                        <span class="licolor">Logout</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                
                
            </header>


            <script type="text/javascript" src="assets/js/jspdf.js"></script>
            <script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
            <script type="text/javascript" src="assets/js/popper.min.js"></script>
            <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

        </body>

        </html>

        <%   }

else{ %>

            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                <title>Result analysis</title>

                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
                <link href="assets/css/bootstrap.min.css" rel="stylesheet">
                <link href="assets/css/style.css" rel="stylesheet">
                <link rel="icon" type="image/png" href="images/s_icon.png" />
                
            <link href="assets/css/index_style.css" rel="stylesheet">

                <style>
                    body {
                        box-sizing: border-box;
                    }

                    header {
                        background-color: #0A5727;

                    }

                    .licolor {
                        color: white
                    }
                    

                </style>
            </head>


            <body>
                <header>
                    <nav class="navbar navbar-expand-lg ">
                        <div class="container">
                            <a class="navbar-brand" href="index.jsp">
                                <span class="licolor">Result analysis</span>
                            </a>
                            
                         <button class="navbar-toggler text-white" type="button" data-toggle="collapse" data-target="#basicExampleNav" aria-controls="basicExampleNav"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-bars"></i>
                        </button>

                            <div class="collapse navbar-collapse" id="basicExampleNav">
                                <ul class="navbar-nav">
                                </ul>
                                <ul class="navbar-nav ml-auto">
                                    <li class="nav-item">
                                        <a class="nav-link waves-effect waves-light" href="login.jsp">
                                            <span class="licolor">Login</span>
                                        </a>                                     
                                    </li>
                                </ul>                               
                            </div>
                        </div>                      
                    </nav>
                </header>


                <script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
                <script type="text/javascript" src="assets/js/popper.min.js"></script>
                <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

            </body>

            </html>

            <% }%>