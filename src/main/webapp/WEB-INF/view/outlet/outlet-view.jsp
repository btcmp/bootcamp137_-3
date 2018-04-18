<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<div><h1>OUTLET</h1></div>
<hr style="border-color:black; border-top:1px dashed;">

<div id="container">

	<div class="row">
		<div class="col-xs-3" style="margin-right:300px; margin-left:50px;">
			<div class="form-group">
				<input type="text" id="outlet-search" class="form-control" placeholder="Search Outlet..">
			</div>
		</div>
		<div style="float:right; margin-right:60px;">
			<div class="form-group">
				<a href="" id="tbl-create" class="btn btn-info" >Create</a>
			</div>
		</div>
	</div>
	
	<table id="outlet-table" class="table table-striped table-bordered">
		<thead>
		<tr>
			<th>Name</th>
			<th>Address</th>
			<th>Phone</th>
			<th>Email</th>
			<th>#</th>
		</tr>
		</thead>
		<tbody id="list-outlet">
		<c:forEach items="${outlets }" var="out">
			<tr>
				<td>${out.name }</td>
				<td>${out.address }</td>
				<td>${out.phone }</td>
				<td>${out.email }</td>
				<td>
					<script type="text/javascript">
						console.log(${out.id});
					</script>
					<a href="" id="${out.id }" class="btn-edit btn btn-success">Edit</a>
				</td>
			<tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<%@ include file="/WEB-INF/view/outlet/modal/create.jsp"%>
<%@ include file="/WEB-INF/view/outlet/modal/edit.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		//$('#outlet-table').DataTable();
		
//=====================================================Reset Button===================================================		
		
		//Reset pas create
		$('#tbl-reset').click(function(e){
			e.preventDefault();
			
			provValid = 0;
			regValid = 0;
			distValid = 0;
			nameValid = 0;
			emailValid = 3;
			postalValid = 3;
			phoneValid = 1;
			
			$('#outlet-name').val("");
			$('#outlet-address').val("");
			$('#outlet-phone').val("");
			$('#outlet-email').val("");
			$('#outlet-postal').val("");
			$('#prov-id option').prop('selected', function() {
		        return this.defaultSelected;
		    });
			$('#reg-id').empty();
			$('#dist-id').empty();
			$('#reg-id').append('<option disabled selected value=\"\">Select A Region</option>');
			$('#dist-id').append('<option disabled selected value=\"\">Select A District</option>');
			$('#create-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#create-alert').hide();
			$('#validasi-name').removeClass('has-success').removeClass('has-error');
			$('#label-name').hide();
			$('#validasi-addr').removeClass('has-success').removeClass('has-error');
			$('#label-address').hide();
			$('#validasi-phone').removeClass('has-success').removeClass('has-error');
			$('#label-phone').hide();
			$('#validasi-email').removeClass('has-success').removeClass('has-error');
			$('#label-email').hide();
			$('#validasi-postal').removeClass('has-success').removeClass('has-error');
			$('#label-postal').hide();
			$('#validasi-prov').removeClass('has-success').removeClass('has-error');
			$('#label-prov').hide();
			$('#validasi-reg').removeClass('has-success').removeClass('has-error');
			$('#label-reg').hide();
			$('#validasi-dist').removeClass('has-success').removeClass('has-error');
			$('#label-dist').hide();
		});
		
		//Reset pas edit
		$('#tbl-cancel').click(function(){
			
			provValid = 0;
			regValid = 0;
			distValid = 0;
			nameValid = 0;
			emailValid = 3;
			postalValid = 3;
			phoneValid = 1;
			
			$('#edit-name').val("");
			$('#edit-address').val("");
			$('#edit-phone').val("");
			$('#edit-email').val("");
			$('#edit-postal').val("");
			$('#prov-edit option').prop('selected', function() {
		        return this.defaultSelected;
		    });
			$('#reg-edit').empty();
			$('#dist-edit').empty();
			$('#reg-edit').append('<option disabled selected value=\"\">Select A Region</option>');
			$('#dist-edit').append('<option disabled selected value=\"\">Select A District</option>');
			$('#edit-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#edit-alert').hide();
			$('#edit-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#edit-alert').hide();
			$('#validasi-edit-name').removeClass('has-success').removeClass('has-error');
			$('#label-edit-name').hide();
			$('#validasi-edit-addr').removeClass('has-success').removeClass('has-error');
			$('#label-edit-address').hide();
			$('#validasi-edit-phone').removeClass('has-success').removeClass('has-error');
			$('#label-edit-phone').hide();
			$('#validasi-edit-email').removeClass('has-success').removeClass('has-error');
			$('#label-edit-email').hide();
			$('#validasi-edit-postal').removeClass('has-success').removeClass('has-error');
			$('#label-edit-postal').hide();
			$('#validasi-edit-prov').removeClass('has-success').removeClass('has-error');
			$('#label-edit-prov').hide();
			$('#validasi-edit-reg').removeClass('has-success').removeClass('has-error');
			$('#label-edit-reg').hide();
			$('#validasi-edit-dist').removeClass('has-success').removeClass('has-error');
			$('#label-edit-dist').hide();
		});

		
