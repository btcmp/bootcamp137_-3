<!-- begin form save -->
	<div class="modal fade" id="modal-edit" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<div class="alert alert-sukses" role="alert" id="edit-alert" style="display:none"></div>
					<button type="button" class="close modalcancel" data-dismiss="modal">&times;</button>
					<h4 id="judul-modal">Edit Outlet</h4>
				</div>
				
				
				
				<div class="modal-body">
					<form id="formdepartemen" data-parsley-validate method="post">
						<div id="validasi-edit-name" class="form-group">
							<div><h5>Outlet Name</h5></div>
							<label class="control-label" style="display:none" id="label-edit-name"><i class="fa fa-check"></i></label>
							<div ><input type="text" class="form-control full-span" id="edit-name" data-parsley-required="true" /></div>
						</div>
						
						<div id="validasi-edit-addr" class="form-group">
							<div><h5>Outlet Address</h5></div>
							<label class="control-label" style="display:none" id="label-edit-address"><i class="fa fa-check"></i></label>
							<div>
							<textarea class="form-control" rows="3" id="edit-address"></textarea>
							</div>
						</div>
						
						<div class="row">
							<div class="col-xs-4"><h5>Phone</h5></div>
							<div class="col-xs-4"><h5>Email</h5></div>
							<div class="col-xs-3"><h5>Postel Code</h5></div>
						</div>
						<div class="row">
							<div class="col-xs-4 form-group" id="validasi-edit-phone">
							<label class="control-label" style="display:none" id="label-edit-phone"><i class="fa fa-check"></i></label>
								<div >
									<input type="text" class="form-control" id="edit-phone" data-parsley-required="true" />
								</div>
							</div>
							
							<div class="col-xs-4 form-group" id="validasi-edit-email">
							<label class="control-label" style="display:none" id="label-edit-email"><i class="fa fa-check"></i></label>
								<div >
									<input type="text" class="form-control" id="edit-email" data-parsley-required="true" />
								</div>
							</div>
							
							<div class="col-xs-4 form-group" id="validasi-edit-postal">
							<label class="control-label" style="display:none" id="label-edit-postal"><i class="fa fa-check"></i></label>
								<div >
									<input type="text" class="form-control"  id="edit-postal" data-parsley-required="true" />
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-xs-4"><label style="color: red; font:small-caption;">*must number</label></div>
							<div class="col-xs-4"><label style="color: red; font:small-caption;">*ex: rama@gmail.com</label></div>
							<div class="col-xs-3"><label style="color: red; font:small-caption;">*max 6 characters</label></div>
						</div>
						
						<div class="row">
							<div class="col-xs-4"><h5>Province</h5></div>
							<div class="col-xs-4"><h5>Region</h5></div>
							<div class="col-xs-3"><h5>District</h5></div>
						</div>
						
						<div class="row">
							<div class="col-xs-4 form-group" id="validasi-edit-prov">
							<label class="control-label" style="display:none" id="label-edit-prov"><i class="fa fa-check"></i></label>
								<select class="form-control" name="area" required="required" id="prov-edit">
    							<option disabled selected value="">Select A Province</option>
    							<c:forEach var="prov" items="${provinces }">
    								<option value="${prov.id }">${prov.name }</option>
    							</c:forEach>
								</select>
							</div>
						
							<div class="col-xs-4 form-group" id="validasi-edit-reg">
							<label class="control-label" style="display:none" id="label-edit-reg"><i class="fa fa-check"></i></label>
							<select class="form-control" name="area" required="required" id="reg-edit">
    							<option disabled selected value="">Select A Region</option>
							</select>
							</div>
						
							<div class="col-xs-4 form-group" id="validasi-edit-dist">
							<label class="control-label" style="display:none" id="label-edit-dist"><i class="fa fa-check"></i></label>
							<select class="form-control" name="area" required="required" id="dist-edit">
    							<option disabled selected value="">Select A District</option>
							</select>
							</div>
						</div>
						
						<input type="hidden" name="id" id="edit-id">
						</form>
				</div>
				
				<div class="modal-footer">
					<div class="row">
						<div class="form-group" style="float:left; margin-left:20px;">
							<button type="button" class="btn btn-danger" id="tbl-delete">X</button>
						</div>
						<div class="form-group" style="float:left; margin-left:350px;">
							<button type="button" class="btn btn-warning" id="tbl-cancel">Cancel</button>
						</div>
						<div class="form-group" style="float:right; margin-right:20px;">
							<button type="button" class="btn btn-info" id="tbl-edit">Save</button>
						</div>
					</div>
				</div>	
				
				
			</div>

		</div>
	</div>
<!-- end form save -->