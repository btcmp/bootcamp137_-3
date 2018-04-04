<!-- Modal -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal fade" id="modal-receipt-sales-order" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Receipt Sales Order</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form class="form-all">
					<div class="form-group">
						<input type="text" class="form-control" id="receipt-change" disabled>
						<input type="text" class="form-control" id="receipt-cash" disabled>
					</div>
					<div class="form-group">
						<label for="receipt-email">How do you want to receive your receipt?</label>
						<input type="email"  class="form-control" id="receipt-email" placeholder="customer mail">
						<button type="button" id="receipt-email-btn" class="btn btn-primary" data-dismiss="modal">Send</button>
					</div>
				</form>
			</div>
			
			<!-- table for get ID INVENTORY-->
						<table id="inventory-table" class="table table-striped table-bordered" cellspacing="0" width="100%">
						<thead>
							<th>Inventory ID</th>
							<th>QTY</th>
						</thead>
						<tbody id="inventory-tbl-body">
						</tbody>
					</table>
					
			<div class="modal-footer">
				<button type="button" id="receipt-print" class="btn btn-primary form-control" data-dismiss="modal">Print Receipt</button>
				<button type="button" id="receipt-done" class="btn btn-primary form-control" data-dismiss="modal">No, Thanks & Done</button>
			</div>
		</div>
	</div>
</div>