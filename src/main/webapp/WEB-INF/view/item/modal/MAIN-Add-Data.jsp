<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="modal fade" id="modal-create-data" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Item</h5>
			</div>
			<div class="modal-body">
				<form id="form-add-data" class="form-all">
						        			
					<div class="form-group">
						<label for="input-item-name">Item Name</label> <input type="text"
							class="form-control" id="add-item-name" placeholder="enter item name" data-parsley-required="true" required>
					</div>

					<div class="form-group">
						<label for="input-region">Category</label> <select
							class=form-control id="add-category">
							<c:forEach var="ctg" items="${categories}">
								<option value="${ctg.id}">${ctg.name}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group" style="display:none" >
						<label for="input-active">Active</label>
						<form id="input-active-add">
							<input name="selector[]" id=add-checkbox" class="ads_Checkbox"
								type="checkbox" value="true"> </input> 
						</form>
					</div>
					
					<br/>
					<div style="float:left"> 
						<br/> <label for="input-active">VARIANT</label>	
					 </div>
					 
					 <div style="float:right"> 
					 	<button type="submit" id="btn-add-variant" class="btn btn-primary">Add Variant</button>
					 </div>		
					<table id="dt-popup-item" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>Variant Name</th>
								<th>Unit Price</th>
								<th>SKU</th>
								<th>Beginning Stock</th>
								<th style="display:none">Alert At</th>
								<th style="display:none">Active</th>
								<th>#</th>
							</tr>
						</thead>
						<tbody id="isi-popup-itm">
							
					<%-- 		<c:forEach items="${itemInventories}" var="invent">
								<tr>
									<td>${invent.itemVariant.name}</td>
									<td>${invent.itemVariant.price}</td>
									<td>${invent.itemVariant.sku}</td>
									<td>${invent.beginning}</td>
									<td><a href="#">Edit</a>
									<a href="#">X</a></td>
									</td>
								</tr>
							</c:forEach>  --%>
						</tbody>
					</table>

					<div class="modal-footer">
						
						<button type="button" class="btn btn-primary" data-dismiss="modal">Back</button>
						<button type="submit" id="btn-cancel" class="btn btn-primary">Cancel</button>
						<button type="submit" value="validate" id="btn-create-data" class="btn btn-primary">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
