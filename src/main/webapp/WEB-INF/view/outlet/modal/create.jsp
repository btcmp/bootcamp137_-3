<!-- begin form save -->
	<div class="modal fade" id="modal-create" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					
					<button type="button" class="close modalcancel" data-dismiss="modal">&times;</button>
					<h4 id="judul-modal">Create Outlet</h4>
				</div>
				<div class="modal-body">
					<form id="formdepartemen" data-parsley-validate method="post">
						<table>
							<tr>
								<td>Outlet Name</td>
								<td>:</td>
								<td><input type="text" name="outlet-name" id="outlet-name" data-parsley-required="true" /></td>
							</tr>
							
							<tr>
								<td>Address</td>
								<td>:</td>
								<td><input type="text" name="outlet-address" id="outlet-address" data-parsley-required="true" /></td>
							</tr>
							
							<tr>
								<td>Phone</td>
								<td>:</td>
								<td><input type="text" name="outlet-phone" id="outlet-phone" data-parsley-required="true" /></td>
							</tr>
							
							<tr>
								<td>Email</td>
								<td>:</td>
								<td><input type="text" name="outlet-email" id="outlet-email" data-parsley-required="true" /></td>
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