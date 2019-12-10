<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.result.model.Student"
    %>
      <%@include file="header.jsp" %>
     <% 
    response.setHeader("Cache-Control","no-store,must-revalidate"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", -1); 
    new java.util.Date();
    if(session.getAttribute("currentSessionStudent")!=null)
    {
    %>

</head>

<h2>ALready Logged !</h2>

<%@include file="footer.jsp" %>

<%}
else
response.sendRedirect("login.jsp");%>
