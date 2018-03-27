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
			$('#reg-id').append('<option disabled selected value=""> -- Select A Region -- </option>');
			$('#dist-id').append('<option disabled selected value=""> -- Select A District -- </option>');
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
			$('#dist-id').append('<option disabled selected value=""> -- Select A District -- </option>');
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
					
				}
			});
		});
		
		
		
		$('.btn-edit').on('click', function(e){
			e.preventDefault();
			var id = $(this).attr('id');
			$.ajax({
				url : '${pageContext.request.contextPath}/supplier/take/' + id,
				type : 'GET',
				success : function(){
					$('#edit-name').val(supplier.name);
					$('#edit-address').val(supplier.address);
					$('#edit-phone').val(supplier.phone);
					$('#edit-email').val(supplier.email);
					$('#edit-id').val(supplier.id);
				},
				error : function(){
					
				}
			});
			$('#modal-edit').modal();
		});
		
		$('#tbl-edit').on('click', function(e){
			e.preventDefault();
			var supplier = {
				name : $('#edit-name').val(),
				address : $('#edit-address').val(),
				phone : $('#edit-phone').val(),
				email : $('#edit-email').val(),
				id : $('#edit-id').val(),
				active : true
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