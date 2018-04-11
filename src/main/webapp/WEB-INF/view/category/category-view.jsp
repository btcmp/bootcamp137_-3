<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<div><h1>CATEGORY</h1></div>
<hr style="border-color:black; border-top:1px dashed;">

<div id="container">
	
	<div class="row">
		<div class="col-xs-3" style="margin-right:300px; margin-left:50px;">
			<div class="form-group">
				<input type="text" class="form-control" id="category-search" placeholder="Search Category..">
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
		
		<tbody id="category-data">
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
				name : $('#create-category').val()
			};
			if(nameValid != 1){
				$('#tampilan-alert').removeClass('alert-sukses').addClass('alert-gagal');
				$('#tampilan-alert').html('<strong>Error!</strong> Gagal Menyimpan ke Database');
				$('#tampilan-alert').fadeIn();
				$('#validasi-name').removeClass('has-success').addClass('has-error');
				$('#label-name').html('<i class="fa fa-times-circle-o"></i> Cannot Save');
				$('#label-name').fadeIn();
			}
			else {
			$.ajax({
				url : '${pageContext.request.contextPath}/master/category/save',
				type : 'POST',
				data : JSON.stringify(category),
				contentType : 'application/json',
				success : function(){
					$('#tampilan-alert').removeClass('alert-gagal').addClass('alert-sukses');
					$('#tampilan-alert').html('<strong>Sukses!</strong> Berhasil Menyimpan ke Database');
					$('#tampilan-alert').fadeIn();
						
					setTimeout(function() {
						window.location = '${pageContext.request.contextPath}/master/category';
					}, 2000);
				},
				error : function(){
						$('#tampilan-alert').removeClass('alert-sukses').addClass('alert-gagal');
						$('#tampilan-alert').html('<strong>Error!</strong> Gagal Menyimpan ke Database');
						$('#tampilan-alert').fadeIn(); 
				}
			});
			}
		});
		
		
		$('#category-table').on('click', '.btn-edit', function(e){
			e.preventDefault();
			var id = $(this).attr('id');
			$.ajax({
				url : '${pageContext.request.contextPath}/master/category/take?id=' + id,
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
				url : '${pageContext.request.contextPath}/master/category/update',
				type : 'PUT',
				data : JSON.stringify(category),
				contentType : 'application/json',
				success : function(){
					console.log(category);
					alert('Oke..');
					window.location = '${pageContext.request.contextPath}/master/category';
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
				url : '${pageContext.request.contextPath}/master/category/delete/' + id,
				type : 'DELETE',
				success : function(){
					console.log(id);
					alert('Deleted');
					window.location = '${pageContext.request.contextPath}/master/category';
				},
				error : function(){
					console.log(id);
					alert('Cannot Delete..');
				}
			});
		});
		
		//Search
		$('#category-search').on('input', function(e){
			var search = $(this).val();
			$.ajax({
				url : '${pageContext.request.contextPath}/master/category/search?search='+search,
				type : 'GET',
				dataType : 'json',
				success : function(data){
					$('#category-data').empty();
					$.each(data, function(key, cat){
						console.log(cat);
						$('#category-data').append('<tr>'
								+ '<td>'+cat.name+'</td>'
								+ '<td id="catdat-'+cat.id+'"></td>'
								+ '<td><a href="" id="'+cat.id+'" class="btn-edit btn btn-success">View</a></td>'
								+ '</tr>');
						var idCat = cat.id;
						$.ajax({
							url : '${pageContext.request.contextPath}/master/category/get-item-stock?id=' + idCat,
							type : 'get',
							dataType : 'json',
							success : function(itemStock){
								console.log('Item Stock dari '+cat.name+' adalah '+itemStock);
								$('#catdat-'+cat.id).append(itemStock+' Item');
							},
							error : function(){
								alert('Sorry cannot search Item Stock..');
							}
						});
					});
				},
				error : function(data){
					console.log(data);
				}
			});
		});
		
		var nameValid = 0;
		
		//validasi
		$('#create-category').on('input', function(){
			var name = $('#create-category').val();
			if(name.length > 0){
				$.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath}/master/category/cek-name?name='+name,
					success : function(data){
						if(data > 0){
							$('#validasi-name').removeClass('has-success').addClass('has-error');
							$('#label-name').html('<i class="fa fa-times-circle-o"></i> category name must be unique');
							$('#label-name').fadeIn();
							nameValid = 0;
						}
						else {
							$('#validasi-name').removeClass('has-error').addClass('has-success');
							$('#label-name').html('<i class="fa fa-times-circle-o"></i> Ok');
							$('#label-name').fadeIn();
							nameValid = 1;
						}
					},
					error : function(){
						console.log('Gagal!');
					}
				});
			}
			else{
				$('#validasi-name').removeClass('has-success').addClass('has-error');
				$('#label-name').html('<i class="fa fa-times-circle-o"></i> Cannot be empty');
				$('#label-name').fadeIn();
				nameValid = 0;
			}
		});
		
	});
</script>