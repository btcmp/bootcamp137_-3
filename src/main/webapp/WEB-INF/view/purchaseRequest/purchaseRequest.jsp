<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<div class="container">

	<h3>Purchase Request</h3>
	<hr style="border-color:black;">
	<div class="row">
		<div class="col-xs-3">
			<div class="input-group">
		       <button type="button" class="btn btn-default pull-right" id="daterange-btn">
		         <span>
		           <i class="fa fa-calendar"></i> Pilih Tanggal
		         </span>
		         <i class="fa fa-caret-down"></i>
		       </button>
		    </div>
	    </div>
	    
	    <div class="col-xs-2">
		    <div class="input-group">
		    	<select id="pil-status" class="form-control">
		    		<option value="All">All</option>
		    		<option value="Created">Created</option>
		    		<option value="Submitted">Submitted</option>
		    		<option value="Approved">Approved</option>
		    		<option value="Rejected">Rejected</option>
		    	</select>
		    </div>
	    </div>
	    
	    <div class="col-xs-3">
		    <div class="input-group">
		    	<input type="text" id="cari-pr" class="form-control" placeholder="Search...">
		    </div>
	    </div>
	    
	    <div class="col-xs-2">
		    <div class="input-group">
		    	<input type="button" id="btn-export" class="btn btn-md btn-primary float-right" value="Export">
		    </div>
	    </div>
	    <div class="col-xs-2">
		    <div class="input-group">
		    	<input type="button" id="btn-create" class="btn btn-md btn-primary float-right" value="Create" data-toggle="modal" data-target="#create-pr">
		    </div>
	    </div>
	</div>
	<hr>
	<table id="data-pr" class="table table-striped table-bordered table-hover">
		<thead class="thead-light">
			<th>Create Date</th>
			<th>PR No.</th>
			<th>Note</th>
			<th>Status</th>
			<th>#</th>
		</thead>
		<tbody id="isi-data-pr">
			<c:forEach items="${prs }" var="pr">
				<tr>
					<td>${pr.createdOn }</td>
					<td>${pr.prNo }</td>
					<td>${pr.notes }</td>
					<td>${pr.status }</td>
					<td>
						<input type="button" class="btn-edit btn btn-default" value="Edit"> | 
						<input type="button" class="btn-view btn btn-info" value="View">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
</div>

	<div id="create-pr" class="modal fade" role="dialog">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
						<h4 class="modal-title">Create New PR : </h4>
				</div>
				<div class="modal-body">
					<h4>Tanggal Waktu Item Ready : </h4>
					<div class="input-group date">
	                	<div class="input-group-addon">
	                  	<i class="fa fa-calendar"></i>
	                	</div>
	                	<input type="text" class="form-control pull-right" id="datepicker">
	                </div>
	                <div class="input-group">
	                	<h4>Notes : </h4>
	                	<textarea class="form-control" rows="5" id="in-notes" style="width:100%"></textarea>
	                </div>
	                
	                <h4>Purchase Request</h4>
	                <hr style="border-color:black;">
	                <table id="data-purchase-item" class="table table-striped table-bordered table-hover">
	                </table>
	                <button type="button" class="btn btn-md btn-primary btn-block" id="btn-tambah-item" data-toggle="modal" data-target="#add-item-pr">Add Item</button>
	                
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal"
						id="batal-insert">Batal</button>
					<button type="button" class="btn btn-primary" id="tblkonfsimpan"
						key="key">Simpan</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="add-item-pr" class="modal fade" role="dialog">
		<div class="modal-dialog modal-confirm">
			<div class="modal-content">
				<div class="modal-header">
					
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Add Purchase Item</h4>
				</div>
				<div class="modal-body">
					<input type="text" id="search-item" class="form-control">
					<table id="data-barang" class="table table-striped table-bordered table-hover">
						<thead>
							<th>Item</th>
							<th>In Stock</th>
							<th>Request Qty.</th>
						</thead>
						<tbody id="list-barang">
							
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal"
						id="batal-insert">Cancel</button>
					<button type="button" class="btn btn-danger" id="tblkonfdel"
						key="key">Add</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
<script>
	$(function(){
		$('#daterange-btn').daterangepicker(
		      {
		        ranges   : {
		          'Hari Ini'       : [moment(), moment()],
		          'Kemarin'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
		          '7 Hari Terakhit' : [moment().subtract(6, 'days'), moment()],
		          'Sebulan Terakhir': [moment().subtract(29, 'days'), moment()],
		          'Bulan ini'  : [moment().startOf('month'), moment().endOf('month')],
		          'Bulan lalu'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
		        },
		        startDate: moment().subtract(29, 'days'),
		        endDate  : moment()
		      },
		      function (start, end) {
		        $('#daterange-btn span').html(start.format('D MMMM, YYYY') + ' - ' + end.format('D MMMM, YYYY'))
		      }
	    );
	    
	    $('#datepicker').datepicker({
      		autoclose: true
    	});
	    
	    
	});
</script>
</html>