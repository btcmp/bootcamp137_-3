<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Login - POS Kelompok 3</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bower_components/Ionicons/css/ionicons.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/iCheck/all.css">
    <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/timepicker/bootstrap-timepicker.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/elements.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/easyAutoComplete-1.3.5/easy-autocomplete.min.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/easyAutoComplete-1.3.5/easy-autocomplete.themes.min.css">
<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<style type="text/css">
	input.parsley-error
		{
  			color: #B94A48 !important;
  			background-color: #F2DEDE !important;
  			border: 1px solid #EED3D7 !important;
		}
</style>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->


<script
	src="${pageContext.request.contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script
	src="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script
	src="${pageContext.request.contextPath}/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- InputMask -->
<script src="${pageContext.request.contextPath}/resources/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="${pageContext.request.contextPath}/resources/bower_components/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- bootstrap color picker -->
<script src="${pageContext.request.contextPath}/resources/bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="${pageContext.request.contextPath}/resources/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll -->
<script
	src="${pageContext.request.contextPath}/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="${pageContext.request.contextPath}/resources/plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script
	src="${pageContext.request.contextPath}/resources/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script
	src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script
	src="${pageContext.request.contextPath}/resources/dist/js/demo.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/parsley.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jspdf.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/easyAutoComplete-1.3.5/jquery.easy-autocomplete.min.js"></script>
