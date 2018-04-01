<!-- begin form save -->
	<div class="modal fade" id="modal-add-item" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					
					<button type="button" class="close modalcancel" data-dismiss="modal">&times;</button>
					<h4 id="judul-modal">Create Supplier</h4>
				</div>
				<div class="modal-body">
					<form id="form-add-item" data-parsley-validate method="post">
					
					<div>
						<input class="form-control" type="text" id="search-item" placeholder="Item Name - Variant Name">
					</div><br/>
				
					<div>	
					<table class="table table-striped table-bordered">
					<thead>
					<tr>
						<td>Item</td>
						<td>In Stock</td>
						<td>Adj Quantity</td>
					</tr>
					</thead>
					
					<tbody>
						<c:forEach items="${inventories }" var="invent">
						<tr>
							<td>${invent.itemVariant.item.name } - ${invent.itemVariant.name }</td>
							<td>${invent.endingQty }</td>
							<td><input class="form-control" type="text" id="input-adjustment"></td>
						</tr>
						</c:forEach>
					</tbody>	
					</table>
					</div>
					
					
					<div class="row">
						<div class="col-xs-3" style="float:left">
							<input type="button" class="cancel btn btn-info btn-block" value="cancel">
						</div>
						
						<div class="col-xs-3" style="float:right">
							<input type="button" class="add btn btn-info btn-block" value="add">
						</div>
					</div>
							
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-info" id="tbl-simpan">Save</button>
				</div>
			</div>

		</div>
	</div>
<!-- end form save -->