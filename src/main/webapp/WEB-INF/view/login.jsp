<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url value="/j_spring_security_logout" var="logoutUrl" />
<spring:url value="/resources/adminLTE" var="url"></spring:url>
<spring:url value="/resources/js/jquery-3.3.1.js" var="jq"></spring:url>
<spring:url value="/resources/js/parsley.js" var="parsley"></spring:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	    <a href="../../index2.html"><b>Admin</b>LTE</a>
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
	        <input type="text" class="form-control" placeholder="Email/Username" name='username'>
	        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
	      </div>
	      <div class="form-group has-feedback">
	        <input type="password" class="form-control" placeholder="Password" name='password'>
	        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
	      </div>
	      <div class="row">
	        <div class="col-xs-8">
	         
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
</body>
</html>