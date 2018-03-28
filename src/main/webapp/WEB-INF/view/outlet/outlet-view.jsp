<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<div id="container">
	<table id="outlet-table" class="table table-striped table-bordered">
		<thead>
		<tr>
			<th>Name</th>
			<th>Address</th>
			<th>Phone</th>
			<th>Email</th>
			<th>Postal Code</th>
			<th>#</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${outlets }" var="out">
			<tr>
				<td>${out.name }</td>
				<td>${out.address }</td>
				<td>${out.phone }</td>
				<td>${out.email }</td>
				<td>${out.postalCode }</td>
				<td>
					<a href="" id="${out.id }" class="btn-edit btn btn-warning">Edit</a>
				</td>
			<tr>
		</c:forEach>
		</tbody>
	</table>
	<a href="" id="tbl-create" class="btn btn-info" >Create</a>
</div>
<%@ include file="/WEB-INF/view/outlet/modal/create.jsp"%>
<%@ include file="/WEB-INF/view/outlet/modal/edit.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		//$('#outlet-table').DataTable();
		
		//Munculkan modal create
		$('#tbl-create').on('click', function(e){
			e.preventDefault();
			$('#modal-create').modal();
		});
		
		//Men-save yang sudah di-create
		$('#tbl-simpan').on('click', function(e){
			e.preventDefault();
			var outlet = {
				name : $('#outlet-name').val(),
				address : $('#outlet-address').val(),
				phone : $('#outlet-phone').val(),
				email : $('#outlet-email').val(),
				postalCode : $('#outlet-postal').val(),
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
				url : '${pageContext.request.contextPath}/outlet/save',
				type : 'POST',
				data : JSON.stringify(outlet),
				contentType : 'application/json',
				success : function(){
					console.log(outlet);
					alert('yes..');
					window.location = '${pageContext.request.contextPath}/outlet';
				},
				error : function(){
					console.log(outlet);
					alert('no..');
				}
			});
		});
		
		//Get Region By Province
		$('#prov-id').change(function(){
			$('#reg-id').empty();
			$('#dist-id').empty();
			$('#reg-id').append('<option disabled selected value=\"\"> --- Select A Region --- </option>');
			$('#dist-id').append('<option disabled selected value=\"\"> --- Select A District --- </option>');
			var id = $(this).val();
			$.ajax({
				url : '${pageContext.request.contextPath}/outlet/get-region/'+id,
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
			$('#dist-id').append('<option disabled selected value=\"\"> --- Select A District --- </option>');
			var id = $(this).val();
			$.ajax({
				url : '${pageContext.request.contextPath}/outlet/get-district/'+id,
				type : 'GET',
				success : function(districts){
					console.log(districts)
					$(districts).each(function(index, data){
						$('#dist-id').append('<option value="'+data.id+'">'+data.name+'</option>');
					});
				},
				error : function(districts){
					console.log(districts);
					alert('Cannot get districts');
				}
			});
		});
		
		//Take data to edit
		$('.btn-edit').on('click', function(e){
			e.preventDefault();
			var id = $(this).attr('id');
			$.ajax({
				url : '${pageContext.request.contextPath}/outlet/take?id=' + id,
				type : 'GET',
				success : function(outlet){
					$('#edit-name').val(outlet.name);
					$('#edit-address').val(outlet.address);
					$('#edit-phone').val(outlet.phone);
					$('#edit-email').val(outlet.email);
					$('#edit-postal').val(outlet.postalCode);
					$('#edit-id').val(outlet.id);
					$('#prov-edit').val(outlet.province.id);
					var id = outlet.province.id;
					$.ajax({
						url : '${pageContext.request.contextPath}/outlet/get-region/'+id,
						type : 'GET',
						success : function(regions){
							console.log(regions);
							$(regions).each(function(index, data){
								$('#reg-edit').append('<option value=\"'+data.id+'\">'+data.name+'</option>');
							});
							$('#reg-edit').val(outlet.region.id);
							var idReg = outlet.region.id;
							$.ajax({
								url : '${pageContext.request.contextPath}/outlet/get-district/'+idReg,
								type : 'GET',
								success : function(districts){
									console.log(districts)
									$(districts).each(function(index, data){
										$('#dist-edit').append('<option value="'+data.id+'">'+data.name+'</option>');
									});
									$('#dist-edit').val(outlet.district.id);
								},
								error : function(districts){
									console.log(districts);
									alert('Cannot get districts');
								}
							});

						},
						error : function(regions){
							console.log(regions);
							alert('Cannot take regions..');
						}
					});
				},
				error : function(){
					
				}
			});
			$('#modal-edit').modal();
		});
		
		$('#prov-edit').change(function(){
			$('#reg-edit').empty();
			$('#dist-edit').empty();
			$('#reg-edit').append('<option disabled selected value=\"\"> --- Select A Region --- </option>');
			$('#dist-edit').append('<option disabled selected value=\"\"> --- Select A District --- </option>');
			var id = $(this).val();
			$.ajax({
				url : '${pageContext.request.contextPath}/outlet/get-region/'+id,
				type : 'GET',
				success : function(regions){
					console.log(regions);
					$(regions).each(function(index, data){
						$('#reg-edit').append('<option value=\"'+data.id+'\">'+data.name+'</option>');
					});
				},
				error : function(regions){
					console.log(regions);
					alert('Cannot take regions..');
				}
			});
		});
		
		$('#reg-edit').change(function(){
			$('#dist-edit').empty();
			$('#dist-edit').append('<option disabled selected value=\"\"> --- Select A District --- </option>');
			var id = $(this).val();
			$.ajax({
				url : '${pageContext.request.contextPath}/outlet/get-district/'+id,
				type : 'GET',
				success : function(districts){
					console.log(districts)
					$(districts).each(function(index, data){
						$('#dist-edit').append('<option value="'+data.id+'">'+data.name+'</option>');
					});
				},
				error : function(districts){
					console.log(districts);
					alert('Cannot get districts');
				}
			});
		});
		
		//Send edited data to DB
		$('#tbl-edit').on('click', function(e){
			e.preventDefault();
			var outlet = {
				name : $('#edit-name').val(),
				address : $('#edit-address').val(),
				phone : $('#edit-phone').val(),
				email : $('#edit-email').val(),
				id : $('#edit-id').val(),
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
				url : '${pageContext.request.contextPath}/outlet/update',
				type : 'PUT',
				data : JSON.stringify(outlet),
				contentType : 'application/json',
				success : function(){
					console.log(outlet);
					alert('Oke..');
				},
				error : function(){
					console.log(outlet);
					alert('Failed bro..');
				}
			});
		});
		
	});
</script>