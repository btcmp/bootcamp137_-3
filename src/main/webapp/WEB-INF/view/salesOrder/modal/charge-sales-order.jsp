<!-- Modal -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal fade" id="modal-charge-sales-order" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel" align="center">Charge Sales Order</h5>
			</div>
			<div class="modal-body">
				
				<div class="row" id="div-alert-charge" style="display:none;">
						<div class="col-xs-12">
							<div id="tampilan-alert-charge" class="alert alert-sukses" role="alert">
								<strong>Sukses!</strong> Data Berhasil Disimpan.
							</div>
						</div>
					</div>
			
				<form id="form-charge-so" class="form-all" style="border:none">
					<div  id="div-charge-cash" class="form-group">
						<label id="charge-cash-label" for="charge-cash">Cash</label> <!-- <input type="number"
							class="form-control" id="charge-cash" value="0"> -->
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="charge-cancel" class="btn btn-primary">Cancel</button>
				<button type="button" id="charge-done" class="btn btn-primary">Confirm</button>
			</div>
		</div>
	</div>
</div>