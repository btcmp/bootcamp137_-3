 <!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="edit-itm" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 align="center" class="modal-title" id="exampleModalLabel">Edit Item Master</h5>
			</div>
			<div class="modal-body">
			<input type="hidden" id="edit-item-input-id" class="form-control">			
				<form style="border:none" class="form-all" id="form-main-edit-data">
					<div class="form-group">
						<label for="input-item-name">Item Name</label> <input type="text" 
							class="form-control" id="edititem-item-name" placeholder="enter item name" data-parsley-required="true" required>
							<input type="text" style="display:none"
							class="form-control" id="outlet-id" placeholder="enter item name">
					</div>

					<div class="form-group">
						<label for="input-region">Category</label> <select
							class=form-control id="edititem-category">
							<c:forEach var="ctg" items="${categories}">
								<option value="${ctg.id}">${ctg.name}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label for="input-active">Deactive Item</label>
						<form id="input-active-edititem">
							<input name="selector[]" id="edititem-checkbox" class="ads_Checkbox"
								type="checkbox" value="false" > </input> 
						</form>
					</div>
					
					<div style="float:left"> 
						<br/> <label for="input-active">Variant List</label>	
					 </div>
					 
					 <div style="float:right"> 
					 	<button type="submit" id="edititem-btn-add-variant" class="btn btn-primary">Add Variant</button>
					 </div>	
					
					<table id="dt-popup-edit" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>Variant Name</th>
								<th>Unit Price</th>
								<th>SKU</th>
								<th>Begining Stock</th>
								<th style="display:none">Alert At</th>
								<th style="display:none">Active</th>
								<th style="display:none">Variant ID</th>
								<th style="display:none">Inventory ID</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody id="isi-popup-edit">
							
						</tbody>
					</table>


					<div class="modal-footer">
						<button type="button" id=btn-back-edit class="btn btn-primary" data-dismiss="modal">Back</button>
						<button type="submit" id="edititem-btn-cancel" class="btn btn-primary">Cancel</button>
						<button type="submit" id="edititem-btn-create-data" class="btn btn-primary">Save</button>
					</div>
				</form>
			</div>

		</div>
	</div>
</div>

 