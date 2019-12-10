<%@page import="com.result.controller.*"%>
    <%@ page import = "java.util.Date" %>
        <%@ page import = "java.text.SimpleDateFormat" %>
            <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" 
import="com.result.model.*"
import="com.result.controller.*"
import="java.util.ArrayList"

%>

      
                    <%@include file="header.jsp"%>

                        <%
                  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                  String current_date = sdf.format(new Date());

            %>
            
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
                
  .column {
  width: 33.33%;
  padding: 15px;
  background-color: #D5DFF7 ;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width:480px) {
  .column {
    width: 60%;
  }
}
</style>
            
 
 <body onload="noBack();">   
                                   
<div class="row">
      <center>  
      
  <div class="column">
    <h2>Welcome To University of Barishal</h2>
      <img src="images/bu.png" style="width:300px" alt="default image"/>
  </div>
      
      
  <div class="column">
  
    <h2>Description</h2>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sit amet pretium urna. Vivamus venenatis velit nec neque ultricies, eget elementum magna tristique. Quisque vehicula, risus eget aliquam placerat, purus leo tincidunt eros, eget luctus quam orci in velit. Praesent scelerisque tortor sed accumsan convallis.</p>
  </div>
  

</div>
  </center> 
</body>
                         

                            <br>
                            <%@include file="footer.jsp" %>