<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<section class="content">
	<form id="form-emp" style="display:none;">
	<script>
		var role = "${userLogin.role.name}";
		var superr = "${superr}";
		if(superr == 1 || role == 'ROLE_ADMIN'){
			$('#form-emp').show();
		}
	</script>
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
					<div class="form-group" id="div-f">
						<label class="control-label" for="in-fisrtname" style="display:none" id="lbl-f"><i class="fa fa-check"></i></label>
						<input type="text" class="form-control" id="in-f" placeholder="First Name" data-parsley-required="true" data-parsley-required-message="PLease insert your first name" required></div>
					</div>
				<div class="col-xs-3">
					<div class="form-group" id="div-l">
						<label class="control-label" for="in-l" style="display:none" id="lbl-l"><i class="fa fa-check"></i></label>
						<input type="text" class="form-control" id="in-l" placeholder="Last Name" data-parsley-required="true" data-parsley-required-message="Please insert last name" required>
					</div>
				</div>
				<div class="col-xs-3">
					<div class="form-group" id="div-e">
						<label class="control-label" for="in-e" style="display:none" id="lbl-e"><i class="fa fa-check"></i></label>
						<input type="email" class="form-control" id="in-e" placeholder="Email" data-parsley-required="true" data-parsley-type="email" data-parsley-required-message="Please insert your email" required>
					</div>
				</div>
				<div class="col-xs-3">
					<div class="form-group" id="div-t">
						<label class="control-label" for="in-t" style="display:none" id="lbl-t"><i class="fa fa-check"></i></label>
						<select id="in-t" class="form-control" style="font-size: 16px; font-family: raleway;" data-parsley-required="true" required >
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
					<div class="form-group" id="div-o">
						<label class="control-label" for="btn-outlet" style="display:none" id="lbl-o"><i class="fa fa-check"></i></label>
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
					<div class="form-group" id="div-r">
						<label class="control-label" for="in-r" style="display:none" id="lbl-r"><i class="fa fa-check"></i></label>
						<select id = "in-r" class="form-control">
							<option disabled selected>Choose Role</option>
							<c:forEach items = "${roles }" var= "role">
								<option value="${role.id }">${role.description }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-xs-3">
					<input type="hidden" id="in-id-user">
					<div class="form-group" id="div-u">
						<label class="control-label" for="in-u" style="display:none" id="lbl-u"><i class="fa fa-check"></i></label>
						<input type="text" placeholder="username" id="in-u" class="form-control" data-parsley-required="false">
					</div>
				</div>
				<div class="col-xs-3">
					<div class="form-group" id="div-p">
						<label class="control-label" for="in-p" style="display:none" id="lbl-p"><i class="fa fa-check"></i></label>
						<input type="password" placeholder="password" id="in-p" class="form-control" data-parsley-required="false">
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
	<div class="box content">
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
			<th class="kolom-action" style="display:none">#</th>
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
					<td class="kolom-action" style="display:none"><a href="#" key-id="${emp.id }" class="tblupdate btn btn-info">Edit</a> | 
						<a href="#" key-id="${emp.id }" class="nonaktifkan btn btn-danger">&times;</a></td>
				</tr>
				<script>
					var role = "${userLogin.role.name}";
					var superr = "${superr}";
					if(superr == 1 || role == 'ROLE_ADMIN'){
						$('.kolom-action').show();
					}
				</script>
			</c:forEach>
		</tbody>
	</table>
	</div>
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
							<input type="checkbox" id="outlet-${outlet.id }" class="in-o" class="form-check-input" name="in-o" value="${outlet.id }">
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
					<h4 class="modal-t">Non-aktifkan Employee ?</h4>
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
	        	$('#in-u').attr('data-parsley-required', true);
	        	$('#in-u').prop('required', true);
	        	$('#in-p').attr('data-parsley-required', true);
	        	$('#in-p').prop('required', true);
	        	$('#in-r').attr('data-parsley-required', true);
        		$('#in-r').prop('required', true);
	        }else{ 
	            $('#buat-akun').fadeOut('fast');
	        	$('#in-u').attr('data-parsley-required', false);
	        	$('#in-u').prop('required', false);
        		$('#in-p').attr('data-parsley-required', false);
        		$('#in-p').prop('required', false);
        		$('#in-r').attr('data-parsley-required', false);
        		$('#in-r').prop('required', false);
        		uv = 1;
        		pv = 1;
        		ov = 1;
        		rv = 1;
	        }
	    });
	    $('#cek-akun').change();
	    
	    $('.in-o').change(function(){
	    	var outcb = $('input[name="in-o"]:checked').length;
	    	if(outcb > 0){
	    		$('#div-o').removeClass('has-error').addClass('has-success');
				$('#lbl-o').html('<i class="fa fa-check"></i> Ok');
				$('#lbl-o').fadeIn();
				ov = 1;
	    	}else if(outcb == 0 && $('#cek-akun').is(":checked")){
	    		$('#div-o').removeClass('has-success').addClass('has-error');
				$('#lbl-o').html('<i class="fa-times-circle-o"></i> Please choose outlet');
				$('#lbl-o').fadeIn();
				ov = 0;
	    	}
	    });
	    $('.in-o').change();
	    
	    $('#btn-batal').click(function(){
	    	$('#buat-akun').fadeOut('fast');
	    	ee = '';
			ue = '';
			ev = 0;
			uv = 0;
			pv = 0;
			fv = 0;
			lv = 0;
			ov = 1;
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
					uv = 1;
					ev = 1;
					pv = 1;
					fv = 1;
					lv = 1;
					ov = 1;
					tv = 1;
					rv = 1;
					$('#in-id').val(data.id);
					$('#in-f').val(data.firstName);
					$('#in-l').val(data.lastName);
					$('#in-t').val(data.title);
					$('#in-e').val(data.email);
					ee = data.email;
					if(data.haveAccount == 1){
						$('#in-id-user').val(data.user.id);
						$('#in-u').val(data.user.username);
						ue = data.user.username;
						$('#in-p').val(data.user.password);
						$('#in-r').val(data.user.role.id);
						if(data.user.active == 1){
							$('#cek-akun').prop('checked', true);
							$('#buat-akun').fadeIn('fast');
						}else{
							$('#cek-akun').prop('checked', false);
							$('#buat-akun').fadeOut('fast');
						}
					}else if(data.haveAccount == 0){
						$('#cek-akun').prop('checked', false);
						$('#buat-akun').fadeOut('fast');
					};
					if(data.empOutlet!=null){
						$.each(data.empOutlet, function(i, item){
							$('input[name="in-o"][value="'+data.empOutlet[i].outlet.id+'"]').prop('checked', true);
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
			$('.in-o:checked').each(function(){
				var eo = {
					outlet : {
						id : $(this).val()
					}
				};
				empOut.push(eo);
			});
			
			var usr;
			var outcb = $('input[name="in-o"]:checked').length;
			if ($('#cek-akun').is(":checked"))
			{
				var akun = 1;
				usr = {
					"id" : $('#in-id-user').val(),
					"username" : $('#in-u').val(),
					"password" : $('#in-p').val(),
					"active" : 1,
					"role" : {
						"id" : $('#in-r').val()
					}
				}
				if(outcb > 0){
					ov = 1;
				}else{
					ov = 0;
				}
				if($('#in-r').val() == null){
					rv = 0;
				}else{
					rv = 1;
				}
			}else{
				uv = 1;
				pv = 1;
				ov = 1;
				rVAlid = 1;
			};
			
			var employee = {
				"id" : $('#in-id').val(),
				"firstName" : $('#in-f').val(),
				"lastName" : $('#in-l').val(),
				"title" : $('#in-t').val(),
				"active" : 1,
				"email" : $('#in-e').val(),
				"user" : usr,
				"haveAccount" : akun,
				"empOutlet" : empOut
			};
	
			console.log(ev);
			console.log(uv);
			console.log(fv);
			console.log(lv);
			console.log(pv);
			console.log(ov);
			console.log(tv);
			console.log(rv);
			if(ev == 1 && uv == 1 && fv == 1 && lv == 1 && pv == 1 && ov == 1 && tv == 1 && rv == 1){
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
			}else{
				$('#tampilan-alert').removeClass('alert-sukses').addClass('alert-gagal');
				$('#tampilan-alert').html('<strong>Error!</strong> Gagal Menyimpan ke Database.');
				$('#div-alert').fadeIn();
				setTimeout(function(){
					$('#div-alert').fadeOut();
				}, 4000);
			}
			if(ev == 0){
				if($('#in-e').val().length < 7){
					$('#div-e').removeClass('has-success').addClass('has-error');
					$('#lbl-e').html('<i class="fa fa-times-circle-o"></i> Please insert your email');
					$('#lbl-e').fadeIn();
				}else{
					$('#div-e').removeClass('has-success').addClass('has-error');
					$('#lbl-e').html('<i class="fa fa-times-circle-o"></i> email must be unique');
					$('#lbl-e').fadeIn();
				}
			}
			if(ev == 2){
				$('#div-e').removeClass('has-success').addClass('has-error');
				$('#lbl-e').html('<i class="fa fa-times-circle-o"></i> please insert valid email');
				$('#lbl-e').fadeIn();
				ev = 2;
			}
			if(uv == 0){
				if($('#in-u').val().length == 0){
					$('#div-u').removeClass('has-success').addClass('has-error');
					$('#lbl-u').html('<i class="fa fa-times-circle-o"></i> Please insert username');
					$('#lbl-u').fadeIn();
				}else{
					$('#div-u').removeClass('has-success').addClass('has-error');
					$('#lbl-u').html('<i class="fa fa-times-circle-o"></i> username must be unique');
					$('#lbl-u').fadeIn();
				}
			}
			if(pv == 0){
				$('#div-p').removeClass('has-success').addClass('has-error');
				$('#lbl-p').html('<i class="fa fa-times-circle-o"></i> Password must more than 6 characters');
				$('#lbl-p').fadeIn();
			}
			if(fv == 0){
				$('#div-f').removeClass('has-success').addClass('has-error');
				$('#lbl-f').html('<i class="fa fa-times-circle-o"></i> please insert first name');
				$('#lbl-f').fadeIn();
			}
			if(lv == 0){
				$('#div-l').removeClass('has-success').addClass('has-error');
				$('#lbl-l').html('<i class="fa fa-times-circle-o"></i> please insert last name');
				$('#lbl-l').fadeIn();
			}
			if(tv == 0){
				$('#div-t').removeClass('has-success').addClass('has-error');
				$('#lbl-t').html('<i class="fa fa-times-circle-o"></i> Please select title');
				$('#lbl-t').fadeIn();
			}
			if(rv == 0){
				$('#div-r').removeClass('has-success').addClass('has-error');
				$('#lbl-r').html('<i class="fa fa-times-circle-o"></i> Please select user role');
				$('#lbl-r').fadeIn();
			}
			if(ov == 0){
				$('#div-o').removeClass('has-success').addClass('has-error');
				$('#lbl-o').html('<i class="fa fa-times-circle-o"></i> Please choose outlet');
				$('#lbl-o').fadeIn();
			}
		}); // end fungsi simpan

		var ee = '';
		var ue = '';
		var ev = 0;
		var uv = 0;
		var pv = 0;
		var fv = 0;
		var lv = 0;
		var ov = 1;
		var tv = 0;
		var rv = 1;
		var tv = 0;
		
		// cek username
		$('#in-u').on('input',function(){
			var username = $('#in-u').val();
			if(username.length > 0){
				$.ajax({
					type : 'get',
					url : '${pageContext.request.contextPath}/master/employee/cek-user?user='+username,
					success : function(data){
						if((data > 0 && $('#cek-akun').is(":checked") && username != ue) || username == 'superadmin'){
							$('#div-u').removeClass('has-success').addClass('has-error');
							$('#lbl-u').html('<i class="fa fa-times-circle-o"></i> username must be unique');
							$('#lbl-u').fadeIn();
							uv = 0;
						}else {
							$('#div-u').removeClass('has-error').addClass('has-success');
							$('#lbl-u').html('<i class="fa fa-check"></i> Ok');
							$('#lbl-u').fadeIn();
							uv = 1;
						}
					}, error : function(){
						console.log('gagal')
					}
				});
			}else{
				$('#div-u').removeClass('has-success').addClass('has-error');
				$('#lbl-u').html('<i class="fa fa-times-circle-o"></i> please insert username');
				$('#lbl-u').fadeIn();
				uv = 0;
			}
			
		});
		
		$('#in-e').on('input',function(){
			var email = $('#in-e').val();
			var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			var valid =  regex.test(email);
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/master/employee/cek-email?email='+email,
				success : function(data){
					if(valid && email.length > 6){
						if(data > 0 && email != ee){
							$('#div-e').removeClass('has-success').addClass('has-error');
							$('#lbl-e').html('<i class="fa fa-times-circle-o"></i> email must be unique');
							$('#lbl-e').fadeIn();
							ev = 0;
						}else{
							$('#div-e').removeClass('has-error').addClass('has-success');
							$('#lbl-e').html('<i class="fa fa-check"></i> Ok');
							$('#lbl-e').fadeIn();
							ev = 1;
						}
					}else{
						$('#div-e').removeClass('has-success').addClass('has-error');
						$('#lbl-e').html('<i class="fa fa-times-circle-o"></i> please insert valid email');
						$('#lbl-e').fadeIn();
						ev = 2;
					}
				}, error : function(){
					console.log('gagal')
				}
			});
		});
		
		$('#in-f').on('input', function(){
			if($(this).val().length > 0){
				$('#div-f').removeClass('has-error').addClass('has-success');
				$('#lbl-f').html('<i class="fa fa-check"></i> Ok');
				$('#lbl-f').fadeIn();
				fv = 1;
			}else{
				$('#div-f').removeClass('has-success').addClass('has-error');
				$('#lbl-f').html('<i class="fa fa-times-circle-o"></i> please insert first name');
				$('#lbl-f').fadeIn();
				fv = 0;
			}
		});
		
		$('#in-l').on('input', function(){
			if($(this).val().length > 0){
				$('#div-l').removeClass('has-error').addClass('has-success');
				$('#lbl-l').html('<i class="fa fa-check"></i> Ok');
				$('#lbl-l').fadeIn();
				lv = 1;
			}else{
				$('#div-l').removeClass('has-success').addClass('has-error');
				$('#lbl-l').html('<i class="fa fa-times-circle-o"></i> please insert last name');
				$('#lbl-l').fadeIn();
				lv = 0;
			}
		});
		
		$('#in-p').on('input', function(){
			if($(this).val().length > 6){
				$('#div-p').removeClass('has-error').addClass('has-success');
				$('#lbl-p').html('<i class="fa fa-check"></i> Ok');
				$('#lbl-p').fadeIn();
				pv = 1;
			}else{
				$('#div-p').removeClass('has-success').addClass('has-error');
				$('#lbl-p').html('<i class="fa fa-times-circle-o"></i> Password must more than 6 characters');
				$('#lbl-p').fadeIn();
				pv = 0;
			}
		});
		
		$('#in-t').on('change', function(){
			if($(this).val() != ''){
				$('#div-t').removeClass('has-error').addClass('has-success');
				$('#lbl-t').html('<i class="fa fa-check"></i> Ok');
				$('#lbl-t').fadeIn();
				tv = 1;
			}else{
				$('#div-t').removeClass('has-success').addClass('has-error');
				$('#lbl-t').html('<i class="fa fa-times-circle-o"></i> Please select title');
				$('#lbl-t').fadeIn();
				tv = 0;
			}
		});
		
		$('#in-r').on('change', function(){
			if($(this).val() != ''){
				$('#div-r').removeClass('has-error').addClass('has-success');
				$('#lbl-r').html('<i class="fa fa-check"></i> Ok');
				$('#lbl-r').fadeIn();
				rv = 1;
			}else{
				$('#div-r').removeClass('has-success').addClass('has-error');
				$('#lbl-r').html('<i class="fa fa-times-circle-o"></i> Please select user role');
				$('#lbl-r').fadeIn();
				rv = 0;
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