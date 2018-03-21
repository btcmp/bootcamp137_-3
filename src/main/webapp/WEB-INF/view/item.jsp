<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<spring:url value="/resources/js/jquery.js" var="jq"></spring:url>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ITEM JSP</title>
<script type="text/javascript" src="${jq}"></script>

</head>
<body>
	<div>Items</div>
	<div>
		<div id="search-box">
			<span><input type="text" id="search" placeholder="Search"/></span>
			<span><a id="btn-search" href="#" class="btn btn-primary">Search</a></span>
			<button id="export">Export</button>
			<button id="create">Create</button>
		</div>
	</div>
	
	<div id="daftar-barang">
		<table id="dt-item" border="1">
		<thead>
			<tr>
				<th>Name</th>
				<th>Category</th>
				<th>Unit Price</th>
				<th>In Stock</th>
				<th>Stock Alert</th>
				<th>#</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${items}" var="item">
				<tr>
					<td>${item.name}</td>
					<td><a href="#">beli</a></td>
				</tr>
			</c:forEach> 
		</tbody>	
		</table>
	</div>
</body>
</html>