<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<section class="content">
<div class="box">
	<h3>Purchase Order</h3>
	<hr style="border-color:black;">
	<div class="row">
		<div class="col-xs-3">
			<div class="form-group">
		       <button type="button" class="btn btn-default pull-right btn-block" id="pilih-tanggal-range">
		         <span>
		           <i class="fa fa-calendar"></i> Pilih Tanggal
		         </span>
		         <i class="fa fa-caret-down"></i>
		       </button>
		    </div>
	    </div>
	    
	    <div class="col-xs-2">
		    <div class="form-group">
		    	<select id="pil-status" class="form-control">
		    		<option value="All">All</option>
		    		<option value="Created">Created</option>
		    		<option value="Submitted">Submitted</option>
		    		<option value="Approved">Approved</option>
		    		<option value="Rejected">Rejected</option>
		    		<option value="Processed">Processed</option>
		    	</select>
		    </div>
	    </div>
	    
	    <div class="col-xs-3">
		    <div class="form-group">
		    	<input type="text" id="cari-pr" class="form-control" placeholder="Search...">
		    </div>
	    </div>
	    
	    <div class="col-xs-2">
		    <div class="form-group">
		    	
		    </div>
	    </div>
	    <div class="col-xs-2">
		    <div class="form-group">
		    	<a href="${pageContext.request.contextPath}/generate/po" id="btn-export" class="btn btn-md btn-primary float-right btn-block">Export</a>
		    </div>
	    </div>
	</div>
	<hr>
	<table id="data-po" class="table table-striped table-bordered table-hover">
		<thead class="thead-light">
			<th>Create Date</th>
			<th>Supplier</th>
			<th>PO No.</th>
			<th>Total</th>
			<th>Status</th>
			<th>#</th>
		</thead>
		<tbody id="isi-data-po">
			<c:forEach items="${pos }" var="po">
				<tr>
					<td>
						<script>
							var waktu = '${po.createdOn}';
							var wkt = waktu.split('.');
							var tanggalJam = wkt[0].split(' ');
							var tgl = tanggalJam[0].split('-');
							var tanggal = tgl[2]+'-'+tgl[1]+'-'+tgl[0];
							document.write(tanggal+' '+tanggalJam[1]);
						</script>
					</td>
					<td>${po.supplier.name }</td>
					<td>${po.poNo }</td>
					<td>
						<script>
							var gt = "${po.grandTotal }"
							document.write('Rp. ' + gt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+',-');
						</script>
					</td>
					<td>${po.status }</td>
					<td>
						<input type="button" class="btn-edit-po btn btn-default" value="Edit" key-id="${po.id }"> | 
						<a href='${pageContext.request.contextPath}/transaksi/purchase-order/detail/${po.id}' class="btn-view-pr btn btn-info" key-id="${pr.id }">View</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<div id="edit-po" class="modal fade" role="dialog">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					<div class="row" id="div-alert" style="display:none;">
						<div class="col-xs-12">
							<div class="alert alert-sukses" role="alert" id="tampilan-alert">
							  <strong>Sukses!</strong> Data Berhasil Disimpan.
							</div>
						</div>
					</div>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
						<h4 class="modal-title">Edit PO : </h4>
				</div>
				<div class="modal-body">
				<form id="form-edit-po">
					<h4>choose Supplier : </h4>
					<div class="form-group" id = "div-supplier">
						<input type="hidden" id="in-id">
						<input type="hidden" id="in-outlet">
						<label class="control-label" for="pil-supplier" style="display:none" id="lbl-supplier"><i class="fa fa-check"></i></label>
						<select id="pil-supplier" class="form-control" data-parsley-required="true">
							<option disabled selected>Choose Supplier</option>
							<c:forEach items = "${sups }" var = "sup">
								<option value = "${sup.id }">${sup.name }</option>
							</c:forEach>
						</select>
					</div>
	                <div class="form-group has-success" id = "div-notes">
	                	<h4>Notes : </h4>
	                	<label class="control-label" for="in-notes" id="lbl-notes"><i class="fa fa-check"></i>Ok</label>
	                	<textarea class="form-control" rows="5" id="in-notes" data-parsley-required="true" required></textarea>
	                </div>
	                </form>
	                <h4>Purchase Order</h4>
	                <hr style="border-color:black;">
	                <div class="row">
		                <div class="col-xs-12" id="div-item">
		                	<label class="control-label" for="data-purchase-item" style="display:none" id="lbl-item"><i class="fa fa-check"></i></label>
			                <table id="data-purchase-item" class="table table-striped table-bordered table-hover">
			                	<thead>
			                		<th>Item</th>
			                		<th>In Stock</th>
			                		<th>Qty.</th>
			                		<th>Unit Cost</th>
			                		<th>Sub Total</th>
			                	</thead>
			                	<tbody id = "list-item">
			                	</tbody>
			                	<tfoot>
									<tr style=" border: none; background: none;">
										<td colspan="4"><strong>TOTAL</strong></td>
										<td id="totalbanget"></td>
									</tr>
								</tfoot>
			                </table>
		               </div>
	               </div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-success" 
						id="submit-po">Submit</button>
					<button type="button" class="btn btn-info" data-dismiss="modal"
						id="batal-insert">Cancel</button>
					<button type="button" class="btn btn-primary" id="tblsimpan"
						key="key">Save</button>
				</div>
			</div>
		</div>
	</div>
	
	
