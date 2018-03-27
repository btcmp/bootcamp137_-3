<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<div id="container">
	<table id="outlet-table" class="table table-striped table-bordered">
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
		<c:forEach items="${outlets }" var="out">
			<tr>
				<td>${out.name }</td>
				<td>${out.address }</td>
				<td>${out.phone }</td>
				<td>${out.email }</td>
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
		
		$('#tbl-create').on('click', function(e){
			e.preventDefault();
			$('#modal-create').modal();
		});
		
		$('#tbl-simpan').on('click', function(e){
			e.preventDefault();
			var outlet = {
				name : $('#outlet-name').val(),
				address : $('#outlet-address').val(),
				phone : $('#outlet-phone').val(),
				email : $('#outlet-email').val(),
				active : true
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
		
		$('.btn-edit').on('click', function(e){
			e.preventDefault();
			var id = $(this).attr('id');
			$.ajax({
				url : '${pageContext.request.contextPath}/outlet/take/' + id,
				type : 'GET',
				success : function(){
					$('#edit-name').val(outlet.name);
					$('#edit-address').val(outlet.address);
					$('#edit-phone').val(outlet.phone);
					$('#edit-email').val(outlet.email);
					$('#edit-id').val(outlet.id);
				},
				error : function(){
					
				}
			});
			$('#modal-edit').modal();
		});
		
		$('#tbl-edit').on('click', function(e){
			e.preventDefault();
			var outlet = {
				name : $('#edit-name').val(),
				address : $('#edit-address').val(),
				phone : $('#edit-phone').val(),
				email : $('#edit-email').val(),
				id : $('#edit-id').val(),
				active : true
			};
			
			$.ajax({
				url : '${pageContext.request.contextPath}/outlet/update',
				type : 'PUT',
				data : JSON.strigify(outlet),
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