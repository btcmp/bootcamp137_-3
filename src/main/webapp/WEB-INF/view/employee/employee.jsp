<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<section class="content">
	<h2>Data Employee</h2>
	<button type="button" class="tbladd btn btn-info btn-lg">Tambah
		Employee</button>
	<table id="data-emp"
		class="table table-striped table-bordered table-hover">
		<thead>
			<th>ID</th>
			<th>Name</th>
			<th>alamat</th>
			<th>Email</th>
			<th>Action</th>
		</thead>
		<tbody id="isi-emp">
			<c:forEach items="${emps }" var="emp">
				<tr>
					<td>${emp.id }</td>
					<td>${emp.name }</td>
					<td>${emp.address }</td>
					<td>${emp.email }</td>
					<td><a href="#" key-id="${emp.id }" class="tbldetail btn btn-success">Detail</a> | 
						<a href="#" key-id="${emp.id }" class="tblupdate btn btn-info">Update</a> | 
						<a href="#" key-id="${emp.id }" class="delete btn btn-danger">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- end table employee -->

	<!-- begin form save -->
	<div class="modal fade" id="frminsert" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close modalcancel"
						data-dismiss="modal">&times;</button>
					<h4 id="judul-modal">Tambahkan Employee</h4>
				</div>
				<div class="modal-body">
					<form data-parsley-validate method="post" id="form-emp">
						<table>
							<tr>
								<td>Nama</td>
								<td>:</td>
								<td><input type="text" name="name" id="name"
									data-parsley-required="true" /></td>
							</tr>
							<tr>
								<td>Alamat</td>
								<td>:</td>
								<td><input type="text" name="address" id="address"
									data-parsley-required="true" /></td>
							</tr>
							<tr>
								<td>Email</td>
								<td>:</td>
								<td><input type="email" name="email" id="email"
									data-parsley-required="true" data-parsley-type="email"/></td>
							</tr>
							<tr>
								<td colspan="2"><button type="button"
										class="btn btn-primary" id="tblsimpan">Simpan</button></td>
								<td><input type="hidden" name="id" id="id"></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<!-- end form save -->

	<!-- begin konfirmasi delete -->
	<div id="konfirmdel" class="modal fade" role="dialog">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Hapus Data?</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<p>Apakah Anda Yakin Ingin Menghapus Data Ini?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal"
						id="batal-insert">Batal</button>
					<button type="button" class="btn btn-danger" id="tblkonfdel"
						key="key">Hapus</button>
				</div>
			</div>
		</div>
	</div>

	<!-- begin pop detail -->
	<div id="popdetail" class="modal fade" role="dialog">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Detail Employee</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<table>
						<tr>
							<td>ID</td>
							<td>:</td>
							<td id="pop-id" style="padding: 10px;"></td>
						</tr>
						<tr>
							<td>Nama</td>
							<td>:</td>
							<td id="pop-name" style="padding: 10px;"></td>
						</tr>
						<tr>
							<td>Alamat</td>
							<td>:</td>
							<td id="pop-address" style="padding: 10px;"></td>
						</tr>
						<tr>
							<td>Email</td>
							<td>:</td>
							<td id="pop-email" style="padding: 10px;"></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal"
						id="batal-insert">Tutup</button>
				</div>
			</div>
		</div>
	</div>
</section>
</body>

