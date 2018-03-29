<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<div id="container">
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
		<tbody>
		<c:forEach items="${suppliers }" var="sup">
			<tr>
				<td>${sup.name }</td>
				<td>${sup.address }</td>
				<td>${sup.phone }</td>
				<td>${sup.email }</td>
				<td>
					<a href="" id="${sup.id }" class="btn-edit btn btn-warning">Edit</a>
				</td>
			<tr>
		</c:forEach>
		</tbody>
	</table>
	<a href="" id="tbl-create" class="btn btn-info" >Create</a>
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
		
		//Men-save hasil create
		$('#tbl-simpan').on('click', function(e){
			e.preventDefault();
			var supplier = {
				name : $('#supplier-name').val(),
				address : $('#supplier-address').val(),
				phone : $('#supplier-phone').val(),
				email : $('#supplier-email').val(),
				postalCode : $('#supplier-postal').val(),
				active : true,
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
				url : '${pageContext.request.contextPath}/supplier/save',
				type : 'POST',
				data : JSON.stringify(supplier),
				contentType : 'application/json',
				success : function(){
					console.log(supplier);
					alert('yes..');
					window.location = '${pageContext.request.contextPath}/supplier';
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
				url : '${pageContext.request.contextPath}/supplier/get-region/'+id,
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
				url : '${pageContext.request.contextPath}/supplier/get-district/'+id,
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
		$('.btn-edit').on('click', function(e){
			e.preventDefault();
			var id = $(this).attr('id');
			$.ajax({
				url : '${pageContext.request.contextPath}/supplier/take/' + id,
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
						url : '${pageContext.request.contextPath}/supplier/get-region/'+idProv,
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
								url : '${pageContext.request.contextPath}/supplier/get-district/'+idReg,
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
				url : '${pageContext.request.contextPath}/supplier/get-region/' + id,
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
				url : '${pageContext.request.contextPath}/supplier/get-district/' + id,
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
				active : true,
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
				url : '${pageContext.request.contextPath}/supplier/update',
				type : 'PUT',
				data : JSON.strigify(supplier),
				contentType : 'application/json',
				success : function(){
					console.log(supplier);
					alert('Oke..');
				},
				error : function(){
					console.log(supplier);
					alert('Failed bro..');
				}
			});
		});
		
	});
</script>