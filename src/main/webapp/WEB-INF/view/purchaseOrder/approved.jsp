<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<section class="content">
<div class="box content">
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
	    
	    <div class="col-xs-3">
		    <div class="form-group">
		    	<input type="text" id="cari-pr" class="form-control" placeholder="Search...">
		    </div>
	    </div>
	    
	    <div class="col-xs-2">
		    
	    </div>
	    <div class="col-xs-2">
		    
	    </div>
	    <div class="col-xs-2">
		    
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
							var gt = "${po.grandTotal }";
							document.write('Rp. ' + String(gt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."))+',-');
						</script>
					</td>
					<td>${po.status }</td>
					<td>
						<a href='${pageContext.request.contextPath}/dashboard/detail/po/${po.id}' class="btn-view-pr btn btn-info" key-id="${pr.id }">View</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
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
		        ur = '${pageContext.request.contextPath}/transaksi/purchase-order/search-date?awal='+awal+'&akhir='+akhir;
		        search();
		      }
	    );
		
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
							+'<td>'+val.grandTotal+'</td>'
							+'<td>'+val.status+'</td>'
							+'<td>'
							+'<a href="${pageContext.request.contextPath}/transaksi/purchase-order/detail/'+val.id+'" class="btn-view-pr btn btn-info" key-id="'+val.id+'">View</a></td>');
					})
				},
				error : function(){
					$('#isi-data-po').empty();
					console.log('gagal');
				}
			});
		}
		
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