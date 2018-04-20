<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="edititem-modal-edit-variant" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel" align="center">Edit Variant</h5>
			</div>
			<div class="modal-body">
				<form style="border:none" class="form-all" id="form-edititem-variant-edit-data">	
					<!-- ZZZZZZZZZZZZZZZZZZZZ -->
					
					<div class="form-group" align="left" style="float:left;width:33%">
					<label>Variant Name</label>
						<input type="text" placeholder="Variant Name" 
							 id="edititem-edit-variant-name" data-parsley-required="true" data-required-message="Please insert your name" required>
					</div>
					
					<div class="form-group" style="float:left ;width:33%">
					<label>Unit Price</label>
					<input type="text" placeholder="Unit Price" id="edititem-edit-unit-price" required>
					</div>
					
					<div class="form-group" style="float:left;width:33%">
					<label>SKU</label>
					<input type="text" placeholder="SKU"
							 id="edititem-edit-sku" data-parsley-required="true" required>
					</div>
					
					<div style="clear:both"></div>

					<div class="form-group">

						<div style="float:left;width:33%">
							<label>Beginning Stock</label>
							<input placeholder="Beginning Stock" type="number" id="edititem-edit-beginning-stock" data-parsley-required="true" required>
						</div>
						
						<div style="float:left;width:33%">
						<label>Alert at</label>
							<input placeholder="Alert At" type="number" id="edititem-edit-alert-at" data-parsley-required="true" required>
						</div>
					</div>
					
					<div style="clear: both	"></div>	
		
					<div class="checkbox" style="display:none">
						<label for="add-active"><input id="edititem-edit-active-variant" type="checkbox"
							value="true">Active</label>
					</div> 
							
					<input type="hidden" id="variant-id" class="form-control">
					<input type="hidden" id="inventory-id" class="form-control">
					<input type="hidden" id="id-item-hidden" class="form-control">	
					<input type="hidden" id="ending-qty" class="form-control">	

					<div class="modal-footer">
						<button type="button" id="edititem-btn-close" class="btn btn-primary" data-dismiss="modal">Cancel</button>
						<button type="submit" id="edititem-btn-save-variant" class="btn btn-primary">Save</button>
					</div>
				</form>



			</div>

		</div>
	</div>
</div>

