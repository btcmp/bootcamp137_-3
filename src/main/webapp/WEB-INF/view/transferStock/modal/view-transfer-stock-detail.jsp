<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="modal-view-transfer-stock-detail" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header" style="float : left">
				<h5 class="modal-title" id="exampleModalLabel">Transfer Stock Detail</h5>
			</div>
			
			<div class="form-group style="float left">
					<select name="more" id="more-option">
					</select>
			</div>
				
			<div class="modal-body">
			
			<div>
			<input type="hidden" id="hidden-id">
			<div>Created By : <input type="text" class="form-control" id="created-by" disabled>  </div> 
			<div>Transfer Status : <input type="text" class="form-control" id="transfer-status" disabled> </div> 
			<div>Notes: </div>
			<input type="text"
							class="form-control" id="notes" disabled>
			
			</div>
			
				<form class="form-all">
				
						        			
					<table id="data-transfer-stock-detail" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>	
								<th>Item</th>
								<th>In Stock</th>
								<th>Trans. Qty</th>
							</tr>
						</thead>
						<tbody id="isi-transfer-stock-detail">		
							<%-- <c:forEach items="${transferStockDetails}" var="tsdetail">
								<tr>
									<td>${tsdetail.itemVariant.item.name} - ${tsdetail.itemVariant.name}</td>
									<td>${tsdetail.inStock}</td>
									<td>${tsdetail.transferQty}</td>
								</tr>
							</c:forEach>   --%>
						</tbody>
					</table>

					<div class="modal-footer">
						<button type="submit" id="btn-done" class="btn btn-primary">Add</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

