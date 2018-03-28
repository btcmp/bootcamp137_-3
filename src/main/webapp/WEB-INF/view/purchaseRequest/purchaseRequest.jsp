<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<div class="container">

	<h3>Purchase Request</h3>
	<hr style="border-color:black;">
	<div class="row">
		<div class="col-xs-2">
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
		    	<input type="button" id="btn-create" class="btn btn-md btn-primary float-right" value="Create">
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
</body>
</html>