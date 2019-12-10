
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.result.model.Admin"%>

<%
	response.setHeader("Cache-Control", "no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
	new java.util.Date();
	if (session.getAttribute("currentSubAdminName") != null) {
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

<script>
	function clearForms() {
		var i;
		for (i = 0; (i < document.forms.length); i++) {
			document.forms[i].reset();
		}
	}
	function validateForm() {
		var roll = document.forms["myForm"]["sroll"].value;
		var reg = document.forms["myForm"]["sreg"].value;
		var sname = document.forms["myForm"]["sname"].value;
		var fmid = document.forms["myForm"]["sfmid"].value;
		var smid = document.forms["myForm"]["ssmid"].value;
		var ct = document.forms["myForm"]["sct"].value;
		var att = document.forms["myForm"]["satt"].value;
		var sem = document.forms["myForm"]["ssem"].value;
		var ccode = document.forms["myForm"]["sccode"].value;
		var pass = document.forms["myForm"]["spass"].value;

		if (roll == null || roll == "") {
			alert("class Roll must be filled out");
			return false;
		}

		if (reg == null || reg == "") {
			alert("reg Number must be filled out");
			return false;
		}

		if (name == null || name == "") {
			alert("student name must be filled out");
			return false;
		}
		if (fmid == null || fmid == "") {
			alert("frist mid must be filled out");
			return false;
		}
		if (smid == null || smid == "") {
			alert("second mid must be filled out");
			return false;
		}

		if (ct == null || ct == "") {
			alert("class test must be filled out");
			return false;
		}

		if (att == null || att == "") {
			alert("attendence must be filled out");
			return false;
		}

		if (sem == null || sem == "") {
			alert("semester must be filled out");
			return false;
		}

		if (ccode == null || ccode == "") {
			alert("course code must be filled out");
			return false;
		}


		if (pass == null || pass == "") {
			alert("password must be filled out");
			return false;
		}

	}
</script>


<body onLoad="clearForms()" onunload="clearForms()">
<style>
body {
  margin: 0;
  font-family: "Lato", sans-serif;
}

.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #f1f1f1;
  position: fixed;
  height: 100%;
  overflow: auto;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: #4CAF50;
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: #555;
  color: white;
}

div.content {
  margin-left: 200px;
  padding: 1px 16px;
  height: 1000px;
}

@media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .sidebar a {float: left;}
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  .sidebar a {
    text-align: center;
    float: none;
  }
}
</style>


<div class="content">
<!--Main Navigation-->
	<div class="row">

		<!--Grid column-->
		<div class="col-md-5  m-auto pt-3 ">

			<form id="myForm" onsubmit="return validateForm()" method="post"
				name="myForm" action="addMarkController">

				<div class="card wow fadeIn animated" data-wow-delay="0.3s"
					style="visibility: visible; animation-name: fadeIn; animation-delay: 0.3s;">

                    <div class="card mb-5">
					<div class="card-body m-4">
						<!-- Header -->
						<div class="form-header  text-center "
							style="border-radius: 25px;">
							<h3 class="font-weight-500 my-2 py-1 text-light" style="border-radius: 25px;
    background-color: #216C3A; color:white">Add New
								Mark</a></h3>
						</div>
						<!-- Body -->
						<div class="md-form mb-1">
							<input type="text" id="sroll"
								name="s_roll" class="form-control" required> <label for="sroll"
								class="">Roll no</label>
						</div>

						<div class="md-form mb-1">
						<input type="text" id="sreg"
								name="s_reg" class="form-control" required> <label for="sreg"
								class="">Reg no</label>
						</div>

						<div class="md-form mb-1">
							<input type="text" id="sname"
								name="s_name" class="form-control" required> <label for="sname"
								class="">Student's Name</label>
						</div>

						<div class="md-form mb-1">
							<input type="number"
								id="sfmid" name="s_fmid" class="form-control" required> <label
								for="sfmid" class="">Frist Mid</label>
						</div>

						<div class="md-form mb-1">
							 <input type="number"
								id="ssmid" name="s_smid" class="form-control" required> <label
								for="ssmid" class="">Second Mid</label>
						</div>


						<div class="md-form mb-1">
						 <input type="number"
								id="sct" name="s_ct" class="form-control" required> <label
								for="sct" class="">Class Test</label>
						</div>
						

						<div class="md-form mb-1">
							<input type="number"
								id="satt" name="s_att" class="form-control" required> <label
								for="satt" class="">Attendence</label>
						</div>

                            <div class="md-form mb-1">
							<div class="md-form mb-0">
								<select id="ssem"
									class="browser-default custom-select custom-select-lg mb-3"
									name="s_sem" required>
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


						<div class="md-form mb-1">
							<div class="md-form mb-0">
								<select id="sccode"
									class="browser-default custom-select custom-select-lg mb-3"
									name="s_ccode" required>
									<option selected>Course Code</option>
									<option value="CSE-3200">CSE-3200</option>
									<option value="CSE-3201">CSE-3201</option>
									<option value="CSE-3202">CSE-3202</option>
									<option value="CSE-3203">CSE-3203</option>
									<option value="CSE-3204">CSE-3204</option>
									<option value="CSE-3205">CSE-3205</option>
									<option value="CSE-3206">CSE-3206</option>
									<option value="CSE-3207">CSE-3208</option>

								</select>
							</div>
						</div>
						</div>

						
						<div class="text-center">
							<input type="submit" value="Add record"
								class="btn " style="border-radius: 25px;
    background-color: #216C3A; color:white">

						</div>
					</div>
					<!-- Jumbotron -->
				</div>

			</form>
		</div>
	</div>


</div>
	

	<!-- SCRIPTS -->
	<!-- JQuery -->
	<script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="assets/js/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="assets/js/mdb.min.js"></script>
</body>
</html>

<br>
<br>
<%@include file="admin-footer.jsp" %>

<%
	} else {
%>

<%@include file="admin-login.jsp"%>
<%
	}
%>