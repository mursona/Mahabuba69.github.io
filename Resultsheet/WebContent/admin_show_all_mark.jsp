
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.result.model.Admin"
	import="com.result.controller.*" import="com.result.model.*"
	import="java.util.ArrayList"%>

<%
	response.setHeader("Cache-Control", "no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
	new java.util.Date();
	if ((session.getAttribute("currentSessionForSuperAdmin") != null) || (session.getAttribute("show_mark_table") != null)) {
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
	float:left;

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


<body>
	<section class="p-5">
    <button class="btn" style="float:right;
    background-color: #387AF0  ;''">
    <a href="#" id="test" onClick="javascript:fnExcelReport();"><span  style="color:white">Download Resultsheet</span></a>  
    </button>
    
    		<a href="#" class="btn btn-primary" id="test" onclick="printData()">Print Data</a>
    		<a href="admin_add_mark.jsp"><i class='fas fa-plus' style='font-size:20px;color:#6BB8E9'></i> Add new Record</a>
    		
 	<div id="printData">
    <h3 class="inline"><u>Marksheet Table</u></h3>
		<table  border="1" cellpadding="4" cellspacing="4" class="table table-hover" id="myTable">
			<tr  align="center">

				<th>Registration</th>
				<th>Name</th>
				<th>Frist Mid</th>
				<th>Second Mid</th>
				<th>Class Test</th>
				<th>Attendence</th>
				<th>Semester</th>
				<th>Course Code</th>
			</tr>

			<%
				adminShowMarkController dao = new adminShowMarkController();
					ArrayList<Mark> a3 = new ArrayList<Mark>();
					a3 = dao.showMark();

					for (int i = 0; i < a3.size(); i++) {
			%>
			<tr>
				<%
					//out.println(a3.get(i).getId());
				%>
				<td>
					<%
						out.println(a3.get(i).getS_reg());
					%>
				</td>
				<td>
					<%
						out.println(a3.get(i).getS_name());
					%>
				</td>
				<td>
					<%
						out.println(a3.get(i).getS_fmid());
					%>
				</td>
				<td>
					<%
						out.println(a3.get(i).getS_smid());
					%>
				</td>
				<td>
					<%
						out.println(a3.get(i).getS_ct());
					%>
				</td>
				<td>
					<%
						out.println(a3.get(i).getS_att());
					%>
				</td>
				<td>
					<%
						out.println(a3.get(i).getS_sem());
					%>
				</td>
				<td>
					<%
						out.println(a3.get(i).getS_ccode());
					%>
				</td>

			</tr>

			<%
				}
			%>


		</table>
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
        $('#test').attr('download', 'Result-sheet.xls');
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


</script>

<%@include file="admin-footer.jsp"%>
<%
	} else {
%>

<%@include file="admin-login.jsp"%>
<%
	}
%>