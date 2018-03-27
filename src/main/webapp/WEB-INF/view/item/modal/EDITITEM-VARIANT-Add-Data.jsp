<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="edititem-modal-add-variant" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Add Variant</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form class="form-all">
					<div class="form-group">
						<label for="input-variant-name">Variant Name</label> <input type="text"
							class="form-control" id="edititem-add-variant-name">
					</div>
					
					<div class="form-group">
						<label for="input-variant-name">Unit Price</label> <input type="text"
							class="form-control" id="edititem-add-unit-price">
					</div>
					
					<div class="form-group">
						<label for="input-variant-name">SKU</label> <input type="text"
							class="form-control" id="edititem-add-sku">
					</div>
					
					<div class="form-group">
						<label for="input-variant-name">Beginning Stock</label> <input type="text"
							class="form-control" id="edititem-add-beginning-stock">
					</div>
					
						<div class="form-group">
						<label for="input-variant-name">Alert at</label> <input type="text"
							class="form-control" id="edititem-add-alert-at">
					</div>
					
					<div class="checkbox">
						<label for="add-active"><input id="edititem-add-active-variant" type="checkbox"
							value="true">Active</label>
					</div>

					<div class="modal-footer">
						<button type="button" id="edititem-btn-add-data-variant" class="btn btn-primary" data-dismiss="modal">Add</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
					</div>
				</form>



			</div>

		</div>
	</div>
</div>

