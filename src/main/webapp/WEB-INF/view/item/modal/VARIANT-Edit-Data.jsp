<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="modal-edit-variant" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 align="center" class="modal-title" id="exampleModalLabel">Edit Variant</h5>
				
			</div>
			<div class="modal-body">
				<form class="form-all" id="form-variant-edit-data" style="border:none">				
					<!-- aaadddddddddddddddddddddddddddddddddd -->
					<div class="form-group" align="left" style="float:left;width:33%">
					<label>Variant Name</label>
						<input type="text" placeholder="Variant Name" 
							 id="edit-variant-name" disabled>
					</div>
					
					<div class="form-group" style="float:left ;width:33%">
					<label>Unit Price</label>
					<input type="number" placeholder="Unit Price" id="edit-unit-price" required>
					</div>
					
					<label>SKU</label>
					<div id="div-edit-sku" class="form-group" style="float:left;width:33%">
					<input type="text" placeholder="SKU"
							 id="edit-sku" disabled>
<!-- 					<label style="display:none" class="control-label" id="lbl-edit-sku"><i class="fa fa-check"></i></label>
 -->					</div>
				
					<div class="form-group">

						<div style="float:left;width:33%">
							<label>Beginning Stock</label>
							<input placeholder="Beginning Stock" type="number" id="edit-beginning-stock" disabled>
						</div>
						
						<div style="float:left;width:33%">
						<label>Alert at</label>
							<input placeholder="Alert At" max="document.getElementById('edit-beginning-stock').value" type="number" id="edit-alert-at" data-parsley-required="true" required>
						</div>
					</div> 
					
					<div style="clear: both	"></div>	
					
					
					<div class="checkbox" style="display:none" >
						<label for="edit-active"><input id="edit-active-variant" type="checkbox"
							value="true">Active</label>
					</div>
					
					<input type="hidden" id="id-item-hidden-variant-edit" class="form-control">

					<div class="modal-footer">
						<button type="button" id="btn-close" class="btn btn-primary" data-dismiss="modal">Cancel</button>
						<button type="submit" id="btn-edit-save-variant" class="btn btn-primary">Save</button>
					</div>
				</form>



			</div>

		</div>
	</div>
</div>

