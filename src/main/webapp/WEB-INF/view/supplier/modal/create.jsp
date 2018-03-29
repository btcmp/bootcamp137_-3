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
								<td><input type="text" name="supplier-email" id="supplier-email" data-parsley-required="true" placeholder="example: alfa@gmail.com" /></td>
							</tr>
							
							<tr>
								<td>Postal Code</td>
								<td>:</td>
								<td><input type="text" name="supplier-postal" id="supplier-postal" data-parsley-required="true" placeholder="max six characters" /></td>
							</tr>
    						    						
							<tr>
								<td><input type="hidden" name="id" id="id"></td>
							</tr>
						</table>
						
						<table>
						<thead>
							<tr>
								<td class="text-center">Province</td>
								<td class="text-center">Region</td>
								<td class="text-center">District</td>
							</tr>
						</thead>
						
						<tbody>
						<tr>
						
						<td>
						<select name="area" required="required" id="prov-id">
    					<option disabled selected value=""> --- Select A Province --- </option>
    					<c:forEach var="prov" items="${provinces }">
    						<option value="${prov.id }">${prov.name }</option>
    					</c:forEach>
						</select>
						</td>
						
						<td>
						<select name="area" required="required" id="reg-id">
    						<option disabled selected value=""> --- Select A Region --- </option>
						</select>
						</td>
						
						<td>
						<select name="area" required="required" id="dist-id">
    						<option disabled selected value=""> --- Select A District --- </option>
						</select>
						</td>
						
						</tr>
						</tbody>
						</table>
						
						
				</div>
				<div class="modal-footer">
					<button type="reset" class="btn btn-danger" id="tbl-reset">Cancel</button>
					<button type="button" class="btn btn-info" id="tbl-simpan">Save</button>
				</div>
				</form>
			</div>

		</div>
	</div>
<!-- end form save -->