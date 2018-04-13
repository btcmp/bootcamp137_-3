<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<section class="content">


<div><h1>ADJUSTMENT</h1></div>
<hr style="border-color:black; border-top:1px dashed;">
<br/>

<div class="container">
	
	<div class=row>
	
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
		
		<div style="float:right;  margin-left:40px; margin-right:90px;">
			<button id="create" class="btn btn-primary btn-md">Create</button>
		</div>
		
		<div style="float: right;">
			<button id="export" class="btn btn-primary btn-md">Export</button>
		</div>
		
		
	</div>



	<table id="adjustment-table" class="table table-striped table-bordered">
		<thead>
		<tr>
			<th>Adjustment Date</th>
			<th>Notes</th>
			<th>Status</th>
			<th>#</th>
		</tr>
		</thead>
		<tbody id="isi-adjustment">
		<c:forEach items="${adjustments }" var="adj">
			<tr>
				<td>
					<script type="text/javascript">
						var waktu = '${adj.createdOn}';
						var time = waktu.split('.');
						var wkt = time[0].split(' ');
						var times = wkt[0].split('-');
						document.write(times[2]+'-'+times[1]+'-'+times[0]+' '+wkt[1]);
					</script>
				</td>
				<td>${adj.notes }</td>
				<td>${adj.status }</td>
				<td>
					<a href="http://localhost:8084/kelompok-3-batch137/transaksi/adjustment/take/${adj.id }" id="${adj.id }" class="btn-detail btn btn-warning">view</a>
				</td>
			<tr>
		</c:forEach>
		</tbody>
	</table>
	
	<input type="hidden" value="${outletLogin.id }" id="outlet" />
