<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<section class="content">
<div class="row">
	<div class="col-xs-9">
		<h3>PURCHASE ORDER DETAIL</h3>
		<hr style="border-color: black; border-top: 1px dashed;">
	</div>
	<div class="col-xs-3">
		<script>
			if('${po.status}' == 'Created' || '${po.status}' == 'Submitted'){
				document.write('<select id="action-po" class="btn-primary form-control no-print" key-id="${po.id }">'
						+'<option disabled selected>More</option>'
						+'<option value="approve">Approve</option>'
						+'<option value="reject">Reject</option>'
						+'<option value="process" disabled>Process</option>'
						+'<option value="print">Print</option>');
			}else if('${po.status}' == 'Rejected'){
				document.write('<select id="action-po" class="btn-primary form-control no-print" key-id="${po.id }">'
						+'<option disabled selected>More</option>'
						+'<option value="approve" disabled>Approve</option>'
						+'<option value="reject" disabled>Reject</option>'
						+'<option value="process" disabled>Process</option>'
						+'<option value="print">Print</option>');
			}else if('${po.status}' == 'Processed'){
				document.write('<select id="action-po" class="btn-poimary form-control no-print" key-id="${po.id }">'
						+'<option disabled selected>More</option>'
						+'<option value="approve" disabled>Approve</option>'
						+'<option value="reject" disabled>Reject</option>'
						+'<option value="process" disabled>Process</option>'
						+'<option value="print">Print</option>');
			}else if('${po.status}' == 'Approved'){
				document.write('<select id="action-po" class="btn-primary form-control no-print" key-id="${po.id }">'
						+'<option disabled selected>More</option>'
						+'<option value="approve" disabled>Approve</option>'
						+'<option value="reject" disabled>Reject</option>'
						+'<option value="process">Process</option>'
						+'<option value="print">Print</option>');
			}
		</script>
			
		</select>
	</div>
</div>
<div class="row">
<div class="col-xs-8">
<h5><strong>${po.supplier.name }</strong></h5>
<table class="table table-striped table-bordered table-hover" style="border-color:black;">
	<tr style="border-color:black;">
		<td style="border-color:black;">${po.supplier.phone }</td>
		<td colspan="2" style="border-color:black;">${po.supplier.email }</td>
	</tr>
	<tr style="border-color:black;">
		<td colspan="3" style="border-color:black;">${po.supplier.address }</td>
	</tr>
	<tr style="border-color:black;">
		<td style="border-color:black;">${po.supplier.province.name }</td>
		<td style="border-color:black;">${po.supplier.region.name }</td>
		<td style="border-color:black;">${po.supplier.postalCode }</td>
	</tr>
</table>
</div>
</div>
<div class="form-group">
	<label for="input-note">Notes</label>
	<textarea class="form-control" id="input-note" rows="5" style="resize:none;" readonly>${po.notes }</textarea>
</div>
<div class = "row">
	<div class="col-xs-8">
		<table class = "table table-borderless table-hover">
			<tr>
				<td>PO Number : ${po.poNo }</td>
			</tr>
			<tr>
				<td>Created By : ${po.createdBy.employee.firstName } ${po.createdBy.employee.lastName }</td>
			</tr>
			<tr>
				<td>Email : ${po.outlet.email }
			</tr>
			<tr>
				<td>Outlet : ${po.outlet.name }</td>
			</tr>
			<tr>
				<td>Phone : ${po.outlet.phone }</td>
			</tr>
			<tr>
				<td>Address : ${po.outlet.address }</td>
			</tr>
			<tr>
				<td>PO Status : ${po.status }</td>
			</tr>
		</table>
	</div>
</div>
<h5>
	<b>Status History</b>
</h5>
<hr style="border-color: black; border-top: 1px dashed;">
<div class="row">
	<div class="col-xs-8">
		<table id="data-history" class="table table-striped table-borderless table-hover">
			<c:forEach items="${po.history }" var="his">
				<tr>
					<td>On 
						<script>
							var waktu = '${his.createdOn}';
							var wkt = waktu.split('.');
							document.write(wkt[0]);
						</script>
					&#8208; ${po.poNo } is ${his.status }</td>
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
		<th>Qty. Order</th>
		<th>Unit Cost</th>
		<th>Total</th>
	</thead>
	<tbody id="list-item">
		<c:forEach items="${po.detail }" var ="pod">
			<tr>
				<td>${pod.variant.item.name }-${pod.variant.name }</td>
				<td id="td${pod.id }">
					<script type="text/javascript">
							$.ajax({
								type : 'GET',
								url : '${pageContext.request.contextPath}/transaksi/purchase-order/get-inventory?idPo='+${po.id}+'&idPod='+${pod.id},
								dataType: 'json',
								success : function(inv){
									$('#td${pod.id}').append(inv[0]);
								}
							});
					</script>
				</td>
				<td>${pod.requestQty }</td>
				<td>
					<script>
						document.write('Rp. ' + ${pod.unitCost }.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+',-');
					</script>
				</td>
				<td>
					<script>
						document.write('Rp. ' + ${pod.subTotal }.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+',-');
					</script>
				</td>
			</tr>
		</c:forEach>
		<tfoot>
			<tr style="border-bottom:black dashed 1px;">
				<td colspan="4" style="border-bottom:black dashed 1px;"><strong>TOTAL</strong></td>
				<td style="border-bottom:black dashed 1px;">
					<script>
						document.write('Rp. ' + ${po.grandTotal }.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+',-');
					</script>
				</td>
			</tr>
		</tfoot>
	</tbody>
</table>
<div class="row">
	<div class="col-xs-9"></div>
	<div class="col-xs-3"><a href="${pageContext.request.contextPath}/transaksi/purchase-order" class="btn btn-primary btn-block no-print">Done</a></div>
</div>
</section>
</body>
<script>
	$(function(){
		
		$('#action-po').change(function(){
			var action = $(this).val();
			var id = $(this).attr('key-id');
			if(action == 'print'){
				window.print();
			}else{
				$.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath}/transaksi/purchase-order/'+action+'/'+id,
					success : function(){
						console.log('sukses');
						window.location = '${pageContext.request.contextPath}/transaksi/purchase-order/detail/'+id;
					},
					error : function(){
						console.log('gagal');
					}
				});
			}
		});
	})
</script>
</html>