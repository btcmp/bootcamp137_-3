<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<div id="container">
	<table id="supplier-table" class="table table-striped table-bordered">
		<thead>
		<tr>
			<th>Name</th>
			<th>Address</th>
			<th>Phone</th>
			<th>Email 	</th>
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
		
		$("#workshop1").change(function() {
       		$("select[name=workshop2] option").removeAttr("disabled");
        	var workshopName = $("select[name=workshop1]").val();
        	$("select[name=workshop2] option[value=" + workshopName + "]").attr("disabled", "disabled");
    	});
		
		$('#tbl-create').on('click', function(e){
			e.preventDefault();
			$('#modal-create').modal();
		});
		
		$('#tbl-simpan').on('click', function(e){
			e.preventDefault();
			var supplier = {
				name : $('#supplier-name').val(),
				address : $('#supplier-address').val(),
				phone : $('#supplier-phone').val(),
				email : $('#supplier-email').val(),
				active : true,
				district : {
					id : 111111
				},
				region : {
					id : 1111
				},
				province : {
					id : 11
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