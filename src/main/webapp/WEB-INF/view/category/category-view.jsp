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
<%@ include file="/WEB-INF/view/category/modal/delete.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		//$('#category-table').DataTable();
		
		$('#tbl-create').on('click', function(e){
			e.preventDefault();
			$('#create-category').val("");
			$('#create-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#create-alert').hide();
			$('#validasi-name').removeClass('has-error').removeClass('has-success');
			$('#label-name').empty();
			$('#modal-create').modal();
		});
		
		$('#tbl-reset').click(function(){
			$('#create-category').val("");
			mustNotEmpty('#validasi-name', '#label-name');
		});
		
		$('#tbl-cancel').click(function(){
			$('#edit-category').val("");
			mustNotEmpty('#validasi-edit', '#label-edit');
		});
		
		//Simpan
		$('#tbl-simpan').on('click', function(e){
			e.preventDefault();
			var category = {
				name : $('#create-category').val()
			};
			if(nameValid == 0){
				//Alert gagal
				$('#create-alert').removeClass('alert-sukses').addClass('alert-gagal');
				$('#create-alert').html('<strong>Error!</strong> Failed to save. Please fill the blank.');
				$('#create-alert').fadeIn();
				//Validasi salah
				$('#validasi-name').removeClass('has-success').addClass('has-error');
				$('#label-name').html('<i class="fa fa-times-circle-o"></i> Cannot empty');
				$('#label-name').fadeIn();
			}
			else if(nameValid == 1){
				//Alert gagal
				$('#create-alert').removeClass('alert-sukses').addClass('alert-gagal');
				$('#create-alert').html('<strong>Error!</strong> Failed to save. Please fill another name.');
				$('#create-alert').fadeIn();
				//Validasi salah
				$('#validasi-name').removeClass('has-success').addClass('has-error');
				$('#label-name').html('<i class="fa fa-times-circle-o"></i> Category name must be unique.');
				$('#label-name').fadeIn();
			}
			else {
			$.ajax({
				url : '${pageContext.request.contextPath}/master/category/save',
				type : 'POST',
				data : JSON.stringify(category),
				contentType : 'application/json',
				success : function(){
					$('#create-alert').removeClass('alert-gagal').addClass('alert-sukses');
					$('#create-alert').html('<strong>Save success!</strong>');
					$('#create-alert').fadeIn();
						
					setTimeout(function() {
						window.location = '${pageContext.request.contextPath}/master/category';
					}, 3000);
				},
				error : function(){
						$('#create-alert').removeClass('alert-sukses').addClass('alert-gagal');
						$('#create-alert').html('<strong>Error!</strong> Failed to save. Please fill the blank.');
						$('#create-alert').fadeIn(); 
				}
			});
			}
		});
		
		var nameEdit;
		
		//getOne when press view button
		$('#category-table').on('click', '.btn-edit', function(e){
			e.preventDefault();
			var id = $(this).attr('id');
			$.ajax({
				url : '${pageContext.request.contextPath}/master/category/take?id=' + id,
				type : 'GET',
				success : function(category){
					nameEdit = category.name;
					$('#edit-category').val(category.name);
					$('#id-edit').val(category.id);
					console.log(id);
				},
				error : function(){
					console.log(id);
				}
			});
			$('#edit-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#edit-alert').hide();
			$('#validasi-edit').removeClass('has-error').removeClass('has-success');
			$('#label-edit').empty();
			$('#modal-edit').modal();
		});
		
		//Update
		$('#tbl-edit').on('click', function(e){
			e.preventDefault();
			var category = {
				name : $('#edit-category').val(),
				id : $('#id-edit').val()
			};
			if(nameValid == 0){
				//Alert gagal
				$('#edit-alert').removeClass('alert-sukses').addClass('alert-gagal');
				$('#edit-alert').html('<strong>Error!</strong> Failed to save. Please fill the blank.');
				$('#edit-alert').fadeIn();
				//Validasi salah
				$('#validasi-edit').removeClass('has-success').addClass('has-error');
				$('#label-edit').html('<i class="fa fa-times-circle-o"></i> Cannot empty');
				$('#label-edit').fadeIn();
			}
			else if(nameValid == 1){
				//Alert gagal
				$('#edit-alert').removeClass('alert-sukses').addClass('alert-gagal');
				$('#edit-alert').html('<strong>Error!</strong> Failed to save. Please fill another name.');
				$('#edit-alert').fadeIn();
				//Validasi salah
				$('#validasi-edit').removeClass('has-success').addClass('has-error');
				$('#label-edit').html('<i class="fa fa-times-circle-o"></i> Category name must be unique.');
				$('#label-edit').fadeIn();
			}
			else if(nameValid == 2){
			$.ajax({
				url : '${pageContext.request.contextPath}/master/category/update',
				type : 'POST',
				data : JSON.stringify(category),
				contentType : 'application/json',
				success : function(){
					$('#edit-alert').removeClass('alert-gagal').addClass('alert-sukses');
					$('#edit-alert').html('<strong>Update success!</strong>');
					$('#edit-alert').fadeIn();
						
					setTimeout(function() {
						window.location = '${pageContext.request.contextPath}/master/category';
					}, 2500);
				},
				error : function(){
						$('#edit-alert').removeClass('alert-sukses').addClass('alert-gagal');
						$('#edit-alert').html('<strong>Error!</strong> Failed to save.');
						$('#edit-alert').fadeIn(); 
				}
			});
			}
		});
		
		
		$('#call-delete').click(function(e){
			e.preventDefault();
			$('#modal-delete').modal();
		});
		
		$('#tbl-delete').click(function(e){
			e.preventDefault();
			var id = $('#id-edit').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/master/category/delete/' + id,
				type : 'DELETE',
				success : function(){
					$('#delete-alert').removeClass('alert-gagal').addClass('alert-sukses');
					$('#delete-alert').html('<strong>Delete success!</strong>');
					$('#delete-alert').fadeIn();
					
					setTimeout(function(){
						window.location = '${pageContext.request.contextPath}/master/category';
					}, 2500);
				},
				error : function(){
					console.log(id);
					$('#delete-alert').removeClass('alert-sukses').addClass('alert-gagal');
					$('#delete-alert').html('<strong>Delete failed!</strong>');
					$('#delete-alert').fadeIn();
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
		
		function mustUnique(validasi, label){
			$(validasi).removeClass('has-success').addClass('has-error');
			$(label).html('<i class="fa fa-times-circle-o"></i> Category name must be unique.');
			$(label).fadeIn();
			nameValid = 1;
		}
		
		function mustNotEmpty(validasi, label){
			$(validasi).removeClass('has-success').addClass('has-error');
			$(label).html('<i class="fa fa-times-circle-o"></i> Cannot empty');
			$(label).fadeIn();
			nameValid = 0;
		}
		
		function kirim(validasi, label){
			$(validasi).removeClass('has-error').addClass('has-success');
			$(label).html('<i class="fa fa-check-circle-o"></i> Ok');
			$(label).fadeIn();
			nameValid = 2;
		}
		
		//validasi name di modal create
		$('#create-category').on('input', function(){
			var name = $('#create-category').val();
			if(name.length > 0){
				$.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath}/master/category/cek-name?name='+name,
					success : function(data){
						if(data > 0){
							/* $('#validasi-name').removeClass('has-success').addClass('has-error');
							$('#label-name').html('<i class="fa fa-times-circle-o"></i> category name must be unique');
							$('#label-name').fadeIn();
							nameValid = 1; */
							mustUnique('#validasi-name', '#label-name');
						}
						else {
							/* $('#validasi-name').removeClass('has-error').addClass('has-success');
							$('#label-name').html('<i class="fa fa-times-circle-o"></i> Ok');
							$('#label-name').fadeIn();
							nameValid = 1; */
							kirim('#validasi-name', '#label-name');
						}
					},
					error : function(){
						console.log('Gagal!');
					}
				});
			}
			else{
				/* $('#validasi-name').removeClass('has-success').addClass('has-error');
				$('#label-name').html('<i class="fa fa-times-circle-o"></i> Cannot be empty');
				$('#label-name').fadeIn();
				nameValid = 0; */
				mustNotEmpty('#validasi-name', '#label-name');
			}
		});
		
		
		//validasi name di modal edit
		$('#edit-category').on('input', function(e){
			e.preventDefault();
			var name = $('#edit-category').val();
			if(name.length > 0){
				$.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath}/master/category/cek-name?name='+name,
					success : function(data){
						if(data > 0 && name != nameEdit){
							mustUnique('#validasi-edit', '#label-edit');
						}
						else {
							kirim('#validasi-edit', '#label-edit');
						}
					},
					error : function(){
						console.log('Gagal!');
					}
				});
			}
			else{
				mustNotEmpty('#validasi-edit', '#label-edit');
			}
		});
		
	});
</script>