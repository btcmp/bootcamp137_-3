<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal fade" id="modal-view-transfer-stock-detail" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<div style="float : left ; margin-right : 340px" >
					<h5 class="modal-title" id="exampleModalLabel">Transfer Stock Detail</h5>
				</div>
				
				<div class="form-group" style="float : left" >
					<select name="more" id="more-option">
					</select>
				</div>
			
			</div>
			
			
				
			<div class="modal-body">
			
			<div>
			<input type="hidden" id="hidden-id">
				<input type="hidden" id="hidden-outlet-id">
				<input type="hidden" id="hidden-from-outlet-id">
			
			<div>
				<table>
					<tr><td id="created-by"></td></tr>
					<tr><td id="transfer-status"></td></tr>
				</table>
			</div> 
			
			<div>Notes : </div>
			<input type="text" class="form-control" id="notes" disabled>
			</div> <br/>
			
			<div> Status History
				<table id="status-history">
					<tbody id="view-status-history"></tbody>
				</table>	
			</div>
			
			<br/> 	
				<label>Transfer Item</label>      			
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
					
					<div style="display:none">
					<table id="data-hidden-inventory" class="table table-striped table-bordered table-hover" >
						<thead>
							<tr>	
								<th>ID</th>
							</tr>
						</thead>
						<tbody id="isi-hidden-id">		
							<%-- <c:forEach items="${transferStockDetails}" var="tsdetail">
								<tr>
									<td>${tsdetail.itemVariant.item.name} - ${tsdetail.itemVariant.name}</td>
									<td>${tsdetail.inStock}</td>
									<td>${tsdetail.transferQty}</td>
								</tr>
							</c:forEach>z   --%>
						</tbody>
					</table>
					
					
					</div>
			</div>
			
			<div class="modal-footer">
						<button type="button" id="back-view-transfer-stock" class="btn btn-primary" data-dismiss="modal">Back</button>
					</div>	
			
		</div>
	</div>
</div>

