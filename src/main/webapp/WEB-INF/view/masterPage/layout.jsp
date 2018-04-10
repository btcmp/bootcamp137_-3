<script>
	if("${userLogin.id}" == null){
		window.location = "${pageContext.request.contextPath}/login";
	}else if("${outletLogin.id}" == null){
		window.location = "${pageContext.request.contextPath}/welcome-auth/choose-outlet";
	}
</script>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Kelompok 3</title>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bower_components/bootstrap-daterangepicker/daterangepicker.css">
<!-- bootstrap datepicker -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/iCheck/all.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/timepicker/bootstrap-timepicker.min.css">
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
input.parsley-error {
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
<script
	src="${pageContext.request.contextPath}/resources/plugins/input-mask/jquery.inputmask.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script
	src="${pageContext.request.contextPath}/resources/bower_components/moment/min/moment.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script
	src="${pageContext.request.contextPath}/resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- bootstrap color picker -->
<script
	src="${pageContext.request.contextPath}/resources/bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script
	src="${pageContext.request.contextPath}/resources/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll -->
<script
	src="${pageContext.request.contextPath}/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script
	src="${pageContext.request.contextPath}/resources/plugins/iCheck/icheck.min.js"></script>
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
<script
	src="${pageContext.request.contextPath}/resources/js/jspdf.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/easyAutoComplete-1.3.5/jquery.easy-autocomplete.min.js"></script>

<!-- page script -->

</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<header class="main-header"> <!-- Logo --> <a
			href="${pageContext.request.contextPath}" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini">K<b>3</b></span> <!-- logo for regular state and mobile devices -->
			<span class="logo-lg"><b>KELOMPOK 3</b></span>
		</a> <!-- Header Navbar: style can be found in header.less --> <nav
			class="navbar navbar-static-top"> <!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="push-menu"
			role="button"> <span class="sr-only">Toggle navigation</span> <span
			class="icon-bar"></span> <span class="icon-bar"></span> <span
			class="icon-bar"></span>
		</a>

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="${pageContext.request.contextPath}/resources/dist/img/avatar5.png"
						class="user-image" alt="User Image"> <span class="hidden-xs">Batch
							137 Kel 3</span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header"><img
							src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg"
							class="img-circle" alt="User Image">
							<div class="row text-center">
								Halo, ${empLogin.firstName } ${empLogin.lastName } <br>
								Anda memiliki akses ke ${outletLogin.name }
							</div> <!-- /.row --> <!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-right">
							<c:url value="/j_spring_security_logout" var="logoutUrl" />
								<form action="${logoutUrl}" method="post" id="logoutForm">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" /> <input type="submit" name="logout"
										class="btn btn-default btn-flat" value="log out" />
								</form>
							</div>
						</li>
					</ul></li>
				<!-- Control Sidebar Toggle Button -->
				<!-- <li><a href="#" data-toggle="control-sidebar"><i
						class="fa fa-gears"></i></a></li> -->
			</ul>
		</div>
		</nav> </header>

		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar"> <!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar"> <!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img
					src="${pageContext.request.contextPath}/resources/dist/img/avatar5.png"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>Batch 137 Kel 3</p>
				<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>

		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">Menu</li>
			<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
					<span>Data Master</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="${pageContext.request.contextPath}/master/employee"><i
							class="fa fa-users"></i> Employee</a></li>
					<li><a href="${pageContext.request.contextPath}/master/category"><i
							class="fa fa-object-group"></i> Category</a></li>
					<li><a href="${pageContext.request.contextPath}/master/outlet"><i
							class="fa fa-shopping-bag"></i> Outlet</a></li>
					<li><a href="${pageContext.request.contextPath}/master/supplier"><i
							class="fa fa-building"></i> Supplier</a></li>
					<li><a href="${pageContext.request.contextPath}/master/item"><i
							class="fa fa-shopping-cart"></i> Item</a></li>
				</ul></li>

			<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
					<span>Data Transaksi</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a
						href="${pageContext.request.contextPath}/transaksi/purchase-request"><i
							class="fa fa-circle-o"></i> Purchase Request</a></li>
					<li><a
						href="${pageContext.request.contextPath}/transaksi/purchase-order"><i
							class="fa fa-circle-o"></i> Purchase Order</a></li>
					<li><a
						href="${pageContext.request.contextPath}/transaksi/adjustment"><i
							class="fa fa-circle-o"></i> Adjustment</a></li>
					<li><a href="${pageContext.request.contextPath}/transaction/transfer-stock"><i
							class="fa fa-circle-o"></i> Transfer Stock</a></li>
					<li><a href="${pageContext.request.contextPath}/transaction/sales-order"><i
							class="fa fa-circle-o"></i> Sales Order</a></li>
				</ul></li>
		</ul>
		</section> <!-- /.sidebar --> </aside>

		<div class="content-wrapper">