<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	.currencyinput {
    border: 0px inset #ccc;
}
.currencyinput input {
    border: 2;
}
</style>

<div class="modal fade" id="modal-add-variant" tabindex="-1" role="dialog"
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
				<form class="form-all" id="form-add-varian-data">
					<div class="form-group">
						<label for="input-variant-name">Variant Name</label> <input type="text"
							class="form-control" id="add-variant-name" data-parsley-required="true" required>
					</div>
					
					<div class="form-group">
					<label for="input-variant-name">Unit Price</label> <br/>
					<span class="currencyinput">IDR <input type="number" name="currency" id="add-unit-price" data-parsley-required="true" required></span>
					
					<!-- 	<label for="input-variant-name">Unit Price</label>  -->
<!-- 						<span class="currencyinput" style="border: 1px inset #ccc">$<input style="border: 0" type="number" class="form-control" id="add-unit-price"></span>
 -->					</div>
					
					<div class="form-group">
						<label for="input-variant-name">SKU</label> <input type="text"
							class="form-control" id="add-sku" data-parsley-required="true" required>
					</div>
					
					<div class="form-group">
						<label for="input-variant-name">Beginning Stock</label> <input type="number"
							class="form-control" id="add-beginning-stock" data-parsley-required="true" required>
					</div>
					
						<div class="form-group">
						<label for="input-variant-name">Alert at</label> <input type="number"
							class="form-control" id="add-alert-at" data-parsley-required="true" required>
					</div>
					
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

