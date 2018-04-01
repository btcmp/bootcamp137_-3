<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<section class="content">
	<form id="form-emp">
			<div class="row">
				<div class="col-xs-3">
					<input type="hidden" id="in-id">
					<input type="text" class="form-control" id="in-firstname" placeholder="First Name" data-parsley-required="true" required></div>
				<div class="col-xs-3">
					<input type="text" class="form-control" id="in-lastname" placeholder="Last Name" data-parsley-required="true" required>
				</div>
				<div class="col-xs-3">
					<input type="email" class="form-control" id="in-email" placeholder="Email" data-parsley-required="true" data-parsley-type="email" required>
				</div>
				<div class="col-xs-3">
					<select id="in-title" class="form-control" style="font-size: 16px; font-family: raleway;" data-parsley-required="true" required >
						<option value="Mr.">Mr.</option>
						<option value="Mrs.">Mrs.</option>
					</select>
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-xs-3">
					<input type="button" class="btn btn-info btn-block" id="btn-outlet" value="Assign Outlet">
				</div>
				<div class="col-xs-3">
					<div class="form-check checkbox-teal">
						<input type="checkbox" id="cek-akun" class="form-check-input">
						<label class="form-check-label" for="cek-akun">Create Account</label>
					</div>
				</div>
			</div>
			<hr style="border-color:black; border-top:1px dashed;">
			<div class="row" id = "buat-akun" style="display:none;">
				<div class="col-xs-3">
					<select id = "pilih-role" class="form-control">
						<c:forEach items = "${roles }" var= "role">
							<option value="${role.id }">${role.name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-xs-3">
					<input type="hidden" id="in-id-user">
					<input type="text" placeholder="username" id="in-username" class="form-control" data-parsley-required="false">
				</div>
				<div class="col-xs-3">
					<input type="password" placeholder="password" id="in-password" class="form-control" data-parsley-required="false">
				</div>
			</div>
			<br>
		<div class="row">
			<div class="col-xs-8">
			</div>
			<div class="col-xs-2">
				<input type="button" class="btn btn-info btn-block" value="Save" id="btn-simpan">
			</div>
			<div class="col-xs-2">
				<input type="reset" class="btn btn-warning btn-block" value="Cancel" id="btn-batal">
			</div>
		</div>
	</form>
	<h2>Staff List</h2>
	<hr style="border-color:black; border-top:1px dashed;">
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
					<td>
						<script>
							if("${emp.haveAccount}" === "true" && "${emp.user.active}" === "true"){
								document.write("&#10004;");
							}else if("${emp.haveAccount}" === "false" && "${emp.user.active}" === "true"){
								document.write("&#10004;");
							}else{
								document.write("&#10008;");
							}
						</script>
					</td>
					<td>
						<ol>
							<c:forEach items="${emp.empOutlet }" var="empo">
								<li>${empo.outlet.name }</li>
							</c:forEach>
						</ol>
					</td>
					<td>
						<script>
							if("${emp.haveAccount}" === "true" && "${emp.user.active}" === "true"){
									document.write("${emp.user.role.name }");
								}else if("${emp.haveAccount}" === "false" && "${emp.user.active}" === "true"){
									document.write("User Tidak Aktif");
								}else{
									document.write("Tidak Memiliki User");
							}
						</script>
					</td>
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
					<div class="form-check checkbox-teal">
						<c:forEach items="${outlets }" var="outlet">
							<input type="checkbox" id="outlet-${outlet.id }" class="in-outlet" class="form-check-input" name="in-outlet" value="${outlet.id }">
							<label class="form-check-label" for="outlet-${outlet.id }">${outlet.name }</label><br/>
						</c:forEach>
					</div>
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
	        if (this.checked) {
	            $('#buat-akun').fadeIn('fast');
	        	$('#in-username').attr('data-parsley-required', true);
	        	$('#in-username').prop('required', true);
	        	$('#in-password').attr('data-parsley-required', true);
	        	$('#in-password').prop('required', true);
	        }else{ 
	            $('#buat-akun').fadeOut('fast');
	        	$('#in-username').attr('data-parsley-required', false);
	        	$('#in-username').prop('required', false);
        		$('#in-password').attr('data-parsley-required', false);
        		$('#in-password').prop('required', false);
	        }
	    });
	    $('#cek-akun').change();
	    
	    $('#btn-batal').click(function(){
	    	$('#buat-akun').fadeOut('fast');
	    	emailEdit = '';
			userEdit = '';
			emailValid = 0;
			userValid = 0;
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
					window.location = '${pageContext.request.contextPath}/employee';
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
					console.log('sukses ambil data');
					console.log(data);
					$('#in-id').val(data.id);
					$('#in-firstname').val(data.firstName);
					$('#in-lastname').val(data.lastName);
					$('#in-title').val(data.title);
					$('#in-email').val(data.email);
					emailEdit = data.email;
					if(data.haveAccount == 1){
						$('#cek-akun').prop('checked', true);
						$('#buat-akun').fadeIn('fast');
						$('#in-id-user').val(data.user.id);
						$('#in-username').val(data.user.username);
						userEdit = data.user.username;
						$('#in-password').val(data.user.password);
						$('#pilih-role').val(data.user.role.id);
					}else if(data.haveAccount == 0 && data.user.active == 1){
						$('#cek-akun').prop('checked', false);
						$('#buat-akun').fadeOut('fast');
						$('#in-id-user').val(data.user.id);
						$('#in-username').val(data.user.username);
						$('#in-password').val(data.user.password);
						$('#pilih-role').val(data.user.role.id);
					};
					if(data.empOutlet!=null){
						$.each(data.empOutlet, function(i, item){
							$('input[name="in-outlet"][value="'+data.empOutlet[i].outlet.id+'"]').prop('checked', true);
						})
					}
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
			var empOut = [];
			$('.in-outlet:checked').each(function(){
				var eo = {
					outlet : {
						id : $(this).val()
					}
				};
				empOut.push(eo);
			});
			
			var usr;
			
			if ($('#cek-akun').is(":checked"))
			{
				var akun = 1;
				usr = {
					"id" : $('#in-id-user').val(),
					"username" : $('#in-username').val(),
					"password" : $('#in-password').val(),
					"active" : 1,
					"role" : {
						"id" : $('#pilih-role').val()
					}
				}
			}else{
				userValid = 1;
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
				"empOutlet" : empOut
			};
			console.log(employee);
			validate = $('#form-emp').parsley();
			validate.validate();
			if(validate.isValid() && emailValid == 1 && userValid == 1){
				$.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath}/employee/save',
					data : JSON.stringify(employee),
					contentType : 'application/json',
					success : function() {
						console.log('simpan');
						window.location = '${pageContext.request.contextPath}/employee';
					},
					error : function() {
						alert('save failed');
					}
				});
			}
		}); // end fungsi simpan

		var emailEdit = '';
		var userEdit = '';
		var emailValid = 0;
		var userValid = 0;
		
		// cek username
		$('#in-username').on('input',function(){
			var username = $('#in-username').val();
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/employee/cek-user?user='+username,
				success : function(data){
					if(data > 0 && $('#cek-akun').is(":checked") && username != userEdit){
						// Non unique
						$('#btn-simpan').prop('disabled', true);
						userValid = 0;
					}else {
						// unique
						$('#btn-simpan').prop('disabled', false);
						userValid = 1;
					}
				}, error : function(){
					console.log('gagal')
				}
			});
		});
		
		$('#in-email').on('input',function(){
			var email = $('#in-email').val();
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/employee/cek-email?email='+email,
				success : function(data){
					if(data > 0 && email != emailEdit){
						// Non unique
						$('#btn-simpan').prop('disabled', true);
						emailValid = 0;
					}else{
						// unique
						$('#btn-simpan').prop('disabled', false);
						emailValid = 1;
					}
				}, error : function(){
					console.log('gagal')
				}
			});
		});
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