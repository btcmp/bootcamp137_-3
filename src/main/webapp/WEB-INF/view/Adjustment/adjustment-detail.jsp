<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<div class="container">

<div class="row">
	<div class="col-xs-5" style="margin-left:30px;">
		<h2>ADJUSTMENT DETAIL</h2>
	</div>
	<div class="col-xs-2" style="float:right; margin-right:50px; margin-top:25px">
		<select class="form-control btn-info" id="status-adjustment">
			<option disabled selected>MORE</option>
			<option value="Aproved">Approve</option>
			<option value="Rejected">Reject</option>
			<option value="Printed">Print</option>
		</select>
	</div>
</div>
<hr style="border-color:black; border-top:1px dashed; margin-right:50px;">
<br/>

<div id="adjustment-detail">
	<div class="row">
		<div class="col-xs-2">Created By</div>
		<div class="col-xs-1">:</div>
		<div class="col-xs-3">[User]</div>
	</div>
	
	<div class="row">
		<div class="col-xs-2">Adjustment Status</div>
		<div class="col-xs-1">:</div>
		<div class="col-xs-3">${adjustment.status }</div>
	</div>
	
	<div style="margin-right:50px;">
		<div><h5>Notes</h5></div>
		<div >
			<textarea class="form-control" rows="3" id="notes">${adjustment.notes }</textarea>
		</div>
	</div>
	
<hr style="border-color:black; border-top:1px dashed; margin-right:50px;">
<br/>
</div>
	
<div class="row">
	<div class="col-xs-5" style="margin-left:30px;">
		<h2>STATUS HISTORY</h2>
	</div>
</div>
<hr style="border-color:black; border-top:1px dashed; margin-right:50px;">
<br/>

<div id="status-history">
	<c:forEach items="${adjustment.adjustmentHistories }" var="history">
		<div>On ${history.createdOn } - ${history.status }</div>
	</c:forEach>
</div>

<hr style="border-color:black; border-top:1px dashed; margin-right:50px;">
<br/>

<div class="row">
	<div class="col-xs-5" style="margin-left:30px;">
		<h2>ADJUSTMENT ITEMS</h2>
	</div>
</div>
<hr style="border-color:black; border-top:1px dashed; margin-right:50px;">
<br/>

<div id="adjustment-items">
	<table id="adjustment-table" class="table table-striped table-bordered">
		<thead>
		<tr>
			<th>Item</th>
			<th>In Stock</th>
			<th>Adj Quantity</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${adjustment.adjustmentDetails }" var="detail">
			<tr>
				<td>${detail.variant.item.name } - ${detail.variant.item.name }</td>
				<td>${detail.inStock }</td>
				<td>${detail.actualStock }</td>
			<tr>
		</c:forEach> 
		</tbody>
	</table>
	<input type="hidden" id="adjustment-id" value="a" />
</div>
<hr style="border-color:black; border-top:1px dashed; margin-right:50px;">
<br/>

<div class="row">
	<div class="col-xs-2" style="float:right; margin-right:50px; margin-bottom:50px">
		<input class="form-control btn btn-info" id="done-adjustment" value="Done" />
	</div>
</div>

</div>
</body>

<script type="text/javascript">
	$(document).ready(function(){
		//$('#supplier-table').DataTable();
		
		$('#status-adjustment').change(function(){
			var status = $(this).val();
			if(status !== null){
				var adjustment = {
					id : $('#adjustment-id').val(),
					status : status,
				}
				$.ajax({
					url : '${pageContext.request.contextPath}/transaksi/adjustment/update',
					type : 'PUT',
					data : JSON.stringify(adjustment),
					contentType : 'application/json',
					success : function(acc){
						$.each(acc, function(key, data))
						$('#status-history').append('<div>'
								+ 
								+ '</div>')
					},	
					error : function(){
						alert('')
				}
				});
			}
		});
		
		
		$('#done-adjustment').click(function(){
			window.location = '${pageContext.request.contextPath}/transaksi/adjustment';
		});
		
	});
</script>
</html>