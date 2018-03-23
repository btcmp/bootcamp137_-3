<!-- begin form save -->
	<div class="modal fade" id="modal-create" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					
					<button type="button" class="close modalcancel" data-dismiss="modal">&times;</button>
					<h4 id="judul-modal">Create Supplier</h4>
				</div>
				<div class="modal-body">
					<form id="formdepartemen" data-parsley-validate method="post">
					<select name="workshop1" required="required" id="workshop1">
    				<option disabled selected value=""> -- select an option -- </option>
   	 				<option value="wkshp1">Workshop</option>
   					<option value="wkshp2">name</option>
    				<option value="wkshp3">Workshop name</option>
					</select>
					<select name="workshop1" required="required" id="workshop2">
    				<option disabled selected value=""> -- select an option -- </option>
    				<option value="wkshp1">Workshop</option>
    				<option value="wkshp2">name</option>
    				<option value="wkshp3">Workshop name</option>
					</select>
						<table>
						
							<tr>
								<td>Supplier Name</td>
								<td>:</td>
								<td><input type="text" name="supplier-name" id="supplier-name" data-parsley-required="true" /></td>
							</tr>
							
							<tr>
								<td>Address</td>
								<td>:</td>
								<td><input type="text" name="supplier-address" id="supplier-address" data-parsley-required="true" /></td>
							</tr>
							
							<tr>
								<td>Phone</td>
								<td>:</td>
								<td><input type="text" name="supplier-phone" id="supplier-phone" data-parsley-required="true" /></td>
							</tr>
							
							<tr>
								<td>Email</td>
								<td>:</td>
								<td><input type="text" name="supplier-email" id="supplier-email" data-parsley-required="true" /></td>
							</tr>
							
							<tr>
    							<td>Province</td>
    							<td>:</td>
    							<td>
    								<select id="prov-id">
    									<c:forEach var="prov" items="${provinces }">
    										<option>${prov.name }</option>
    									</c:forEach>
    									<option>1</option>
    									<option>2</option>
    									<option>3</option>
    								</select>
    							</td>
    						</tr>
    						
    						<tr>
    							<td>Region</td>
    							<td>:</td>
    							<td>
    								<select id="reg-id">
    									<c:forEach var="prov" items="${regions }">
    										<option>${prov.name }</option>
    									</c:forEach>
    									<option>1</option>
    									<option>2</option>
    									<option>3</option>
    								</select>
    							</td>
    						</tr>
    						
    						<tr>
								<td>District</td>
								<td>:</td>
								<td>
    								<select id="dist-id">
    									<c:forEach items="${districts }" var="prov">
    										<option>${prov.name}</option>
    									</c:forEach>
    									<option>1</option>
    									<option>2</option>
    									<option>3</option>
    								</select>
    							</td>
    						</tr>
    						    						
							<tr>
								<td><input type="hidden" name="id" id="id"></td>
							</tr>
						</table>
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