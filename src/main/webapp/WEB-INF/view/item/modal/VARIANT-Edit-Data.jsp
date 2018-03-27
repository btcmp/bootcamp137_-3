<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="modal-edit-variant" tabindex="-1" role="dialog"
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
						<label for="input-variant-name">Variant Namee</label> <input type="text"
							class="form-control" id="edit-variant-name" disabled>
					</div>
					
					<div class="form-group">
						<label for="input-variant-name">Unit Price</label> <input type="text"
							class="form-control" id="edit-unit-price" >
					</div>
					
					<div class="form-group">
						<label for="input-variant-name">SKU</label> <input type="text"
							class="form-control" id="edit-sku" disabled>
					</div>
					
					<div class="form-group">
						<label for="input-variant-name">Beginning Stock</label> <input type="text"
							class="form-control" id="edit-beginning-stock" disabled>
					</div>
					
						<div class="form-group">
						<label for="input-variant-name">Alert at</label> <input type="text"
							class="form-control" id="edit-alert-at">
					</div>
					
					<div class="checkbox" style="display:none" >
						<label for="edit-active"><input id="edit-active-variant" type="checkbox"
							value="true">Active</label>
					</div>
					
					<input type="hidden" id="id-item-hidden-variant-edit" class="form-control">

					<div class="modal-footer">
						<button type="button" id="btn-close" class="btn btn-primary" data-dismiss="modal">Cancel</button>
						<button type="submit" id="btn-edit-save-variant" class="btn btn-primary" data-dismiss="modal">Add</button>
					</div>
				</form>



			</div>

		</div>
	</div>
</div>

