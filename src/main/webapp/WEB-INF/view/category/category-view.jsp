<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<div><h1>CATEGORY</h1></div>
<hr style="border-color:black; border-top:1px dashed;">

<div id="container">
	
	<div class="row">
		<div class="col-xs-3" style="margin-right:300px; margin-left:50px;">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search Category..">
			</div>
		</div>
		<div style="float:right; margin-right:60px;">
			<div class="form-group">
				<a href="" id="tbl-create" class="btn btn-info" >Create</a>
			</div>
		</div>
	</div>
	
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
				<td>${cat.itemStock} Item</td>
				<td>
					<a href="" id="${cat.id }" class="btn-edit btn btn-success">View</a>
				</td>
			<tr>
		</c:forEach>
		</tbody>
	</table>
	
</div>
<%@ include file="/WEB-INF/view/category/modal/create.jsp"%>
<%@ include file="/WEB-INF/view/category/modal/edit.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		//$('#category-table').DataTable();
		
		$('#tbl-create').on('click', function(e){
			e.preventDefault();
			$('#modal-create').modal();
		});
		
		$('#tbl-reset').click(function(){
			$('#create-category').val("");
		});
		
		$('#tbl-cancel').click(function(){
			$('#edit-category').val("");
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
					alert('Saved..');
					window.location = '${pageContext.request.contextPath}/category';
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
				type : 'GET',
				success : function(category){
					$('#edit-category').val(category.name);
					$('#id-edit').val(category.id);
					console.log(id);
				},
				error : function(){
					console.log(id);
				}
			});
			$('#modal-edit').modal();
		});
		
		
		$('#tbl-edit').on('click', function(e){
			e.preventDefault();
			var category = {
				name : $('#edit-category').val(),
				id : $('#id-edit').val()
			};
			$.ajax({
				url : '${pageContext.request.contextPath}/category/update',
				type : 'PUT',
				data : JSON.stringify(category),
				contentType : 'application/json',
				success : function(){
					console.log(category);
					alert('Oke..');
					window.location = '${pageContext.request.contextPath}/category';
				},
				error : function(){
					console.log(category);
					alert('Failed bro..');
				}
			});
		});
		
		$('#tbl-delete').click(function(e){
			e.preventDefault();
			var id = $('#id-edit').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/category/delete/' + id,
				type : 'DELETE',
				success : function(){
					console.log(id);
					alert('Deleted');
					window.location = '${pageContext.request.contextPath}/category';
				},
				error : function(){
					console.log(id);
					alert('Cannot Delete..');
				}
			});
		});
		
	});
</script>