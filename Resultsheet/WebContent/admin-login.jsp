<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Login</title>

  <!-- Custom fonts for this template-->
  <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="assets/css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-light">

  <div class="container">
    <div class="card card-login mx-auto mt-5 ">
      <div class="card-header text-center">Admin Login Panel</div>
      <div class="card-body"><p>Login as:</p>
        <form action="adminController?action=login" method="post">
        	<label><input type="radio" name="admin_status" value="SuperAdmin" required>Super Admin</label>
        	<label><input type="radio" name="admin_status" value="Admin" >Admin</label><br><br>
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="admin" name="admin" class="form-control" placeholder="Email address" required="required" autofocus="autofocus">
              <label for="admin">admin</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" id="password" name="password" class="form-control" placeholder="password" required="required">
              <label for="password">Password</label>
            </div>
          </div>

          
           <div class="text-center">
               <input type="submit" class="btn btn-primary" value="Login" > 
           </div>  
          
        </form>
 
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
