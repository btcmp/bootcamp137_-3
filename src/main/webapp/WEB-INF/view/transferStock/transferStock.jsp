<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ITEM JSP</title>

<script type="text/javascript">
	$(document).ready(function() {
		var saved = [];
		
		//Create Data Clicked
		$('#create-transfer-stock').on('click',function(evt){
			evt.preventDefault;
			$('#modal-create-data').modal();
		});
		
		//Add transfer item
	 	$('#add-transfer-item').on('click',function(evt){
			evt.preventDefault;
			$('#modal-add-transfer-item').modal();
		}); 
		
		//clik save item
		//a >> tag
		$('body').on('click', 'a.save-item', function(evt){
			var id = $(this).attr('id');
			console.log(id);
			evt.preventDefault;
			/* $('#td-qty-'+id).html(transQty); */
		});
		
		
	 	$('#search-item').on('input',function(e){
	 		var keyword=$(this).val();
	 		if(keyword==""){
	 			$('#isi-popup-transfer-stock').empty();
	 			
	 		}
	 		
	 		else{
	 			$.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath}/transfer-stock/search-item?search='+keyword,
					dataType : 'json',
					success : function (data){
			 			$('#isi-popup-transfer-stock').empty();
						//alert('ok')
						//$('#full-data-utama').empty();
						$.each(data,function(key,val){
						$('#isi-popup-transfer-stock').append('<tr><td>'+val.itemVariant.item.name+'-'+val.itemVariant.name+'</td>'
								+ '<td>'+val.endingQty+'</td>'
								+ '<td id="qty-"'+val.id+'><input type="number" class="add-transfer-stock-qty'+ val.id +'" value="1" /></td>'
								+ '<td> <a href="#" id='+val.id +' class="save-item">SAVE</a> <a href="#" id='+val.id +' class="add-transfer-saved">SAVED</a> </td>'
								+ '</tr>');
						
					/* 	$('.add-transfer-ok'+val.id).hide();
						 */
						});
					},
					error : function (){
						$('#isi-popup-transfer-stock').empty();
					}
				});
	 		}
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