<script>
	$(document).ready(function() {
		$('#data-emp').on('click', '.delete',function() {
			var id = $(this).attr('key-id');
			$('#tblkonfdel').attr('key', id);
			$('#konfirmdel').modal('show')
		});
		$('#tblkonfdel').on('click', function() {
							var id = $(this).attr('key');
							console.log('klik tombol hapus')
							$.ajax({
								url : '${pageContext.request.contextPath}/emp/delete/'+ id,
								type : 'DELETE',
								success : function(response) {
									$('#konfirmdel').modal('hide');
									reloadTable();
								},
								error : function() {
	
								}
							});
						}); // end fungsi delete
		function reloadTable() {
			$
					.ajax({
						url : '${pageContext.request.contextPath}/emp/get-all',
						type : "GET",
						dataType : "json",
						success : function(data) {
							$('#data-emp').DataTable()
									.destroy();
							$('#isi-emp').empty();
							$.each(data,function(key, val) {
								$('#isi-emp').append(
												'<tr><td>'
														+ val.id
														+ '</td><td>'
														+ val.name
														+ '</td><td>'
														+ val.address
														+ '</td><td>'
														+ val.email
														+ '</td>'
														+ '<td><a href="#" key-id="'+val.id+'" class="tbldetail btn btn-success">Detail</a>'
														+ ' | '
														+ '<a href="#" key-id="'+val.id+'" class="tblupdate btn btn-info">Update</a>'
														+ ' | '
														+ '<a href="#" key-id="'+val.id+'" class="delete btn btn-danger">Delete</a>');
							});
							$('#data-emp').DataTable({
								'paging' : true,
								'lengthChange' : false,
								'searching' : true,
								'ordering' : true,
								'info' : true,
								'autoWidth' : false
							});
						}
					});
		} // end fungsi reload table
		$('.tbladd').on('click', function() {
			$('#judul-modal').html('Tambah Data Employee');
			$('#frminsert').modal('show');
			clearForm();
		});
		$('#tblsimpan').on('click',function(evt) {
			console.log('click tombol simpan');
			evt.preventDefault();
			var id = $('#id').val();
			var name = $('#name').val();
			var address = $('#address').val();
			var email = $('#email').val();
			var employee = {
				'id' : id,
				'name' : name,
				'address' : address,
				'email' : email
			};
			validate = $('#form-emp').parsley();
			validate.validate();
			if(validate.isValid()){
					$.ajax({
						type : 'post',
						url : '${pageContext.request.contextPath}/emp/save',
						data : JSON
								.stringify(employee),
						contentType : 'application/json',
						success : function() {
							$("#frminsert")
									.modal(
											"hide");
							console
									.log('simpan');
							reloadTable();
							clearForm();
							//alert('save '+ name + ' berhasil');
						},
						error : function() {
							alert('save failed');
						}
					});
			}
		}); // end fungsi simpan
		$('#data-emp').on('click', '.tblupdate',function() {
							var id = $(this).attr('key-id');
							console.log('klik edit');
							$
									.ajax({
										url : '${pageContext.request.contextPath}/emp/get-one/'
												+ id,
										type : "GET",
										dataType : "json",
										success : function(data) {
											clearForm();
											console
													.log('sukses ambil data');
											$('#judul-modal')
													.html(
															'Update Data Employee');
											$('#id').val(
													data.id);
											$('#name').val(
													data.name);
											$('#address')
													.val(
															data.address);
											$('#email').val(
													data.email);
											$("#frminsert")
													.modal(
															"show");
										}
									});
						}); // end fungsi update
		$('#data-emp').on('click', '.tbldetail',function() {
							var id = $(this).attr('key-id');
							console.log('klik detail');
							$
									.ajax({
										url : '${pageContext.request.contextPath}/emp/get-one/'
												+ id,
										type : "GET",
										dataType : "json",
										success : function(data) {
											clearForm();
											console
													.log('sukses ambil data');
											$('#pop-id').html(
													data.id);
											$('#pop-name')
													.html(
															data.name);
											$('#pop-address')
													.html(
															data.address);
											$('#pop-email')
													.html(
															data.email);
											$("#popdetail")
													.modal(
															"show");
										}
									});
						}); // end fungsi detail
		$('.modalcancel').on('click', function() {
			$('#judul-modal').html('Tambahkan Data Employee');
		});
		function clearForm() {
			$('#id').val('');
			$('#name').val('');
			$('#address').val('');
			$('#email').val('');
		}
	});
</script>
<script>
	$(function() {
		$('#data-emp').DataTable({
			'paging' : true,
			'lengthChange' : false,
			'searching' : true,
			'ordering' : true,
			'info' : true,
			'autoWidth' : false
		})
	})
</script>
</html>