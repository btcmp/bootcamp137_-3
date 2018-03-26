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
								<td><input type="text" name="supplier-email" id="supplier-email" data-parsley-required="true" /></td>
							</tr>
							
							<tr>
								<td>Postal Code</td>
								<td>:</td>
								<td><input type="text" name="supplier-postal" id="supplier-postal" data-parsley-required="true" /></td>
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
    					<option disabled selected value=""> -- select an province -- </option>
    					<c:forEach var="prov" items="${provinces }">
    						<option vslur="${prov.id }">${prov.name }</option>
    					</c:forEach>
   	 					<option value="1">Workshop</option>
   						<option value="2">name</option>
    					<option value="3">Workshop name</option>
						</select>
						</td>
						<td>
						<select name="area" required="required" id="reg-id">
    					<option disabled selected value=""> -- select an region -- </option>
    					<c:forEach var="reg" items="${regions }">
    						<option value="${reg.id }">${reg.name }</option>
    					</c:forEach>
    					<option value="1">Workshop</option>
    					<option value="1">Workshop</option>
    					<option value="2">name</option>
    					<option value="2">name</option>
    					<option value="3">Workshop name</option>
    					<option value="3">Workshop name</option>
						</select>
						</td>
						<td>
						<select name="area" required="required" id="dist-id">
    					<option disabled selected value=""> -- select an district -- </option>
    					<c:forEach items="${districts }" var="prov">
    						<option value="${dis.name }">${dis.name}</option>
    					</c:forEach>
    					<option value="wkshp1">Workshop</option>
    					<option value="wkshp2">name</option>
    					<option value="wkshp3">Workshop name</option>
						</select>
						</td>
						</tr>
						</tbody>
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