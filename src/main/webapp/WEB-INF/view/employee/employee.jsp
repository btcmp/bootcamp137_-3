<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<section class="content">
	<form id="form-emp">
		<div class="row" id="div-alert" style="display:none;">
			<div class="col-xs-12">
				<div class="alert alert-sukses" role="alert" id="tampilan-alert">
				  <strong>Sukses!</strong> Data Berhasil Disimpan.
				</div>
			</div>
		</div>
			<div class="row">
				<div class="col-xs-3">
					<input type="hidden" id="in-id">
					<div class="form-group" id="div-firstname">
						<label class="control-label" for="in-fisrtname" style="display:none" id="lbl-firstname"><i class="fa fa-check"></i></label>
						<input type="text" class="form-control" id="in-firstname" placeholder="First Name" data-parsley-required="true" data-parsley-required-message="PLease insert your first name" required></div>
					</div>
				<div class="col-xs-3">
					<div class="form-group" id="div-lastname">
						<label class="control-label" for="in-lastname" style="display:none" id="lbl-lastname"><i class="fa fa-check"></i></label>
						<input type="text" class="form-control" id="in-lastname" placeholder="Last Name" data-parsley-required="true" data-parsley-required-message="Please insert last name" required>
					</div>
				</div>
				<div class="col-xs-3">
					<div class="form-group" id="div-email">
						<label class="control-label" for="in-email" style="display:none" id="lbl-email"><i class="fa fa-check"></i></label>
						<input type="email" class="form-control" id="in-email" placeholder="Email" data-parsley-required="true" data-parsley-type="email" data-parsley-required-message="Please insert your email" required>
					</div>
				</div>
				<div class="col-xs-3">
					<div class="form-group" id="div-title">
						<label class="control-label" for="in-title" style="display:none" id="lbl-title"><i class="fa fa-check"></i></label>
						<select id="in-title" class="form-control" style="font-size: 16px; font-family: raleway;" data-parsley-required="true" required >
							<option disabled selected>Choose Title</option>
							<option value="Mr.">Mr.</option>
							<option value="Mrs.">Mrs.</option>
						</select>
					</div>
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-xs-3">
					<div class="form-group" id="div-outlet">
						<label class="control-label" for="btn-outlet" style="display:none" id="lbl-outlet"><i class="fa fa-check"></i></label>
						<input type="button" class="btn btn-info btn-block" id="btn-outlet" value="Assign Outlet">
					</div>
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
					<div class="form-group" id="div-role">
						<label class="control-label" for="pilih-role" style="display:none" id="lbl-role"><i class="fa fa-check"></i></label>
						<select id = "pilih-role" class="form-control">
							<option disabled selected>Choose Role</option>
							<c:forEach items = "${roles }" var= "role">
								<option value="${role.id }">${role.description }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-xs-3">
					<input type="hidden" id="in-id-user">
					<div class="form-group" id="div-username">
						<label class="control-label" for="in-username" style="display:none" id="lbl-username"><i class="fa fa-check"></i></label>
						<input type="text" placeholder="username" id="in-username" class="form-control" data-parsley-required="false">
					</div>
				</div>
				<div class="col-xs-3">
					<div class="form-group" id="div-password">
						<label class="control-label" for="in-password" style="display:none" id="lbl-password"><i class="fa fa-check"></i></label>
						<input type="password" placeholder="password" id="in-password" class="form-control" data-parsley-required="false">
					</div>
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
							if("${emp.haveAccount}" === "true"){
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
									document.write("${emp.user.role.description }");
								}else if("${emp.haveAccount}" === "true" && "${emp.user.active}" === "false"){
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
					<button type="button" class="btn btn-info" data-dismiss="modal">Save</button>
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
        		userValid = 1;
        		pValid = 1;
        		oValid = 1;
        		rValid = 1;
	        }
	    });
	    $('#cek-akun').change();
	    
	    $('.in-outlet').change(function(){
	    	var outcb = $('input[name="in-outlet"]:checked').length;
	    	if(outcb > 0){
	    		$('#div-outlet').removeClass('has-error').addClass('has-success');
				$('#lbl-outlet').html('<i class="fa fa-check"></i> Ok');
				$('#lbl-outlet').fadeIn();
				oValid = 1;
	    	}else if(outcb == 0 && $('#cek-akun').is(":checked")){
	    		$('#div-outlet').removeClass('has-success').addClass('has-error');
				$('#lbl-outlet').html('<i class="fa-times-circle-o"></i> Please choose outlet');
				$('#lbl-outlet').fadeIn();
				oValid = 0;
	    	}
	    });
	    $('.in-outlet').change();
	    
	    $('#btn-batal').click(function(){
	    	$('#buat-akun').fadeOut('fast');
	    	emailEdit = '';
			userEdit = '';
			emailValid = 0;
			userValid = 0;
			pValid = 0;
			fValid = 0;
			lValid = 0;
			oValid = 1;
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
				url : '${pageContext.request.contextPath}/master/employee/nonaktif/'+ id,
				type : 'GET',
				success : function(response) {
					window.location = '${pageContext.request.contextPath}/master/employee';
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
				url : '${pageContext.request.contextPath}/master/employee/get-one/'+id,
				type : 'get',
				dataType : 'json',
				success : function(data){
					console.log('sukses ambil data');
					console.log(data);
					userValid = 1;
					emailValid = 1;
					pValid = 1;
					fValid = 1;
					lValid = 1;
					oValid = 1;
					tValid = 1;
					rValid = 1;
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
			var outcb = $('input[name="in-outlet"]:checked').length;
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
				if(outcb > 0){
					oValid = 1;
				}else{
					oValid = 0;
				}
				if($('#pilih-role').val() == null){
					rValid = 0;
				}else{
					rValid = 1;
				}
			}else{
				userValid = 1;
				pValid = 1;
				oValid = 1;
				rVAlid = 1;
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
	
			console.log(emailValid);
			console.log(userValid);
			console.log(fValid);
			console.log(lValid);
			console.log(pValid);
			console.log(oValid);
			console.log(tValid);
			console.log(rValid);
			if(emailValid == 1 && userValid == 1 && fValid == 1 && lValid == 1 && pValid == 1 && oValid == 1){
				validate = $('#form-emp').parsley();
				validate.validate();
				if(validate.isValid()){
					$.ajax({
						type : 'post',
						url : '${pageContext.request.contextPath}/master/employee/save',
						data : JSON.stringify(employee),
						contentType : 'application/json',
						success : function() {
							$('#tampilan-alert').removeClass('alert-gagal').addClass('alert-sukses');
							$('#tampilan-alert').html('<strong>Sukses!</strong> Berhasil Menyimpan ke Database');
							$('#div-alert').fadeIn();
							setTimeout(function() {
								window.location = '${pageContext.request.contextPath}/master/employee';
							}, 2000);
						},
						error : function() {
							$('#tampilan-alert').removeClass('alert-sukses').addClass('alert-gagal');
							$('#tampilan-alert').html('<strong>Error!</strong> Gagal Menyimpan ke Database');
							$('#div-alert').fadeIn();
							setTimeout(function(){
								$('#div-alert').fadeOut();
							}, 4000);
						}
					});
				}
			}/* else if(validate.isValid() && emailValid == 0 && userValid == 0){
				$('#tampilan-alert').removeClass('alert-sukses').addClass('alert-gagal');
				$('#tampilan-alert').html('<strong>Error!</strong> Username dan Email tidak Unique.');
				$('#div-alert').fadeIn();
				setTimeout(function(){
					$('#div-alert').fadeOut();
				}, 4000);
			}else if(validate.isValid() && emailValid == 0 && userValid == 1){
				$('#tampilan-alert').removeClass('alert-sukses').addClass('alert-gagal');
				$('#tampilan-alert').html('<strong>Erro!</strong> Email tidak Unique.');
				$('#div-alert').fadeIn();
				setTimeout(function(){
					$('#div-alert').fadeOut();
				}, 4000);
			}else if(validate.isValid() && emailValid == 1 && userValid == 0){
				$('#tampilan-alert').removeClass('alert-sukses').addClass('alert-gagal');
				$('#tampilan-alert').html('<strong>Erro!</strong> Username tidak Unique.');
				$('#div-alert').fadeIn();
				setTimeout(function(){
					$('#div-alert').fadeOut();
				}, 4000);
			} */else{
				$('#tampilan-alert').removeClass('alert-sukses').addClass('alert-gagal');
				$('#tampilan-alert').html('<strong>Error!</strong> Gagal Menyimpan ke Database.');
				$('#div-alert').fadeIn();
				setTimeout(function(){
					$('#div-alert').fadeOut();
				}, 4000);
			}
			if(emailValid == 0){
				if($('#in-email').val().length < 7){
					$('#div-email').removeClass('has-success').addClass('has-error');
					$('#lbl-email').html('<i class="fa fa-times-circle-o"></i> Please insert your email');
					$('#lbl-email').fadeIn();
				}else{
					$('#div-email').removeClass('has-success').addClass('has-error');
					$('#lbl-email').html('<i class="fa fa-times-circle-o"></i> email must be unique');
					$('#lbl-email').fadeIn();
				}
			}
			if(emailValid == 2){
				$('#div-email').removeClass('has-success').addClass('has-error');
				$('#lbl-email').html('<i class="fa fa-times-circle-o"></i> please insert valid email');
				$('#lbl-email').fadeIn();
				emailValid = 2;
			}
			if(userValid == 0){
				if($('#in-username').val().length == 0){
					$('#div-username').removeClass('has-success').addClass('has-error');
					$('#lbl-username').html('<i class="fa fa-times-circle-o"></i> Please insert username');
					$('#lbl-username').fadeIn();
				}else{
					$('#div-username').removeClass('has-success').addClass('has-error');
					$('#lbl-username').html('<i class="fa fa-times-circle-o"></i> username must be unique');
					$('#lbl-username').fadeIn();
				}
			}
			if(pValid == 0){
				$('#div-password').removeClass('has-success').addClass('has-error');
				$('#lbl-password').html('<i class="fa fa-times-circle-o"></i> Password must more than 6 characters');
				$('#lbl-password').fadeIn();
			}
			if(fValid == 0){
				$('#div-firstname').removeClass('has-success').addClass('has-error');
				$('#lbl-firstname').html('<i class="fa fa-times-circle-o"></i> please insert first name');
				$('#lbl-firstname').fadeIn();
			}
			if(lValid == 0){
				$('#div-lastname').removeClass('has-success').addClass('has-error');
				$('#lbl-lastname').html('<i class="fa fa-times-circle-o"></i> please insert last name');
				$('#lbl-lastname').fadeIn();
			}
			if(tValid == 0){
				$('#div-title').removeClass('has-success').addClass('has-error');
				$('#lbl-title').html('<i class="fa fa-times-circle-o"></i> Please select title');
				$('#lbl-title').fadeIn();
			}
			if(rValid == 0){
				$('#div-role').removeClass('has-success').addClass('has-error');
				$('#lbl-role').html('<i class="fa fa-times-circle-o"></i> Please select user role');
				$('#lbl-role').fadeIn();
			}
			if(oValid == 0){
				$('#div-outlet').removeClass('has-success').addClass('has-error');
				$('#lbl-outlet').html('<i class="fa fa-times-circle-o"></i> Please choose outlet');
				$('#lbl-outlet').fadeIn();
			}
		}); // end fungsi simpan

		var emailEdit = '';
		var userEdit = '';
		var emailValid = 0;
		var userValid = 0;
		var pValid = 0;
		var fValid = 0;
		var lValid = 0;
		var oValid = 1;
		var tValid = 0;
		var rValid = 1;
		
		// cek username
		$('#in-username').on('input',function(){
			var username = $('#in-username').val();
			if(username.length > 0){
				$.ajax({
					type : 'get',
					url : '${pageContext.request.contextPath}/master/employee/cek-user?user='+username,
					success : function(data){
						if(data > 0 && $('#cek-akun').is(":checked") && username != userEdit){
							$('#div-username').removeClass('has-success').addClass('has-error');
							$('#lbl-username').html('<i class="fa fa-times-circle-o"></i> username must be unique');
							$('#lbl-username').fadeIn();
							userValid = 0;
						}else {
							$('#div-username').removeClass('has-error').addClass('has-success');
							$('#lbl-username').html('<i class="fa fa-check"></i> Ok');
							$('#lbl-username').fadeIn();
							userValid = 1;
						}
					}, error : function(){
						console.log('gagal')
					}
				});
			}else{
				$('#div-username').removeClass('has-success').addClass('has-error');
				$('#lbl-username').html('<i class="fa fa-times-circle-o"></i> please insert username');
				$('#lbl-username').fadeIn();
				userValid = 0;
			}
			
		});
		
		$('#in-email').on('input',function(){
			var email = $('#in-email').val();
			var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			var valid =  regex.test(email);
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/master/employee/cek-email?email='+email,
				success : function(data){
					if(valid && email.length > 6){
						if(data > 0 && email != emailEdit){
							$('#div-email').removeClass('has-success').addClass('has-error');
							$('#lbl-email').html('<i class="fa fa-times-circle-o"></i> email must be unique');
							$('#lbl-email').fadeIn();
							emailValid = 0;
						}else{
							$('#div-email').removeClass('has-error').addClass('has-success');
							$('#lbl-email').html('<i class="fa fa-check"></i> Ok');
							$('#lbl-email').fadeIn();
							emailValid = 1;
						}
					}else{
						$('#div-email').removeClass('has-success').addClass('has-error');
						$('#lbl-email').html('<i class="fa fa-times-circle-o"></i> please insert valid email');
						$('#lbl-email').fadeIn();
						emailValid = 2;
					}
				}, error : function(){
					console.log('gagal')
				}
			});
		});
		
		$('#in-firstname').on('input', function(){
			if($(this).val().length > 0){
				$('#div-firstname').removeClass('has-error').addClass('has-success');
				$('#lbl-firstname').html('<i class="fa fa-check"></i> Ok');
				$('#lbl-firstname').fadeIn();
				fValid = 1;
			}else{
				$('#div-firstname').removeClass('has-success').addClass('has-error');
				$('#lbl-firstname').html('<i class="fa fa-times-circle-o"></i> please insert first name');
				$('#lbl-firstname').fadeIn();
				fValid = 0;
			}
		});
		
		$('#in-lastname').on('input', function(){
			if($(this).val().length > 0){
				$('#div-lastname').removeClass('has-error').addClass('has-success');
				$('#lbl-lastname').html('<i class="fa fa-check"></i> Ok');
				$('#lbl-lastname').fadeIn();
				lValid = 1;
			}else{
				$('#div-lastname').removeClass('has-success').addClass('has-error');
				$('#lbl-lastname').html('<i class="fa fa-times-circle-o"></i> please insert last name');
				$('#lbl-lastname').fadeIn();
				lValid = 0;
			}
		});
		
		$('#in-password').on('input', function(){
			if($(this).val().length > 6){
				$('#div-password').removeClass('has-error').addClass('has-success');
				$('#lbl-password').html('<i class="fa fa-check"></i> Ok');
				$('#lbl-password').fadeIn();
				pValid = 1;
			}else{
				$('#div-password').removeClass('has-success').addClass('has-error');
				$('#lbl-password').html('<i class="fa fa-times-circle-o"></i> Password must more than 6 characters');
				$('#lbl-password').fadeIn();
				pValid = 0;
			}
		});
		
		$('#in-title').on('change', function(){
			if($(this).val() != ''){
				$('#div-title').removeClass('has-error').addClass('has-success');
				$('#lbl-title').html('<i class="fa fa-check"></i> Ok');
				$('#lbl-title').fadeIn();
				tValid = 1;
			}else{
				$('#div-title').removeClass('has-success').addClass('has-error');
				$('#lbl-title').html('<i class="fa fa-times-circle-o"></i> Please select title');
				$('#lbl-title').fadeIn();
				tValid = 0;
			}
		});
		
		$('#pilih-role').on('change', function(){
			if($(this).val() != ''){
				$('#div-role').removeClass('has-error').addClass('has-success');
				$('#lbl-role').html('<i class="fa fa-check"></i> Ok');
				$('#lbl-role').fadeIn();
				rValid = 1;
			}else{
				$('#div-role').removeClass('has-success').addClass('has-error');
				$('#lbl-role').html('<i class="fa fa-times-circle-o"></i> Please select user role');
				$('#lbl-role').fadeIn();
				rValid = 0;
			}
		});
	});
</script>
<script>
	$(function() {
		$('#data-emp').DataTable({
			'paging' : true,
			'lengthChange' : false,
			'searching' : false,
			'ordering' : true,
			'info' : true,
			'autoWidth' : false
		})
	})
</script>
</html>