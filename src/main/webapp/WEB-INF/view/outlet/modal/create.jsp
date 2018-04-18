<!-- begin form save -->
	<div class="modal fade" id="modal-create" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<div class="alert alert-sukses" role="alert" id="create-alert" style="display:none"></div>
					<button type="button" class="close modalcancel" data-dismiss="modal">&times;</button>
					<h4 id="judul-modal">Create Outlet</h4>
				</div>
				
				<div class="modal-body">
					<form id="formdepartemen" data-parsley-validate method="post">
						<div id="validasi-name" class="form-group">
							<div><h5>Outlet Name<label style="color: red; font:small-caption;">*</label></h5></div>
							<label class="control-label" for="outlet-name" style="display:none" id="label-name"><i class="fa fa-check"></i></label>
							<div ><input type="text" class="form-control full-span" id="outlet-name" data-parsley-required="true" /></div>
						</div>
						
						<div id="validasi-addr" class="form-group">
							<div><h5>Outlet Address</h5></div>
							<label class="control-label" style="display:none" id="label-address"><i class="fa fa-check"></i></label>
							<div >
							<textarea class="form-control" rows="3" id="outlet-address"></textarea>
							</div>
						</div>
						
						<div class="row">
							<div class="col-xs-4"><h5>Phone</h5></div>
							<div class="col-xs-4"><h5>Email</h5></div>
							<div class="col-xs-3"><h5>Postel Code</h5></div>
						</div>
						
						<div class="row ">
							<div class="col-xs-4 form-group"" id="validasi-phone">
								<label class="control-label" style="display:none" id="label-phone"><i class="fa fa-check"></i></label>
								<div >
									<input type="text" class="form-control" name="outlet-phone" id="outlet-phone" data-parsley-required="true" />
								</div>
								<label style="color: red; font:small-caption;">*must number</label>
							</div>
							
							<div class="col-xs-4 form-group" id="validasi-email">
								<label class="control-label" style="display:none" id="label-email"><i class="fa fa-check"></i></label>
								<div >
									<input class="form-control" type="text" name="outlet-email" id="outlet-email" data-parsley-required="true" />
								</div>
								<label style="color: red; font:small-caption;">*ex: rama@gmail.com</label>
							</div>
							
							<div class="col-xs-4 form-group" id="validasi-postal">
								<label class="control-label" style="display:none" id="label-postal"><i class="fa fa-check"></i></label>
								<div >
									<input class="form-control" type="text" pattern="\d{1,6}" name="outlet-postal" id="outlet-postal" data-parsley-required="true" />
								</div>
								<label style="color: red; font:small-caption;">*max 6 characters</label>
							</div>
						</div>
						
						<div class="row">
							<div class="col-xs-4"><h5>Province<label style="color: red; font:small-caption;">*</label></h5></div>
							<div class="col-xs-4"><h5>Region<label style="color: red; font:small-caption;">*</label></h5></div>
							<div class="col-xs-3"><h5>District<label style="color: red; font:small-caption;">*</label></h5></div>
						</div>
						
						<div class="row">
							<div class=" col-xs-4 form-group" id="validasi-prov">
							<label class="control-label" style="display:none" id="label-prov"><i class="fa fa-check"></i></label>
								<select class="form-control" name="area" required="required" id="prov-id">
    							<option disabled selected value=""> Select A Province</option>
    							<c:forEach var="prov" items="${provinces }">
    								<option value="${prov.id }">${prov.name }</option>
    							</c:forEach>
								</select>
							</div>
						
							<div class="col-xs-4 form-group" id="validasi-reg">
								<label class="control-label" style="display:none" id="label-reg"><i class="fa fa-check"></i></label>
								<select name="area" class="form-control" required="required" id="reg-id">
    							<option disabled selected value=""> Select A Region </option>
								</select>
							</div>
						
							<div class="col-xs-4 form-group" id="validasi-dist">
								<label class="control-label" style="display:none" id="label-dist"><i class="fa fa-check"></i></label>
								<select name="area" class="form-control" required="required" id="dist-id">
    								<option disabled selected value=""> Select A District </option>
								</select>
							</div>
						</div>
						
						<input type="hidden" name="id" id="id">
						</form>
				</div>	
				

				<div class="modal-footer">
					<div class="row">
						<div class="form-group" style="float:left; margin-left:20px;">
							<button type="button" class="btn btn-danger" id="tbl-reset">Cancel</button>
						</div>
						<div class="form-group" style="float:right; margin-right:20px;">
							<button type="button" class="btn btn-info" id="tbl-simpan">Save</button>
						</div>
					</div>
					
					
				</div>
				
				
				
			</div>

		</div>
	</div>
<!-- end form save -->