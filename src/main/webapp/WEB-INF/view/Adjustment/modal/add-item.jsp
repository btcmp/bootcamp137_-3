<!-- begin form save -->
	<div class="modal fade" id="modal-add-item" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					
					<button type="button" class="close modalcancel" data-dismiss="modal">&times;</button>
					<h4 id="judul-modal">Add Item</h4>
				</div>
				<div class="modal-body">
					<form id="form-add-item" data-parsley-validate method="post">
					
					<div>
						<input class="form-control" type="text" id="search-item" placeholder="Search Item Name - Variant Name">
					</div><br/>
				
					<div>	
					<table class="table table-striped table-bordered">
					<thead>
					<tr>
						<td>Item</td>
						<td>In Stock</td>
						<td>Adj Quantity</td>
						<td>#</td>
					</tr>
					</thead>
					
					<tbody id="data-item">
						<c:forEach items="${inventories }" var="invent">
						<tr>
							<td class="item-name-${invent.id }">${invent.itemVariant.item.name } - ${invent.itemVariant.name }</td>
							<td class="in-stock-${invent.id }">${invent.endingQty }</td>
							<td><input id="${invent.id }" class="form-control adj-quantity-${invent.id }" type="number" value="1"></td>
							<td align="center"><a href="#" id="${invent.id }" class="save-item-${invent.id } btn-save-item">SAVE</a> <a href="#" class="saved-item-${invent.id } btn-saved-item" style="display: none;">SAVED</a></td>
						</tr>
						</c:forEach>
					</tbody>	
					</table>
					</div>
							
					</form>
				</div>
				<div class="modal-footer">
					<div class="row">
						<div class="col-xs-3" style="float:left">
							<input type="button" class="cancel btn btn-info btn-block" value="cancel">
						</div>
						
						<div class="col-xs-3" style="float:right">
							<input type="button" class="btn btn-info btn-block" id="btn-add-item" value="add">
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
<!-- end form save -->