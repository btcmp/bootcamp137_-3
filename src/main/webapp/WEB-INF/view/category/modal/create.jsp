<!-- begin form save -->
	<div class="modal fade" id="modal-create" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
			
				<div class="modal-header">
					<button type="button" class="close modalcancel" data-dismiss="modal">&times;</button>
					<h3 id="judul-modal">Create Category</h3>
				</div>
				
				<div class="modal-body">
					<form id="formdepartemen" data-parsley-validate method="post">
						<div>
							<div><h4>Category Name</h4></div>
							<div ><input type="text" class="form-control full-span" id="create-category" data-parsley-required="true" /></div>
						</div>
						<input type="hidden" name="id" id="id">
					</form>
				</div>
				
				<div class="modal-footer">
					<div class="row">
						<div class="form-group" style="float:left; margin-left:20px;">
							<button type="reset" class="btn btn-warning" id="tbl-reset">Cancel</button>
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