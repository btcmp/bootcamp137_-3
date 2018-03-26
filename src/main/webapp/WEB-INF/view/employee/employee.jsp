<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<section class="content">
	<form id="form-emp">
		<table>
			<tr>
				<td>
				<input type="hidden" id="in-id">
				<input type="text" class="form-control" id="in-firstname" placeholder="First Name" data-parsley-required="true"></td>
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
					<input type="text" placeholder="username" id="in-username" class="form-control">
				</td>
				<td>
					<input type="password" placeholder="password" id="in-password" class="form-control">
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
					<td>
						
					</td>
					<td>${emp.user.role.name }
					<td><a href="#" key-id="${emp.id }" class="tblupdate btn btn-info">Edit</a> | 
						<a href="#" key-id="${emp.id }" class="nonaktifkan btn btn-danger">&times;</a></td>
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
						<input type="checkbox" class="in-outlet" name="in-outlet" value="${outlet.id }"> ${outlet.name } <br/>
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
						key="key">Nonaktifkan</button>
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
	            $('#buat-akun').fadeIn('fast');
	        else 
	            $('#buat-akun').fadeOut('fast');
	    });
	    $('#cek-akun').change();
	    
	    $('#btn-batal').click(function(){
	    	$('#buat-akun').fadeOut('fast');
	    });
	    
	    $('#data-emp').on('click', '.nonaktifkan', function(){
	    	var id = $(this).attr('key-id');
	    	$('#tblkonfdel').attr('key', id);
	    	$('#konfirmdel').modal('show');
	    });
		
		$('#btn-outlet').on('click', function() {
			$('#frm-outlet').modal('show');
		});
		
		$('#tblkonfdel').on('click', function() {
			var id = $(this).attr('key');
			console.log('klik tombol hapus')
			$.ajax({
				url : '${pageContext.request.contextPath}/employee/nonaktif/'+ id,
				type : 'GET',
				success : function(response) {
					$('#konfirmdel').modal('hide');
				},
				error : function() {
					console.log('error');
				}
			});
		}); // end fungsi delete
		
		$('#data-emp').on('click', '.tblupdate', function(){
			var id = $(this).attr('key-id');
			$.ajax({
				url : '${pageContext.request.contextPath}/employee/get-one/'+id,
				type : 'get',
				dataType : 'json',
				success : function(data){
					console.log(data),
					$('#in-id').val(data.id);
					$('#in-firstname').val(data.firstName);
					$('#in-lastname').val(data.lastName);
					$('#in-title').val(data.title);
					$('#in-email').val(data.email);
					if(data.haveAccount == true){
						$('#cek-akun').prop('checked', true);
						$('#in-username').val(data.user.username);
						$('#in-password').val(data.user.password);
						$('#pilih-role').val(data.user.role.id);
						$('#buat-akun').fadeIn('fast');
					};
					//if(data.empOtlet!=null){
						$.each(data.outlets, function(){
							//$('input[name="in-outlet"][value="'+data.empOutlet.outlet.id+'"]').prop('checked', true);
							console.log(data.outlets.name);
						})
					//}
				},
				error : function(){
					console.log('gagal')
				}
			});
		});
		
		//begin fungsi simpan
		$('#btn-simpan').on('click',function(evt) {
			console.log('click tombol simpan');
			evt.preventDefault();
			var outl = [];
			$('.in-outlet:checked').each(function(){
				var eo = {
					
					id : $(this).val(),
					name : "aaaa"
				};
				outl.push(eo);
			});
			
			var usr;
			
			if ($('#cek-akun').is(":checked"))
			{
				var akun = 1;
				usr = {
					"username" : $('#in-username').val(),
					"password" : $('#in-password').val(),
					"role" : {
						"id" : $('#pilih-role').val()
					}
				}
			};
			
			var employee = {
				"id" : $('#in-id').val(),
				"firstName" : $('#in-firstname').val(),
				"lastName" : $('#in-lastname').val(),
				"title" : $('#in-title').val(),
				"active" : 1,
				"email" : $('#in-email').val(),
				"user" : usr,
				"haveAccount" : akun,
				"outlets" : outl
			};
			//console.log(employee);
			validate = $('#form-emp').parsley();
			validate.validate();
			if(validate.isValid()){
				//console.log(employee);
				 $.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath}/employee/save',
					data : JSON.stringify(employee),
					contentType : 'application/json',
					success : function(data) {
						console.log(data);
					},
					error : function() {
						alert('save failed');
					}
				}); 
			}
		}); // end fungsi simpan

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