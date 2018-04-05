<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<div><h1>SUPPLIER</h1></div>
<hr style="border-color:black; border-top:1px dashed;">

<div id="container">
	
	<div class="row">
		<div class="col-xs-3" style="margin-right:300px; margin-left:50px;">
			<div class="form-group">
				<input type="text" id="supplier-search" class="form-control" placeholder="Search Suppier..">
			</div>
		</div>
		<div style="float:right; margin-right:60px;">
			<div class="form-group">
				<a href="" id="tbl-create" class="btn btn-info" >Create</a>
			</div>
		</div>
	</div>
	
	<div>
	<table id="supplier-table" class="table table-striped table-bordered">
		<thead>
		<tr>
			<th>Name</th>
			<th>Address</th>
			<th>Phone</th>
			<th>Email</th>
			<th>#</th>
		</tr>
		</thead>
		<tbody id="supplier-list">
		<c:forEach items="${suppliers }" var="sup">
			<tr>
				<td>${sup.name }</td>
				<td>${sup.address }</td>
				<td>${sup.phone }</td>
				<td>${sup.email }</td>
				<td>
					<a href="" id="${sup.id }" class="btn-edit btn btn-success">Edit</a>
				</td>
			<tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
</div>
<%@ include file="/WEB-INF/view/supplier/modal/create.jsp"%>
<%@ include file="/WEB-INF/view/supplier/modal/edit.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		//$('#supplier-table').DataTable();
		
		
		//Memanggil modal create
		$('#tbl-create').on('click', function(e){
			e.preventDefault();
			$('#modal-create').modal();
		});
		
		
		//Mereset form create
		$('#tbl-reset').click(function(){
			$('#reg-id').empty();
			$('#dist-id').empty();
			$('#reg-id').append('<option disabled selected value=""> --- Select A Region --- </option>');
			$('#dist-id').append('<option disabled selected value=""> --- Select A District --- </option>');
		});
		
		
		//Men-delete (menonaktifkan sebenarnya)
		$('#tbl-delete').click(function(){
			var id = $('#edit-id').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/master/supplier/delete/'+id,
				type : 'DELETE',
				success : function(id){
					console.log(id);
					alert('Delete success..');
					window.location = '${pageContext.request.contextPath}/master/supplier';
				},
				error : function(id){
					console.log(id);
					alert('Cannot Delete');
				}
			});
		});
		
		
		//Men-save hasil create
		$('#tbl-simpan').on('click', function(e){
			e.preventDefault();
			var supplier = {
				name : $('#supplier-name').val(),
				address : $('#supplier-address').val(),
				phone : $('#supplier-phone').val(),
				email : $('#supplier-email').val(),
				postalCode : $('#supplier-postal').val(),
				province : {
					id : $('#prov-id').val()
				},
				region : {
					id : $('#reg-id').val()
				},
				district : {
					id : $('#dist-id').val()
				}
				
			};
			$.ajax({
				url : '${pageContext.request.contextPath}/master/supplier/save',
				type : 'POST',
				data : JSON.stringify(supplier),
				contentType : 'application/json',
				success : function(){
					console.log(supplier);
					alert('yes..');
					window.location = '${pageContext.request.contextPath}/master/supplier';
				},
				error : function(){
					console.log(supplier);
					alert('no..');
				}
			});
		});
		
		
		//Get Region By Province
		$('#prov-id').change(function(){
			$('#reg-id').empty();
			$('#dist-id').empty();
			$('#reg-id').append('<option disabled selected value=""> --- Select A Region --- </option>');
			$('#dist-id').append('<option disabled selected value=""> --- Select A District --- </option>');
			var id = $(this).val();
			$.ajax({
				url : '${pageContext.request.contextPath}/master/supplier/get-region/'+id,
				type : 'GET',
				success : function(regions){
					console.log(regions);
					$(regions).each(function(index, data){
						$('#reg-id').append('<option value=\"'+data.id+'\">'+data.name+'</option>');
					});
				},
				error : function(regions){
					console.log(regions);
					alert('Cannot take regions..');
				}
			});
		});
		
		
		//Get District By Region
		$('#reg-id').change(function(){
			$('#dist-id').empty();
			$('#dist-id').append('<option disabled selected value=""> --- Select A District --- </option>');
			var id = $(this).val();
			$.ajax({
				url : '${pageContext.request.contextPath}/master/supplier/get-district/'+id,
				type : 'GET',
				success : function(districts){
					console.log(districts);
					$(districts).each(function(index, data){
						$('#dist-id').append('<option value=\"'+data.id+'\">'+data.name+'</option>');
					});
				},
				error : function(districts){
					console.log(districts);
					alert('Cannot take district..');
				}
			});
		});
		
		
		//Ambil data dan naruh ke modal edit
		$('#supplier-table').on('click', '.btn-edit', function(e){
			e.preventDefault();
			var id = $(this).attr('id');
			$.ajax({
				url : '${pageContext.request.contextPath}/master/supplier/take/' + id,
				type : 'GET',
				success : function(supplier){
					$('#edit-name').val(supplier.name);
					$('#edit-address').val(supplier.address);
					$('#edit-phone').val(supplier.phone);
					$('#edit-email').val(supplier.email);
					$('#edit-postal').val(supplier.postalCode);
					$('#edit-id').val(supplier.id);
					$('#prov-edit').val(supplier.province.id);
					var idProv = supplier.province.id;
					$.ajax({
						url : '${pageContext.request.contextPath}/master/supplier/get-region/'+idProv,
						type : 'GET',
						success : function(regions){
							console.log(regions);
							$('#reg-edit').empty();
							$('#reg-edit').append('<option disabled selected value=""> --- Select A Region --- </option>');
							$(regions).each(function(index, data){
								$('#reg-edit').append('<option value=\"'+data.id+'\">'+data.name+'</option>');
							});
							$('#reg-edit').val(supplier.region.id);
							var idReg = supplier.region.id;
							$.ajax({
								url : '${pageContext.request.contextPath}/master/supplier/get-district/'+idReg,
								type : 'GET',
								success : function(districts){
									$('#dist-edit').empty();
									$('#dist-edit').append('<option disabled selected value=""> --- Select A District --- </option>');
									console.log(districts);
									$(districts).each(function(index, data){
										$('#dist-edit').append('<option value=\"'+data.id+'\">'+data.name+'</option>');
									});
									$('#dist-edit').val(supplier.district.id);
								},
								error : function(districts){
									console.log(districts);
									alert('Cannot take district..');
								}
							});
						},
						error : function(regions){
							console.log(regions);
							alert('Cannot take regions..');
						}
					});
				},
				error : function(districts){
					console.log(districts);
					alert('Cannot take districts..');
				}
			});
			$('#modal-edit').modal();
		});
		
		//Take region by province in modal edit
		$('#prov-edit').change(function(){
			$('#reg-edit').empty();
			$('#reg-edit').append('<option disabled selected value=""> --- Select A Region --- </option>');
			$('#dist-edit').empty();
			$('#dist-edit').append('<option disabled selected value=""> --- Select A District --- </option>');
			var id = $(this).val();
			$.ajax({
				url : '${pageContext.request.contextPath}/master/supplier/get-region/' + id,
				type : 'GET',
				success : function(regions){
					console.log(regions);
					$(regions).each(function(index, data){
						$('#reg-edit').append('<option value="'+data.id+'">'+data.name+'</option>');
					});
				},
				error : function(regions){
					console.log(regions);
					alert('Cannot take region..');
				}
			});
		});
		
		//Take District By Region in modal edit
		$('#reg-edit').change(function(){
			$('#dist-edit').empty();
			$('#dist-edit').append('<option disabled selected value=""> --- Select A District --- </option>');
			var id = $(this).val();
			$.ajax({
				url : '${pageContext.request.contextPath}/master/supplier/get-district/' + id,
				type : 'GET',
				success : function(districts){
					console.log(districts);
					$(districts).each(function(index, data){
						$('#dist-edit').append('<option value="'+data.id+'">'+data.name+'</option>');
					});
				},
				error : function(districts){
					console.log(districts);
				}
			});
		});
		
		//Kirim hasil editan ke DB
		$('#tbl-edit').on('click', function(e){
			e.preventDefault();
			var supplier = {
				name : $('#edit-name').val(),
				address : $('#edit-address').val(),
				phone : $('#edit-phone').val(),
				email : $('#edit-email').val(),
				id : $('#edit-id').val(),
				postalCode : $('#edit-postal').val(),
				province : {
					id : $('#prov-edit').val()
				},
				region : {
					id : $('#reg-edit').val()
				},
				district : {
					id : $('#dist-edit').val()
				}
			};
			
			$.ajax({
				url : '${pageContext.request.contextPath}/master/supplier/update',
				type : 'PUT',
				data : JSON.stringify(supplier),
				contentType : 'application/json',
				success : function(){
					console.log(supplier);
					alert('Oke..');
					window.location = '${pageContext.request.contextPath}/master/supplier';
				},
				error : function(){
					console.log(supplier);
					alert('Failed bro..');
				}
			});
		});
		
		//Search
		$('#supplier-search').on('input', function(){
			var keyword = $(this).val();
			$.ajax({
				url : '${pageContext.request.contextPath}/master/supplier/search?search='+keyword,
				type : 'GET',
				data : 'json',
				success : function(data){
					$('#supplier-list').empty();
					$.each(data, function(key, sup){
						console.log(sup);
						$('#supplier-list').append('<tr>'
							+ '<td>'+sup.name+'</td>'
							+ '<td>'+sup.address+'</td>'
							+ '<td>'+sup.phone+'</td>'
							+ '<td>'+sup.email+'</td>'
							+ '<td><a href="" id="'+ sup.id +'" class="btn-edit btn btn-success">Edit</a></td>'
							+ '</tr>');
					});
				},
				error : function(){
					
				}
			});
		});
		
	});
</script>