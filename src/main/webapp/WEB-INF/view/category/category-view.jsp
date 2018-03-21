<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<div id="container">
	<table id="category-table" class="table table-striped table-bordered">
		<thead>
			<th>Category Name</th>
			<th>Item Stocks</th>
			<th>#</th>
		</thead>
		<tbody>
		<c:forEach items="${categories }" var="cat">
			<tr>
				<td>${cat.name }</td>
				<td></td>
				<td>
					<a href="" id="${cat.id }" class="btn-edit btn btn-warning">View</a>
				</td>
			<tr>
		</c:forEach>
		</tbody>
	</table>
	<a href="" id="tbl-create" class="btn btn-info" >Create</a>
</div>
<%@ include file="/WEB-INF/view/category/modal/create.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		$('#category-table').DataTable();
		
		$('#tbl-create').on('click', function(e){
			e.preventDefault();
			$('#modal-create').modal();
		});
	});
</script>