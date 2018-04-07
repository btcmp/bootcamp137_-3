
<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales Order</title>

<script>
$(document).ready(function() {
	
	//Create customer
	$('.customer').on('click', function() {
		$('#choose-cust').modal();
	})
	
	//Add Customer
	$('#add-new').on('click', function() {
		$('#new-cust').modal();
	})
	
	//save customer
	$('#btn-simpan').on('click', function(evt) {
		evt.preventDefault();
		var customer = {
				name : $('#save-name-cust').val(),
				email : $('#save-email-cust').val(),
				phone : $('#save-phone-cust').val(),
				dob : $('#save-dob-cust').val(),
				address : $('#save-address-cust').val(),
				province : {
					id : $('#prov-id').val()
				},
				region : {
					id : $('#reg-id').val()
				},
				district : {
					id : $('#dist-id').val()
				},
				active : 1
		}
		console.log(customer);
	
	
		$.ajax({
			url : '${pageContext.request.contextPath}/transaction/sales-order/save-customer',
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify(customer),
			success : function(data) {
				alert('save success');
			},
			error : function() {
				alert('saving failed!');
			}                              
		}); 
		
	});
	
	//list region
	//---------------------------------------------------------------------------------------------------------list region---------------------------------------------
	$('#save-pro-cust').on('change', function() {
		var id = $(this).val();
		//console.log(id);
		if (id!==""){
			$.ajax({
				url : '${pageContext.request.contextPath}/region/get-region?id='+id,
				type : 'GET',
				success : function(regionss) {
					var region = [];
						var reg = '<option value=/"/">Region</option>';
						region.push(reg);
						$(regionss).each(function(index, data2) {
							reg = "<option value=\""+data2.id+"\">"+data2.name+"</option>";
							region.push(reg);
						})
						
						$('#save-reg-cust').html(region);
				}, error : function(){
					alert('get failed');
				}
			});
		}
	});		
	
	//Get Region By Province
	$('#prov-id').change(function(){
		$('#reg-id').empty();
		$('#dist-id').empty();
		$('#reg-id').append('<option disabled selected value=\"\"> --- Select A Region --- </option>');
		$('#dist-id').append('<option disabled selected value=\"\"> --- Select A District --- </option>');
		var id = $(this).val();
		$.ajax({
			
			url : '${pageContext.request.contextPath}/outlet/get-region/'+id,
			type : 'GET',
			success : function(regions){
				console.log(regions);
				$(regions).each(function(index, data){
					$('#reg-id').append('<option value=\"'+data.id+'\">'+data.name+'</option>');
				});
			},
			error : function(regions){
				console.log(regions);
				alert('Cannot take regions..');
			}
		});
	});
	
	//Get District By Region
	$('#reg-id').change(function(){
		$('#dist-id').empty();
		$('#dist-id').append('<option disabled selected value=\"\"> --- Select A District --- </option>');
		var id = $(this).val();
		$.ajax({
			url : '${pageContext.request.contextPath}/outlet/get-district/'+id,
			type : 'GET',
			success : function(districts){
				console.log(districts)
				$(districts).each(function(index, data){
					$('#dist-id').append('<option value="'+data.id+'">'+data.name+'</option>');
				});
			},
			error : function(districts){
				console.log(districts);
				alert('Cannot get districts');
			}
		});
	});
	
	//search customer
	$('#name-cust').on('input',function(e){
		var word = $(this).val();
		console.log(word)
		if (word=="") {
			$('#search-customer-tbl').empty();
		} else {
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/transaction/sales-order/search-customer?search='+word,
				dataType: 'json',
				success : function(data){
					$('#search-customer-tbl').empty();
					$.each(data, function(key, val) {
						$('#search-customer-tbl').append('<tr><td id="customer-name'+ val.id+'">'+ val.name +'</td><td>'
								+ val.phone +'</td><td>'+ val.email +'</td><td><button type="button" id="'+ val.id +'" class="btn-choose-customer'
								+ val.id +' btn-choose-customer btn btn-primary"  data-dismiss="modal">Choose</button></td></tr>');
					});
				}, 
				error : function(){
					$('#search-customer-tbl').empty();
					//alert('show selected transferStock data in modal failed');
				}
			})
		}
	})
	
	//choose customer
	$('body').on('click', 'button.btn-choose-customer', function(){
		var id = $(this).attr('id');
		var name = $('#customer-name'+id).text();
		$('.customer').text(name);
		$('.customer').attr("id",id);
	})
	
	//search item
	var added=[];
	$('#search-item').on('input',function(e){
		var word = $(this).val();
		if (word=="") {
			$('#item-tbl').empty();
		} else {
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/transaction/sales-order/search-item?search='+word,
				dataType: 'json',
				success : function(data){
					$('#item-tbl').empty();
					$.each(data, function(key, val) {
						if(added.indexOf(val.id.toString()) == -1) {
							$('#item-tbl').append('<tr><td>'+ val.itemVariant.item.name +'-'+ val.itemVariant.name +'</td><td>Rp.'
									+ val.itemVariant.price +'</td><td id="td-qty'+ val.id +'"><input type="number" class="add-item-qty'+ val.id +'" value="1" min="1" max="'+val.endingQty+'" /></td><td><button type="button" id="'+ val.id +'" class="btn-add-item'
									+ val.id +' btn-add-item btn btn-primary">Add</button><button type="button" id="'+ val.id +'" class="btn-added-item'
									+ val.id +' btn-added-item btn">Added</button></td></tr>');
							$('.btn-added-item'+val.id).hide();
						} else {
							var a = added.indexOf(val.id.toString());
							$('#item-tbl').append('<tr><td>'+ val.itemVariant.item.name +'-'+ val.itemVariant.name +'</td><td>Rp.'
									+ val.itemVariant.price +'</td><td id="td-qty'+ val.id +'">'+addedQty[a]+'</td><td><button type="button" id="'+ val.id +'" class="btn-add-item'
									+ val.id +' btn-add-item btn btn-primary">Add</button><button type="button" id="'+ val.id +'" class="btn-added-item'
									+ val.id +' btn-added-item btn">Added</button></td></tr>');
							$('.btn-add-item'+val.id).hide();
						}
					});
				}, 
				error : function(){
					$('#item-tbl').empty();
					//alert('show selected transferStock data in modal failed');
				}
			})
		}
	})
	
	//add item
	document.getElementById("charge").disabled = true;
	var addedQty=[];
	$('.btn-added-item').hide();
	$('body').on('click', 'button.btn-add-item', function(){
		var id = $(this).attr('id');
		var transQty = $('.add-item-qty'+id).val();
		if (transQty<1) {
			alert("at least 1");
		} else {
			added.push(id);
			addedQty.push(transQty);
			$('#td-qty'+id).html(transQty);
			$(this).hide();
			$('.btn-added-item'+id).show();
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/transaction/sales-order/get-one-item/'+id,
				dataType: 'json',
				success : function(data){
					document.getElementById("charge").disabled = false;
					if (added.length=="1") {
						$('#salesOrder-tbl-body').empty();
					}
					
					$('#salesOrder-tbl-body').append('<tr id="tr-salesOrder'+ data.id +'"><td id="'+ data.itemVariant.id +'">'+ data.itemVariant.item.name +'-'+ data.itemVariant.name +'</td><td>Rp.'
							+ data.itemVariant.price +'</td><td>'+ transQty +'</td><td>Rp.'+ data.itemVariant.price*transQty +'</td><td><button type="button" id="'+ data.id +'" class="btn-cancel-item'
							+ data.id +' btn-cancel-item btn btn-primary">Cancel</button></td></tr>');
					$('#salesOrder-tbl-foot').empty();
					var total = 0;
					
					$('#salesOrder-tbl-body > tr').each(function(index, data){
						var price = $(data).find('td').eq(3).text().split("Rp.")[1];
						total = total + parseInt(price);
					})
					
					//$('#total-harga-fix').append('<tr id="tr-total-item"><th colspan="3">TOTAL</th><th colspan="2">Rp. '+ total +'</th></tr>');
					$('#charge').text("Charge Rp."+total)
				},
				error : function(){
					alert('get one item inventory failed');
				}
			})
		}
	})
	
	//btn-cancel
	$('body').on('click', 'button.btn-cancel-item', function(){
		var id = $(this).attr('id');
		$('#tr-salesOrder'+id).remove();
		$('.btn-added-item'+id).hide();
		$('.btn-add-item'+id).show();
		$('#td-qty'+id).html('<input type="number" class="add-item-qty'+ id +'" value="1" />');
		var a = added.indexOf(id.toString());
		added.splice(a,1);
		addedQty.splice(a,1);
		if (document.getElementById("salesOrder-tbl-body").rows.length>0) {
			document.getElementById("charge").disabled = false;
		}else {
			document.getElementById("charge").disabled = true;
		}
		$('#salesOrder-tbl-foot').empty();
		var total = 0;
		$('#salesOrder-tbl-body > tr').each(function(index, data){
			var price = $(data).find('td').eq(3).text().split("Rp.")[1];
			total = total + parseInt(price);
		})
		$('#salesOrder-tbl-foot').append('<tr id="tr-total-item"><th colspan="3">TOTAL</th><th colspan="2">Rp. '+ total +'</th></tr>');
		$('#charge').text("Charge Rp."+total)
	})
	
	//btn clear
	$('#clear-sale').click(function(){
		$('#salesOrder-tbl-body').empty();
		added = [];
		addedQty = [];
		$('#salesOrder-tbl-foot').empty();
		$('#salesOrder-tbl-foot').append('<tr id="tr-total-item"><th colspan="3">TOTAL</th><th colspan="2">Rp. '+ 0 +'</th></tr>');
		$('#charge').text("Charge");
		document.getElementById("charge").disabled = true;
		var word = $('#search').val();
		if (word=="") {
			$('#item-tbl').empty();
		} else {
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/transaction/sales-order/search-item?search='+word,
				dataType: 'json',
				success : function(data){
					$('#item-tbl').empty();
					$.each(data, function(key, val) {
						if(added.indexOf(val.id.toString()) == -1) {
							$('#item-tbl').append('<tr><td>'+ val.itemVariant.item.name +'-'+ val.itemVariant.name +'</td><td>Rp.'
									+ val.itemVariant.price +'</td><td id="td-qty'+ val.id +'"><input type="number" class="add-item-qty'+ val.id +'" value="1" min="1" max="'+val.endingQty+'" /></td><td><button type="button" id="'+ val.id +'" class="btn-add-item'
									+ val.id +' btn-add-item btn btn-primary">Add</button><button type="button" id="'+ val.id +'" class="btn-added-item'
									+ val.id +' btn-added-item btn">Added</button></td></tr>');
							$('.btn-added-item'+val.id).hide();
						} else {
							var a = added.indexOf(val.id.toString());
							$('#item-tbl').append('<tr><td>'+ val.itemVariant.item.name +'-'+ val.itemVariant.name +'</td><td>Rp.'
									+ val.itemVariant.price +'</td><td id="td-qty'+ val.id +'">'+addedQty[a]+'</td><td><button type="button" id="'+ val.id +'" class="btn-add-item'
									+ val.id +' btn-add-item btn btn-primary">Add</button><button type="button" id="'+ val.id +'" class="btn-added-item'
									+ val.id +' btn-added-item btn">Added</button></td></tr>');
							$('.btn-add-item'+val.id).hide();
						}
					});
				}, 
				error : function(){
					$('#item-tbl').empty();
					//alert('show selected transferStock data in modal failed');
				}
			})
		}
	})
	
	//charge
		$('#charge').on('click',function(){
		if ($('.customer').attr("id") === undefined) {
			alert("choose customer first");
		}else {
			$('#modal-charge-sales-order').modal();
		}
	});
	
	//done
		$('#charge-done').click(function(){
		var cash = parseInt($('#charge-cash').val());
		var total = parseInt($('#charge').text().split("Rp.")[1]);
		$('#receipt-cash').val("Out of Rp."+cash);
		$('#receipt-change').val("Rp."+(cash-total));
		$('#modal-receipt-sales-order').modal();
		
		var dataForUpdate = [];
		$('#salesOrder-tbl-body > tr').each(function(index, data){
			//for update inventory in database
			var updateInventory = {
					id : $(data).find('td').eq(0).attr('id'), //inventory
					qtySalesOrder : $(data).find('td').eq(2).text() //untuk ngurangi stock
			}
			dataForUpdate.push(updateInventory);
		});
		
		 dataForUpdate.forEach(function(element){
	   		$.ajax({
 				url : '${pageContext.request.contextPath}/transaction/transfer-stock/search-item-inventory?search='+element.id,
				type : 'GET',
				dataType : 'json',
				success : function(data){
			 		$.each(data, function(key, val) {

					$('#inventory-tbl-body').append('<tr><td>'+val.id+'</td>'
				 	 		+ '<td>'+element.qtySalesOrder+'</td>'
				 	 		+ '<td>'+val.outlet.id+'</td>'
							+ '</tr>');
			 		});
				},
				error : function(data){
					alert('failed')
				}
 			});   
 		 });
		
		
		
		
	})
	
	//send
	$('#receipt-done').click(function(){
		var salesOrderDetail = [];
		$('#salesOrder-tbl-body > tr').each(function(index, data){
			var sod = {
					itemVariant : {
						id : $(data).find('td').eq(0).attr('id')
					},
					qty : $(data).find('td').eq(2).text(),
					unitPrice : $(data).find('td').eq(1).text().split("Rp.")[1],
					subTotal : $(data).find('td').eq(3).text().split("Rp.")[1]
			}
			salesOrderDetail.push(sod);

		})
		
		var salesOrder = {
				customer : {
					id : $('.customer').attr('id')
				},
				grandTotal : $('#charge').text().split("Rp.")[1],
				salesOrderDetail : salesOrderDetail
		}
		console.log(salesOrder);
		
		$.ajax({
			url : '${pageContext.request.contextPath }/transaction/sales-order/save',
			type : 'POST',
			data : JSON.stringify(salesOrder),
			contentType : 'application/json',
			success : function(){
				alert('ok')
				//window.location = "${pageContext.request.contextPath}/transaction/sales-order";
			}, error : function(){
				alert('save failed');
			}
			
		}) 
		
		
/* 		$('#inventory-tbl-body > tr').each(function(index, data){
			var updateDataInventory = {
				id : $(data).find('td').eq(0).text(),
				salesOrderQty :  $(data).find('td').eq(1).text(),
				outlet : {
					id : $(data).find('td').eq(2).text()
				}
			}
			
			$.ajax({
				url : '${pageContext.request.contextPath}/item/update-inventory-so',
				type : 'PUT',
				data : JSON.stringify(updateDataInventory),
				contentType : 'application/json',
				success : function(){
					alert('update to inventory');
				}, error : function(){
					alert('update inventory failed');
				}
			
			}) 
			
		}); */
		
		
		
	
		
	})
});
</script>