</section>
</body>
<script>
	$(function(){
		$('#pilih-tanggal-range').daterangepicker(
		      {
		        ranges   : {
		          'Hari Ini'       : [moment(), moment()],
		          'Kemarin'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
		          '7 Hari Terakhit' : [moment().subtract(6, 'days'), moment()],
		          'Sebulan Terakhir': [moment().subtract(29, 'days'), moment()],
		          'Bulan ini'  : [moment().startOf('month'), moment().endOf('month')],
		          'Bulan lalu'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
		        },
		        startDate: moment().subtract(29, 'days'),
		        endDate  : moment()
		      },
		      function (start, end) {
		        $('#pilih-tanggal-range').html(start.format('D MMMM, YYYY') + ' - ' + end.format('D MMMM, YYYY'));
		        awal = start.format('YYYY-MM-DD');
		        akhir = end.format('YYYY-MM-DD');
		        if(awal == akhir){
		        	ur = '${pageContext.request.contextPath}/transaksi/purchase-order/search-one-date?date='+awal;
		        }else{
		        	ur = '${pageContext.request.contextPath}/transaksi/purchase-order/search-date?awal='+awal+'&akhir='+akhir;
		        }
		        search();
		      }
	    );
	    
	    $('#pilih-tanggal').datepicker({
      		autoclose: true,
      		startDate : new Date()
    	});
	    
	    //begin fungsi simpan
	    
	    var stat = '';
	    
	    $('#tblsimpan').on('click',function(evt) {
			evt.preventDefault();
			stat = 'Created';
			simpan();
		});
	    
	    $('#submit-po').on('click', function(evt){
	    	evt.preventDefault();
	    	stat = 'Submitted';
	    	simpan();
	    });
		
	    // fungsi simpan
		function simpan(){
			var pod = [];
			var errorCost = [];
			var totalCost = $('#totalbanget').text();
			var tc1 = totalCost.split(' ');
			var tc2 = tc1[1].split(',');
			var totalnya;
			for(i = 0; i < tc2.length-1; i++){
				if(i == 0){
					totalnya = tc2[0];
				}else{
					totalnya = totalnya + tc2[i];
				}
			}
			$('#list-item > tr').each(function(index,data) {
				var cost = $('#cost'+$(this).attr('key-id')+'').val();
				/* var cost1 = cost.split(' ');
				var cost2 = cost1[1].split(',');
				var costnya;
				for(i = 1; i < cost2.length-1; i++){
					costnya = costnya+cost2[i];
				} */
				var st = $(this).find('td').eq(4).text();
				var st1 = st.split(' ');
				var st2 = st1[1].split(',');
				var subtotalnya;
				for(i = 0; i < st2.length-1; i++){
					if(i == 0){
						subtotalnya = st2[0];
					}else{
						subtotalnya = subtotalnya + st2[i];
					}
				}
				if(cost == 0){
					errorCost.push('#cost'+$(this).attr('key-id'));
				}
				var detail = {
						"requestQty" : $(this).find('td').eq(2).text(),
						"variant" : {
							"id" : $(this).attr('key-id')
						},
						"subTotal" : subtotalnya,
						"unitCost" : cost
				};
				pod.push(detail);
			});
			
			var purOrd = {
				"id" : $('#in-id').val(),
				"notes" : $('#in-notes').val(),
				"outlet" : {
					"id" : $('#in-outlet').val()
				},
				"detail" : pod,
				"status" : stat,
				"supplier" : {
					"id" : $('#pil-supplier').val()
				},
				"grandTotal" : totalnya
			};
			
			var error = errorCost.length;
			if(sValid == 1 && nValid == 1 && error == 0){
				validate = $('#form-edit-po').parsley();
				validate.validate();
				if(validate.isValid()){
					$.ajax({
						type : 'put',
						url : '${pageContext.request.contextPath}/transaksi/purchase-order/update',
						data : JSON.stringify(purOrd),
						contentType : 'application/json',
						success : function() {
							$('#tampilan-alert').removeClass('alert-gagal').addClass('alert-sukses');
							$('#tampilan-alert').html('<strong>Sukses!</strong> Berhasil Menyimpan ke Database');
							$('#div-alert').fadeIn();
							setTimeout(function() {
								window.location = '${pageContext.request.contextPath}/transaksi/purchase-order';
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
				$('#tampilan-alert').html('<strong>Error!</strong> Gagal menyimpan ke database');
				$('#div-alert').fadeIn();
				setTimeout(function(){
					$('#div-alert').fadeOut();
				}, 4000);
			}
			if(error > 0){
				$('#div-item').removeClass('has-success').addClass('has-error');
				$('#lbl-item').html('<i class="fa fa-times-circle-o"></i> Please insert valid cost');
				$('#lbl-item').fadeIn();
			}
			if(nValid == 0){
				$('#div-notes').removeClass('has-success').addClass('has-error');
				$('#lbl-notes').html('<i class="fa fa-times-circle-o"></i> Please insert notes');
			}
			if(sValid == 0){
				$('#div-supplier').removeClass('has-success').addClass('has-error');
				$('#lbl-supplier').html('<i class="fa fa-times-circle-o"></i> Please choose supplier');
				$('#lbl-supplier').fadeIn();
			}
		}
		
		$('#data-po').on('click', '.btn-edit-po', function(){
			console.log('edit');
			$('#list-item').empty();
			var id = $(this).attr('key-id');
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/transaksi/purchase-order/get-one/'+id,
				dataType: 'json',
				success : function(data){
					console.log(data);
					$('#in-notes').val(data.notes);
					$('#in-id').val(data.id);
					$('#in-outlet').val(data.outlet.id);
					$('#totalbanget').text('Rp. '+data.grandTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+',-');
					if(data.supplier == null){
						
					}else{
						$('#pil-supplier').val(data.supplier.id);
						sValid = 1;
					};
					$(data.detail).each(function(key, val){
						$('#list-item').append(
							'<tr key-id="'+val.variant.id+'"><td>'+val.variant.item.name+'-'+val.variant.name+'</td>'
							+'<td id="td'+val.id+'"></td>'
							+'<td>'+val.requestQty+'</td>'
							+'<td><input type="text" id="cost'+val.variant.id+'" placeholder="20000" value="'+val.unitCost+'" class="edit-cost form-control" data-parsley-required="true" required></td>'
							+'<td id="subtotal'+val.id+'">Rp. '+val.subTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+',-'+'</td>'
						);
						$.ajax({
							type : 'GET',
							url : '${pageContext.request.contextPath}/transaksi/purchase-order/get-inventory?idPo='+id+'&idPod='+val.id,
							dataType: 'json',
							success : function(inv){
								$('#td'+val.id).append(inv[0]);
							}
						});
					})
					if(data.status=='Approved' || data.status=='Processed' || data.status=='Rejected' || data.status=='Submitted'){
						$('#submit-po').prop('disabled', true);
						$('#tblsimpan').prop('disabled', true);
						$('#pil-supplier').prop('disabled', true);
						$('#in-notes').prop('disabled', true);
						$('.edit-cost').prop('disabled', true);
					}else{
						$('#submit-po').prop('disabled', false);
						$('#tblsimpan').prop('disabled', false);
						$('#pil-supplier').prop('disabled', false);
						$('#in-notes').prop('disabled', false);
						$('.edit-cost').prop('disabled', false);
					};
					$('#edit-po').modal('show');
				}, 
				error : function(){
					console.log('gagal');
				}
			});
		});
		
		$('#list-item').on('keyup', '.edit-cost',function(){
			var cost = parseInt($(this).val());
			var tr = $(this).parent().parent();
			var subLoc = tr.find('td').eq(4);
			var reqQty = parseInt(tr.find('td').eq(2).text());
			var subTotal = cost*reqQty;
			subLoc.text('Rp. '+subTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+',-');
			var total = 0;
			$('#list-item > tr').each(function(index,data) {
				var subtot = parseInt($(this).find('td').eq(4).text());
				total = total + subTotal;
			});
			$('#totalbanget').text('Rp. '+total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+',-');
		});
		
		var cost;
		
		$("#list-item").on('keydown', '.edit-cost', function (e) {
	        // Allow: backspace, delete, tab, escape, enter and .
	        cost = $(this).val();
	        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
	             // Allow: Ctrl/cmd+A
	            (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
	             // Allow: Ctrl/cmd+C
	            (e.keyCode == 67 && (e.ctrlKey === true || e.metaKey === true)) ||
	             // Allow: Ctrl/cmd+X
	            (e.keyCode == 88 && (e.ctrlKey === true || e.metaKey === true)) ||
	             // Allow: home, end, left, right
	            (e.keyCode >= 35 && e.keyCode <= 39)) {
	                 // let it happen, don't do anything
	                 return;
	        }
	        // Ensure that it is a number and stop the keypress
	        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105 )) {
	            e.preventDefault();
	        }
	        if((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 96 && e.keyCode <= 105)){
	        	cost = cost + e.key;
	        }
	        console.log(cost);
	    });
		
		var ur='';
		
		function search(){
			$.ajax({
				type : 'GET',
				url : ur,
				success : function(data){
					$('#isi-data-po').empty();
					$(data).each(function(key, val){
						var json_data = '/Date('+val.createdOn+')/';
						var asAMoment = moment(json_data);
						var tanggal = asAMoment.format('DD-MM-YYYY HH:mm:ss');
						
						$('#isi-data-po').append('<tr><td>'+tanggal+'</td>'
							+'<td>'+val.supplier.name+'</td>'
							+'<td>'+val.poNo+'</td>'
							+'<td>Rp. '+val.grandTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+',-</td>'
							+'<td>'+val.status+'</td>'
							+'<td><input type="button" class="btn-edit-pr btn btn-default" value="Edit" key-id="'+val.id+'" pr-status="'+val.status+'"> | '
							+'<a href="${pageContext.request.contextPath}/transaksi/purchase-order/detail/'+val.id+'" class="btn-view-pr btn btn-info" key-id="'+val.id+'">View</a></td>'
							);
					})
				},
				error : function(){
					$('#isi-data-po').empty();
					console.log('gagal');
				}
			});
		}
		
		$('#pil-status').change(function(){
			var status = $(this).val();
			if(status == "All"){
				ur = '${pageContext.request.contextPath}/transaksi/purchase-order/get-all';
				search();
			}else{
				ur = '${pageContext.request.contextPath}/transaksi/purchase-order/search-status?search='+status;
				search();
			}
		});
		
		$('#cari-pr').on('keyup', function(){
			var word = $(this).val();
			if (word=="") {
				ur = '${pageContext.request.contextPath}/transaksi/purchase-order/get-all';
				search();
			} else {
				ur = '${pageContext.request.contextPath}/transaksi/purchase-order/search?search='+word;
				search();
			}
		});
		
		var nValid = 1;
		
		$('#in-notes').on('input', function(){
			var notes = $(this).val().length;
			if(notes > 0){
				$('#div-notes').removeClass('has-error').addClass('has-success');
				$('#lbl-notes').html('<i class="fa fa-check"></i> Ok');
				nValid = 1;
			}else{
				$('#div-notes').removeClass('has-success').addClass('has-error');
				$('#lbl-notes').html('<i class="fa fa-times-circle-o"></i> Please insert notes');
				nValid = 0;
			}
		});
		
		var sValid = 0;
		
		$('#pil-supplier').on('change', function(){
			var notes = $(this).val().length;
			if(notes > 0){
				$('#div-supplier').removeClass('has-error').addClass('has-success');
				$('#lbl-supplier').html('<i class="fa fa-check"></i> Ok');
				$('#lbl-supplier').fadeIn();
				sValid = 1;
			}else{
				$('#div-supplier').removeClass('has-success').addClass('has-error');
				$('#lbl-supplier').html('<i class="fa fa-times-circle-o"></i> Please choose supplier');
				$('#lbl-supplier').fadeIn();
				sValid = 0;
			}
		});
		
		$('#data-po').DataTable({
			'paging' : true,
			'lengthChange' : false,
			'searching' : false,
			'ordering' : true,
			'info' : true,
			'autoWidth' : false
		})
	});
</script>
</html>