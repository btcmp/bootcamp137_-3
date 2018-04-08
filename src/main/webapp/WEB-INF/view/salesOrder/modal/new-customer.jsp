<div class="modal fade" id="new-cust" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">New Customer</h5>
			</div>
			<div class="modal-body">
				<form action="#" style="border:none">
					<div class="form-group">
						<label>PROFILE</label>
						<input type="text" class="form-control" id="save-name-cust" aria-describedby="emailHelp" placeholder="Customer Name" />
						<input type="email" class="form-control" id="save-email-cust" aria-describedby="emailHelp" placeholder="Email" />
						<input type="text" class="form-control" id="save-phone-cust" aria-describedby="emailHelp" placeholder="Phone" />
					</div>
					
					<div class="form-group">
						<label>Day Of Birth</label>
							<div class="input-group date">
	                	<div class="input-group-addon">
	                  	<i class="fa fa-calendar"></i>
	                	</div>
	                	<input type="text" class="datepicker form-control pull-right" id="pilih-tanggal" data-parsley-required="true" required readonly>
	                	<input type="hidden" id="in-id">
	                </div>
					</div>
					
					
					
					<div class="form-group">
						<label>Address</label>
						<input type="text" class="form-control" id="save-address-cust" aria-describedby="emailHelp" placeholder="address" />
					<%-- 		<select class="form-control" id="save-pro-cust">
								<option value="">Provinsi</option>
								<c:forEach var="prov" items="${provinces}">
									<option id="sprov" value="${prov.id}"> ${prov.name}</option>
								</c:forEach>
							</select>
							<select class="form-control" name="save-reg" id="save-reg-cust">
								<option value=""> Region</option>
							</select>
							<select class="form-control" name="save-dis" id="save-dis-cust">
								<option value="">District</option>
							</select> --%>
							
							<select style="width:30%;float:left;margin-right:5%" name="area" required="required" id="prov-id" class="form-control">
    					<option disabled selected value="">Select A Province</option>
    					<c:forEach var="prov" items="${provinces }">
    						<option value="${prov.id }">${prov.name }</option>
    					</c:forEach>
						</select>
						
						<select style="width:30%;float:left;margin-right:5%" class="form-control" name="area" required="required" id="reg-id">
    						<option disabled selected value="">Select A Region</option>
						</select>
						
						<select style="width:30%;float:left" class="form-control" name="area" required="required" id="dist-id">
    						<option disabled selected value="">Select A District</option>
						</select>
						
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button style="float: left;" type="button" id="btn-cancel-save" class="btn btn-primary">CANCEL</button>
				<button style="float: right;" type="button" id="btn-simpan" class="btn btn-primary">SAVE</button>
			</div>
		</div>
	</div>
</div>
