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
		var alreadyId=[];
		
		//Create Data Clicked
		$('#create-transfer-stock').on('click',function(evt){
			evt.preventDefault;
			document.getElementById("btn-save-submit").disabled = true;
			$('#modal-create-data').modal();
		});
		
		//Add transfer item
	 	$('#add-transfer-item').on('click',function(evt){
			evt.preventDefault;
			$('#modal-add-transfer-item').modal();
			
			document.getElementById("btn-save-transfer-item").disabled = true;
		}); 
		
		//save transfer item
		$('#btn-save-transfer-item').on('click',function(evt){
			
			evt.preventDefault();
			if(dataFromAddItem==""){
				alert('Please fill the data')
			}
			
			else{
				 $('#modal-add-transfer-item').modal('toggle');
					document.getElementById("btn-save-submit").disabled = false;
					$.each(dataFromAddItem, function(key,val) {
						if(alreadyId.indexOf(val.id.toString())==-1){
							console.log('id baru')
							$('#isi-popup-transfer').append('<tr id="list-transfer'+val.id+'">'
				 					+'<td>'+val.item+'</td>'
									+ '<td>'+val.inStock+'</td>'
									+ '<td id="qty-'+val.id+'">'+val.transferQty+'</td>'
									+ '<td>'+val.idVariant+'</td>'
									+ '<td> <a href="#" id='+val.id +' class="delete-transfer-item">X</a> </td>'
									+ '</tr>');
							alreadyId.push(val.id);
						}
						
						else{
							console.log('id-lama')
						}
								
				 		});
					
					console.log(dataFromAddItem)
			}
		}); 
		
		
		
		//delete transfer item
		$('body').on('click', 'a.delete-transfer-item', function(evt){
			var id = $(this).attr('id');
			$('#list-transfer'+id).remove();
			$('.save-item'+id).show();
			$('.add-transfer-saved'+id).hide();
			$('#qty-'+id).html('<input type="number" class="add-transfer-stock-qty'+ id +'" value="1" />');
			var a = saved.indexOf(id.toString());
			/* var b = dataFromAddItem.indexOf(id.toString());
			console.log(b) */
			
			//select index from dataFromAddItem
			let index = dataFromAddItem.findIndex((item) => item.id == id);
			console.log(index)

			dataFromAddItem.splice(index,1);
			saved.splice(a,1);
			savedQty.splice(a,1);
			alreadyId.splice(a,1);
			
			
		});
		
		//executeSave
		$('#btn-save-submit').on('click',function(evt){
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
					status : "Submitted",

					
			};
		  
		  //console.log(transferStock)
		  
			$.ajax({
				url : '${pageContext.request.contextPath }/transaction/transfer-stock/save',
				type : 'POST',
				data : JSON.stringify(transferStock),
				contentType : 'application/json',
				success : function(){
					alert('save successfully');
					window.location='${pageContext.request.contextPath}/transaction/transfer-stock';
				}, error : function(){
					alert('save failed');
				}
			}) 
			
		});
		
		
		//clik save item
		//a >> tag
		$('body').on('click', 'a.btn-save-item', function(evt){
			document.getElementById("btn-save-transfer-item").disabled = false;
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
			
			//console.log (dataFromAddItem);
			//console.log(id);
			evt.preventDefault();
			/* $('#td-qty-'+id).html(transQty); */
			saved.push(id);
			savedQty.push(transQty);
			//supaya gak bsa d edit lg
 			//console.log(saved)
			//console.log(savedQty) 
			$('#qty-'+id).html(transQty);
			$(this).hide();
			$('.add-transfer-saved'+id).show();

		});
		
		
		//cancel modal
		$('#cancel-add-transfer-item').on('click',function(){
			saved=[];
			$('#isi-popup-transfer-stock').empty();
			$('#search-item').val('');
			$('#modal-add-transfer-item').modal('toggle');
		})
		
		
		var added=[];
	 	$('#search-item').on('input',function(e){
	 		var keyword=$(this).val();
	 		var outletId = $('#add-transfer-from').val();
			console.log(outletId);
	 		if(keyword==""){
	 			$('#isi-popup-transfer-stock').empty();
	 		}
	 		
	 		else{
	 			$.ajax({
	 			
					type : 'GET',
					url : '${pageContext.request.contextPath}/transaction/transfer-stock/search-item?search='+keyword+'&outlet-id='+outletId,
					dataType : 'json',
					success : function (data){
			 			$('#isi-popup-transfer-stock').empty();
						$.each(data,function(key,val){
						if(saved.indexOf(val.id.toString())==-1){
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
	 	
	 	
	 	///VIEW TRANSFER STOCK DEAIL
	 	$('.view-transfer-stock-detail').on('click',function(evt){
	 		evt.preventDefault();
			var id = $(this).attr('id');

			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/transaction/transfer-stock/get-one/'+id,
				dataType: 'json',
				success : function(data){
					$('#hidden-from-outlet-id').val(data.fromOutlet.id);	
					$('#hidden-outlet-id').val(data.toOutlet.id);
					$('#hidden-id').val(data.id);
					$('#created-by').val(data.createdBy);
					$('#transfer-status').val(data.status);
					$('#notes').val(data.notes);
				    $('#isi-transfer-stock-detail').empty();
				    
					var option = [];
					if (data.status=="Submitted") {
						option.push("<option value=\"Kosong\">More</option>");
						option.push("<option value=\"Approved\">Approve</option>");
						option.push("<option value=\"Rejected\">Reject</option>");
						option.push("<option value=\"Print\">Print</option>");
					} else {
						option.push("<option value=\"Kosong\">More</option>");
						option.push("<option value=\"Print\">Print</option>");
					}
					
					$('#more-option').html(option);

					$.ajax({
						url : '${pageContext.request.contextPath }/transaction/transfer-stock/search-transfer-stock-detail?search='+id,
						type : 'GET',
						dataType : 'json',
						success : function(data){
					 		$('#modal-view-transfer-stock-detail').modal();
					 		$.each(data, function(key, val) {
					 		$('#isi-transfer-stock-detail').append('<tr><td>'+val.itemVariant.item.name+'-'+val.itemVariant.name+'</td>'
						 			+ '<td>'+val.inStock+'</td>'
									+ '<td>'+val.transferQty+'</td>'
									+ '<td>'+val.itemVariant.id+'</td>'
									+'<td>'+$('#hidden-outlet-id').val()+'</td>'
									+ '</tr>');
					 		});
					 		
					 		var idz = []
					 		$('#data-transfer-stock-detail > tbody > tr').each(function(index,data){
					 			var idx = {
					 					id : $(data).find('td').eq(3).text(),
					 					trStock : $(data).find('td').eq(2).text()
					 			}
					 			idz.push(idx)
					 		});
					 		
					 		 idz.forEach(function(element){
					 			 //console.log(element)
						   		$.ajax({
					 				url : '${pageContext.request.contextPath }/transaction/transfer-stock/search-item-inventory?search='+element.id,
									type : 'GET',
									dataType : 'json',
									success : function(data){
								 		$.each(data, function(key, val) {

										$('#isi-hidden-id').append('<tr><td>'+val.id+'</td>'
									 	 		+ '<td>'+element.trStock+'</td>'
									 	 		+ '<td>'+val.outlet.id+'</td>'
												+ '</tr>');
								 		});
									},
									error : function(data){
										alert('failed')
									}
					 			});  
					 		 });
						}, error : function(){
							alert('error to get data');
						}
					});
					
				},
				error : function(){
					alert('error to get data');
				}
	 	});
	 	
	});
	 	

	 	
	 $('#more-option').change(function(evt){
		evt.preventDefault();
		var newStatus = $(this).val();

		if (newStatus=="Approved" || newStatus=="Rejected") {
			transferStockId = $('#hidden-id').val();
			/* console.log(newStatus);
			console.log(transferStockId); */
		 	 $.ajax({
				url : '${pageContext.request.contextPath }/transaction/transfer-stock/update-status/'+transferStockId,
				type : 'PUT',
				data : JSON.stringify(newStatus),
				contentType : 'application/json',
				success : function(){
					alert('update status successfully');
				}, error : function(){
					alert('update status failed');
				}
			})   
		
			if(newStatus=="Approved"){
				
				 $('#data-hidden-inventory > tbody > tr').each(function(index,data){
					var updateTrstock = {
						id: $(data).find('td').eq(0).text(),
						transferStockQty : $(data).find('td').eq(1).text(),
						 outlet : {
							 id : $('#hidden-outlet-id').val() //transferTo
						}
					}
				console.log(updateTrstock)
				
				var outId = parseInt($(data).find('td').eq(2).text());
				var fromId = parseInt($('#hidden-from-outlet-id').val());
				
				console.log(outId);
				console.log ('z');		
				console.log(fromId);
				
				if(outId == fromId){
					 	$.ajax({
							url : '${pageContext.request.contextPath}/item/update-inventory',
							type : 'PUT',
							data : JSON.stringify(updateTrstock),
							contentType : 'application/json',
							success : function(){
								alert('update to inventory');
							}, error : function(){
								alert('update inventory failed');
							}
						
						}) 
					}
				
				 }); //data-hidden.each
				 
				
				 
			}
		
		 
		 
			
		} else if (newStatus=="Print") {
			//window.locationd='${pageContext.request.contextPath}/transaction/transfer-stock/detail';
		}	
		
	 });
	 
	 //search outlet to tampilan awal
	  $('#search-outlet-to').change(function(evt){
		  var keyword = $(this).val();
		  if(keyword=="all"){
			  window.location = "${pageContext.request.contextPath}/transaction/transfer-stock";
		  }
		  
		  else if (keyword !== "kosong"){
				window.location = "${pageContext.request.contextPath}/transaction/transfer-stock/search-outlet?search="+keyword;
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
				<select id="search-outlet-to">
				<option value="kosong">Search Outlet</option>
					<c:forEach var="out" items="${outlets}">
						<option value="${out.id}">${out.name}</option>
					</c:forEach>
				<option value="all">All Outlet</option>	
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
							<td><a href="#" id="${trstock.id}"
								class="view-transfer-stock-detail">view</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<%@ include file="modal/create-data.jsp"%>
		<%@ include file="modal/add-transfer-item.jsp"%>
		<%@ include file="modal/view-transfer-stock-detail.jsp"%>
	
	</div>

</body>
</html>