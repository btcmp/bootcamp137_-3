<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="modal fade" id="modal-add-variant" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header" align="center">
				<h5 class="modal-title" id="exampleModalLabel">Add Variant</h5>
			</div>
			<div class="modal-body">
				<form style="border:none" class="form-all" id="form-add-varian-data">
					<div class="form-group" align="left" style="float:left;width:30%;margin-right:3%">
						<input  class="form-control"type="text" placeholder="Variant Name" 
							 id="add-variant-name" data-parsley-required-message="Please insert the variant name"
							data-parsley-required>
					</div>
					
					<div class="form-group" style="float:left ;width:30%;margin-right:3%">
					<input class="form-control" type="number" placeholder="Unit Price" id="add-unit-price" data-parsley-required-message="Please insert the unit price"
							data-parsley-required min="1"></span>					
					
					<!-- 	<label for="input-variant-name">Unit Price</label>  -->
<!-- 						<span class="currencyinput" style="border: 1px inset #ccc">$<input style="border: 0" type="number" class="form-control" id="add-unit-price"></span>
 -->					</div>
					
					<div id="div-add-sku" class="form-group" style="float:left;width:30%;margin-right:3%">
					<input class="form-control" type="text" placeholder="SKU" id="add-sku" data-parsley-required-message="Please insert the SKU"
							data-parsley-required>
					<label style="display:none"  class="control-label" for="in-sku"id="lbl-sku"><i class="fa fa-check"></i></label>
					</div>
					
					<div style="clear:both"></div>
					
					<div>										
						<label for="input-variant-name">Set Beginning Stock</label> 					
					</div>
					
					<div class="form-group">
						<div style="float:left;width:30%;margin-right:3%">
							<input id="add-beginning-stock" class="form-control" min="1" onchange="document.getElementById('add-alert-at').max=this.value;" placeholder="Beginning Stock" type="number"  data-parsley-required-message="Please insert the beginning stock"
							data-parsley-required>
						</div>
						
						<div style="float:left;width:30%;margin-right:3%">
							<input id="add-alert-at" class="form-control" min="1" max="document.getElementById('add-beginning-stock').value" placeholder="Alert At" type="number" data-parsley-required-message="Please insert the alert at quantity"
							data-parsley-required>
						</div>
					</div> <br/>
					
					
					<div class="checkbox" style="display:none">
						<label for="add-active"><input id="add-active-variant" type="checkbox"
							value="true">Active</label>
					</div> 

					<div class="modal-footer">
						<button type="button" id="btn-add-data-variant" class="btn btn-primary">Add</button>
						<button type="button" class="btn btn-primary" id="btn-cancel-add-variant">Cancel</button>
					</div>
				</form>



			</div>

		</div>
	</div>
</div>

