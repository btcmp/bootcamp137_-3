<!-- Modal -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal fade" id="modal-charge-sales-order" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel" align="center">Charge Sales Order</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="form-charge-so" class="form-all" style="border:none">
					<div class="form-group">
						<label id="charge-cash-label" for="charge-cash">Cash</label> <!-- <input type="number"
							class="form-control" id="charge-cash" value="0"> -->
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="charge-done" class="btn btn-primary">Done</button>
			</div>
		</div>
	</div>
</div>