<!-- page script -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AdminLTE 2 | Log in</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<meta name="_csrf" content="${_csrf.token}"/>
	<!-- default header name is X-CSRF-TOKEN -->
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<!-- ... -->
<title>Login</title>
</head><!-- comment -->
<body class="hold-transition login-page">
	
	<div class="login-box">
	  <div class="login-logo">
	    <b>Kelompok</b>3
	  </div>
	  <!-- /.login-logo -->
	  <div class="login-box-body">
		<c:if test="${not empty error }">
			<div class="login-box-msg">${error}</div>
		</c:if>
		<c:if test="${not empty logout }">
			<div class="login-box-msg">${logout}</div>
		</c:if>
	    <p class="login-box-msg">Sign in to start your session</p>
	
	    <form name='loginForm' action="<c:url value='j_spring_security_check' />" method='POST'>
	      <div class="form-group has-feedback">
	        <input type="text" class="form-control" placeholder="Username" name='username'>
	        <span class="glyphicon glyphicon-user form-control-feedback"></span>
	      </div>
	      <div class="form-group has-feedback">
	        <input type="password" class="form-control" placeholder="Password" name='password'>
	        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
	      </div>
	      <div class="row">
	        <div class="col-xs-8">
	         	<small><a data-toggle="modal" data-target="#modal-forgot">Forgot Password?</a></small>
	        </div>
	        <!-- /.col -->
	        <div class="col-xs-4">
	          <button name="submit" type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
	        </div>
	        <!-- /.col -->
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	      </div>
	    </form>
	  </div>
	  <!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->
	
	<!-- forgot password -->
	<div class="modal fade" id="modal-forgot" role="dialog">
		<div class="modal-dialog modal-sm">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<div class="row" id="div-alert" style="display:none;">
						<div class="col-xs-12">
							<div class="alert alert-sukses" role="alert" id="tampilan-alert">
							  <strong>Sukses!</strong> Data Berhasil Disimpan.
							</div>
						</div>
					</div>
					<button type="button" class="close modalcancel" data-dismiss="modal">&times;</button>
					<h3 id="judul-modal">Change Password</h3>
				</div>
				
				<div class="modal-body">
					<div class="form-group has-feedback" id="div-email">
						<h4>Email :</h4> 
						<label class="control-label" for="in-email" style="display:none" id="lbl-email"><i class="fa fa-check"></i></label>
						<input type="email" class="form-control" id="in-email" placeholder="email" name="in-email"/>
					</div>
					
					<div class="form-group has-feedback" id="div-password">
						<h4>New Password :</h4>
						<label class="control-label" for="in-password" style="display:none" id="lbl-password"><i class="fa fa-check"></i></label>
						<input type="password" class="form-control full-span" id="in-password" placeholder="new password"/>
					</div>
					
					<div class=form-group has-feedback" id="div-repassword">
						<h4>Re-type Password :</h4>
						<label class="control-label" for="in-repassword" style="display:none" id="lbl-repassword"><i class="fa fa-check"></i></label>
						<input type="password" class="form-control full-span" id="in-repassword" placeholder="re-type password"/>
					</div>
				</div>
				
				<div class="modal-footer">
					<div class="row">
						<div class="col-xs-9">
						
						</div>
						<div class="col-xs-2">
							<button type="button" class="btn btn-info" id="tbl-pswd">Save</button>
						</div>
						<div class="col-xs-1">
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(function(){
		
		var password = '';
		var email = '';
		var repassword = '';
		
		var eValid = 0;
		var pValid = 0;
		var rpValid = 0;
		
		$('#tbl-pswd').on('click', function(){
			if(eValid == 1 && pValid == 1 && rpValid == 1){
				$.ajax({
					type : 'get',
					url : '${pageContext.request.contextPath}/login/ubah-password?password='+password+'&email='+email,
					success : function(data) {
						console.log(data);
						if(data == 0){
							// ga ada emailnya
							$('#tampilan-alert').removeClass('alert-sukses').addClass('alert-gagal');
							$('#tampilan-alert').html('<strong>Error!</strong> Gagal mengubah password');
							$('#div-alert').fadeIn();
							$('#div-email').removeClass('has-success').addClass('has-error');
							$('#lbl-email').html('<i class="fa fa-times-circle-o"></i> Email not found');
							$('#lbl-email').fadeIn();
						}else if(data == 1){
							$('#tampilan-alert').removeClass('alert-gagal').addClass('alert-sukses');
							$('#tampilan-alert').html('<strong>Sukses!</strong> Password berhasil diubah');
							$('#div-alert').fadeIn();
							setTimeout(function() {
								$('#modal-forgot').modal('hide');
								$('#in-email').val('');
								$('#in-password').val('');
								$('#in-repassword').val('');
								$('#div-alert').fadeOut();
							}, 2000);
							$('#div-email').removeClass('has-success').removeClass('has-error');
							$('#lbl-email').fadeOut();
							$('#div-password').removeClass('has-success').removeClass('has-error');
							$('#lbl-password').fadeOut();
							$('#div-repassword').removeClass('has-success').removeClass('has-error');
							$('#lbl-repassword').fadeOut();
						}else if(data == 2){
							// user tidak aktif
							$('#tampilan-alert').removeClass('alert-sukses').addClass('alert-gagal');
							$('#tampilan-alert').html('<strong>Error!</strong> Gagal mengubah password');
							$('#div-alert').fadeIn();
							$('#div-email').removeClass('has-success').addClass('has-error');
							$('#lbl-email').html('<i class="fa fa-times-circle-o"></i> User not active');
							$('#lbl-email').fadeIn();
							setTimeout(function(){
								$('#div-alert').fadeOut();
							}, 4000);
						}else{
							// ga punya user
							$('#tampilan-alert').removeClass('alert-sukses').addClass('alert-gagal');
							$('#tampilan-alert').html('<strong>Error!</strong> Gagal mengubah password');
							$('#div-alert').fadeIn();
							$('#div-email').removeClass('has-success').addClass('has-error');
							$('#lbl-email').html('<i class="fa fa-times-circle-o"></i> User not found');
							$('#lbl-email').fadeIn();
							setTimeout(function(){
								$('#div-alert').fadeOut();
							}, 4000);
						}
					},
					error : function() {
						$('#tampilan-alert').removeClass('alert-sukses').addClass('alert-gagal');
						$('#tampilan-alert').html('<strong>Error!</strong> Gagal mengubah password');
						$('#div-alert').fadeIn();
						setTimeout(function(){
							$('#div-alert').fadeOut();
						}, 4000);
					}
				});
			}
			if(eValid == 0){
				$('#div-email').removeClass('has-success').addClass('has-error');
				$('#lbl-email').html('<i class="fa fa-times-circle-o"></i> Email not valid');
				$('#lbl-email').fadeIn();
			}
			if(pValid == 0){
				$('#div-password').removeClass('has-success').addClass('has-error');
				$('#lbl-password').html('<i class="fa fa-times-circle-o"></i> > 6 characters');
				$('#lbl-password').fadeIn();
			}
			if(rpValid == 0){
				$('#div-repassword').removeClass('has-success').addClass('has-error');
				$('#lbl-repassword').html('<i class="fa fa-times-circle-o"></i> Password did not match');
				$('#lbl-repassword').fadeIn();
			}
			
		});
		
		$('#in-password').on('input', function(){
			password = $(this).val();
			if(password.length > 6){
				$('#div-password').removeClass('has-error').addClass('has-success');
				$('#lbl-password').html('<i class="fa fa-check"></i> Ok');
				$('#lbl-password').fadeIn();
				pValid = 1;
			}else{
				$('#div-password').removeClass('has-success').addClass('has-error');
				$('#lbl-password').html('<i class="fa fa-times-circle-o"></i> > 6 characters');
				$('#lbl-password').fadeIn();
				pValid = 0;
			}
			if(password.length > 6){
				$('#in-repassword').trigger('input');
			}
		});
		
		$('#in-repassword').on('input', function(){
			repassword = $(this).val();
			if(repassword == password){
				$('#div-repassword').removeClass('has-error').addClass('has-success');
				$('#lbl-repassword').html('<i class="fa fa-check"></i> Ok');
				$('#lbl-repassword').fadeIn();
				rpValid = 1;
			}else{
				$('#div-repassword').removeClass('has-success').addClass('has-error');
				$('#lbl-repassword').html('<i class="fa fa-times-circle-o"></i> Password did not match');
				$('#lbl-repassword').fadeIn();
				rpValid = 0;
			}
		})
		
		$('#in-email').on('input',function(){
			$('#div-email').removeClass('has-success').removeClass('has-error');
			$('#lbl-email').fadeOut();
			email = $(this).val();
			var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			var valid =  regex.test(email);
			if(valid){
				eValid = 1;
			}else{
				eValid = 0;
			}
		});
	})
</script>
</html>