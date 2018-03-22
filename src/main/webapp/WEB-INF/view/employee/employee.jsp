<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<section class="content">
	<form>
		<table>
			<tr>
				<td><input type="text" class="form-control" id="in-firstname" placeholder="First Name" data-parsley-required="true"></td>
				<td><input type="text" class="form-control" id="in-lastname" placeholder="Last Name" data-parsley-required="true"></td>
				<td><input type="email" class="form-control" id="in-email" placeholder="Email" data-parsley-required="true" data-parsley-type="email"></td>
				<td>
					<select id="in-title" class="form-control" style="font-size: 16px; font-family: raleway;">
						<option value="Mr.">Mr.</option>
						<option value="Mrs.">Mrs.</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="btn btn-info" id="btn-outlet" value="Assign Outlet">
				</td>
				<td>
					<input type="checkbox" id="cek-akun"> Create Account
				</td>
			</tr>
			<tr id = "buat-akun" style="display:none;">
				<td>
					<select id = "pilih-role">
						<c:forEach items = "${roles }" var= "role">
							<option value="${role.id }">${role.name }</option>
						</c:forEach>
					</select>
				<td>
				<td>
					<input type="text" data-parsley-required="true" placeholder="username" id="in-username" class="form-control">
				</td>
				<td>
					<input type="password" data-parsley-required="true" placeholder="password" id="in-password" class="form-control">
				</td>
			</tr>
		</table>
		<input type="button" class="btn btn-info" value="Save" id="btn-simpan">
		<input type="reset" class="btn btn-warning" value="Cancel" id="btn-batal">
	</form>
	<h2>Staff List</h2>
	<hr />
	<table id="data-emp"
		class="table table-striped table-bordered table-hover">
		<thead>
			<th>Name</th>
			<th>Email</th>
			<th>Have Account</th>
			<th>Outlet Access</th>
			<th>Role</th>
			<th>#</th>
		</thead>
		<tbody id="isi-emp">
			<c:forEach items="${emps }" var="emp">
				<tr>
					<td>${emp.firstName } ${emp.lastName }</td>
					<td>${emp.email }</td>
					<td>${emp.haveAccount }</td>
					<td></td>
					<td>${emp.user.role.name }
					<td><a href="#" key-id="${emp.id }" class="tbldetail btn btn-success">Detail</a> | 
						<a href="#" key-id="${emp.id }" class="tblupdate btn btn-info">Update</a> | 
						<a href="#" key-id="${emp.id }" class="delete btn btn-danger">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- end table employee -->

	<!-- begin form outlet -->
	<div class="modal fade" id="frm-outlet" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close modalcancel"
						data-dismiss="modal">&times;</button>
					<h4 id="judul-modal">Assign Outlet to Employee</h4>
				</div>
				<div class="modal-body">
					<c:forEach items="${outlets }" var="outlet">
						<input type="checkbox" class="in-outlet" name="in-outlet" value="${outlet.id }"> ${outlet.name }
					</c:forEach>
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
					<h4 class="modal-title">Non-aktifkan Employee ?</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<p>Apakah Anda Yakin Ingin Menon-aktifkan Employee ini ?</p>
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

	
</section>
</body>

<script>
	$(document).ready(function() {
		
		$('#cek-akun').change(function () {
	        if (this.checked) 
	            $('#buat-akun').fadeIn('slow');
	        else 
	            $('#buat-akun').fadeOut('slow');
	    });
	    $('#cek-akun').change();
	    
		$('#data-emp').on('click', '.delete',function() {
			var id = $(this).attr('key-id');
			$('#tblkonfdel').attr('key', id);
			$('#konfirmdel').modal('show')
		});
		
		$('#btn-outlet').on('click', function() {
			$('#frm-outlet').modal('show');
			clearForm();
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
			$.ajax({
				url : '${pageContext.request.contextPath}/emp/get-all',
				type : "GET",
				dataType : "json",
				success : function(data) {
					$('#data-emp').DataTable().destroy();
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
		
		
		$('#btn-simpan').on('click',function(evt) {
			console.log('click tombol simpan');
			evt.preventDefault();
			var empOut = [];
			$('.in-outlet:checked').each(function(){
				var eo = {
					outlet : {
						id : $(this).val
					}
				};
				empOut.push(eo);
			});
			var employee = {
				"firstName" : $('#in-firstname').val(),
				"lastName" : $('#in-lastname').val(),
				"title" : $('#in-title').val(),
				"active" : 1,
				"email" : $('#in-email').val(),
				"user" : {
					"username" : $('#in-username').val(),
					"password" : $('#in-password').val(),
					"role" : {
						"id" : $('#pilih-role').val()
					}
				},
				"empOutlet" : empOut
			};
			console.log(employee);
			//validate = $('#form-emp').parsley();
			//validate.validate();
			//if(validate.isValid()){
				$.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath}/employee/save',
					data : JSON.stringify(employee),
					contentType : 'application/json',
					success : function() {
						//$("#frminsert").modal("hide");
						console.log('simpan');
						//reloadTable();
						//clearForm();
						//alert('save '+ name + ' berhasil');
					},
					error : function() {
						alert('save failed');
					}
				});
			//}
		}); // end fungsi simpan
		$('#data-emp').on('click', '.tblupdate',function() {
			var id = $(this).attr('key-id');
			console.log('klik edit');
			$.ajax({
				url : '${pageContext.request.contextPath}/emp/get-one/'+ id,
				type : "GET",
				dataType : "json",
				success : function(data) {
					clearForm();
					console.log('sukses ambil data');
					$('#judul-modal').html('Update Data Employee');
					$('#id').val(data.id);
					$('#name').val(data.name);
					$('#address').val(data.address);
					$('#email').val(data.email);
					$("#frminsert").modal("show");
				}
			});
		}); // end fungsi update
	
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