<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.result.model.Admin"
	import="com.result.controller.*" import="com.result.model.*"
	import="java.util.ArrayList"%>

<%
	response.setHeader("Cache-Control", "no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
	new java.util.Date();
	if ((session.getAttribute("currentSessionForSuperAdmin") != null) || (session.getAttribute("currentSessionForSubAdmin") != null)) {
%>

<%@include file="admin-header.jsp"%>


<style>

h3.inline {
    margin-left: 40%;
    margin-right: 50%;
    width: 100%;
}

.table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    margin-bottom: 20px;
	float:right;

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

</style>
<section class="p-1">

    		<a href="#" class="btn btn-primary" id="test" onClick="javascript:fnExcelReport();">Export Data</a>
    		<a href="#" class="btn btn-primary" id="test" onclick="printData()">Print Data</a>

 	<div id="printData">

        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="super-admin.jsp">Home</a>
          </li>
          <li class="breadcrumb-item active">Session</li>
        </ol>
<%
	String keyword = "";
    String key = "";
	if(request.getParameter("txtKeyword") != null) {
		keyword = request.getParameter("txtKeyword");
	}
	if(request.getParameter("txtKey") != null) {
		key = request.getParameter("txtKey");
	}
%>

	<form name="frmSearch" method="get" action="session.jsp">
	  <table   cellpadding="5" cellspacing="5" class="table table-hover" id="myTable">
	    <tr>
	      <th>
	     
		 <select id="txtKeyword" type="text" name="txtKeyword" required value="<%=keyword%>">
									<option selected>Session</option>
									<option value="2015-16">2015-16</option>
									<option value="2016-17">2016-17</option>
								
							</select>
		     
		 <select id="txtKey" type="text" name="txtKey" required value="<%=key%>">
									<option selected>Department</option>
									<option value="CSE">CSE</option>
									<option value="Math">Math</option>
								
								</select>							
								
								<input type="submit" value="SUBMIT"></th>
	      
	    </tr>
	  </table>
	</form>

	<%
	Connection connect = null;
	Statement s = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		connect =  DriverManager.getConnection("jdbc:mysql://localhost/development" +
				"?user=root&password=");
		
		s = connect.createStatement();
		
		String sql = "SELECT * FROM student WHERE s_Session like '%" + keyword + "%' " + " AND s_Department like '%" + key + "%' " + " ORDER BY s_Semester ASC";
		
		System.out.println(sql);
		
		ResultSet rec = s.executeQuery(sql);
		%>
		<table  border="1" cellpadding="5" cellspacing="5" class="table table-hover" id="myTable">
		  <tr>
		    <th> <div align="center">Student ID</div></th>
		    <th> <div align="center">Student Name </div></th>
		    <th> <div align="center">Email </div></th>
		    <th> <div align="center">Session </div></th>
		    <th> <div align="center">Semester </div></th>
		    <th> <div align="center">Department </div></th>
		  </tr>	
			<%while((rec!=null) && (rec.next())) { %>
				  <tr>
				    <td><div align="center"><%=rec.getString("s_Id")%></div></td>
				    <td align="center"><%=rec.getString("s_Name")%></td>
				    <td align="center"><%=rec.getString("s_Email")%></td>
				    <td><div align="center"><%=rec.getString("s_Session")%></div></td>
				    <td align="center"><%=rec.getString("s_Semester")%></td>
				    <td align="center"><%=rec.getString("s_department")%></td>

				  </tr>
	       	<%}%>
	  	</table>      
	  	</div>
	    <%	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		try {
			if(s!=null){
				s.close();
				connect.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
<script>

function fnExcelReport() {
    var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
    tab_text = tab_text + '<head><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>';

    tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';

    tab_text = tab_text + '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
    tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';

    tab_text = tab_text + "<table border='1px'>";
    tab_text = tab_text + $('#myTable').html();
    tab_text = tab_text + '</table></body></html>';

    var data_type = 'data:application/vnd.ms-excel';
    
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE ");
    
    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
        if (window.navigator.msSaveBlob) {
            var blob = new Blob([tab_text], {
                type: "application/csv;charset=utf-8;"
            });
            navigator.msSaveBlob(blob, 'Test file.xls');
        }
    } else {
        $('#test').attr('href', data_type + ', ' + encodeURIComponent(tab_text));
        $('#test').attr('download', 'student.xls');
    }

}


function printData() {
		var print_div = document.getElementById("printData");
		var print_area = window.open();
		print_area.document.write(print_div.innerHTML);
		print_area.document.close();
		print_area.focus();
		print_area.print();
		print_area.close();
				
}
	

function searchByFunction() {
  // Declare variables
   var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput1");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[8];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if ((txtValue.toUpperCase().indexOf(filter) > -1)) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}


</script>

<%@include file="admin-footer.jsp"%>
<%
	} else {
%>

<%@include file="admin-login.jsp"%>
<%
	}
%>