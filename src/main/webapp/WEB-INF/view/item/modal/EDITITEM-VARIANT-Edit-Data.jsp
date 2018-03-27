<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="edititem-modal-edit-variant" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Edit Variant</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form class="form-all">
					<div class="form-group">
						<label for="input-variant-name">Variant Namee</label> <input type="text"
							class="form-control" id="edititem-edit-variant-name">
					</div>
					
					<div class="form-group">
						<label for="input-variant-name">Unit Price</label> <input type="text"
							class="form-control" id="edititem-edit-unit-price">
					</div>
					
					<div class="form-group">
						<label for="input-variant-name">SKU</label> <input type="text"
							class="form-control" id="edititem-edit-sku">
					</div>
					
					<div class="form-group">
						<label for="input-variant-name">Beginning Stock</label> <input type="text"
							class="form-control" id="edititem-edit-beginning-stock">
					</div>
					
						<div class="form-group">
						<label for="input-variant-name">Alert at</label> <input type="text"
							class="form-control" id="edititem-edit-alert-at">
					</div>
					
					<div class="checkbox">
						<label for="edit-active"><input id="edititem-edit-active-variant" type="checkbox"
							value="true">Active</label>
					</div>
					
					<input type="hidden" id="variant-id" class="form-control">
					<input type="hidden" id="inventory-id" class="form-control">
					<input type="hidden" id="id-item-hidden" class="form-control">		

					<div class="modal-footer">
						<button type="button" id="edititem-btn-close" class="btn btn-primary">Cancel</button>
						<button type="submit" id="edititem-btn-save-variant" class="btn btn-primary"  data-dismiss="modal">Add</button>
					</div>
				</form>



			</div>

		</div>
	</div>
</div>