//=======================================================Delete Button======================================
		$('#tbl-delete').click(function(){
			var id = $('#edit-id').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/master/outlet/delete?id='+id,
				type : 'DELETE',
				success : function(id){
					console.log(id);
					alert('Delete success..');
					window.location = '${pageContext.request.contextPath}/master/outlet';
				},
				error : function(id){
					console.log(id);
					alert('Failed to delete..')
				}
			});
		});

//======================================================Create Functions=============================================
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
			if(provValid == 1 && regValid == 1 && distValid == 1 && phoneValid == 1
					&& nameValid == 3 && emailValid == 3 && postalValid == 3){
				$.ajax({
					url : '${pageContext.request.contextPath}/master/outlet/save',
					type : 'POST',
					data : JSON.stringify(outlet),
					contentType : 'application/json',
					success : function(){
						console.log(outlet);
						$('#create-alert').removeClass('alert-gagal').addClass('alert-sukses');
						$('#create-alert').html('<strong>Save Success!</strong>');
						$('#create-alert').fadeIn();
						setTimeout(function(){
							window.location = '${pageContext.request.contextPath}/master/outlet';
						}, 2500);
						provValid = 0;
						regValid = 0;
						distValid = 0;
						nameValid = 0;
						emailValid = 3;
						postalValid = 3;
						phoneValid = 1;
					},
					error : function(){
						console.log(outlet);
						$('#create-alert').removeClass('alert-sukses').addClass('alert-gagal');
						$('#create-alert').html('<strong>Internal Error!</strong>');
						$('#create-alert').fadeIn();
					}
				});
			}
			else{
				$('#create-alert').removeClass('alert-sukses').addClass('alert-gagal');
				$('#create-alert').html('<strong>Error!</strong> Failed to save. Please check again.');
				$('#create-alert').fadeIn();
				if(nameValid != 3){
					$('#validasi-name').removeClass('has-success').addClass('has-error');
					$('#label-name').html('<i class="fa fa-times-circle-o"></i> Required');
					$('#label-name').fadeIn();
				}
				if(provValid != 1){
					$('#validasi-prov').removeClass('has-success').addClass('has-error');
					$('#label-prov').html('<i class="fa fa-times-circle-o"></i> Required');
					$('#label-prov').fadeIn();
				}
				if(regValid != 1){
					$('#validasi-reg').removeClass('has-success').addClass('has-error');
					$('#label-reg').html('<i class="fa fa-times-circle-o"></i> Required');
					$('#label-reg').fadeIn();
				}
				if(distValid != 1){
					$('#validasi-dist').removeClass('has-success').addClass('has-error');
					$('#label-dist').html('<i class="fa fa-times-circle-o"></i> Required');
					$('#label-dist').fadeIn();
				}
			}
		});
		
		var provValid = 0;
		var regValid = 0;
		var distValid = 0;
		
		//Get Region By Province
		$('#prov-id').change(function(){
			$('#reg-id').empty();
			$('#dist-id').empty();
			$('#reg-id').append('<option disabled selected value=\"\">Select A Region</option>');
			$('#dist-id').append('<option disabled selected value=\"\">Select A District</option>');
			$('#validasi-reg').removeClass('has-success').removeClass('has-error');
			$('#label-reg').hide();
			$('#validasi-dist').removeClass('has-success').removeClass('has-error');
			$('#label-dist').hide();
			oke('#validasi-prov', '#label-prov');
			$('#create-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#create-alert').hide();
			var id = $(this).val();
			$.ajax({
				url : '${pageContext.request.contextPath}/master/outlet/get-region/'+id,
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
			provValid = 1;
			regValid = 0;
			distValid = 0;
		});
		
		//Get District By Region
		$('#reg-id').change(function(){
			$('#dist-id').empty();
			$('#dist-id').append('<option disabled selected value=\"\">Select A District</option>');
			$('#validasi-dist').removeClass('has-success').removeClass('has-error');
			$('#label-dist').hide();
			$('#create-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#create-alert').hide();
			var id = $(this).val();
			oke('#validasi-reg', '#label-reg');
			$.ajax({
				url : '${pageContext.request.contextPath}/master/outlet/get-district/'+id,
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
			regValid = 1;
			distValid = 0;
		});
		
		$('#dist-id').change(function(){
			oke('#validasi-dist', '#label-dist');
			$('#create-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#create-alert').hide();
			distValid = 1;
		});
		
		
//========================================================Edit Functions========================================================
		
		//Take data to edit
		//Select-nya tadi diganti untuk tujuan edit table ketika di-search
		$('#outlet-table').on('click', '.btn-edit', function(e){
			e.preventDefault();
			var id = $(this).attr('id');
			$.ajax({
				url : '${pageContext.request.contextPath}/master/outlet/take?id=' + id,
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
						url : '${pageContext.request.contextPath}/master/outlet/get-region/'+id,
						type : 'GET',
						success : function(regions){
							console.log(regions);
							$('#reg-edit').empty();
							$('#reg-edit').append('<option disabled selected value=\"\"> --- Select A Region --- </option>');
							$(regions).each(function(index, data){
								$('#reg-edit').append('<option value=\"'+data.id+'\">'+data.name+'</option>');
							});
							$('#reg-edit').val(outlet.region.id);
							var idReg = outlet.region.id;
							$.ajax({
								url : '${pageContext.request.contextPath}/master/outlet/get-district/'+idReg,
								type : 'GET',
								success : function(districts){
									console.log(districts);
									$('#dist-edit').empty();
									$('#dist-edit').append('<option disabled selected value=\"\"> --- Select A District --- </option>');
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
					var outPhone = outlet.phone;
					var outMail = outlet.email;
					var outPostal = $('#edit-postal').val();
					var regexx = /^([0-9])+$/;
					var validx =  regexx.test(outPhone);
					var regexy = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9])+$/;
					var validy =  regexy.test(outMail);
					if(validx){
						$('#validasi-edit-phone').addClass('has-success').removeClass('has-error');
						$('#label-edit-phone').html('<i class="fa fa-check-circle-o"></i> Ok');
						$('#label-edit-phone').fadeIn();
						phoneValid = 1;
						
					}
					else{
						$('#validasi-edit-phone').addClass('has-error').removeClass('has-success');
						$('#label-edit-phone').html('<i class="fa fa-times-circle-o"></i> Must number');
						$('#label-edit-phone').fadeIn();
						phoneValid = 0;
						
					}
					if(validy){
						$('#validasi-edit-email').addClass('has-success').removeClass('has-error');
						$('#label-edit-email').html('<i class="fa fa-check-circle-o"></i> Ok');
						$('#label-edit-email').fadeIn();
						emailValid = 3;
					}
					else{
						$('#validasi-edit-email').addClass('has-error').removeClass('has-success');
						$('#label-edit-email').html('<i class="fa fa-times-circle-o"></i> The format must be valid');
						$('#label-edit-email').fadeIn();
						emailValid = 2;
					}
					if(outPostal.length > 0 && outPostal.length < 7){
						$('#validasi-edit-postal').addClass('has-success').removeClass('has-error');
						$('#label-edit-postal').html('<i class="fa fa-check-circle-o"></i> Ok');
						$('#label-edit-postal').fadeIn();
						postalValid = 3;
					}
					else{
						$('#validasi-edit-postal').addClass('has-error').removeClass('has-success');
						$('#label-edit-postal').html('<i class="fa fa-times-circle-o"></i> The format must be valid');
						$('#label-edit-postal').fadeIn();
						postalValid = 2;
					}
				},
				error : function(){
					
				}
			});
			$('#validasi-edit-name').addClass('has-success').removeClass('has-error');
			$('#label-edit-name').html('<i class="fa fa-check-circle-o"></i> Ok');
			$('#label-edit-name').fadeIn();
			$('#validasi-edit-addr').addClass('has-success').removeClass('has-error');
			$('#label-edit-address').html('<i class="fa fa-check-circle-o"></i> Ok');
			$('#label-edit-address').fadeIn();
			$('#validasi-edit-prov').addClass('has-success').removeClass('has-error');
			$('#label-edit-prov').html('<i class="fa fa-check-circle-o"></i> Ok');
			$('#label-edit-prov').fadeIn();
			$('#validasi-edit-reg').addClass('has-success').removeClass('has-error');
			$('#label-edit-reg').html('<i class="fa fa-check-circle-o"></i> Ok');
			$('#label-edit-reg').fadeIn();
			$('#validasi-edit-dist').addClass('has-success').removeClass('has-error');
			$('#label-edit-dist').html('<i class="fa fa-check-circle-o"></i> Ok');
			$('#label-edit-dist').fadeIn();
			
			provValid = 1;
			regValid = 1;
			distValid = 1;
			nameValid = 3;
			
			$('#modal-edit').modal();
			
		});
		
		$('#prov-edit').change(function(){
			$('#reg-edit').empty();
			$('#dist-edit').empty();
			$('#reg-edit').append('<option disabled selected value=\"\">Select A Region</option>');
			$('#dist-edit').append('<option disabled selected value=\"\">Select A District</option>');
			oke('#validasi-edit-prov', '#label-edit-prov');
			$('#validasi-edit-reg').removeClass('has-success').removeClass('has-error');
			$('#label-edit-reg').hide();
			$('#validasi-edit-dist').removeClass('has-success').removeClass('has-error');
			$('#label-edit-dist').hide();
			$('#edit-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#edit-alert').hide();
			var id = $(this).val();
			$.ajax({
				url : '${pageContext.request.contextPath}/master/outlet/get-region/'+id,
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
			provValid = 1;
			regValid = 0;
			distValid = 0;
		});
		
		$('#reg-edit').change(function(){
			$('#dist-edit').empty();
			$('#dist-edit').append('<option disabled selected value=\"\">Select A District</option>');
			$('#validasi-edit-dist').removeClass('has-success').removeClass('has-error');
			$('#label-edit-dist').hide();
			$('#edit-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#edit-alert').hide();
			oke('#validasi-edit-reg', '#label-edit-reg');
			var id = $(this).val();
			$.ajax({
				url : '${pageContext.request.contextPath}/master/outlet/get-district/'+id,
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
			regValid = 1;
			distValid = 0;
		});
		
		$('#dist-edit').change(function(){
			oke('#validasi-edit-dist', '#label-edit-dist');
			$('#edit-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#edit-alert').hide();
			distValid = 1;
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
				postalCode : $('#edit-postal').val(),
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
			
			if(provValid == 1 && regValid == 1 && distValid == 1 && phoneValid == 1
					&& nameValid == 3 && emailValid == 3 && postalValid == 3){
				$.ajax({
					url : '${pageContext.request.contextPath}/master/outlet/update',
					type : 'PUT',
					data : JSON.stringify(outlet),
					contentType : 'application/json',
					success : function(){
						console.log(outlet);
						$('#edit-alert').removeClass('alert-gagal').addClass('alert-sukses');
						$('#edit-alert').html('<strong>Save Success!</strong>');
						$('#edit-alert').fadeIn();
						setTimeout(function(){
							window.location = '${pageContext.request.contextPath}/master/outlet';
						}, 2500);
						provValid = 0;
						regValid = 0;
						distValid = 0;
						nameValid = 0;
						emailValid = 3;
						postalValid = 3;
						phoneValid = 1;
					},
					error : function(){
						console.log(outlet);
						$('#edit-alert').removeClass('alert-sukses').addClass('alert-gagal');
						$('#edit-alert').html('<strong>Internal Error!</strong>');
						$('#edit-alert').fadeIn();
					}
				});
			}
			else{
				$('#edit-alert').removeClass('alert-sukses').addClass('alert-gagal');
				$('#edit-alert').html('<strong>Error!</strong> Failed to save. Please check again.');
				$('#edit-alert').fadeIn();
				if(nameValid != 3){
					$('#validasi-edit-name').removeClass('has-success').addClass('has-error');
					$('#label-edit-name').html('<i class="fa fa-times-circle-o"></i> Required');
					$('#label-edit-name').fadeIn();
				}
				if(provValid != 1){
					$('#validasi-edit-prov').removeClass('has-success').addClass('has-error');
					$('#label-edit-prov').html('<i class="fa fa-times-circle-o"></i> Required');
					$('#label-edit-prov').fadeIn();
				}
				if(regValid != 1){
					$('#validasi-edit-reg').removeClass('has-success').addClass('has-error');
					$('#label-edit-reg').html('<i class="fa fa-times-circle-o"></i> Required');
					$('#label-edit-reg').fadeIn();
				}
				if(distValid != 1){
					$('#validasi-edit-dist').removeClass('has-success').addClass('has-error');
					$('#label-edit-dist').html('<i class="fa fa-times-circle-o"></i> Required');
					$('#label-edit-dist').fadeIn();
				}
			}
			
		});

		
//===============================================SEARCH==========================================
		//Search
		$('#outlet-search').on('input', function(){
			var search = $(this).val();
			$.ajax({
				url : '${pageContext.request.contextPath}/master/outlet/search?search=' + search,
				type : 'GET',
				dataType : 'json',
				success : function(data){
					$('#list-outlet').empty();
					//console.log(data);
					$.each(data, function(key, out){
						$('#list-outlet').append('<tr>'
							+ '<td>'+out.name+'</td>'
							+ '<td>'+out.address+'</td>'
							+ '<td>'+out.phone+'</td>'
							+ '<td>'+out.email+'</td>'
							+ '<td><a href="" id="' + out.id + '" class="btn-edit btn btn-success">Edit</a></td>'
							+ '</tr>');
						console.log(out.id);
					});
					
				},
				error : function(){
					
				}
			});
		});		

//===========================================Tools for Validation==============================================
		function notEmpty(validasi, label){
			$(validasi).removeClass('has-success').addClass('has-error');
			$(label).html('<i class="fa fa-times-circle-o"></i> Cannot empty');
			$(label).fadeIn();
		}
		
		function mustUnique(validasi, label){
			$(validasi).removeClass('has-success').addClass('has-error');
			$(label).html('<i class="fa fa-times-circle-o"></i> This must be unique');
			$(label).fadeIn();
		}
		
		function oke(validasi, label){
			$(validasi).removeClass('has-error').addClass('has-success');
			$(label).html('<i class="fa fa-check-circle-o"></i> Ok');
			$(label).fadeIn();
		}
		
		function notValid(validasi, label){
			$(validasi).removeClass('has-success').addClass('has-error');
			$(label).html('<i class="fa fa-times-circle-o"></i> The format must be valid');
			$(label).fadeIn();
		}
		
		function mustNumber(validasi, label){
			$(validasi).removeClass('has-success').addClass('has-error');
			$(label).html('<i class="fa fa-times-circle-o"></i> Must number');
			$(label).fadeIn();
		}
		
		var nameValid = 0;
		var emailValid = 3;
		var postalValid = 3;
		var phoneValid = 1;
		
// =======================================Input Validation in Create Modal=========================================================
		$('#outlet-name').on('input', function(e){
			e.preventDefault();
			$('#create-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#create-alert').hide();
			var name = $(this).val();
			if (name.length > 0){
				$.ajax({
					url : '${pageContext.request.contextPath}/master/outlet/checking?name='+name,
					type : 'GET',
					success : function(data){
						if(data > 0) {
							mustUnique('#validasi-name', '#label-name');
							nameValid = 1;
						}
						else{
							oke('#validasi-name', '#label-name');
							nameValid = 3;
						}
					},
					error : function(){
						
					}
				});
			}
			else{
				notEmpty('#validasi-name', '#label-name');
				nameValid = 0;
			}
		});
		
		$('#outlet-email').on('input', function(){
			$('#create-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#create-alert').hide();
			var email = $(this).val();
			var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9])+$/;
			var valid =  regex.test(email);
			if(email.length > 0){
				$.ajax({
					type : 'get',
					url : '${pageContext.request.contextPath}/master/outlet/check?email='+email,
					success : function(data){
						if(valid){
							if(data > 0){
								mustUnique('#validasi-email', '#label-email');
								emailValid = 1;
							}
							else{
								oke('#validasi-email', '#label-email');
								emailValid = 3;
							}
						}
						else{
							notValid('#validasi-email', '#label-email');
							emailValid = 2;
						}
					},
					error : function(){
								
					}
				});
			}
			else{
				$('#validasi-email').removeClass('has-success').removeClass('has-error');
				$('#label-email').hide();
			}
		});
		
		$('#outlet-address').on('input', function(e){
			e.preventDefault();
			$('#create-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#create-alert').hide();
			var address = document.getElementById('outlet-address').value;
			if(address.length > 0){
				oke('#validasi-addr', '#label-address');
			}
			else {
				$('#validasi-addr').removeClass('has-success').removeClass('has-error');
				$('#label-address').hide();
			}
		});
		
		$('#outlet-phone').on('input', function(e){
			e.preventDefault();
			$('#create-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#create-alert').hide();
			var phone = $(this).val();
			var regex = /^([0-9])+$/;
			var valid =  regex.test(phone);
			if(phone.length > 0){
				if(valid){
					oke('#validasi-phone', '#label-phone');
					phoneValid = 1;
				}
				else{
					mustNumber('#validasi-phone', '#label-phone');
					phoneValid = 0;
				}
			}
			else {
				$('#validasi-phone').removeClass('has-success').removeClass('has-error');
				$('#label-phone').hide();
			}
		});
		
		$('#outlet-postal').on('input', function(e){
			e.preventDefault();
			$('#create-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#create-alert').hide();
			var postal = $(this).val();
			if(postal.length > 0 && postal.length < 7){
				oke('#validasi-postal', '#label-postal');
				postalValid = 3;
			}
			else if (postal.length > 6 ){
				notValid('#validasi-postal', '#label-postal');
				postalValid = 2;
			}
			else{
				$('#validasi-postal').removeClass('has-success').removeClass('has-error');
				$('#label-postal').hide();
			}
		});
		
		
// =======================================Input Validation in Edit Modal=========================================================		
		$('#edit-name').on('input', function(e){
			e.preventDefault();
			$('#edit-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#edit-alert').hide();
			var name = $(this).val();
			if (name.length > 0){
				$.ajax({
					url : '${pageContext.request.contextPath}/master/outlet/checking?name='+name,
					type : 'GET',
					success : function(data){
						if(data > 0) {
							mustUnique('#validasi-edit-name', '#label-edit-name');
							nameValid = 1;
						}
						else{
							oke('#validasi-edit-name', '#label-edit-name');
							nameValid = 3;
						}
					},
					error : function(){
						
					}
				});
			}
			else{
				notEmpty('#validasi-edit-name', '#label-edit-name');
				nameValid = 0;
			}
		});
		
		$('#edit-email').on('input', function(){
			$('#edit-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#edit-alert').hide();
			var email = $(this).val();
			var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9])+$/;
			var valid =  regex.test(email);
			if(email.length > 0){
				$.ajax({
					type : 'get',
					url : '${pageContext.request.contextPath}/master/outlet/check?email='+email,
					success : function(data){
						if(valid){
							if(data > 0){
								mustUnique('#validasi-edit-email', '#label-edit-email');
								emailValid = 1;
							}
							else{
								oke('#validasi-edit-email', '#label-edit-email');
								emailValid = 3;
							}
						}
						else{
							notValid('#validasi-edit-email', '#label-edit-email');
							emailValid = 2;
						}
					},
					error : function(){
								
					}
				});
			}
			else{
				$('#validasi-edit-email').removeClass('has-success').removeClass('has-error');
				$('#label-edit-email').hide();
			}
		});
		
		$('#edit-address').on('input', function(e){
			e.preventDefault();
			$('#edit-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#edit-alert').hide();
			var address = document.getElementById('edit-address').value;
			/* var address = $('textarea#edit-address').val(); */
			console.log(address);
			if(address.length > 0){
				oke('#validasi-edit-addr', '#label-edit-address');
			}
			else {
				$('#validasi-edit-addr').removeClass('has-success').removeClass('has-error');
				$('#label-edit-address').hide();
			}
		});
		
		$('#edit-phone').on('input', function(e){
			e.preventDefault();
			$('#edit-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#edit-alert').hide();
			var phone = $(this).val();
			var regex = /^([0-9])+$/;
			var valid =  regex.test(phone);
			if(phone.length > 0){
				if(valid){
					oke('#validasi-edit-phone', '#label-edit-phone');
					phoneValid = 1;
				}
				else{
					mustNumber('#validasi-edit-phone', '#label-edit-phone');
					phoneValid = 0;
				}
			}
			else {
				$('#validasi-edit-phone').removeClass('has-success').removeClass('has-error');
				$('#label-edit-phone').hide();
			}
		});
		
		$('#edit-postal').on('input', function(e){
			e.preventDefault();
			$('#edit-alert').removeClass('alert-sukses').removeClass('alert-gagal');
			$('#edit-alert').hide();
			var postal = $(this).val();
			if(postal.length > 0 && postal.length < 7){
				oke('#validasi-edit-postal', '#label-edit-postal');
				postalValid = 3;
			}
			else if (postal.length > 6 ){
				notValid('#validasi-edit-postal', '#label-edit-postal');
				postalValid = 2;
			}
			else{
				$('#validasi-edit-postal').removeClass('has-success').removeClass('has-error');
				$('#label-edit-postal').hide();
			}
		});
		
	});
</script>