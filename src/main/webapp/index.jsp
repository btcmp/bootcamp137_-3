<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script
	src="http://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/parsley.js"></script>
<script>
$(document).ready(function(){
	
	$('#data-employees').DataTable({
		'paging'      : true,
	      'lengthChange': false,
	      'searching'   : true,
	      'ordering'    : true,
	      'info'        : true,
	      'autoWidth'   : false,
	      'pageLength'  : 5
	});
	
	$('#data-regions').DataTable({
		'paging'      : true,
	      'lengthChange': false,
	      'searching'   : true,
	      'ordering'    : true,
	      'info'        : true,
	      'autoWidth'   : false,
	      'pageLength'  : 5
	});
	
	$('#data-countries').DataTable({
	      'paging'      : true,
	      'lengthChange': false,
	      'searching'   : true,
	      'ordering'    : true,
	      'info'        : true,
	      'autoWidth'   : false,
	      'pageLength'  : 5
    });
	
    $('#data-departments').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : true,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
      'pageLength'  : 5
    });
    
    $('#data-locations').DataTable({
        'paging'      : true,
        'lengthChange': false,
        'searching'   : true,
        'ordering'    : true,
        'info'        : true,
        'autoWidth'   : false,
        'pageLength'  : 5
     })
});
</script>
</head>
<body>
<div class="container">
	<br/>
	<a href="${pageContext.request.contextPath }/regions" class="btn btn-success">Regions</a>
	<a href="${pageContext.request.contextPath }/countries" class="btn btn-success">Countries</a>
	<a href="${pageContext.request.contextPath }/locations" class="btn btn-success">Locations</a>
	<a href="${pageContext.request.contextPath }/departments" class="btn btn-success">Departments</a>
	<a href="${pageContext.request.contextPath }/employees" class="btn btn-success">Employees</a>
	<br/>
	<br/>
	<h2><a href="${pageContext.request.contextPath }/employees">Daftar Employee</a></h2>
	<table id="data-employees" class="table table-striped table-bordered"
		cellspacing="0" width="100%">
		<thead>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Phone Number</th>
			<th>Salary</th>
			<th>Manager</th>
			<th>Department</th>
		</thead>
		<tbody>
			<c:forEach items="${emps }" var="employees">
				<tr>
					<td>${employees.id }</td>
					<td>${employees.firstName } ${employees.lastName }</td>
					<td>${employees.email }</td>
					<td>${employees.phoneNumber }</td>
					<td>${employees.salary }</td>
					<td>${employees.manager.firstName } ${employees.manager.lastName }</td>
					<td>${employees.departments.departmentName }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br/>
	
	<h2><a href="${pageContext.request.contextPath }/departments" >Daftar Department</a></h2>
	<table id="data-departments" class="table table-striped table-bordered"
		cellspacing="0" width="100%">
		<thead>
			<th>ID</th>
			<th>Department Name</th>
			<th>City</th>
			<th>Manager</th>
		</thead>
		<tbody>
			<c:forEach items="${deps }" var="departments">
				<tr>
					<td>${departments.id }</td>
					<td>${departments.departmentName }</td>
					<td>${departments.locations.city }</td>
					<td>${departments.managers.firstName } ${departments.managers.lastName }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<br/>
	<h2><a href="${pageContext.request.contextPath }/locations" >Daftar Locations</a></h2>
	<table id="data-locations" class="table table-striped table-bordered"
		cellspacing="0" width="100%">
		<thead>
			<th>ID</th>
			<th>Street Address</th>
			<th>City</th>
			<th>Province</th>
			<th>Postal Code</th>
			<th>Country</th>
		</thead>
		<tbody>
			<c:forEach items="${locs }" var="locations">
				<tr>
					<td>${locations.id }</td>
					<td>${locations.streetAddress }</td>
					<td>${locations.city }</td>
					<td>${locations.province }</td>
					<td>${locations.postalCode }</td>
					<td>${locations.countries.countriesName }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<br/>
	<h2><a href="${pageContext.request.contextPath }/countries" >Daftar Countries</a></h2>
	<table id="data-countries" class="table table-striped table-bordered"
		cellspacing="0" width="100%">
		<thead>
			<th>ID</th>
			<th>Country Name</th>
			<th>Region Name</th>
		</thead>
		<tbody>
			<c:forEach items="${couns }" var="countries">
				<tr>
					<td>${countries.id }</td>
					<td>${countries.countriesName }</td>
					<td>${countries.regions.regionName }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<br/>
	<h2><a href="${pageContext.request.contextPath }/regions" >Daftar Regions</a></h2>
	<table id="data-regions" class="table table-striped table-bordered"
		cellspacing="0" width="100%">
		<thead>
			<th>ID</th>
			<th>Region Name</th>
		</thead>
		<tbody>
			<c:forEach items="${regs }" var="regions">
				<tr>
					<td>${regions.id }</td>
					<td>${regions.regionName }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>