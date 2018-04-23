<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>
<%@ include file="modal/MAIN-Add-Data.jsp"%>
<%@ include file="modal/MAIN-Edit-Data.jsp"%>
<%@ include file="modal/VARIANT-Add-Data.jsp"%>
<%@ include file="modal/VARIANT-Edit-Data.jsp"%>
<%@ include file="modal/EDITITEM-VARIANT-Add-Data.jsp"%>
<%@ include file="modal/EDITITEM-VARIANT-Edit-Data.jsp"%>

<div class="content">
<section class="box content">
	<h3>Master Item</h3>
	<hr style="border-color:black;"/>
		<div style="display:none;float: left; margin-right: 600px;">
				<p> Outlet Login : ${outletLogin.name} </p>
				<input style="display:none" id="add-outlet" value="${outletLogin.id}"/>
		</div>
		
		<div> 
		<div style="float:left;margin-right:200px;">
			<span><input class="form-control" style="width:200%" type="text" id="search-box" placeholder="Search Item"/></span>
		</div>
		
		
		<div align="right" style="float:left;margin-right:30px;">
			<button id="export" class="btn btn-primary btn-md" >Export Item Data</button>
		</div>	
		
		<div align="right" style="float:left">
			<button  id="create-data-utama" class="btn btn-primary btn-md">Create Item Data</button>
		</div>	
		
		</div>
		
		<div style="clear:both"></div>
		<br/>
		
	<div id="daftar-barang">
		<table id="dt-view-item" class="table table-striped table-bordered table-hover">
		<thead>
	
			<tr>
				<th>Name</th>
				<th>Category</th>
				<th>Unit Price</th>
				<th>In Stock</th>
				<th>Stock Alert</th>
				<th>Action</th>
				
			</tr>
		</thead>
		<tbody id="full-data-utama">
			<c:forEach items="${itemInventories}" var="invent"> 
			<c:set var = "endQty" scope = "session" value = "${invent.endingQty}"/>
			<c:set var = "alertQty" scope = "session" value = "${invent.alertAtQty}"/>
			<c:set var = "activeItem" scope = "session" value = "${invent.itemVariant.item.active}"/>
			<c:set var = "activeVariant" scope = "session" value = "${invent.itemVariant.active}"/>
			<c:if test = "${activeVariant == true && activeItem == true}">
         			<tr>
					<td>${invent.itemVariant.item.name} - ${invent.itemVariant.name} </td>
					<td>${invent.itemVariant.item.category.name}</td>

					<td>
						<script>
							document.write('Rp' + ${invent.itemVariant.price}.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "."));
						</script>
					</td>
					<td>${invent.endingQty}</td>
					<td id="stock-alert">	
					<c:choose>
    		  				<c:when test = "${endQty <= alertQty}">
       			  				<p style="color:red">LOW<p>
     		 				</c:when>
     		
     		 				<c:otherwise>
       			  				<p>OK<p>
     		 				</c:otherwise>
     		 		</c:choose>
					</td>
					
					<td><a href="#" id="${invent.itemVariant.item.id}" class="edit-data">Edit</a></td>
				</tr>
     		</c:if>
		
			</c:forEach> 
		</tbody>	
		</table>
		</div>	
</section>
</div>
</body>

