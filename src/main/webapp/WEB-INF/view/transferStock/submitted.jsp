<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<div class="content">
<section class="box content">
	<h3>Transfer Stock</h3>
	<hr style="border-color:black;">
		<div>
			<div align="right" style="float:left;margin-right:10px">
				
			</div>

			<div align="right" style="float: left">
				
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
			paging : true,
			searching : false
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
										alert('failed')
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