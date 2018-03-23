<!-- begin form save -->
	<div class="modal fade" id="modal-edit" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					
					<button type="button" class="close modalcancel" data-dismiss="modal">&times;</button>
					<h4 id="judul-modal">Edit Category</h4>
				</div>
				<div class="modal-body">
					<form id="formdepartemen" data-parsley-validate method="post">
						<table>
							<tr>
								<td>Category Name</td>
								<td>:</td>
								<td><input type="text" name="edit-category" id="edit-category" data-parsley-required="true" /></td>
							</tr>
							
							<tr>
								<td><input type="hidden" name="id-edit" id="id-edit"></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-info" id="tbl-edit">Save</button>
				</div>
			</div>

		</div>
	</div>
<!-- end form save -->