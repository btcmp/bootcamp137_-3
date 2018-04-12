<style>
  input.parsley-success,
select.parsley-success,
textarea.parsley-success {
    color: #468847;
    background-color: #F2F9F0 !important;
    border: 1px solid #D6E9C6;
}

input.parsley-error,
select.parsley-error,
textarea.parsley-error {
    color: #B94A48;
    background-color: #F9F0F0 !important;
    border: 1px solid #f09784;
}

.parsley-errors-list {
    list-style-type: none;
    opacity: 0;
    transition: all .3s ease-in;

    color: #d16e6c;
    margin-top: 5px;
    margin-bottom: 0;
  padding-left: 0;
}

.parsley-errors-list.filled {
    opacity: 1;
}
</style>

<div class="modal fade" id="new-cust" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" align="center" id="exampleModalLabel">New Customer</h5>
			</div>
			<div class="modal-body">
				<form id="form-add-customer" style="border:none">
					<div class="form-group">
						<label>PROFILE</label>
						<input type="text" class="form-control" id="save-name-cust" placeholder="Customer Name" data-parsley-required-message="Please insert the customer name"
							data-parsley-required/>
						<input type="email" class="form-control" id="save-email-cust" placeholder="Email" data-parsley-required-message="Please insert the email"
							data-parsley-required/>
						<input type="text" class="form-control" id="save-phone-cust" placeholder="Phone" data-parsley-required-message="Please insert the phone number"
							data-parsley-required/>
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
						<input type="text" class="form-control" id="save-address-cust" placeholder="address" data-parsley-required-message="Please insert the address"
							data-parsley-required/>
					</div>
					
					<div>		
						<div style="width:30%;float:left;margin-right:5%">
							<select name="area" id="prov-id" class="form-control" data-parsley-required>
    							<option disabled selected value="">Select A Province</option>
    								<c:forEach var="prov" items="${provinces }">
    							<option value="${prov.id }">${prov.name }</option>
    						</c:forEach>
							</select>
							
						</div>
									
						<div style="width:30%;float:left;margin-right:5%" >
							<select class="form-control" name="area" id="reg-id" data-parsley-required>
    						<option disabled selected value="">Select A Region</option>
						</select>
						</div>
						
						<div style="width:30%;float:left" >
							<select class="form-control" name="area" id="dist-id" data-parsley-required>
    						<option disabled selected value="">Select A District</option>
							</select>
						</div>
												
						
						
						
						
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button style="float: left;" type="button" id="btn-cancel-save" class="btn btn-primary" data-dismiss="modal">Back</button>
				<button style="float: right;" type="button" id="btn-simpan" class="btn btn-primary">Save</button>
			</div>
		</div>
	</div>
</div>
