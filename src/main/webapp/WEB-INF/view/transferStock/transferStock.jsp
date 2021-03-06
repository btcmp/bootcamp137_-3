<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<%@ include file="modal/create-data.jsp"%>
<%@ include file="modal/add-transfer-item.jsp"%>
<%@ include file="modal/view-transfer-stock-detail.jsp"%>

<style>
  input.parsley-success,
select.parsley-success,
textarea.parsley-success {
    color: #468847;
    background-color: #F2F9F0 !important;
    border: 1px solid #D6E9C6;
}

input.parsley-error,
select.parsley-error,
textarea.parsley-error {
    color: #B94A48;
    background-color: #F9F0F0 !important;
    border: 1px solid #f09784;
}

.parsley-errors-list {
    list-style-type: none;
    opacity: 0;
    transition: all .3s ease-in;

    color: #d16e6c;
    margin-top: 5px;
    margin-bottom: 0;
  padding-left: 0;
}

.parsley-errors-list.filled {
    opacity: 1;
}
</style>


<div class="content">
<section class="box content">
	<h3>Transfer Stock</h3>
	<hr style="border-color:black;">
		<div>
			<div style="float:left;margin-right:150px;">
				<select class="form-control" style="width:180%" id="search-outlet-to">
				<option value="kosong">Search Outlet</option>
					<c:forEach var="out" items="${outlets}">
							<c:set var = "outId" scope = "session" value = "${outletLogin.id}"/>
						
							<c:choose>
    		  				<c:when test = "${out.id != outId}">
       			  				<option value="${out.id}">${out.name}</option>
     		 				</c:when>
     		 				</c:choose>
						
						</c:forEach>
				<option value="all">All Outlet</option>	
				</select>
			</div>
			
			<div align="right" style="float:left;margin-right:10px">
				<button id="export" class="btn btn-primary btn-md">Export Transfer Stock Data</button>
			</div>

			<div align="right" style="float: left">
				<button id="create-transfer-stock" class="btn btn-primary btn-md">Create Transfer Stock Data</button>
			</div>

		</div>
		<div style="clear:both"></div>

		<div>
			<table id="transfer-stock-list"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>Transfer Date</th>
						<th>From Outlet</th>
						<th>To Outlet</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody id="isi-transfer-stock-list">
					<c:forEach items="${transferStocks}" var="trstock">
						<tr>
							<%-- <td>${trstock.modifiedOn}</td> --%> 
							<script>
								var modifiedOn = Date.parse("${trstock.modifiedOn}");
								var date = getDateFormat(modifiedOn);
								
								function getDateFormat(date) {
									var d = new Date(Number(date)),
									month = '' + (d.getMonth() + 1),
									day = '' + d.getDate(),
									year = d.getFullYear();
									if (month.length < 2)
									    month = '0' + month;
									if (day.length < 2)
									    day = '0' + day;
									var date = new Date();
									date.toLocaleDateString();
									return [year, month, day].join('-');
								};
								
								document.write("<td>"+date+"</td>");
							</script>
							
							
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
</section>
</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		
		
		$('#transfer-stock-list').DataTable({
			 dom: "<'row'<'col-sm-12'tr>>" +
	         "<'row'<'col-sm-4'l><'col-sm-4'i><'col-sm-4'p>>"	
		});
		
		
		var saved = [];
		var savedQty = [];
		var dataFromAddItem = [];
		var alreadyId=[];
		
		//Create Data Clicked
		$('#create-transfer-stock').on('click',function(evt){
			evt.preventDefault;
			document.getElementById("btn-save-submit").disabled = true;
			$('#modal-create-data').modal({backdrop: 'static', keyboard: false});
		});
		
		//Add transfer item
	 	$('#add-transfer-item').on('click',function(evt){
			$('#search-item').val('');
			$('#isi-popup-transfer-stock').empty();
	 		evt.preventDefault();
			$('#modal-add-transfer-item').modal({backdrop: 'static', keyboard: false});
			
			document.getElementById("btn-save-transfer-item").disabled = true;
		}); 
		
		//save transfer item
		$('#btn-save-transfer-item').on('click',function(evt){
			clickSaveItem++;
			spliceAlreadyId = [];
			resDataFromAddItem = [];
			evt.preventDefault();
			if(dataFromAddItem==""){
				$('#tampilan-alert-add-transfer-item').removeClass('alert-gagal').addClass('alert-sukses');
	    		$('#tampilan-alert-add-transfer-item').html('<strong>Please fill the data!</strong>');
	    		$('#div-alert-add-transfer-item').fadeIn();
				
				//alert('Please fill the data')
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
									+ '<td style="display : none">'+val.idVariant+'</td>'
									+ '<td> <a href="#" id='+val.id +' class="delete-transfer-item">Delete</a> </td>'
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
			evt.preventDefault();
			

			validate=$('#form-create-data').parsley();
			validate.validate();
			
			if(validate.isValid()){
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
						
						$('#tampilan-alert-transfer-stock').removeClass('alert-gagal').addClass('alert-sukses');
			    		$('#tampilan-alert-transfer-stock').html('<strong>Sukses!</strong> Berhasil Menyimpan ke Database');
			    		$('#div-alert-transfer-stock').fadeIn();
			    		
			    		setTimeout(function(){
							window.location='${pageContext.request.contextPath}/transaction/transfer-stock';
				    		},1000);
						
						//alert('save successfully');
					}, error : function(){
						$('#tampilan-alert-transfer-stock').removeClass('alert-sukses').addClass('alert-gagal');
			    		$('#tampilan-alert-transfer-stock').html('<strong>Error!</strong> Gagal Menyimpan ke Database');
			    		$('#div-alert-transfer-stock').fadeIn(); 
						//alert('save failed');
					}
				}) 
				
			}
		
			
		});
		
		
		//clik save item
		//a >> tag
		$('body').on('click', 'button.btn-save-item', function(evt){
			
			validate=$('#form-add-transfer-item').parsley();
			validate.validate();
			
			if(validate.isValid()){
				
				document.getElementById("btn-save-transfer-item").disabled = false;
				var id = $(this).attr('id');
				var transQty=parseInt($('.add-transfer-stock-qty'+id).val());
				var stock = parseInt($('.in-stock'+id).text());
				
				if(transQty > stock){
					alert('not enough stock!');
				}
				
				else if(transQty <= 0){
					alert('cannot transfer the data');
				}
				
				else{
					
					var fullData = {
							id : id,
							item : $('.item-name'+id).text(),
							inStock : $('.in-stock'+id).text(),
							transferQty : $('.add-transfer-stock-qty'+id).val(),
							idVariant : $('.item-variant'+id).text()
					}
					
				
					dataFromAddItem.push(fullData);
					resDataFromAddItem.push(fullData);
					//console.log (dataFromAddItem);
					//console.log(id);
					evt.preventDefault();
					/* $('#td-qty-'+id).html(transQty); */
					saved.push(id);
					spliceAlreadyId.push(id);
					savedQty.push(transQty);
					//supaya gak bsa d edit lg
		 			//console.log(saved)
					//console.log(savedQty) 
					$('#qty-'+id).html(transQty);
					$(this).hide();
					$('.add-transfer-saved'+id).show();
					
				}	
			}
		});
		
		
		//reset dataFromAddItem
		var resDataFromAddItem = [];
		var clickSaveItem = 0;
		var spliceAlreadyId = [];
		
		//cancel modal
		$('#cancel-add-transfer-item').on('click',function(){
			
				resDataFromAddItem.forEach(function(element){
					let index = dataFromAddItem.findIndex((id) => id == element.id);
					dataFromAddItem.splice(index,1);	
				});
				
				spliceAlreadyId.forEach(function(element){
					var a = saved.indexOf(element.toString());
					saved.splice(a,1);
				});
				
				//console.log(alreadyId);
				$('#isi-popup-transfer-stock').empty();
				$('#search-item').val('');
				$('#modal-add-transfer-item').modal('toggle');
				resDataFromAddItem = [];
				spliceAlreadyId = [];
	
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
									+ '<td id="qty-'+val.id+'"><input id='+val.id+' type="number" class="add-transfer-stock-qty'+ val.id +' input-transfer-stock" value="1" min="1" max="'+val.endingQty+'" data-parsley-required="true" required/></td>'
									+ '<td style="display : none" class="item-variant'+val.id+'">'+val.itemVariant.id+'</td>'
									+ '<td> <button href="#" id='+val.id +' class="save-item'+val.id+' btn btn-save-item btn-primary"> Confirm </button> <a href="#" id='+val.id +' class="btn btn-success add-transfer-saved'+val.id+'"> Confirmed </a> </td>'
									+ '</tr>');
							$('.add-transfer-saved'+val.id).hide();
						}
						
						else{
							var x = saved.indexOf(val.id.toString());
							$('#isi-popup-transfer-stock').append('<tr><td>'+val.itemVariant.item.name+'-'+val.itemVariant.name+'</td>'
									+ '<td>'+val.endingQty+'</td>'
									+ '<td id="qty-'+val.id+'">'+savedQty[x]+'</td>'
									+ '<td style="display : none" class="item-variant'+val.id+'">'+val.itemVariant.id+'</td>'
									+ '<td> <a href="#" id='+val.id +' class="save-item'+val.id+' btn btn-save-item btn-primary">  Confirm </button> <a href="#" id='+val.id +' class="btn btn-success add-transfer-saved'+val.id+'"> Confirmed </a> </td>'
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
					$('#created-by').text("Created By : " + data.createdBy.username);
					$('#transfer-status').text("Transfer Status : "+ data.status);
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
					
					//ajax for get transferstock-detail
						$.ajax({
					 		url : '${pageContext.request.contextPath }/transaction/transfer-stock/search-transfer-stock-history?search='+id,
							type : 'GET',
							dataType : 'json',
								success : function(data){
								$('#view-status-history').empty();
								$.each(data, function(key, val) {
								$('#view-status-history').append('<tr><td> On '+getDateFormat(val.createdOn)+' - '+val.status+'</td>'
										+ '</tr>');
								 		});
									},
									error : function(data){
										//alert('failed')
									}
					 			});
					
					
 
					$.ajax({
						url : '${pageContext.request.contextPath }/transaction/transfer-stock/search-transfer-stock-detail?search='+id,
						type : 'GET',
						dataType : 'json',
						success : function(data){ 
					 		$('#modal-view-transfer-stock-detail').modal({backdrop: 'static', keyboard: false});
					 		$.each(data, function(key, val) {
					 		$('#isi-transfer-stock-detail').append('<tr><td>'+val.itemVariant.item.name+'-'+val.itemVariant.name+'</td>'
						 			+ '<td>'+val.inStock+'</td>'
									+ '<td>'+val.transferQty+'</td>'
									+ '<td style="display : none">'+val.itemVariant.id+'</td>'
									+'<td style="display : none">'+$('#hidden-outlet-id').val()+'</td>'
									+ '</tr>');
					 		});
					 		
					 		var idz = [];
					 		$('#data-transfer-stock-detail > tbody > tr').each(function(index,data){
					 			var idx = {
					 					id : $(data).find('td').eq(3).text(),
					 					trStock : $(data).find('td').eq(2).text()
					 			};
					 			
					 			idz.push(idx)
					 		});
					 		
					 	/* 	 idz.forEach(function(element){
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
					 		 }); */
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
		var id = $('#hidden-id').val();

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
					if(newStatus=="Rejected"){
			    		window.location = '${pageContext.request.contextPath}/transaction/transfer-stock';	
					}
				}, error : function(){
					alert('update status failed');
				}
			});  
		
			if(newStatus=="Approved"){
				
				$.ajax({
				url : '${pageContext.request.contextPath }/transaction/transfer-stock/update-inventory-data?search='+transferStockId,
				type : 'GET',
				data : JSON.stringify(newStatus),
				contentType : 'application/json',
				success : function(){
		    		window.location = '${pageContext.request.contextPath}/transaction/transfer-stock';	
				}, error : function(){
					alert('update status failed');
				}
			}); 
				
				
				
				
	/* 				 /* $('#data-hidden-inventory > tbody > tr').each(function(index,data){
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
					  */
				
				 
			} 
		
		} else if (newStatus=="Print") {
			window.location='${pageContext.request.contextPath}/generate/ts2/'+id;
		}	
		
	 });
	
	 $('#back-view-transfer-stock').on('click',function(evt){
		window.location='${pageContext.request.contextPath}/transaction/transfer-stock';
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
	 
	 //function date format

		function getDateFormat(date) {
			var d = new Date(Number(date)),
			month = '' + (d.getMonth() + 1),
			day = '' + d.getDate(),
			year = d.getFullYear();
			if (month.length < 2)
			    month = '0' + month;
			if (day.length < 2)
			    day = '0' + day;
			var date = new Date();
			date.toLocaleDateString();
			return [year, month, day].join('-');
		};
		
		$('#export').click(function(){
			window.location = '${pageContext.request.contextPath}/generate/ts'; 
		})
		
		//fix bug input stock
		$('body').on('input', 'input.input-transfer-stock', function(evt){
				evt.preventDefault();
				 var id = $(this).attr('id');
			     var max = parseInt($(this).attr('max'));
			     var min = parseInt($(this).attr('min'));
			      if ($(this).val() > max)
			      {
			          $(this).val(max);
			      }
			      else if ($(this).val() < min)
			      {
			          $(this).val(min);
			      }     
			    }); 
		
		
	 	
	 	
	});
</script>

</html>