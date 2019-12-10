<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.result.model.Admin"%>

<%
	response.setHeader("Cache-Control", "no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
	new java.util.Date();
	if ((session.getAttribute("currentSessionForSuperAdmin") != null) || (session.getAttribute("currentSessionForSubAdmin") != null)) {
%>

<%@include file="admin-header.jsp"%>

        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="super-admin.jsp">Home</a>
          </li>
          <li class="breadcrumb-item active">Add Record</li>
        </ol>

		<!--Grid column-->
		<div class="col-md-10  m-auto pt-3  ">
		
		<div class="mb-4">
			<form enctype="multipart/form-data"  action="TestCSVServlet" method="post">
				<table align="center" border="1px solid black">
					<tr><td><input type="file" name="chooser" ></td></tr>
					<tr><td><input type="submit" value="Submit"></td></tr>
				</table>
			</form>
		</div>

			<form  method="post"action="addResultController">

				<div class="card mb-5">

					<div class="card-body m-4">
	
						<div class="form-header text-center" style="border-radius: 25px;">
							<h3>Add New result</h3>
						</div>
						
						<div class="md-form mb-1">
						
						<input type="text" id="sroll" name="s_roll" class="form-control" placeholder="Roll No." required>
						</div>

						<div class="md-form mb-1">
						<input type="text" id="sreg" name="s_reg" class="form-control" placeholder="Reg. No." required>
						</div>

						<div class="md-form mb-1">
						<input type="text" id="sname" name="s_name" class="form-control" placeholder="Name..." required>
						</div>

						<div class="md-form mb-1">
						 <input type="text" id="moname" name="s_mother_name" class="form-control" placeholder="Mother Name..." required>
						</div>

						<div class="md-form mb-1">
						<input type="text" id="faname" name="s_father_name" class="form-control" placeholder="Father Name..." required>
						</div>


						<div class="md-form mb-1">
						<input type="email" id="semail" name="s_email" class="form-control" placeholder="Gmail..." required>
						</div>

						<div class="md-form">
							<div class="md-form mb-0">
								<select id="ssession"
									class="browser-default custom-select custom-select-lg mb-3"
									name="s_session" required>
									<option selected>Session Name</option>
									<option value="2015-16">2015-16</option>
									<option value="2016-17">2016-17</option>
									<option value="2017-18">2017-18</option>
								</select>
							</div>
						</div>

						<div class="md-form">
							<div class="md-form mb-0">
								<select id="sdepartment"
									class="browser-default custom-select custom-select-lg mb-3"
									name="s_department" required>
									<option selected>Department Name</option>
									<option value="CSE">CSE</option>
									<option value="Math">Math</option>
									<option value="CHM">CHM</option>
									<option value="PHY">PHY</option>

								</select>
							</div>
						</div>

						<div class="md-form">
							<div class="md-form mb-0">
								<select id="ssemester"
									class="browser-default custom-select custom-select-lg mb-3"
									name="s_semester" required>
									<option selected>Semester</option>
									<option value="1st">1<sup>st</sup></option>
									<option value="2nd">2<sup>nd</sup></option>
									<option value="3th">3<sup>rd</sup></option>
									<option value="4th">4<sup>th</sup></option>
									<option value="5th">5<sup>th</sup></option>
									<option value="6th">6<sup>th</sup></option>
									<option value="7th">7<sup>th</sup></option>
									<option value="8th">8<sup>th</sup></option>
								</select>
							</div>
						</div>

						<div class="md-form mb-2">
						
						<input type="number" id="sphone" name="s_phone" class="form-control" placeholder="Phone No..." required>
						</div>

						<div class="text-center">
							<input type="submit" value="Add record" class="btn btn-primary">
						</div>
					</div>
					
				</div>

			</form>
		</div>


<%@include file="admin-footer.jsp" %>

<%
	} else {
%>

<%@include file="admin-login.jsp"%>
<%
	}
%>
