<!-- begin form save -->
	<div class="modal fade" id="modal-create" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					
					<button type="button" class="close modal cancel" data-dismiss="modal">&times;</button>
					<h4 id="judul-modal">Create Adjustment</h4>
				</div>
				<div class="modal-body">
					<form id="formdepartemen" data-parsley-validate method="post">
						
						
							<div class="form-group">
								CREATE NEW ADJUSTMENT <a href="">Outlet Login</a>
								<hr style="border-color:black; border-top:1px dashed;">
							</div>
							
							<div id="outlet" style="display:none">
								<div class="form-group">
									<label for="input-region">Choose Outlet</label>
									<select class="form-control" id="outlet-list">
									<c:forEach items="${outlets }" var="out">
										<option value="${out.id }">${out.name }</option>
									</c:forEach>
									</select>
								</div>
							</div>
							
							<div id="list-outlet">
								
							</div>
							
							<div class="form-group">
								<p>Notes</p>
								<textarea id="adj-notes" rows="4" cols="75" name="comment" form="usrform"></textarea>
							</div>
							
							<div style="float:left">
								<label>Adjustment Stock</label>
							</div><br/>
							<hr style="border-color:black; border-top:1px dashed">
							
							<div id="item-table">
							
								<%-- <table class="table table-striped table-bordered">
								<thead>
								<tr>
									<th>Item</th>
									<th>In Stock</th>
									<th>Adj Quantity</th>
									<th>#</th>
								</tr>
								</thead>
								
								<tbody id="isi-inventory">
								
								 <c:forEach items="adjDetails" var="adj">
									<tr>
										<td></td>
										<td>${adj.notes }</td>
										<td>${adj.status }</td>
										<td><input type="button" id="${adj.id }" data-parsley-required="true" />X</td>
									</tr>
								</c:forEach>		
														
								</tbody>
								
								</table> --%>
								
							</div>
						<div>
							<a type="submit" class="btn btn-primary btn-block" id="add-item">Add Item</a> <br/>
						</div>
				</div>
				
				<div class="modal-footer">
					
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-info" id="tbl-simpan">Save & Submit</button>
				</div>
				
				</form>
				
			</div>

		</div>
	</div>
<!-- end form save -->