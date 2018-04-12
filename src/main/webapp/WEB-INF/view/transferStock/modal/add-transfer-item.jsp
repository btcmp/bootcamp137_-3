<!-- aModal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="modal-add-transfer-item" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 align="center" class="modal-title" id="exampleModalLabel">Add Transfer Item</h5>
			</div>
			<div class="modal-body">
				<form class="form-all" id="form-add-transfer-item" style="border:none">
				
				<div class="row" id="div-alert-add-transfer-item" style="display:none">
					<div class="col-xs-12">
						<div id="tampilan-alert-add-transfer-item" class="alert alert-sukses" role="alert">
							<strong>Sukses!</strong> Data Berhasil Disimpan.
						</div>
					</div>
				</div>
				
				<div>
					<span><input class="form-control" type="text" id="search-item" placeholder="Search Item"/></span>
				</div>
						        			
					<table id="data-popup-add-transfer-stock" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>	
								<th>Item</th>
								<th>In Stock</th>
								<th>Trans. Qty</th>
								<th style="display : none">ID VARIANT</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody id="isi-popup-transfer-stock">		
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
						<button type="button" id="cancel-add-transfer-item" class="btn btn-primary">Cancel</button>
						<button type="submit" id="btn-save-transfer-item" class="btn btn-primary">Add</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

