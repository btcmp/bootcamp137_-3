<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="modal fade" id="modal-add-variant" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header" align="center">
				<h5 class="modal-title" id="exampleModalLabel">Add Variant</h5>
			</div>
			<div class="modal-body">
				<form class="form-all" id="form-add-varian-data">
					<div class="form-group" align="left" style="float:left;width:33%">
						<input type="text" placeholder="Variant Name" 
							 id="add-variant-name" data-parsley-required="true" data-required-message="Please insert your name" required>
					</div>
					
					<div class="form-group" style="float:left ;width:33%">
					<input type="number" placeholder="Unit Price" id="add-unit-price" required=""></span>
					
					<!-- 	<label for="input-variant-name">Unit Price</label>  -->
<!-- 						<span class="currencyinput" style="border: 1px inset #ccc">$<input style="border: 0" type="number" class="form-control" id="add-unit-price"></span>
 -->					</div>
					
					<div class="form-group" style="float:left;width:33%">
					<input type="text" placeholder="SKU"
							 id="add-sku" data-parsley-required="true" required>
					</div>

					<label for="input-variant-name">Set Beginning Stock</label> 					
					<div class="form-group">
						<div style="float:left;width:33%">
							<input placeholder="Beginning Stock" type="number" id="add-beginning-stock" data-parsley-required="true" required>
						</div>
						
						<div style="float:left;width:33%">
							<input placeholder="Alert At" type="number" id="add-alert-at" data-parsley-required="true" required>
						</div>
					</div> <br/>
					
					
					<div class="checkbox" style="display:none">
						<label for="add-active"><input id="add-active-variant" type="checkbox"
							value="true">Active</label>
					</div> 

					<div class="modal-footer">
						<button type="button" id="btn-add-data-variant" class="btn btn-primary">Add</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
					</div>
				</form>



			</div>

		</div>
	</div>
</div>

