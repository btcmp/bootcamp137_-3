<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ITEM JSP</title>

<script type="text/javascript">
	$(document).ready(function() {
		//Create Data Clicked
		$('#create-transfer-stock').on('click',function(evt){
			evt.preventDefault;
			$('#modal-create-data').modal();
		});
		
		//Add transfer item
	 	$('#add-transfer-item').on('click',function(){
			evt.preventDefault;
			$('#modal-add-transfer-item').modal();
		}); 
		
		
	});
</script>

</head>
<body>

	<div>TRANSFER STOCK</div>
	<br />
	<div class="container">
		<div>
			<div style="float: left; margin-right: 600px;">
				<select>
					<c:forEach var="out" items="${outlets}">
						<option value="${out.id}">${out.name}</option>
					</c:forEach>
				</select>
			</div>



			<div align="right" style="float: left; margin-right: 30px;">
				<button id="export" class="btn btn-primary btn-md">Export</button>
			</div>

			<div align="right" style="float: left">
				<button id="create-transfer-stock" class="btn btn-primary btn-md">Create</button>
			</div>


		</div>

		<div>
			<table id="transfer-stock-list"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>Transfer Date</th>
						<th>From Outlet</th>
						<th>To Outlet</th>
						<th>Status</th>
						<th>#</th>
					</tr>
				</thead>
				<tbody id="isi-transfer-stock-list">
					<c:forEach items="${transferStocks}" var="trstock">
						<tr>
							<td>${trstock.modifiedOn}</td>
							<td>${tstock.fromOutlet.name}</td>
							<td>${tstock.toOutlet.name}</td>
							<td>${tstock.status}</td>
							<td><a href="#" id="${tstock.id}"
								class="edit-data-transfer-stock">Edit</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<%@ include file="modal/create-data.jsp"%>
		<%@ include file="modal/add-transfer-item.jsp"%>
	
	</div>

</body>
</html>