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
						        
					<div style="float:left;width:20%" >
						<img src="data:image/jpeg;base64,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" alt="mountain view">
					</div>	        	
						        			
					<div class="form-group" style="float:left;width:80%">
						<label for="input-item-name">Item Name</label> <input type="text"
							class="form-control" id="add-item-name" placeholder="enter item name" data-parsley-required="true" required>
					
						<label for="input-region">Category</label> <select
							class=form-control id="add-category">
							<c:forEach var="ctg" items="${categories}">
								<option value="${ctg.id}">${ctg.name}</option>
							</c:forEach>
						</select>
					</div>
					
						<div style="clear: both	"></div>	

					

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
