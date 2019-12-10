<%@ page import="java.util.*,com.result.model.*,com.result.controller.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.result.model.Admin"
	import="com.result.controller.*" import="com.result.model.*"
	import="java.util.ArrayList"%>

<%
	response.setHeader("Cache-Control", "no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
	new java.util.Date();
	if ((session.getAttribute("currentSessionForSuperAdmin") != null) || (session.getAttribute("show_result_table") != null)) {
%>


<style>

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

.pagination a:hover:not(.active) {background-color: #ddd;}

</style>


<%@include file="admin-header.jsp"%>

        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="super-admin.jsp">Home</a>
          </li>
          <li class="breadcrumb-item active">Result Table</li>
        </ol>

<section class="p-1">
    		<a href="#" class="btn btn-primary" id="test" onClick="javascript:fnExcelReport();">Export Data</a>
    		<a href="#" class="btn btn-primary" id="test" onclick="printData()">Print Data</a>
    		<a href="add_result.jsp"><i class='fas fa-plus' style='font-size:20px;color:#6BB8E9'></i> Add new Record</a>

 	<div id="printData">
    <h3 class="inline"><u>Result Table</u></h3>


<div class="pagination">
<a href="view.jsp?page=1">1</a>
<a href="view.jsp?page=2">2</a>
<a href="view.jsp?page=3">3</a>
<a href="view.jsp?page=4">4</a>
<a href="view.jsp?page=5">5</a>
</div>

<%
	String spageid=request.getParameter("page");
int pageid=Integer.parseInt(spageid);
int total=5;
if(pageid==1){}
else{
	pageid=pageid-1;
	pageid=pageid*total+1;
}
List<studentshow> list=show.getRecords(pageid,total);

out.print("<center>");
out.print("<table border='1' cellpadding='4' cellspacing='4' class='table table-hove' id='myTable'>");
out.print("<br><br>");
out.print("<tr><th>Id</th><th>Roll</th><th>Registration</th><th>Name</th><th>Father Name</th><th>Mother Name</th><th>Email</th><th>Phone</th><th>Semester</th><th>Department</th><th>Session</th>");
for(studentshow e:list){
	out.print("<tr><td>"+e.gets_Id()+"</td><td>"+e.gets_Roll()+"</td><td>"+e.gets_Reg()+"</td><td>"+e.gets_Name()+"</td><td>"+e.gets_Father_name()+"</td><td>"+e.gets_Mother_name()+"</td><td>"+e.gets_Email()+"</td><td>"+e.gets_Phone()+"</td><td>"+e.gets_Semester()+"</td><td>"+e.gets_Department()+"</td><td>"+e.gets_Session()+"</td></tr>");
}
out.print("</table>");
out.print("</center>");
%>

</div>
</section>


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
        $('#test').attr('download', 'Student-table.xls');
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


