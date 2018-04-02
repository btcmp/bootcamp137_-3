<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<section class="content">
	<h3>Purchase Request</h3>
	<hr style="border-color:black;">
	<div class="row">
		<div class="col-xs-3">
			<div class="form-group">
		       <button type="button" class="btn btn-default btn-block" id="pilih-tanggal-range">
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
		    		<option value="PO Created">PO Created</option>
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
		    	<input type="button" id="btn-export" class="btn btn-md btn-primary btn-block" value="Export">
		    </div>
	    </div>
	    <div class="col-xs-2">
		    <div class="form-group">
		    	<input type="button" id="btn-create" class="btn btn-md btn-primary btn-block" value="Create" data-toggle="modal" data-target="#create-pr">
		    </div>
	    </div>
	</div>
	<hr>
	<table id="data-pr" class="table table-striped table-bordered table-hover">
		<thead class="thead-light">
			<th>Create Date</th>
			<th>PR No.</th>
			<th>Note</th>
			<th>Status</th>
			<th>#</th>
		</thead>
		<tbody id="isi-data-pr">
			<c:forEach items="${prs }" var="pr">
				<tr>
					<td>
						<script>
							var waktu = '${pr.createdOn}';
							var wkt = waktu.split('.');
							document.write(wkt[0]);
						</script>
					</td>
					<td>${pr.prNo }</td>
					<td>${pr.notes }</td>
					<td>${pr.status }</td>
					<td>
						<input type="button" class="btn-edit-pr btn btn-default" value="Edit" key-id="${pr.id }" pr-status="${pr.status }"> |
						<a href='${pageContext.request.contextPath}/transaksi/purchase-request/detail/${pr.id}' class="btn-view-pr btn btn-info" key-id="${pr.id }">View</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div id="create-pr" class="modal fade" role="dialog">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
						<h4 class="modal-title">Create New PR : </h4>
						<select id = "pil-outlet">
							<c:forEach items="${outlets }" var="outlet">
								<option value="${outlet.id }">${outlet.name }</option>
							</c:forEach>
						</select>
				</div>
				<div class="modal-body">
					<h4>Tanggal Waktu Item Ready : </h4>
					<div class="input-group date">
	                	<div class="input-group-addon">
	                  	<i class="fa fa-calendar"></i>
	                	</div>
	                	<input type="text" class="form-control pull-right" id="pilih-tanggal">
	                	<input type="hidden" id="in-id">
	                </div>
	                <div class="form-group">
	                	<h4>Notes : </h4>
	                	<textarea class="form-control" rows="5" id="in-notes"></textarea>
	                </div>
	                
	                <h4>Purchase Request</h4>
	                <hr style="border-color:black;">
	                <table id="data-purchase-item" class="table table-striped table-bordered table-hover">
	                	<thead>
	                		<th>
	                			Item
	                		</th>
	                		<th>
	                			In Stock
	                		</th>
	                		<th>
	                			Request Qty.
	                		</th>
	                	</thead>
	                	<tbody id = "list-item">
	                	</tbody>
	                </table>
	                <button type="button" class="btn btn-md btn-primary btn-block" id="btn-tambah-item" data-toggle="modal" data-target="#add-item-pr">Add Item</button>
	                
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal"
						id="batal-insert">Batal</button>
					<button type="button" class="btn btn-primary" id="tblsimpan"
						key="key">Simpan</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="add-item-pr" class="modal fade" role="dialog">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Add Purchase Item</h4>
				</div>
				<div class="modal-body">
					<input type="text" id="search-item" class="form-control">
					<table id="data-barang" class="table table-striped table-bordered table-hover">
						<thead>
							<th>Item</th>
							<th>In Stock</th>
							<th>Request Qty.</th>
						</thead>
						<tbody id="list-barang">
							
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal"
						id="batal-insert">Cancel</button>
					<button type="button" class="btn btn-danger" id="tblkonfdel"
						key="key">Add</button>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
