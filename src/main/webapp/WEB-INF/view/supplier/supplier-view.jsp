<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<div id="container">
	<table id="category-table" class="table table-striped table-bordered">
		<thead>
		<tr>
			<th>Category Name</th>
			<th>Item Stocks</th>
			<th>#</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${categories }" var="cat">
			<tr>
				<td>${cat.name }</td>
				<td>Tes</td>
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
<%@ include file="/WEB-INF/view/category/modal/edit.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		$('#category-table').DataTable();
		
		$('#tbl-create').on('click', function(e){
			e.preventDefault();
			$('#modal-create').modal();
		});
		
		$('#tbl-simpan').on('click', function(e){
			e.preventDefault();
			var category = {
				name : $('#create-category').val(),
				active : true
			};
			$.ajax({
				url : '${pageContext.request.contextPath}/category/save',
				type : 'POST',
				data : JSON.stringify(category),
				contentType : 'application/json',
				success : function(){
					console.log(category);
					alert();
				},
				error : function(){
					console.log(category);
					alert();
				}
			});
		});
		
		$('.btn-edit').on('click', function(e){
			e.preventDefault();
			var id = $(this).attr('id');
			$.ajax({
				url : '${pageContext.request.contextPath}/category/take?id=' + id,
				type : 'GET'
			});
			$('#modal-edit').modal();
		});
		
		$('#tbl-edit').on('click', function(e){
			e.preventDefault();
			var category : {
				name : $('#edit-caegory'),
				active : true
			}
			$.ajax({
				url : '${pageContext.request.contextPath}/category/update',
				type : 'PUT',
				data : JSON.strigify(category),
				contentType : 'application/json',
				success : function(){
					console.log(category);
					alert(Oke..);
				},
				error : function(){
					console.log(category);
					alert(Failed bro..);
				}
			});
		});
		
	});
</script>