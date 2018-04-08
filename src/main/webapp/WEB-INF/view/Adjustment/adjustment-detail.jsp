<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<div class="container">

<div class="row">
	<div class="col-xs-5" style="margin-left:30px;">
		<h2>ADJUSTMENT DETAIL</h2>
	</div>
	<div class="col-xs-2" style="float:right; margin-right:50px; margin-top:25px">
		<script type="text/javascript">
			if('${adjustment.status}' == 'Submitted'){
				document.write('<select class="form-control btn-info" id="status-adjustment">'
					+ '<option disabled selected>MORE</option>'
					+ '<option value="Approved">Approve</option>'
					+ '<option value="Rejected">Reject</option>'
					+ '<option value="Printed">Print</option>');
			}
			else if(('${adjustment.status}' == 'Rejected')  || ('${adjustment.status}' == 'Approved')){
				document.write('<select class="form-control btn-info" id="status-adjustment">'
					+ '<option disabled selected>MORE</option>'
					+ '<option disabled value="Approved">Approve</option>'
					+ '<option disabled value="Rejected">Reject</option>'
					+ '<option value="Printed">Print</option>');
			}
			/* else if('${adjustment.status}' == 'Approved'){
				document.write('<select class="form-control btn-info" id="status-adjustment">'
					+ '<option disabled selected>MORE</option>'
					+ '<option disabled value="Approved">Approve</option>'
					+ '<option disabled value="Rejected">Reject</option>'
					+ '<option value="Printed">Print</option>');
			} */ 
		</script>
		
		</select>
	</div>
</div>
<hr style="border-color:black; border-top:1px dashed; margin-right:50px;">
<br/>

<div id="adjustment-detail">
	<div class="row">
		<div class="col-xs-2">Created By</div>
		<div class="col-xs-1">:</div>
		<div class="col-xs-3">${adjustment.createdBy.username }</div>
	</div>
	
	<div class="row">
		<div class="col-xs-2">Adjustment Status</div>
		<div class="col-xs-1">:</div>
		<div id="cetatus" class="col-xs-3">${adjustment.status }</div>
	</div>
	
	<div style="margin-right:50px;">
		<div><h5>Notes</h5></div>
		<div >
			<textarea class="form-control" rows="3" id="notes" readonly>${adjustment.notes }</textarea>
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
		<div>On 
		<script type="text/javascript">
			var waktu = '${history.createdOn}';
			var time = waktu.split('.');
			document.write(time[0]);
		</script>
		 - ${history.status }</div>
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
	<input type="hidden" id="adjustment-id" value="${adjustment.id }" />
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
		
		$('#status-adjustment').change(function(e){
			e.preventDefault();
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
					success : function(histories){
						$('#status-history').empty();
						$.each(histories, function(key, data){
							var date = '/Date('+data.createdOn+')';
							var asAMoment = moment(date);
							var tanggal = asAMoment.format('YYYY-MM-DD HH:mm:ss');
							
							$('#status-history').append('<div>'
									+ 'On '+tanggal+' - '+data.status
									+ '</div>');
						});
						$('#cetatus').empty();
						$('#cetatus').append($('#status-adjustment').val());
						$('#status-adjustment').empty();
						$('#status-adjustment').append('<option disabled selected>MORE</option>'
								+ '<option disabled value="Approved">Approve</option>'
								+ '<option disabled value="Rejected">Reject</option>'
								+ '<option value="Printed">Print</option>'
								);
						alert('Yeesss..');
					},	
					error : function(){
						alert('Nooo..');
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