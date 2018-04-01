<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<div>ADJUSTMENT</div>
<br/>

<div class="container">
	
	<div>
		<div style="float: left; margin-right: 600px;">
			<select>
				<c:forEach items="${outlets }" var="out">
					<option value="${out.id }">${out.name }</option>
				</c:forEach>
			</select>
		</div>
		
		<div align="right" style="float: left; margin-right: 30px;">
			<button id="export" class="btn btn-primary btn-md">Export</button>
		</div>
		
		<div>
			<button id="create" class="btn btn-primary btn-md">Create</button>
		</div>
	</div>



	<table id="adjustment-table" class="table table-striped table-bordered">
		<thead>
		<tr>
			<th>Adjustment Date</th>
			<th>Notes</th>
			<th>Status</th>
			<th>#</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${adjustments }" var="adj">
			<tr>
				<td>${adj.createdOn }</td>
				<td>${adj.notes }</td>
				<td>${adj.status }</td>
				<td>
					<a href="" id="${adj.id }" class="btn-edit btn btn-warning">view</a>
				</td>
			<tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<%@ include file="/WEB-INF/view/Adjustment/modal/create.jsp"%>
<%@ include file="/WEB-INF/view/Adjustment/modal/add-item.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		//$('#supplier-table').DataTable();
		
		$('#create').click(function(){
			document.getElementById('tbl-simpan').disabled=true;
			$('#modal-create').modal();
		});
		
		$('#add-item').click(function(){
			$('#modal-add-item').modal();
		});
		
	});
</script>