<script type="text/javascript">
$(document).ready(function(){
	
	$('#dt-view-item').DataTable({
		  dom: "<'row'<'col-sm-12'tr>>" +
	         "<'row'<'col-sm-4'l><'col-sm-4'i><'col-sm-4'p>>"	
	});
	
	var index=0;
	
	var idDelete=[];
	var idClear=[];
/* ============================== [SHOW MODAL] CREATE DATA UTAMA ======================================*/
	$('#create-data-utama').on('click', function(evt) {
		evt.preventDefault;
		$('#modal-create-data').modal({backdrop: 'static', keyboard: false});
	}); 
/* ============================== [SHOW MODAL] FOR ADD VARIANT ======================================*/
    $('#btn-add-variant').on('click', function(evt) {
	   	document.getElementById('form-add-varian-data').reset();
		$('#form-add-varian-data').parsley().reset();
		$('#div-add-sku').removeClass('has-error');
		//$('#lbl-sku').html();
		document.getElementById('lbl-sku').style.display = "none";

		validate=$('#form-add-data').parsley();
		validate.validate();
		
		if(validate.isValid()){
			evt.preventDefault();
			$('#modal-add-variant').modal({backdrop: 'static', keyboard: false});
			clearForm();
		}
	});
	
	//urusan input unit price
    $('body').on('input', 'input#add-unit-price', function(evt){
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
	
	///
	   $('body').on('input', 'input#edit-unit-price', function(evt){
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
	
	//
	 $('body').on('input', 'input#edititem-add-unit-price', function(evt){
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
	
	//
	 $('body').on('input', 'input#edititem-edit-unit-price', function(evt){
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

    
    $('#edititem-btn-add-variant').on('click', function(evt) {
    	evt.preventDefault();
    	
    	var id = $(this).attr("data-id");
		$('#edititem-modal-add-variant').modal({backdrop: 'static', keyboard: false});
		clearFormEdit();
	});
   
    var uniqueSku=[];
/* =================== [ADD] VARIANT DATA TO TABLE MODAL-CREATE-DATA ===================================*/
	 $('#btn-add-data-variant').on('click', function(evt) {
		 evt.preventDefault;
		 
		 validate=$('#form-add-varian-data').parsley();
			validate.validate();
			
			if(validate.isValid() && skuValid==1){
				index++;
				
				$('#modal-add-variant').modal('toggle');
				$('#isi-popup-itm').append('<tr id=tr-item' + index + '><td><p id=' + index + '>'+ $('#add-variant-name').val()+'</p></td><td style="display:none"><p>'+
						$('#add-unit-price').val().match(/\d/g).join('')+'</p></td><td><p>'+
						$('#add-unit-price').val()+'</p></td><td><p>'+$('#add-sku').val()
						+'</p></td><td><p>'+$('#add-beginning-stock').val()+'</p></td><td style="display:none"><p>'+$('#add-alert-at').val()
						+'</p></td> <td style="display:none"><p>'+$('#add-active-variant').val()+'</p></td>'
						+'<td> <a href="#" id="tombol-edit-variant">Edit</a> | <a href="#" id="delete-variant-data" >Delete </a>'+'</td></tr>');
			 console.log(index);
			 uniqueSku.push($('#add-sku').val().toLowerCase());
			 console.log(uniqueSku)
			}
		 
		 //reloadTableCreateAddVariant();
	
		});
		
	 $('#edititem-btn-add-data-variant').on('click', function(evt) {
		 evt.preventDefault;
		 validate=$('#form-edititem-variant-add-data').parsley();
		 validate.validate();
			
			if(validate.isValid()){
				$('#edititem-modal-add-variant').modal('toggle');
				index++;
		    	$('#isi-popup-edit').append('<tr id="tr-item'+index+'"><td><p id='+index+'>'+ $('#edititem-add-variant-name').val()+'</p></td><td style="display:none"><p>'+
		    			$('#edititem-add-unit-price').val().match(/\d/g).join('')+'</p></td><td><p>'+
		    			$('#edititem-add-unit-price').val()+'</p></td><td><p>'+$('#edititem-add-sku').val()+'</p></td>'
		    			+'<td><p>'+$('#edititem-add-beginning-stock').val()+'</p></td>'
		    			+'<td style="display:none"><p>'+$('#edititem-add-alert-at').val()+'</p></td>'
		   				+'<td style="display:none"><p>'+$('#edititem-add-active-variant').val()+'</p></td>'
		   				+'<td style="display:none"><p>null</p></td>'
		   				+'<td style="display:none"><p>null</p></td>'
		   				+'<td style="display:none"><p>'+$('#outlet-id').val()+'</p></td>'
		   				+'<td style="display:none"><p>null</p></td>'
		   				+'<td><a href="#" id="edititem-tombol-edit-variant"> Edit </a> | <a href="#" id="edititem-delete-variant-data-remove">Remove </a>'+'</td></tr>');
			}
		 
		});
	 
	 $('#btn-edit-save-variant').on('click', function(evt) {
		 evt.preventDefault();
		 
		 validate=$('#form-variant-edit-data').parsley();
		 validate.validate();
			
			if(validate.isValid() && skuValid==1){
			 	$('#modal-edit-variant').modal('toggle');
				index=$('#id-item-hidden-variant-edit').val();
				 console.log(index)
				 $("#tr-item"+index).remove();
			 	//reloadTableCreateEditVariant();
			 	///index++;
				$('#isi-popup-itm').append('<tr id=tr-item'+index+'><td><p id='+index+'>'+ $('#edit-variant-name').val()+'</p></td><td  style="display:none"><p>'+
							$('#edit-unit-price').val().match(/\d/g).join('')+'</p></td><td><p>'+
							$('#edit-unit-price').val()+'</p></td><td><p>'+$('#edit-sku').val()
							+'</p></td><td><p>'+$('#edit-beginning-stock').val()+'</p></td><td style="display:none"><p>'+$('#edit-alert-at').val()
							+'</p></td> <td style="display:none"><p>'+$('#edit-active-variant').val()+'</p></td>'
							+'<td> <a href="#" id="tombol-edit-variant"> Edit </a> | <a href="#" id="delete-variant-data"> Delete </a>'+'</td></tr>');	
			}
	 });
	 
	 $('#edititem-btn-save-variant').on('click', function(evt) {
		 evt.preventDefault();
		 var endingQty = parseInt($('#ending-qty').val());
		 var endingQtyNull = $('#ending-qty').val();
		 console.log(endingQty)
		 validate=$('#form-edititem-variant-edit-data').parsley();
		 validate.validate();
			
			if(validate.isValid()){
				$('#edititem-modal-edit-variant').modal('toggle');
				indexRemove=$('#id-item-hidden').val();
				console.log(indexRemove)
				 $("#tr-item"+indexRemove).remove();
				 console.log($('#edititem-add-variant-name').val())
				 	//a$.each(xxx,function(key,val){})

				 if(endingQty==0){
					 $('#isi-popup-edit').append('<tr id=tr-item'+indexRemove+'><td><p id='+indexRemove+'>'+ $('#edititem-edit-variant-name').val()+'</p></td><td  style="display:none"><p>'+
				    			$('#edititem-edit-unit-price').val().match(/\d/g).join('')+'</p></td><td><p>'+
				    			$('#edititem-edit-unit-price').val()+'</p></td><td><p>'+$('#edititem-edit-sku').val()
				    			+'</p></td><td><p>'+$('#edititem-edit-beginning-stock').val()+'</p></td><td style="display:none"><p>'+$('#edititem-edit-alert-at').val()
				    			+'</p></td><td style="display:none"><p>'+$('#edititem-edit-active-variant').val()+'</p></td>'
				    			+'<td style="display:none"><p>'+$('#variant-id').val()+'</p></td>'
				    			+'<td style="display:none"><p>'+$('#inventory-id').val()+'</p></td>'
				    			+'<td style="display:none"><p>'+$('#outlet-id').val()+'</p></td>'
				    			+'<td style="display:none"><p>'+$('#ending-qty').val()+'</p></td>'
				    			+'<td> <a href="#" id="edititem-tombol-edit-variant"> Edit </a> | <a href="#" id="edititem-delete-variant-data"> Deactive </a>'+'</td></tr>');
				 }
				 
				 else if(isNaN(endingQty)){
					 $('#isi-popup-edit').append('<tr id=tr-item'+indexRemove+'><td><p id='+indexRemove+'>'+ $('#edititem-edit-variant-name').val()+'</p></td><td style="display:none"><p>'+
				    			$('#edititem-edit-unit-price').val().match(/\d/g).join('')+'</p></td><td><p>'+
				    			$('#edititem-edit-unit-price').val()+'</p></td><td><p>'+$('#edititem-edit-sku').val()
				    			+'</p></td><td><p>'+$('#edititem-edit-beginning-stock').val()+'</p></td><td style="display:none"><p>'+$('#edititem-edit-alert-at').val()
				    			+'</p></td><td style="display:none"><p>'+$('#edititem-edit-active-variant').val()+'</p></td>'
				    			+'<td style="display:none"><p>'+$('#variant-id').val()+'</p></td>'
				    			+'<td style="display:none"><p>'+$('#inventory-id').val()+'</p></td>'
				    			+'<td style="display:none"><p>'+$('#outlet-id').val()+'</p></td>'
				    			+'<td style="display:none"><p>'+$('#ending-qty').val()+'</p></td>'
				    			+'<td> <a href="#" id="edititem-tombol-edit-variant"> Edit </a> | <a href="#" id="edititem-delete-variant-data-remove"> Remove </a>'+'</td></tr>');
				 }
				 
				 else{
					 $('#isi-popup-edit').append('<tr id=tr-item'+indexRemove+'><td><p id='+indexRemove+'>'+ $('#edititem-edit-variant-name').val()+'</p></td><td  style="display:none"><p>'+
				    			$('#edititem-edit-unit-price').val().match(/\d/g).join('')+'</p></td><td><p>'+
				    			$('#edititem-edit-unit-price').val()+'</p></td><td><p>'+$('#edititem-edit-sku').val()
				    			+'</p></td><td><p>'+$('#edititem-edit-beginning-stock').val()+'</p></td><td style="display:none"><p>'+$('#edititem-edit-alert-at').val()
				    			+'</p></td><td style="display:none"><p>'+$('#edititem-edit-active-variant').val()+'</p></td>'
				    			+'<td style="display:none"><p>'+$('#variant-id').val()+'</p></td>'
				    			+'<td style="display:none"><p>'+$('#inventory-id').val()+'</p></td>'
				    			+'<td style="display:none"><p>'+$('#outlet-id').val()+'</p></td>'
				    			+'<td style="display:none"><p>'+$('#ending-qty').val()+'</p></td>'
				    			+'<td> <a href="#" id="edititem-tombol-edit-variant"> Edit </a>'+'</td></tr>');
				 }
				 
			
			}
			});
			 
			
		 
		 
		 
/* =================== [DELETE] VARIANT DATA AT TABLE MODAL-CREATE-DATA ===================================*/
	 $("#isi-popup-itm").on('click','#delete-variant-data',function(){
	        $(this).parent().parent().remove();
	        var element = $(this).parent().parent();
	        var skuToDelete = element.find('td').eq(3).find('p').text();
			var a = uniqueSku.indexOf(skuToDelete.toString());
			uniqueSku.splice(a,1);

	    });
	    
	 $('#btn-cancel-add-variant').on('click',function(){
	     $('#modal-add-variant').modal('toggle');

	 });
	    
	 $("#isi-popup-edit").on('click','#edititem-delete-variant-data-remove',function(){
		 var element = $(this).parent().parent(); //dari a ke td baru ke tr
	        var id = element.find('td').eq(7).find('p').text();
	    	$(this).parent().parent().remove();	
	 });
	 
	 $("#isi-popup-edit").on('click','#edititem-delete-variant-data',function(){
	        var element = $(this).parent().parent(); //dari a ke td baru ke tr
	        var id = element.find('td').eq(7).find('p').text();
	        
	        if(confirm('Are you sure to deactive this variant?')){
	        	 if(id=='null') {
	 	        	$(this).parent().parent().remove();
	 	        	console.log('null');
	 	        } 
	 	         
	 	        else  {
	 	        	$(this).parent().parent().hide();
	 	        	idDelete.push(id);	    	
	 	        	console.log(idDelete);
	 	        }
	        }
	        
	        else{
	        	
	        }
	       
	       
	    });

	 

/* =================== [DELETE] VARIANT DATA AT MODAL-CREATE-DATA ===================================*/
	 $("#btn-cancel").on('click',function(){
			 clearFormAddItem();	
			 uniqueSku = [];
	    });	  

	
	 $("#btn-back-edit").on('click',function(){
		 clearFormEditItem();	 
	 });
	 
	 $("#edititem-btn-cancel").on('click',function(){
		 $('#dt-popup-edit > tbody > tr').each(function(index,data){
		    	var idInventory = $(data).find('td').eq(7).text()
		    	 idClear.push(idInventory);
		    });
		 
		 clearFormEditItem();
	 });
	 
    
/* ========================== [SHOW MODAL] EDIT VARIANT DATA ========================================*/
	 $("#isi-popup-itm").on('click','#tombol-edit-variant',function(evt){
		 evt.preventDefault();
	        var element = $(this).parent().parent();
	        var select = element.find('td').eq(1).find('p').text();
	        console.log(element)
	        console.log(select)
	        $('#modal-edit-variant').modal({backdrop: 'static', keyboard: false});
	        $('#edit-variant-name').val(element.find('td').eq(0).find('p').text());
	        $('#edit-unit-price').val(element.find('td').eq(2).find('p').text());
	        $('#edit-sku').val(element.find('td').eq(3).find('p').text());
	        $('#edit-beginning-stock').val(element.find('td').eq(4).find('p').text());
	   	   	$('#edit-alert-at').val(element.find('td').eq(5).find('p').text());
	   		$('#edit-active-variant').val(element.find('td').eq(6).find('p').text());
	   		$('#id-item-hidden-variant-edit').val(element.find('td').eq(0).find('p').attr('id'));
	   		
	   		var maxVal = element.find('td').eq(4).find('p').text();
	   		$('#edit-alert-at').attr("max", maxVal);
	        console.log(element.find('td').eq(0).find('p').attr('id'))
	    });
	    
	 $("#isi-popup-edit").on('click','#edititem-tombol-edit-variant',function(evt){
		 evt.preventDefault();
	        var element = $(this).parent().parent();
	        $('#edititem-modal-edit-variant').modal({backdrop: 'static', keyboard: false});
	        $('#edititem-edit-variant-name').val(element.find('td').eq(0).find('p').text());
	        $('#edititem-edit-unit-price').val(element.find('td').eq(2).find('p').text());
	        $('#edititem-edit-sku').val(element.find('td').eq(3).find('p').text());
	        $('#edititem-edit-beginning-stock').val(element.find('td').eq(4).find('p').text());
	   	   	$('#edititem-edit-alert-at').val(element.find('td').eq(5).find('p').text());
	   		$('#edititem-edit-active-variant').val(element.find('td').eq(6).find('p').text());
	   		$('#variant-id').val(element.find('td').eq(7).find('p').text());
	   		$('#inventory-id').val(element.find('td').eq(8).find('p').text());
	   		$('#ending-qty').val(element.find('td').eq(10).find('p').text());
	   		$('#id-item-hidden').val(element.find('td').eq(0).find('p').attr('id'));
	    });
	    
	 
	 
	 //urusan image
/* 	 function preview_image(event) 
		{
			 var reader = new FileReader();
	 		reader.onload = function()
			 	{
				  var output = document.getElementById('output_image');
				  output.src = reader.result;
				 }
	 			reader.readAsDataURL(event.target.files[0]);
	} */
/* ============================== [EXECUTE] CREATE DATA UTAMA ======================================*/
		$('#btn-create-data').on('click',function(evt){
			
			//upload Image
			var formData = new FormData();
			formData.append('image',$('#images-input')[0].files[0]); //baca filenya
		/* 	console.log(image); */
			
			
			evt.preventDefault();
			var active = "true";
/* 		      $(':checkbox:checked').each(function(){
		        active=$(this).val()
		      }); */
		    
		    var itemVar = [];
		    var varInv = [];
		    
		    console.log(varInv);
		    
		    $('#dt-popup-item > tbody > tr').each(function(index,data){
		    	var itemInventory = {
						 beginning :$(data).find('td').eq(4).text(),
					     alertAtQty :$(data).find('td').eq(5).text(),
					     outlet : {
					    	 id : $('#add-outlet').val()
					     }
				 }
		    	
				 var itemVariant = {
						 name : $(data).find('td').eq(0).text(),
						 price : $(data).find('td').eq(1).text(),
					     sku : $(data).find('td').eq(3).text(),
					     active : $(data).find('td').eq(6).text(),
					     itemInventories : [itemInventory]
				 };
				 itemVar.push(itemVariant)
			}); 
		    
		    console.log(itemVar)
		    
		
		    
			validate=$('#form-add-data').parsley();
			validate.validate();
			
			if(validate.isValid()){
				$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/master/item/upload',
					data : formData,
					contentType : false,
					processData : false,
					cache : false,
					success : function(data){
					     var item = {
						    	name : $('#add-item-name').val(),
						    	image : data,
						    	active : 1,
						    	category:{
						    		id :  $('#add-category').val()
						    	},
						    	itemVariants : itemVar
						    }
						
						    console.log(data) 
						    
							$.ajax({
					    	url:'${pageContext.request.contextPath}/master/item/save',
					    	type : 'POST',
					    	data : JSON.stringify(item),
					    	contentType : 'application/JSON',
					    	success : function(){
					    		$('#tampilan-alert').removeClass('alert-gagal').addClass('alert-sukses');
					    		$('#tampilan-alert').html('<strong>Sukses!</strong> Berhasil Menyimpan ke Database');
					    		$('#div-alert').fadeIn();
					    		
					    		setTimeout(function(){
						    		window.location = '${pageContext.request.contextPath}/master/item/';
						    		},1000);
					    	},
					    	error : function(){
					    		$('#tampilan-alert').removeClass('alert-sukses').addClass('alert-gagal');
					    		$('#tampilan-alert').html('<strong>Error!</strong> Gagal Menyimpan ke Database');
					    		$('#div-alert').fadeIn(); 
					    	}
					    }); 
						    
						    
						
					},
					
					error : function(){
						alert('error')
					}
					
				});
		
			}
		    
		  
		});
		
		var skuValid;
		
		$('#add-sku').on('input',function(){
			var sku = $('#add-sku').val();
			
	/* 		if(uniqueSku.indexOf(sku.toString().toLowerCase())==-1){
				$('#div-add-sku').removeClass('has-success').addClass('has-error');
				$('#lbl-sku').fadeOut();
				skuValid = 1;
			} 
			
			 else{
				 $('#div-add-sku').removeClass('has-success').addClass('has-error');
					$('#lbl-sku').html('SKU must be unique');
					$('#lbl-sku').fadeIn();
					skuValid = 0;	
			} */
			
			
			//console.log(sku)
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/master/item/cek-sku?sku='+sku,
				success : function(data){
					
					
					if(data>0){
						$('#div-add-sku').removeClass('has-success').addClass('has-error');
						$('#lbl-sku').html('SKU must be unique');
						$('#lbl-sku').fadeIn();
						skuValid = 0;
					}
					
					else{
						//console.log('oke')
						$('#div-add-sku').removeClass('has-error');
						$('#lbl-sku').fadeOut();
						skuValid = 1;
						
						if(uniqueSku.indexOf(sku.toString().toLowerCase())> -1){
							$('#div-add-sku').removeClass('has-success').addClass('has-error');
							$('#lbl-sku').html('SKU must be unique');
							$('#lbl-sku').fadeIn();
							skuValid = 0;
						} 
						
					}
				}, error : function(){
					
				}
			});
		});
		
		$('#edit-sku').on('input',function(){
			var sku = $('#edit-sku').val();
			console.log(sku)
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/master/item/cek-sku?sku='+sku,
				success : function(data){
					if(data>0){
						$('#div-edit-sku').removeClass('has-success').addClass('has-error');
						$('#lbl-edit-sku').html('SKU must be unique');
						$('#lbl-edit-sku').fadeIn();
						skuValid = 0;
					}
					
					else{
						console.log('oke')
						$('#div-edit-sku').removeClass('has-success').addClass('has-error');
						// $('#lbl-sku').html('SKU must be unique');
						$('#lbl-edit-sku').fadeOut();
						skuValid = 1;
					
						
					}
				}, error : function(){
					
				}
			});
		});
		
		
		var imageStatus = 0;
		$('#edititem-btn-create-data').on('click',function(evt){
			evt.preventDefault();
			console.log(imageStatus)
			
			validate=$('#form-main-edit-data').parsley();
			validate.validate();
				
				if(validate.isValid()){
					
					var active = "true";
				      $('#edititem-checkbox:checked').each(function(){
				        active=$(this).val()
				      });
				      
				      console.log(active)
				    
				    var itemVar = [];
				    var varInv = [];
			
				    if(imageStatus==1){
				    	var formData = new FormData();
						formData.append('image',$('#images-input-edit')[0].files[0]); //baca filenya
						$.ajax({
							type : 'POST',
							url : '${pageContext.request.contextPath}/master/item/upload',
							data : formData,
							contentType : false,
							processData : false,
							cache : false,
							success : function(data){ 
							/* 	if(imageStatus==0){
									fixImage=data;
								} */
								
								//ID OUTLET BELUM
							    $('#dt-popup-edit > tbody > tr').each(function(index,data){
							    	var itemInventory = {
							    			 id : $(data).find('td').eq(8).text(),
											 beginning :$(data).find('td').eq(4).text(),
										     alertAtQty :$(data).find('td').eq(5).text(),
										     endingQty :$(data).find('td').eq(10).text(),
										     itemVariant : {
										    	 id : $(data).find('td').eq(7).text()
										     },
							    			 outlet : {
							    				id : $('#add-outlet').val()
							    			 }
							    	
									 }
							    	
									 var itemVariant = {
							    			 id : $(data).find('td').eq(7).text(),
											 name : $(data).find('td').eq(0).text(),
											 price : $(data).find('td').eq(1).text(),
										     sku : $(data).find('td').eq(3).text(),
										     active : 1,
										     itemInventories : [itemInventory],
										     item : {
										    	id : $(data).find('td').eq(7).text()
										     }
									 };
									 itemVar.push(itemVariant)
								}); 
							    
							    //console.log(itemVar)
							    
							    var item = {
							    	id : $('#edit-item-input-id').val(),
							    	name : $('#edititem-item-name').val(),
							    	active : active,
							    	category:{
							    		id :  $('#edititem-category').val()
							    	},
							    	itemVariants : itemVar,
							    	image : data
							    }
							        
						    	console.log(item)
	
								$.ajax({
							    	url:'${pageContext.request.contextPath}/master/item/update',
							    	type : 'PUT',
							    	data : JSON.stringify(item),
							    	contentType : 'application/JSON',
							    	success : function(){
							    		$('#tampilan-alert-edit-data').removeClass('alert-gagal').addClass('alert-sukses');
							    		$('#tampilan-alert-edit-data').html('<strong>Sukses!</strong> Berhasil Menyimpan ke Database');
							    		$('#div-alert-edit-data').fadeIn();
							    		
							    		
							    		if(idDelete!=""){
							    			$.ajax({
												url : '${pageContext.request.contextPath}/master/item/update-variant-active/'+idDelete,
												type:'GET',
												success : function (){
													//alert('delete successfully'+element);
													//window.location = '${pageContext.request.contextPath}/master/item/';
												},
												
												error : function(){
													//alert('delete failed');
												} 
												  
											});
							    		}
							    	  
								    if (idClear!=""){
								        idClear.forEach(function(element){
									    	$.ajax({
												url :'${pageContext.request.contextPath}/master/item/update-variant-active/'+element,
												type:'DELETE',
												success : function (){
													//alert('delete successfully');
													//alert('save successfully')
													//window.location = '${pageContext.request.contextPath}/master/item/';
												},
												
												error : function(){
													//alert('delete failed');
												} 
												
											});
									    }); 	
								    }
							    	    
							    		
							    		setTimeout(function(){
							    			window.location = '${pageContext.request.contextPath}/master/item/';
								    		},1000);
							    		
							    	},
							    	error : function(){
							    		$('#tampilan-alert-edit-data').removeClass('alert-sukses').addClass('alert-gagal');
							    		$('#tampilan-alert-edit-data').html('<strong>Error!</strong> Gagal Menyimpan ke Database');
							    		$('#div-alert-edit-data').fadeIn(); 
							    	}
							    }); //ajax update
							},
							
							error:function(data){
								alert('error')
							},
							
								}); //ajax upload
				    }
				    
				    else{
					    $('#dt-popup-edit > tbody > tr').each(function(index,data){
					    	var itemInventory = {
					    			 id : $(data).find('td').eq(8).text(),
									 beginning :$(data).find('td').eq(4).text(),
								     alertAtQty :$(data).find('td').eq(5).text(),
								     endingQty :$(data).find('td').eq(10).text(),
								     itemVariant : {
								    	 id : $(data).find('td').eq(7).text()
								     },
					    			 outlet : {
					    				id : $('#add-outlet').val()
					    			 }
					    	
							 }
					    	
							 var itemVariant = {
					    			 id : $(data).find('td').eq(7).text(),
									 name : $(data).find('td').eq(0).text(),
									 price : $(data).find('td').eq(1).text(),
								     sku : $(data).find('td').eq(3).text(),
								     active : 1,
								     itemInventories : [itemInventory],
								     item : {
								    	id : $(data).find('td').eq(7).text()
								     }
							 };
							 itemVar.push(itemVariant)
						}); 
					    
					    //console.log(itemVar)
					    
					    var item = {
					    	id : $('#edit-item-input-id').val(),
					    	name : $('#edititem-item-name').val(),
					    	active : active,
					    	category:{
					    		id :  $('#edititem-category').val()
					    	},
					    	itemVariants : itemVar,
					    	image : $('#edit-item-image').val()
					    }
					        
				    	console.log(item)
					    	//console.log(item.name)
						
						
						$.ajax({
					    	url:'${pageContext.request.contextPath}/master/item/update',
					    	type : 'PUT',
					    	data : JSON.stringify(item),
					    	contentType : 'application/JSON',
					    	success : function(){
					    		$('#tampilan-alert-edit-data').removeClass('alert-gagal').addClass('alert-sukses');
					    		$('#tampilan-alert-edit-data').html('<strong>Sukses!</strong> Berhasil Menyimpan ke Database');
					    		$('#div-alert-edit-data').fadeIn();
					    		
					    		if(idDelete!=""){
					    			$.ajax({
										url : '${pageContext.request.contextPath}/master/item/update-variant-active/'+idDelete,
										type:'GET',
										success : function (){
											//alert('delete successfully'+element);
											//window.location = '${pageContext.request.contextPath}/master/item/';
										},
										
										error : function(){
											//alert('delete failed');
										} 
										  
									});
					    		}
					    			
					    	  
						    if (idClear!=""){
						        idClear.forEach(function(element){
							    	$.ajax({
										url :'${pageContext.request.contextPath}/master/item/update-variant-active/'+element,
										type:'DELETE',
										success : function (){
											//alert('delete successfully');
											//alert('save successfully')
											//window.location = '${pageContext.request.contextPath}/master/item/';
										},
										
										error : function(){
											//alert('delete failed');
										} 
										
									});
							    }); 	
						    }
					    	    
					    		
					    		setTimeout(function(){
					    			window.location = '${pageContext.request.contextPath}/master/item/';
						    		},1000);
					    		
					    	},
					    	error : function(){
					    		$('#tampilan-alert-edit-data').removeClass('alert-sukses').addClass('alert-gagal');
					    		$('#tampilan-alert-edit-data').html('<strong>Error!</strong> Gagal Menyimpan ke Database');
					    		$('#div-alert-edit-data').fadeIn(); 
					    	}
					    }); //ajax update
				    } //else
				     	 
				} //validateIsValid
		    
		});
		
/* =================== [EDIT] VARIANT DATA AT TABLE MODAL-CREATE-DATA ==========================*/
	  $('body').on('click', 'a.edit-data', function(evt){
	  //$('.edit-data').on('click', function(evt) {
		  	clearFormEditItem();
	    	evt.preventDefault();
	    	var id=$(this).attr('id');
	    	var outletId = $('#add-outlet').val();
	    	var totalStock=0;

	    	 
	    	console.log(id)
	    		$.ajax({
				url :'${pageContext.request.contextPath}/master/item/search-inventory-outlet?search='+id+'&outlet-id='+outletId,
				type :'GET',
				dataType:'json',
				success : function(xxx){	
					$('#edit-itm').modal({backdrop: 'static', keyboard: false});
					$('#edit-item-input-id').val(parseInt(id));
				
					$.each(xxx,function(key,val){
						totalStock = totalStock + parseInt(val.endingQty);
						var image = val.itemVariant.item.image;
						$('#images-edit').attr('src','${pageContext.request.contextPath}/resources/img/'+image);
						$('#edititem-item-name').val(val.itemVariant.item.name);
						$('#edititem-category').val(val.itemVariant.item.category.id);
						$('#outlet-id').val(val.outlet.id);
						$('#edit-item-image').val(val.itemVariant.item.image);
						
						if(val.itemVariant.active==1){
							if(val.endingQty==0){
								$('#isi-popup-edit').append('<tr id=tr-item'+index+'><td><p id='+index+'>'+ val.itemVariant.name +'</p></td><td style="display:none"><p>'+
										val.itemVariant.price +'</p></td><td><p>'+
										'Rp'+val.itemVariant.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.')+'</p></td><td><p>'+val.itemVariant.sku
										+'</p></td><td><p>'+val.beginning+'</p></td><td style="display:none"><p>'+val.alertAtQty
										+'</p></td> <td style="display:none"><p>'+val.itemVariant.active+'</p></td>'
										+'<td style="display:none"><p>'+val.itemVariant.id+'</p></td>'
										+'<td style="display:none"><p>'+val.id+'</p></td>'
										+'<td style="display:none"><p>'+val.outlet.id+'</p></td>'
										+'<td style="display:none"><p>'+val.endingQty+'</p></td>'
										+'<td> <a href="#" id="edititem-tombol-edit-variant"> Edit </a> | <a href="#" id="edititem-delete-variant-data"> Deactive </a>'
										+'</tr>');
							}
							
							else{
								$('#isi-popup-edit').append('<tr id=tr-item'+index+'><td><p id='+index+'>'+ val.itemVariant.name +'</p></td><td style="display:none"><p>'+
										val.itemVariant.price +'</p></td><td><p>'+
										'Rp'+val.itemVariant.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.')+'</p></td><td><p>'+val.itemVariant.sku
										+'</p></td><td><p>'+val.beginning+'</p></td><td style="display:none"><p>'+val.alertAtQty
										+'</p></td> <td style="display:none"><p>'+val.itemVariant.active+'</p></td>'
										+'<td style="display:none"><p>'+val.itemVariant.id+'</p></td>'
										+'<td style="display:none"><p>'+val.id+'</p></td>'
										+'<td style="display:none"><p>'+val.outlet.id+'</p></td>'
										+'<td style="display:none"><p>'+val.endingQty+'</p></td>'
										+'<td> <a href="#" id="edititem-tombol-edit-variant"> Edit </a>'
										+'</tr>');
							}
							
							
						}
				
						index++;
					})
					
					if(totalStock == 0){
						$("#edititem-checkbox").prop('disabled',false);
					}
					else{
						$("#edititem-checkbox").prop('disabled',true);	
					}
					
				}, 				
				error:function() {
					alert('failed getting data')
				}
			});
		});
		
    function reloadTableCreateAddVariant(){
    var counter=0;
	$('#isi-popup-itm').append('<tr id=' + counter++ + '><td><p>'+ $('#add-variant-name').val()+'</p></td><td><p>'+
			$('#add-unit-price').val()+'</p></td><td><p>'+$('#add-sku').val()
			+'</p></td><td><p>'+$('#add-beginning-stock').val()+'</p></td><td style="display:none"><p>'+$('#add-alert-at').val()
			+'</p></td> <td style="display:none"><p>'+$('#add-active-variant').val()+'</p></td>'
			+'<td> <a href="#" id="tombol-edit-variant" > Edit </a> | <a href="#" id="delete-variant-data">Delete </a>'+'</td></tr>');
	}
    
    function reloadTableCreateEditVariant(){
    	$('#isi-popup-itm').append('<tr id=tr-item3'+index+'><td><p id='+index+'>'+ $('#edit-variant-name').val()+'</p></td><td><p>'+
    			$('#edit-unit-price').val()+'</p></td><td><p>'+$('#edit-sku').val()
    			+'</p></td><td><p>'+$('#edit-beginning-stock').val()+'</p></td><td style="display:none"><p>'+$('#edit-alert-at').val()
    			+'</p></td> <td style="display:none"><p>'+$('#edit-active-variant').val()+'</p></td>'
    			+'<td> <a class="btn-warning" href="#" id="tombol-edit-variant"> Edit </a> | <a href="#" id="delete-variant-data">Delete </a>'+'</td></tr>');
    	}
    
    function reloadTableEdit(){
    	$('#isi-popup-edit').append('<tr><td id='+4+'><p>'+ $('#edititem-add-variant-name').val()+'</p></td><td><p>'+
    			$('#edititem-add-unit-price').val()+'</p></td><td><p>'+$('#edititem-add-sku').val()+'</p></td>'
    			+'<td><p>'+$('#edititem-add-beginning-stock').val()+'</p></td>'
    			+'<td style="display:none"><p>'+$('#edititem-add-alert-at').val()+'</p></td>'
   				+'<td style="display:none"><p>'+$('#edititem-add-active-variant').val()+'</p></td>'
   				+'<td style="display:none"><p>null</p></td>'
   				+'<td style="display:none"><p>null</p></td>'
   				+'<td style="display:none"><p>'+$('#outlet-id').val()+'</p></td>'
   				+'<td style="display:none"><p>null</p></td>'
    			+'<td><a href="#" id="edititem-tombol-edit-variant"> Edit </a> | <a href="#" id="edititem-delete-variant-data">Remove </a>'+'</td></tr>');
    }
   
	function clearForm() {
		$('#add-variant-name').val('');
		$('#add-unit-price').val('');
		$('#add-sku').val('');
		$('#add-beginning-stock').val('');
		$('#add-alert-at').val('');
	}
	
	function clearFormEdit() {
		$('#edititem-add-variant-name').val('');
		$('#edititem-add-unit-price').val('');
		$('#edititem-add-sku').val('');
		$('#edititem-add-beginning-stock').val('');
		$('#edititem-add-alert-at').val('');
	}
	
	function clearFormAddItem() {
		$('#add-item-name').val('');
		//$('#add-category').val('');
		$('#isi-popup-itm').empty();
	}
	
	function clearFormEditItem() {
		$('#edititem-item-name').val('');
		//$('#edititem-category').val('');
		$('#isi-popup-edit').empty();
	}

	//search
 	$('#search-box').on('input',function(e){
		var keyword = $(this).val();
		//console.log(keyword)
		$.ajax({
			type : 'GET',
			url : '${pageContext.request.contextPath}/master/item/search-item?search='+keyword,
			dataType : 'json',
			success : function (data){
				$('#full-data-utama').empty();
				//alert('ok')
				//$('#full-data-utama').empty();
				$.each(data,function(key,val){
				if(val.alertAtQty<val.endingQty){
					$('#full-data-utama').append('<tr><td>'+val.itemVariant.item.name+'-'+val.itemVariant.name+'</td>'
							+ '<td>'+val.itemVariant.item.category.name+'</td>'
							+ '<td>'+val.itemVariant.price+'</td>'
							+ '<td>'+val.endingQty+'</td>'
							+ '<td><p style="color:red">LOW</p></td>'
							+ '<td> <a href="#" id='+val.itemVariant.item.id +' class="edit-data">Edit</a></td>'
							+ '</tr>');
				}
				
				else{
					$('#full-data-utama').append('<tr><td>'+val.itemVariant.item.name+'-'+val.itemVariant.name+'</td>'
							+ '<td>'+val.itemVariant.item.category.name+'</td>'
							+ '<td>'+val.itemVariant.price+'</td>'
							+ '<td>'+val.endingQty+'</td>'
							+ '<td><p>OK</p></td>'
							+ '<td> <a href="#" id='+val.itemVariant.item.id +' class="edit-data">Edit</a></td>'
							+ '</tr>');
				}
					
				});
			},
			error : function (){
				$('#full-data-utama').empty();
			}
		});
	});  
	
 	$('#export').click(function(){
		window.location = '${pageContext.request.contextPath}/generate/item'; 
	})
	
	$('#images-input-edit').on('change',function(){
		$('#images-edit').hide();
		$('.fileinput-preview').show();
		$('#remove-image-edit').show();
		imageStatus=1;
	});
 	
 	$('#remove-image-edit').on('click',function(){
 		$('.fileinput-preview').hide();
		$('#images-edit').show();
		$('#remove-image-edit').hide();  
		imageStatus=0;
	});
	
});
</script>
</html>