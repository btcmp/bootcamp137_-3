<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ITEM JSP</title>

<script type="text/javascript">
	$(document).ready(function() {
		var saved = [];
		var savedQty = [];
		var dataFromAddItem = [];
		
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
		
		//save transfer item
		$('#btn-save-transfer-item').on('click',function(evt){
			evt.preventDefault;
			$.each(dataFromAddItem, function(key,val) {
		 			$('#isi-popup-transfer').append('<tr>'
		 					+'<td>'+val.item+'</td>'
							+ '<td>'+val.inStock+'</td>'
							+ '<td id="qty-'+val.id+'">'+val.transferQty+'</td>'
							+ '<td>'+val.idVariant+'</td>'
							+ '<td> <a href="#" id='+val.id +' class="delete-transfer-item'+val.id+'">X</a> </td>'
							+ '</tr>');
		 		});
			
		}); 
		
		//executeSave
		$('#btn-create-data').on('click',function(evt){
			evt.preventDefault;
		
			var transferStockDetail=[];
			
			 $('#data-popup-transfer > tbody > tr').each(function(index,data){
				var tsd = {
						itemVariant : {
							id : $(data).find('td').eq(3).text()
						},
						inStock : $(data).find('td').eq(1).text(),
						transferQty : $(data).find('td').eq(2).text()
				}
				transferStockDetail.push(tsd);
			});
			 
		  var transferStock = {
					fromOutlet : {
						id : $('#add-transfer-from').val()
					},
					toOutlet : {
						id : $('#add-transfer-to').val()
					},
					transferStockDetail : transferStockDetail,
					notes : $('#add-notes').val(),
					status : "Submitted"
			};
		  
		  console.log(transferStock)
		  
			$.ajax({
				url : '${pageContext.request.contextPath }/transfer-stock/save',
				type : 'POST',
				data : JSON.stringify(transferStock),
				contentType : 'application/json',
				success : function(){
					alert('save successfully');
					window.location='${pageContext.request.contextPath}/transfer-stock';
				}, error : function(){
					alert('save failed');
				}
			}) 
			
		});
		
		
		//clik save item
		//a >> tag
		$('body').on('click', 'a.btn-save-item', function(evt){
			var id = $(this).attr('id');
			var transQty=$('.add-transfer-stock-qty'+id).val();
			
			var fullData = {
					id : id,
					item : $('.item-name'+id).text(),
					inStock : $('.in-stock'+id).text(),
					transferQty : $('.add-transfer-stock-qty'+id).val(),
					idVariant : $('.item-variant'+id).text()
			}
			
			dataFromAddItem.push(fullData);
			
			console.log (dataFromAddItem);
			
			console.log(id);
			evt.preventDefault;
			/* $('#td-qty-'+id).html(transQty); */
			saved.push(id);
			savedQty.push(transQty);
			//supaya gak bsa d edit lg
 			console.log(saved)
			console.log(savedQty) 
			$('#qty-'+id).html(transQty);
			$(this).hide();
			$('.add-transfer-saved'+id).show();
			
			
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
						$.each(data,function(key,val){
						if(saved.indexOf(val.id.toString())==-1){
							console.log(val.id);
							$('#isi-popup-transfer-stock').append('<tr><td class="item-name'+val.id+'">'+val.itemVariant.item.name+'-'+val.itemVariant.name+'</td>'
									+ '<td class="in-stock'+val.id+'">'+val.endingQty+'</td>'
									+ '<td id="qty-'+val.id+'"><input type="number" class="add-transfer-stock-qty'+ val.id +'" value="1" /></td>'
									+ '<td class="item-variant'+val.id+'">'+val.itemVariant.id+'</td>'
									+ '<td> <a href="#" id='+val.id +' class="save-item'+val.id+' btn-save-item">SAVE</a> <a href="#" id='+val.id +' class="add-transfer-saved'+val.id+'">SAVED</a> </td>'
									+ '</tr>');
							$('.add-transfer-saved'+val.id).hide();
						}
						
						else{
							var x = saved.indexOf(val.id.toString());
							$('#isi-popup-transfer-stock').append('<tr><td>'+val.itemVariant.item.name+'-'+val.itemVariant.name+'</td>'
									+ '<td>'+val.endingQty+'</td>'
									+ '<td id="qty-'+val.id+'">'+savedQty[x]+'</td>'
									+ '<td class="item-variant'+val.id+'">'+val.itemVariant.id+'</td>'
									+ '<td> <a href="#" id='+val.id +' class="save-item'+val.id+' btn-save-item">SAVE</a> <a href="#" id='+val.id +' class="add-transfer-saved'+val.id+'">SAVED</a> </td>'
									+ '</tr>');
							$('.save-item'+val.id).hide();
						}
						
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
							<td>${trstock.fromOutlet.name}</td>
							<td>${trstock.toOutlet.name}</td>
							<td>${trstock.status}</td>
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