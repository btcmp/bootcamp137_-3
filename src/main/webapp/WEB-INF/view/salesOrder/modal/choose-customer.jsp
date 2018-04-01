<div class="modal fade" id="choose-cust" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Input Customer</h5>
			</div>
			<div class="modal-body">
				<form action="#">
					<div class="form-group">
						<input type="text" class="form-control" id="name-cust" aria-describedby="emailHelp" placeholder="Search Customer" />
						<a id="cari-customer" class="btn btn-primary" href="#">Search</a>
						<a id="add-new" href="#" class="btn btn-primary">Add Customer</a>
					</div>
					<div>
						<table  id="table-customer" class="table table-stripped table-bordered table-hover">
							<thead>
								<tr>
									<th>Name</th>
									<th>Email</th>
									<th>phone</th>
									<th>#</th>
								</tr>
							</thead>
							<tbody id="search-customer-tbl">
							
							</tbody>
						</table>
					</div>
				</form>
			<div class="modal-footer">
				<button style="float: left;" type="button" id="btn-cancel-save" class="btn btn-primary">CANCEL</button>
				<button style="float: right;" type="button" id="btn-save" class="btn btn-primary">SAVE</button>
			</div>
			</div>
		</div>
	</div>
</div>