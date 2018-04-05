<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<section class="content">


<div><h1>ADJUSTMENT</h1></div>
<hr style="border-color:black; border-top:1px dashed;">
<br/>

<div class="container">
	
	<div class=row>
		<div style="float: left; margin-right: 350px;">
			<input class="form-control">
		</div>
		
		<div style="float:right;  margin-left:40px; margin-right:60px;">
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
		<tbody>
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
		});
		
		
		//Delete item
		$('body').on('click', 'button.hapus', function(){
			var id = $(this).attr('id');
			$('#item-transfered-'+id).remove();
		});
		
		
		//Save and Submit
		$('#tbl-simpan').click(function(){
			var listAdjDetail = [];
			
			var adjHistory = {
					status : "Submitted"
				};
			
			$('#item-table-table > tbody > tr').each(function(index, data){
				var adjDetail = {
					variant : {
						id : $(data).find('td').eq(3).attr('id')
					},
					inStock : $(data).find('td').eq(1).text(),
					actualStock : $(data).find('td').eq(2).text()
				};
				listAdjDetail.push(adjDetail);
			});
			
			var adjustment = {
				adjustmentDetails : listAdjDetail,
				notes : $('#adj-notes').val(),
				status : "Submitted",
				outlet : {
					id : $('#outlet-list').val()
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
		
		
		//search
		$('#search-item').on('input', function(){
			var search = $(this).val();
			$.ajax({
				url : '${pageContext.request.contextPath}/transaksi/adjustment/search-item?search='+ search,
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
		
		/* $('.btn-detail').click(function(){
			var id = $(this).attr('id');
			$.ajax({
				window.location = '${pageContext.request.contextPath}/transaksi/adjustment/take/'+id;
			});
		}); */
		
	});
</script>