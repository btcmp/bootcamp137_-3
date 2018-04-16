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
</section>
<script type="text/javascript">
	$(document).ready(function(){
		$('#adjustment-table').DataTable();

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
		
	});
</script>