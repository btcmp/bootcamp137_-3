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
				<form class="form-all" style="border:none">
					<div class="form-group">
					
					<div align="center">
						<p style="font-size:40px" id="receipt-change"></p>
					</div>
					
					<div align="center">
						<p id="receipt-cash" ></p>
					</div>
					
					</div>
					
					<div class="form-group">
						<label for="receipt-email">How do you want to receive your receipt?</label>
						<br/>
						<input style="width:80%;float:left" type="email"  class="form-control" id="receipt-email" placeholder="customer mail">
						<button style="width:20%;float:left" type="button" id="receipt-email-btn" class="btn btn-primary" data-dismiss="modal">Send</button>
					</div>
				</form>
			</div>
			
	
			<div class="modal-footer">
			<div>
					<button type="button" id="receipt-print" class="btn btn-primary form-control" data-dismiss="modal">Print Receipt</button>	
			</div>
			
			<div>
				<button type="button" id="receipt-done" class="btn btn-danger form-control" data-dismiss="modal">No, Thanks & Done</button>
			</div>
			</div>
		</div>
	</div>
</div>