<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="edititem-modal-add-variant" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Add Variant</h5>
			</div>
			<div class="modal-body">
				<form class="form-all" style="border:none" id="form-edititem-variant-add-data">
					<div class="form-group" align="left" style="float:left;width:33%">
						<input type="text" placeholder="Variant Name" 
							 id="edititem-add-variant-name" data-parsley-required="true" data-required-message="Please insert your name" required>
					</div>
					
					<div class="form-group" style="float:left ;width:33%">
					<input type="text" placeholder="Unit Price" id="edititem-add-unit-price" required>
					</div>
					
					<div class="form-group" style="float:left;width:33%">
					<input type="text" placeholder="SKU"
							 id="edititem-add-sku" data-parsley-required="true" required>
					</div>

					<label for="input-variant-name">Set Beginning Stock</label> 					
					<div class="form-group">
						<div style="float:left;width:33%">
							<input placeholder="Beginning Stock" type="number" id="edititem-add-beginning-stock" data-parsley-required="true" required>
						</div>
						
						<div style="float:left;width:33%">
							<input placeholder="Alert At" type="number" id="edititem-add-alert-at" data-parsley-required="true" required>
						</div>
					</div> <br/>
					
					
					<div class="checkbox" style="display:none">
						<label for="add-active"><input id="edititem-add-active-variant" type="checkbox"
							value="true">Active</label>
					</div> 


					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
						<button type="button" id="edititem-btn-add-data-variant" class="btn btn-primary">Add</button>
					</div>
				</form>



			</div>

		</div>
	</div>
</div>