<script>
	$(function(){
		var awal = '';
		var akhir = '';
		$('#pilih-tanggal-range').daterangepicker(
		      {
		        ranges   : {
		          'Hari Ini'       : [moment(), moment()],
		          'Kemarin'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
		          '7 Hari Terakhir' : [moment().subtract(6, 'days'), moment()],
		          'Sebulan Terakhir': [moment().subtract(29, 'days'), moment()],
		          'Bulan ini'  : [moment().startOf('month'), moment().endOf('month')],
		          'Bulan lalu'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
		        },
		        startDate: moment().subtract(29, 'days'),
		        endDate  : moment(),
		      },
		      function (start, end) {
		        $('#pilih-tanggal-range').html(start.format('D MMMM YYYY') + ' - ' + end.format('D MMMM YYYY'))
		        awal = start.format('YYYY-MM-DD');
		        akhir = end.format('YYYY-MM-DD');
		        $.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath}/transaksi/purchase-request/search-date?awal='+awal+'&akhir='+akhir,
					success : function(data){
						$('#isi-data-pr').empty();
						$(data).each(function(key, val){
							var json_data = '/Date('+val.createdOn+')/';
							var asAMoment = moment(json_data);
							var tanggal = asAMoment.format('DD-MM-YYYY HH:mm:ss');
							
							$('#isi-data-pr').append('<tr><td>'+tanggal+'</td>'
								+'<td>'+val.prNo+'</td>'
								+'<td>'+val.notes+'</td>'
								+'<td>'+val.status+'</td>'
								+'<td><input type="button" class="btn-edit-pr btn btn-default" value="Edit" key-id="'+val.id+'" pr-status="'+val.status+'"> | '
								+'<a href="${pageContext.request.contextPath}/transaksi/purchase-request/detail/'+val.id+'" class="btn-view-pr btn btn-info" key-id="'+val.id+'">View</a></td>');
						})
						
					},
					error : function(){
						console.log('gagal');
						$('#isi-data-pr').empty();
					}
				});
		      }
	    );
	    
	    $('#pilih-tanggal').datepicker({
      		autoclose: true,
      		startDate : new Date(),
    	});
	    
	    $('#tblsimpan').on('click',function(evt) {
			evt.preventDefault();
			var prd = [];
			
			$('#list-item > tr').each(function(index,data) {
				var detail = {
						"requestQty" : $(this).find('td').eq(2).text(),
						"variant" : {
							"id" : $(this).attr('key-id')
						}
				};
				prd.push(detail);
		
			});
			
			var tgl = $('#pilih-tanggal').val().split('/');
			var tanggal = tgl[2]+'-'+tgl[0]+'-'+tgl[1];
			
			var purReq = {
				"id" : $('#in-id').val(),
				"notes" : $('#in-notes').val(),
				"status" : $('#in-status').val(),
				"outlet" : {
					"id" : $('#pil-outlet').val()
				},
				"detail" : prd,
				"status" : "Created",
				"readyTime" : tanggal
			};
			
			//validate = $('#form-emp').parsley();
			//validate.validate();
			//if(validate.isValid()){
				$.ajax({
					type : 'post',
					url : '${pageContext.request.contextPath}/transaksi/purchase-request/save',
					data : JSON.stringify(purReq),
					contentType : 'application/json',
					success : function() {
						
						window.location = '${pageContext.request.contextPath}/transaksi/purchase-request';
					},
					error : function() {
						alert('save failed');
					}
				});
			//}
		}); // end fungsi simpan
	    
		var added = [];
		
		// auto complete
		var itemsss = [];
		var itemss = {
				data : itemsss,
		};
		
		$('#search-item').easyAutocomplete(itemss);
		
		$('#btn-tambah-item').on('click', function(){
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/item/get-inventory',
				dataType : 'json',
				success : function(data){
					$.each(data, function(key, val) {
						var namaItem = val.itemVariant.item.name +'-'+ val.itemVariant.name;
						itemsss.push(namaItem);
					});
				}, error : function(){
					
				}
			});
		});
		
		$(".easy-autocomplete").removeAttr("style");
		
		// fungsi search
	    $('#search-item').on('keyup',function(e){
	    	
			var word = $(this).val();
			if (word=="") {
				$('#list-barang').empty();
			} else {
				$.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath}/transaksi/purchase-request/search-item?search='+word,
					dataType: 'json',
					success : function(data){
						
						$('#list-barang').empty();
						$.each(data, function(key, val) {
							$('#list-barang').append(
								'<tr id = "tr'+val.id+'"><td>'+ val.itemVariant.item.name +'-'+ val.itemVariant.name +'</td>'
								+'<td id="inStock'+ val.id +'">'+ val.beginning +'</td>'
								+'<td id="td-qty'+ val.id +'"><input type="number" mmin="1" max="1000" id="reqQty'+ val.id +'" value="1" /></td>'
								+'<td><button type="button" id="'+ val.id +'" class="tbl-add-brg btn btn-primary btn-add'+val.id
								+'" key-id="'+val.itemVariant.id+'">Add</button></td></tr>');
						});
					}, 
					error : function(){
						$('#list-barang').empty();
					}
				});
			}
		}); // end fungsi search
		
		$('#list-barang').on('click', '.tbl-add-brg', function(){
			var element = $(this).parent().parent();
			var id = $(this).attr('id');
			var variantId = $(this).attr('key-id');
			var itemVar = element.find('td').eq(0).text();
			var inStock = element.find('td').eq(1).text();
			var reqQty = $('#reqQty'+id).val();
			if(added.indexOf(variantId.toString()) == -1) {
				$('#list-item').append(
					'<tr key-id="'+variantId+'" id="'+variantId+'"><td>'+itemVar+'</td>'
					+'<td>'+inStock+'</td>'
					+'<td>'+reqQty+'</td>'
					+'<td><button type="button" class="btn btn-danger btn-hapus-barang" id="btn-del'+id+'" key-id="'+id+'">&times;</button>'
				);
				added.push(variantId);
				
			}else{
				var target = $('#list-item > #'+variantId+'');
				var oldReq = target.find('td').eq(2).text();
				var newReq = parseInt(oldReq)+parseInt(reqQty);
				target.find('td').eq(2).text(newReq);
			}
		});
		
		$('#data-purchase-item').on('click', '.btn-hapus-barang', function(){
			var id = $(this).attr('key-id');
			$(this).parent().parent().remove();
			var index = added.indexOf(id.toString());
			if(index > -1){
				added.splice(index, 1);
			}
		});
		
		$('#data-pr').on('click', '.btn-edit-pr', function(){
			
			added= [];
			$('#list-item').empty();
			var id = $(this).attr('key-id');
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/transaksi/purchase-request/get-one/'+id,
				dataType: 'json',
				success : function(data){
					
					$('#in-notes').val(data.notes);
					$('#in-id').val(data.id);
					var tgl = data.readyTime.split('-');
					var tanggal = tgl[1]+'/'+tgl[2]+'/'+tgl[0];
					$('#pilih-tanggal').val(tanggal);
					$(data.detail).each(function(key, val){
						added.push(''+val.variant.id+'');
						
						$('#list-item').append(
							'<tr key-id="'+val.variant.id+'" id="'+val.variant.id+'"><td>'+val.variant.item.name+'-'+val.variant.name+'</td>'
							+'<td id="td'+val.id+'"></td>'
							+'<td>'+val.requestQty+'</td>'
							+'<td><button type="button" class="btn btn-danger btn-hapus-barang" id="btn-del'+id+'" key-id="'+id+'">&times;</button>'
						);
						$.ajax({
							type : 'GET',
							url : '${pageContext.request.contextPath}/transaksi/purchase-request/get-inventory?idPr='+id+'&idPrd='+val.id,
							dataType: 'json',
							success : function(inv){
								$('#td'+val.id).append(inv[0]);
							}
						});
					})
					$('#create-pr').modal('show');
				}, 
				error : function(){
					console.log('gagal');
				}
			});
		});
		
		$('#pil-status').change(function(){
			var status = $(this).val();
			var ur = '';
			if(status == 'All'){
				ut = '${pageContext.request.contextPath}/transaksi/purchase-request/get-all';
			}else{
				ur = '${pageContext.request.contextPath}/transaksi/purchase-request/search-status?search='+status;
				$.ajax({
					type : 'GET',
					url : ur,
					success : function(data){
						
						$('#isi-data-pr').empty();
						$(data).each(function(key, val){
							var json_data = '/Date('+val.createdOn+')/';
							var asAMoment = moment(json_data);
							var tanggal = asAMoment.format('DD-MM-YYYY HH:mm:ss');
							
							$('#isi-data-pr').append('<tr><td>'+tanggal+'</td>'
								+'<td>'+val.prNo+'</td>'
								+'<td>'+val.notes+'</td>'
								+'<td>'+val.status+'</td>'
								+'<td><input type="button" class="btn-edit-pr btn btn-default" value="Edit" key-id="'+val.id+'" pr-status="'+val.status+'"> | '
								+'<a href="${pageContext.request.contextPath}/transaksi/purchase-request/detail/'+val.id+'" class="btn-view-pr btn btn-info" key-id="'+val.id+'">View</a></td>');
						})
						
					},
					error : function(){
						$('#isi-data-pr').empty();
						console.log('gagal');
					}
				});
			}
		});
		
		$('#cari-pr').on('keyup', function(){
			var word = $(this).val();
			if (word=="") {
				$('#isi-data-pr').empty();
			} else {
				$.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath}/transaksi/purchase-request/search?search='+word,
					success : function(data){
						console.log(data);				
						$('#isi-data-pr').empty();
						$(data).each(function(key, val){
							var json_data = '/Date('+val.createdOn+')/';
							var asAMoment = moment(json_data);
							var tanggal = asAMoment.format('DD-MM-YYYY HH:mm:ss');
							
							$('#isi-data-pr').append('<tr><td>'+tanggal+'</td>'
								+'<td>'+val.prNo+'</td>'
								+'<td>'+val.notes+'</td>'
								+'<td>'+val.status+'</td>'
								+'<td><input type="button" class="btn-edit-pr btn btn-default" value="Edit" key-id="'+val.id+'" pr-status="'+val.status+'"> | '
								+'<a href="${pageContext.request.contextPath}/transaksi/purchase-request/detail/'+val.id+'" class="btn-view-pr btn btn-info" key-id="'+val.id+'">View</a></td>');
						})
						
					},
					error : function(){
						$('#isi-data-pr').empty();
						console.log('gagal');
					}
				});
			}
		});
	});
</script>
</html>