</head>
<body>

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3>Sales Order</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
				<div class="col-lg-6">
					<input type="text" id="search-item" class="form-control" placeholder="Search">
					
					<table id="table-item" class="table table-stripped table-bordered table-hover">
						<thead>
							<th>Item</th>
							<th>Price</th>
							<th>Qty</th>
							<th>Action</th>
						</thead>
						<tbody id="item-tbl">
						</tbody>
					</table>
				</div>
				<div class="col-lg-6">
					<a href="#" class="customer form-control btn btn-primary">Choose Customer</a>
					
					<table id="salesOrder-tabel" class="table table-striped table-bordered" cellspacing="0" width="100%">
						<thead>
							<th>Item</th>
							<th>Price</th>
							<th>Qty.</th>
							<th>Subtotal</th>
							<th>Action</th>
						</thead>
						<tbody id="salesOrder-tbl-body">
						</tbody>
						<tfoot id="salesOrder-tbl-foot">
							<tr>
								<th colspan="3">TOTAL</th>
								<th colspan="2">Rp. 0</th>
							</tr>
						</tfoot>
					</table>
					
						<a href="#" id="clear-sale" class="clear-sod btn btn-primary">Clear Sale</a>
						<a href="#" id="charge" class="bayar-sod btn btn-primary">Charge Rp</a>
					</div>

				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>

	<%@ include file="modal/choose-customer.jsp"%>
	<%@ include file="modal/new-customer.jsp"%>
	<%@ include file="modal/charge-sales-order.jsp"%>
		<%@ include file="modal/receipt.jsp"%>
	


</body>
</html>