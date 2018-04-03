<!-- begin form save -->
	<div class="modal fade" id="modal-create" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					
					<button type="button" class="close modalcancel" data-dismiss="modal">&times;</button>
					<h4 id="judul-modal">Create Supplier</h4>
				</div>
				
				<form id="formdepartemen" data-parsley-validate method="post">
				<div class="modal-body">
					
					
						<div>
							<div><h5>Supplier Name</h5></div>
							<div ><input type="text" class="form-control full-span" id="supplier-name" data-parsley-required="true" /></div>
							<input type="hidden" name="id" id="id">
						</div>
						
						<div>
							<div><h5>Supplier Address</h5></div>
							<div >
							<textarea class="form-control" rows="3" id="supplier-address"></textarea>
							</div>
							<input type="hidden" name="id" id="id">
						</div>
						
						<div class="row">
							<div class="col-xs-4"><h5>Phone</h5></div>
							<div class="col-xs-4"><h5>Email</h5></div>
							<div class="col-xs-3"><h5>Postel Code</h5></div>
						</div>
						<div class="row">
							<div class="col-xs-4"><input type="text" name="supplier-phone" id="supplier-phone" data-parsley-required="true" /></div>
							<div class="col-xs-4"><input type="text" name="supplier-email" id="supplier-email" data-parsley-required="true" placeholder="rama@gmail.com" /></div>
							<div class="col-xs-3"><input type="text" name="supplier-postal" id="supplier-postal" data-parsley-required="true" placeholder="max six characters" /></div>
						</div>
						
						<div class="row">
							<div class="col-xs-4"><h5>Province</h5></div>
							<div class="col-xs-4"><h5>Region</h5></div>
							<div class="col-xs-3"><h5>District</h5></div>
						</div>
						
						<div class="row">
						<div class="col-xs-4">
						<select name="area" required="required" id="prov-id">
    					<option disabled selected value=""> --- Select A Province --- </option>
    					<c:forEach var="prov" items="${provinces }">
    						<option value="${prov.id }">${prov.name }</option>
    					</c:forEach>
						</select>
						</div>
						
						<div class="col-xs-4">
						<select name="area" required="required" id="reg-id">
    						<option disabled selected value=""> --- Select A Region --- </option>
						</select>
						</div>
						
						<div class="col-xs-3">
						<select name="area" required="required" id="dist-id">
    						<option disabled selected value=""> --- Select A District --- </option>
						</select>
						</div>
						
						</div>
						<input type="hidden" name="id" id="id">
						
						
						
				</div>
				<div class="modal-footer">
				<div class="row">
						<div class="form-group" style="float:left; margin-left:20px;">
							<button type="reset" class="btn btn-danger" id="tbl-reset">Cancel</button>
						</div>
						<div class="form-group" style="float:right; margin-right:20px;">
							<button type="button" class="btn btn-info" id="tbl-simpan">Save</button>
						</div>
				</div>
				</div>
				</form>
			</div>

		</div>
	</div>
<!-- end form save -->