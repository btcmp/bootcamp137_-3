<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<section class="content">
<div class="row">
	<div class="col-xs-9">
		<h3>PURCHASE REQUEST DETAIL</h3>
		<hr style="border-color: black; border-top: 1px dashed;">
	</div>
	<div class="col-xs-3">
		<select id="action-pr" class="btn-primary form-control" key-id="${pr.id }">
			<option disabled selected>More</option>
			<option value="approve">Approve</option>
			<option value="reject">Reject</option>
			<option value="print">Print</option>
			<option value="create-po">Create PO</option>
		</select>
	</div>
</div>
<div class="row">
<div class="col-xs-4">
<table class="table table-hover">
	<tr>
		<th>PR Number</th>
		<td></td>
		<td>:</td>
		<td>${pr.prNo }</td>
	</tr>
	<tr>
		<th>Created By</th>
		<td></td>
		<td>:</td>
		<td>${pr.createdBy }</td>
	</tr>
	<tr>
		<th>Target Waktu Item Ready</th>
		<td></td>
		<td> : </td>
		<td>
			<script>
				var tanggal = '${pr.readyTime}';
				var tgl = tanggal.split('-');
				document.write(tgl[2]+'-'+tgl[1]+'-'+tgl[0]);
			</script>
		</td>
	</tr>
	<tr>
		<th>PR Status</th>
		<td></td>
		<td> : </td>
		<td id="status">${pr.status }</td>
	</tr>
</table>
</div>
</div>
<div class="form-group">
	<label for="input-note">Notes</label>
	<textarea class="form-control" id="input-note" rows="5"
		disabled="disabled">${pr.notes }</textarea>
</div>
<h5>
	<b>Status History</b>
</h5>
<hr style="border-color: black; border-top: 1px dashed;">
<div class="row">
	<div class="col-xs-5">
		<table id="data-history" class="table table-striped table-bordered table-hover">
			<c:forEach items="${pr.history }" var="his">
				<tr>
					<td>On</td>
					<td>
						<script>
							var waktu = '${his.createdOn}';
							var wkt = waktu.split('.');
							document.write(wkt[0]);
						</script>
					</td>
					<td>-</td>
					<td>${pr.prNo }</td>
					<td>is</td>
					<td>${his.status }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<h5>
	<b>Purchase Items</b>
</h5>
<hr style="border-color: black; border-top: 1px dashed;">
<table id="data-purchase-item"
	class="table table-striped table-bordered table-hover">
	<thead>
		<th>Item</th>
		<th>In Stock</th>
		<th>Request Qty.</th>
	</thead>
	<tbody id="list-item">
		<c:forEach items="${pr.detail }" var ="prd">
			<tr>
				<td>${prd.variant.item.name }-${prd.variant.name }</td>
				<td>null</td>
				<td>${prd.requestQty }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</section>
</body>
<script>
	$(function(){
		$('#action-pr').change(function(){
			var action = $(this).val();
			var id = $(this).attr('key-id');
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/transaksi/purchase-request/'+action+'/'+id,
				success : function(){
					console.log('sukses');
					window.location = '${pageContext.request.contextPath}/transaksi/purchase-request/detail/'+id;
				},
				error : function(){
					console.log('gagal');
				}
			});
		});
	})
</script>
</html>