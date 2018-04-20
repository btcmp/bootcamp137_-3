
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
	var idSo;
	//Create customer
	$('.customer').on('click', function() {
		$('#choose-cust').modal({backdrop: 'static', keyboard: false});
	})
	
	//Add Customer
	$('#add-new').on('click', function() {
		$('#new-cust').modal({backdrop: 'static', keyboard: false});
	})
	
	
	
	//validate email
		$('#save-email-cust').on('input',function(){
			var email = $('#save-email-cust').val();
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/transaction/sales-order/cek-sku?sku='+sku,
				success : function(data){
					if(data>0){
						$('#div-add-sku').removeClass('has-success').addClass('has-error');
						$('#lbl-sku').html('SKU must be unique');
						$('#lbl-sku').fadeIn();
						skuValid = 0;
					}
					
					else{
						console.log('oke')
						$('#div-add-sku').removeClass('has-success').addClass('has-error');
						// $('#lbl-sku').html('SKU must be unique');
						$('#lbl-sku').fadeOut();
						skuValid = 1;
					}
				}, error : function(){
					
				}
			});
		});
	
	//save customer
	$('#btn-simpan').on('click', function(evt) {
		evt.preventDefault();
		validate=$('#form-add-customer').parsley();
		validate.validate();
		
		if(validate.isValid()){
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
			
		}
		
	});
	
	//list region
	//---------------------------------------------------------------------------------------------------------list region---------------------------------------------
	$('#save-pro-cust').on('change', function() {
		var id = $(this).val();
		//console.log(id);
		if (id!==""){
			$.ajax({
				url : '${pageContext.request.contextPath}/master/region/get-region?id='+id,
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
		$('#reg-id').append('<option disabled selected value=\"\">Select A Region</option>');
		$('#dist-id').append('<option disabled selected value=\"\">Select A District</option>');
		var id = $(this).val();
		$.ajax({
			
			url : '${pageContext.request.contextPath}/master/outlet/get-region/'+id,
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
		$('#dist-id').append('<option disabled selected value=\"\">Select A District</option>');
		var id = $(this).val();
		$.ajax({
			url : '${pageContext.request.contextPath}/master/outlet/get-district/'+id,
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
	
	$('#pilih-tanggal').datepicker({
   		autoclose: true,
   		endDate : '-10y'
 	});
	
	//search customer
	$('#name-cust').on('input',function(e){
		var word = $(this).val();
		
		if (word=="") {
			$('#table-cust').empty();
		} else {
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/transaction/sales-order/search-customer?search='+word,
				dataType: 'json',
				success : function(data){
					$('#table-cust').empty();
					
					$('#table-cust').append('<table  id="table-customer" class="table table-stripped table-bordered table-hover">'
							+'<thead>'
							+	'<tr>'
							+		'<th>Name</th>'
							+		'<th>Email</th>'
							+		'<th>Phone</th>'
							+		'<th>Action</th>'
							+	'</tr>'
						+	'</thead>'
						+	'<tbody id="search-customer-tbl">'
						+	'</tbody>'
					+	'</table>');
					
					$.each(data, function(key, val) {	
						$('#search-customer-tbl').append('<tr><td id="customer-name'+ val.id+'">'+ val.name +'</td><td>'
								+ val.phone +'</td><td>'+ val.email +'</td><td><button type="button" id="'+ val.id +'" class="btn-choose-customer'
								+ val.id +' btn-choose-customer btn btn-primary"  data-dismiss="modal">Choose</button></td></tr>');
					});
				}, 
				error : function(){
					$('#table-cust').empty();
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
							$('#item-tbl').append('<tr><td>'+ val.itemVariant.item.name +'-'+ val.itemVariant.name +'</td><td>Rp'
									+ val.itemVariant.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.')+'</td><td id="td-qty'+ val.id +'"><input id="'+val.id+'" type="number" class="input-add-item add-item-qty'+ val.id +'" value="1" min="1" max="'+val.endingQty+'" data-parsley-required="true" required /></td><td><button type="button" id="'+ val.id +'" class="btn-add-item'
									+ val.id +' btn-add-item btn btn-primary">&#10004;</button><button 	type="button" id="'+ val.id +'" class="btn-added-item'
									+ val.id +' btn-added-item btn btn-success">&#10004;</button></td></tr>');
							$('.btn-added-item'+val.id).hide();
						} else {
							var a = added.indexOf(val.id.toString());
							$('#item-tbl').append('<tr><td>'+ val.itemVariant.item.name +'-'+ val.itemVariant.name +'</td><td>Rp'
									+ val.itemVariant.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.')+'</td><td id="td-qty'+ val.id +'">'+addedQty[a]+'</td><td><button type="button" id="'+ val.id +'" class="btn-add-item'
									+ val.id +' btn-add-item btn btn-primary">&#10004;</button><button type="button" id="'+ val.id +'" class="btn-added-item'
									+ val.id +' btn-added-item btn btn-success">&#10004;</button></td></tr>');
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
		
		validate=$('#form-sales-order').parsley();
		validate.validate();
		
		if(validate.isValid()){
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
						
						$('#salesOrder-tbl-body').append('<tr id="tr-salesOrder'+ data.id +'"><td id="'+ data.itemVariant.id +'">'+ data.itemVariant.item.name +'-'+ data.itemVariant.name +'</td>'
								+'<td style="display:none">Rp'+data.itemVariant.price+'</td>'
								+'<td>Rp'+ data.itemVariant.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.')+'</td><td>'+ transQty +'</td><td style="display:none">Rp'+ data.itemVariant.price*transQty +'</td>'
								+'<td>'+'Rp'+(data.itemVariant.price*transQty).toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.')+'</td>'
								+'<td><button type="button" id="'+ data.id +'" class="btn-cancel-item'
								+ data.id +' btn-cancel-item btn btn-danger" max="'+data.endingQty+'""> &#10006;</button></td></tr>');
						$('#salesOrder-tbl-foot').empty();
						var total = 0;
						
						$('#salesOrder-tbl-body > tr').each(function(index, data){
							var price = $(data).find('td').eq(4).text().split("Rp")[1];
							total = total + parseInt(price);
						})
						
						$('#salesOrder-tbl-foot').append('<tr id="tr-total-item"><th colspan="3">TOTAL</th><th colspan="2">Rp'+ total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.')+'</th></tr>');
						$('#charge-tampilan').text("Charge Rp"+total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.'));
						$('#charge').text("Charge Rp"+total);
					},
					error : function(){
						alert('get one item inventory failed');
					}
				})
			}
		}
	})
	
	//btn-cancel
	$('body').on('click', 'button.btn-cancel-item', function(){
		var id = $(this).attr('id');
		var max = ($(this).attr('max'));
		
		$('#tr-salesOrder'+id).remove();
		$('.btn-added-item'+id).hide();
		$('.btn-add-item'+id).show();
	   
		$('#td-qty'+id).html('<input id="'+id+'" type="number" class="input-add-item add-item-qty'+ id +'" value="1" min="1" max="'+max+'" />');
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
			var price = $(data).find('td').eq(4).text().split("Rp")[1];
			total = total + parseInt(price);
		})
		$('#salesOrder-tbl-foot').append('<tr id="tr-total-item"><th colspan="3">TOTAL</th><th colspan="2">Rp'+ total +'</th></tr>');
		$('#charge').text("Charge Rp"+total)
	})
	
	//btn clear
	$('#clear-sale').click(function(){
		$('#salesOrder-tbl-body').empty();
		added = [];
		addedQty = [];
		$('#salesOrder-tbl-foot').empty();
		$('#salesOrder-tbl-foot').append('<tr id="tr-total-item"><th colspan="3">TOTAL</th><th colspan="2">Rp'+ 0 +'</th></tr>');
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
							$('#item-tbl').append('<tr><td>'+ val.itemVariant.item.name +'-'+ val.itemVariant.name +'</td><td>Rp'
									+ val.itemVariant.price +'</td><td id="td-qty'+ val.id +'"><input id="'+val.id+'" type="number" class="add-item-qty'+ val.id +' input-add-item" value="1" min="1" max="'+val.endingQty+'" /></td><td><button type="button" id="'+ val.id +'" class="btn-add-item'
									+ val.id +' btn-add-item btn btn-primary">Add</button><button type="button" id="'+ val.id +'" class="btn-added-item'
									+ val.id +' btn-added-item btn">Added</button></td></tr>');
							$('.btn-added-item'+val.id).hide();
						} else {
							var a = added.indexOf(val.id.toString());
							$('#item-tbl').append('<tr><td>'+ val.itemVariant.item.name +'-'+ val.itemVariant.name +'</td><td>Rp'
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
		$('#charge-tampilan').on('click',function(){
		var total = parseInt($('#charge').text().split("Rp")[1]);
		var totalTampil = 'Rp'+total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
		if ($('.customer').attr("id") === undefined) {
			alert("choose customer first");
		}else {
			$('#div-charge-cash').append( "<input type='text' class='form-control' id='charge-cash' value="+totalTampil+">");
			$('#modal-charge-sales-order').modal({backdrop: 'static', keyboard: false});
		}
	});
	

	$('body').on('input', 'input#charge-cash', function(evt){
		var charge = $(this).val().match(/\d/g);
		
		if (charge!==null) {
			if (charge[0]==0) {
				chargeRp = 'Rp';
			} else {
				charge = charge.join('');
				console.log(charge);
				var chargeRp = 'Rp'+charge.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
				console.log(chargeRp)
			}
		} else {
			chargeRp = 'Rp';
		}
		$(this).val(chargeRp);
	})
	
	
	$('#charge-cancel').click(function(){
		$('#modal-charge-sales-order').modal("toggle");
		$('#div-charge-cash').empty();
	});

	
	//done
		$('#charge-done').click(function(){

		validate=$('#form-charge-so').parsley();
		validate.validate();
		
		if(validate.isValid()){
			var cash = parseInt($('#charge-cash').val().match(/\d/g).join(''));
			console.log('cash='+cash)
			var total = parseInt($('#charge').text().split("Rp")[1]);
			document.getElementById("receipt-cash").innerHTML = "Out of Rp"+cash.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
			document.getElementById("receipt-change").innerHTML = "Rp"+(cash-total).toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
			
			var salesOrderDetail = [];
			$('#salesOrder-tbl-body > tr').each(function(index, data){
				var sod = {
						itemVariant : {
							id : $(data).find('td').eq(0).attr('id')
						},
						qty : $(data).find('td').eq(3).text(),
						unitPrice : $(data).find('td').eq(1).text().split("Rp")[1],
						subTotal : $(data).find('td').eq(4).text().split("Rp")[1]
				}
				salesOrderDetail.push(sod);

			})
			
			var salesOrder = {
					customer : {
						id : $('.customer').attr('id')
					},
					grandTotal : $('#charge').text().split("Rp")[1],
					salesOrderDetail : salesOrderDetail
			}
			console.log(salesOrder);
			
		$.ajax({
				url : '${pageContext.request.contextPath }/transaction/sales-order/save',
				type : 'POST',
				data : JSON.stringify(salesOrder),
				contentType : 'application/json',
				success : function(data){
					idSo = data;
					$('#tampilan-alert-so').removeClass('alert-gagal').addClass('alert-sukses');
		    		$('#tampilan-alert-so').html('<strong>Sukses!</strong> Berhasil Menyimpan ke Database');
		    		$('#div-alert-so').fadeIn();
		    		
		    /* 	setTimeout(function(){
			    		window.location = '${pageContext.request.contextPath}/master/item/';
			    		},1000); */
					//window.location = "${pageContext.request.contextPath}/transaction/sales-order";
				}, error : function(){
					$('#tampilan-alert-so').removeClass('alert-sukses').addClass('alert-gagal');
		    		$('#tampilan-alert-so').html('<strong>Error!</strong> Gagal Menyimpan ke Database');
		    		$('#div-alert-so').fadeIn();
		    		}
			}) 		
			
			$('#modal-receipt-sales-order').modal({backdrop: 'static', keyboard: false});
		}
		
	})
	
	//send
	$('#receipt-done').click(function(){
		window.location = "${pageContext.request.contextPath}/transaction/sales-order";
	})
	
	$('#receipt-print').click(function(){
		window.location = "${pageContext.request.contextPath}/generate/so/"+idSo;
	})
	
	
	
	//fix bug input
	$('body').on('input', 'input.input-add-item', function(evt){
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
				<form id="form-sales-order" style="border:none">
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
				</form>
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
								<th colspan="2">Rp0</th>
							</tr>
						</tfoot>
					</table>
					<div>
					
					</div>
						<a href="#" id="clear-sale" class="clear-sod btn btn-primary">Clear Sale</a>
						<a href="#" id="charge-tampilan" class="bayar-sod btn btn-primary">Charge Rp</a>
						<a style="display:none" href="#" id="charge" class="bayar-sod btn btn-primary">Charge Rp</a>
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