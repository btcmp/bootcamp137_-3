<!-- begin form save -->
	<div class="modal fade" id="modal-edit" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<div id="edit-alert" class="alert alert-sukses" role="alert" style="display:none"></div>
					<button type="button" class="close modalcancel" data-dismiss="modal">&times;</button>
					<h3 id="judul-modal">Edit Category</h3>
				</div>
				<div class="modal-body">
					<form id="formdepartemen" data-parsley-validate method="post">
						
						<div id="validasi-edit" class="form-group" >
							<div><h4>Category Name</h4></div>
							<label class="control-label" for="in-username" style="display:none" id="label-edit"><i class="fa fa-check"></i></label>
							<div ><input type="text" class="form-control full-span" id="edit-category" data-parsley-required="true" /></div>
							<input type="hidden" name="id-edit" id="id-edit">
							<label>*required</label>
						</div>
						
					</form>
				</div>
				
				<div class="modal-footer">
				<div class="row">
						<div class="form-group" style="float:left; margin-left:20px;">
							<button type="button" class="btn btn-danger" id="call-delete">X</button>
						</div>
						<div class="form-group" style="float:left; margin-left:370px;">
							<button type="reset" class="btn btn-warning" id="tbl-cancel">Cancel</button>
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