</div>
<%@ include file="/WEB-INF/view/Adjustment/modal/create.jsp"%>
<%@ include file="/WEB-INF/view/Adjustment/modal/add-item.jsp"%>
</section>
<script type="text/javascript">
	$(document).ready(function(){
		//$('#supplier-table').DataTable();
		
		 var dataFromAddItem = [];
		
		$('#create').click(function(e){
			e.preventDefault();
			document.getElementById('tbl-simpan').disabled=true;
			$('#adj-notes').val("");
			$('#modal-create').modal();
		});
		
		$('#add-item').click(function(e){
			/* $('#modal-').empty(); */
			e.preventDefault();
			document.getElementById('btn-add-item').disabled=true;
			$('#modal-add-item').modal();
			
		});
		
		$('#tombol-outlet').click(function(){
			$('#outlet').fadeIn('slow');
		});
		
		
		//click save option
		$('body').on('click', 'a.btn-save-item', function(e){
			e.preventDefault();
			document.getElementById('btn-add-item').disabled=false;
			var id = $(this).attr('id');
			
			var actual = $('.adj-quantity-'+id).val();
			
			var dataItem = {
					id : id,
					itemName : $('.item-name-'+id).text(),
					inStock : $('.in-stock-'+id).text(),
					adjust : actual
			};
			
			dataFromAddItem.push(dataItem);
			
			$(this).hide();
			$('.saved-item-'+id).show();
		});
		
		
		//transfer/add selected item
		$('#btn-add-item').click(function(){
			$('#modal-add-item').modal('toggle');
			document.getElementById('tbl-simpan').disabled=false;
			$('#item-table').append('<table class="table table-striped table-bordered" id="item-table-table">'
					+ '<thead><tr>'
					+ '<th>Item</th><th>In Stock</th><th>Adj Quantity</th><th>#</th>'
					+ '</tr></thead>'
					+ '<tbody id="isi-table-item"></tbody>'
					+ '</table>')
			$.each(dataFromAddItem, function(key, data){
				$('#isi-table-item').append('<tr id="item-transfered-'+data.id+'">'
						+ '<td>'+data.itemName+'</td>'
						+ '<td>'+data.inStock+'</td>'
						+ '<td>'+data.adjust+'</td>'
						+ '<td id="'+data.id+'"><button class="hapus btn btn-danger">X</button></td>'
						+ '</tr>');
			});
			console.log(data.adjust);
		});
		
		
		//Delete item
		$('body').on('click', 'button.hapus', function(){
			var id = $(this).attr('id');
			$('#item-transfered-'+id).remove();
		});
		
		
		//Save and Submit
		$('#tbl-simpan').click(function(){
			var listAdjDetail = [];
			
			$('#item-table-table > tbody > tr').each(function(index, data){
				var adjDetail = {
					variant : {
						id : $(data).find('td').eq(3).attr('id')
					},
					inStock : $(data).find('td').eq(1).text(),
					actualStock : $(data).find('td').eq(2).val()
				};
				listAdjDetail.push(adjDetail);
			});
			
			var adjustment = {
				adjustmentDetails : listAdjDetail,
				notes : $('#adj-notes').val(),
				status : "Submitted",
				outlet : {
					id : $('#outlet').val()
				}
			};
			
			console.log(adjustment);
			alert('Checking..');
			
			$.ajax({
				type : 'POST',
				url : '${pageContext.request.contextPath}/transaksi/adjustment/save',
				data : JSON.stringify(adjustment),
				contentType : 'application/json',
				success : function(){
					alert('Berhasil Terkirim..');
					window.location = ''
				},
				error : function(){
					alert('no...');
				}
			});
		});
		
		$('.btn-edit').click(function(){
			var id = $(this).attr('id');
			$.ajax({
				
			});
		});
		
		
		//search item and variant
		$('#search-item').on('input', function(){
			alert('Tahan, liat dulu..')
			var search = $(this).val();
			var outletId = $('#outlet').val();
			console.log(search);
			console.log(outletId);
			alert('Tahan..');
			$.ajax({
				url : '${pageContext.request.contextPath}/transaksi/adjustment/search-item?outlet='+outletId+'&search='+ search,
				type : 'GET',
				dateType : 'json',
				success : function(data){
					$('#data-item').empty();
					$.each(data, function(key, invent){
						console.log(invent);
						$('#data-item').append('<tr>'
								+ '<td class="item-name-'+invent.itemVariant.id+'">'+ invent.itemVariant.item.name + ' - ' + invent.itemVariant.name +'</td>'
								+ '<td class="in-stock-'+invent.itemVariant.id+'">'+ invent.endingQty +'</td>'
								+ '<td><input class="form-control adj-quantity-'+invent.id +'" type="number" value="1"></td>'
								+ '<td align="center"><a href="" id="'+invent.itemVariant.id+'" class="save-item-'+invent.itemVariant.id+ ' btn-save-item">SAVE</a> <a href="" class="saved-item-'+invent.itemVariant.id+' btn-saved-item">SAVED</a></td>'
								+ '</tr>');
						$('.saved-item-'+invent.itemVariant.id).hide();
					});
				},
				error : function(data){
					console.log(data);
					$('#data-item').empty();
				}
			});
		});
		
		
		//Search on main view, kalau ada.
		//Cara pake search yang ke-dua kali
		$('#adjustment-search').on('input', function(){
			var keyword = $(this).val();
			link : '${pageContext.request.contextPath}/transaksi/adjustment/search?search='+keyword;
			search();
		});
		
		//Search by date
		$('#pilih-tanggal-range').daterangepicker(
			      {
			        ranges   : {
			          'Today'       : [moment(), moment()],
			          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
			          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
			          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
			          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
			          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
			        },
			        startDate: moment().subtract(29, 'days'),
			        endDate  : moment(),
			      },
			      function (start, end) {
			        $('#pilih-tanggal-range').html(start.format('D MMMM YYYY') + ' - ' + end.format('D MMMM YYYY'));
			        awal = start.format('YYYY-MM-DD');
			        akhir = end.format('YYYY-MM-DD');
			        link = '${pageContext.request.contextPath}/transaksi/adjustment/search?awal='+awal+'&akhir='+akhir;
			        search();
			      }
		    );
		
		
		//Fungsi search berupa ajax
		function search(){
			$.ajax({
				type : 'GET',
				url : link,
				success : function(data){
					$('#isi-adjustment').empty();
					$(data).each(function(key, val){
						var json_data = '/Date('+val.createdOn+')/';
						var asAMoment = moment(json_data);
						var tanggal = asAMoment.format('DD-MM-YYYY HH:mm:ss');
						
						$('#isi-adjustment').append('<tr><td>'+tanggal+'</td>'
							+'<td>'+val.notes+'</td>'
							+'<td>'+val.status+'</td>'
							+'<td><a href="http://localhost:8084/kelompok-3-batch137/transaksi/adjustment/take/'+val.id +'" id="'+val.id +'" class="btn-detail btn btn-warning">view</a></td>');
					})
				},
				error : function(){
					$('#isi-adjustment').empty();
					console.log('gagal');
				}
			});
		}
		
		
		$('#')
		
		/* $('.btn-detail').click(function(){
			var id = $(this).attr('id');
			$.ajax({
				window.location = '${pageContext.request.contextPath}/transaksi/adjustment/take/'+id;
			});
		}); */
		
	});
</script>