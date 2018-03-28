<%@ include file="/WEB-INF/view/masterPage/layout.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ITEM JSP</title>
	
<script type="text/javascript">
$(document).ready(function(){	
	
	var index=0;
	var idDelete=[];
	var idClear=[];
/* ============================== [SHOW MODAL] CREATE DATA UTAMA ======================================*/
	$('#create-data-utama').on('click', function(evt) {
		evt.preventDefault;
		$('#modal-create-data').modal();
	}); 
/* ============================== [SHOW MODAL] FOR ADD VARIANT ======================================*/
    $('#btn-add-variant').on('click', function(evt) {
    	evt.preventDefault();
		$('#modal-add-variant').modal();
		clearForm();
	});
    
    $('#edititem-btn-add-variant').on('click', function(evt) {
    	evt.preventDefault();
    	
    	var id = $(this).attr("data-id");
		$('#edititem-modal-add-variant').modal();
		clearFormEdit();
	});
   
/* =================== [ADD] VARIANT DATA TO TABLE MODAL-CREATE-DATA ===================================*/
	 $('#btn-add-data-variant').on('click', function(evt) {
		 evt.preventDefault;
		 //reloadTableCreateAddVariant();
		$('#isi-popup-itm').append('<tr id=tr-item' + index + '><td><p id=' + index + '>'+ $('#add-variant-name').val()+'</p></td><td><p>'+
					$('#add-unit-price').val()+'</p></td><td><p>'+$('#add-sku').val()
					+'</p></td><td><p>'+$('#add-beginning-stock').val()+'</p></td><td style="display:none"><p>'+$('#add-alert-at').val()
					+'</p></td> <td style="display:none"><p>'+$('#add-active-variant').val()+'</p></td>'
					+'<td> <a href="#" id="tombol-edit-variant"> Edit </a> <a href="#" id="delete-variant-data"> X </a>'+'</td></tr>');
		
		 index++;
		});
		
	 $('#edititem-btn-add-data-variant').on('click', function(evt) {
		 evt.preventDefault;
		 reloadTableEdit();
		});
	 
	 $('#btn-edit-save-variant').on('click', function(evt) {
	 	evt.preventDefault;
	 	 var index=$('#id-item-hidden-variant-edit').val();
		 console.log(index)
		 $("#tr-item"+index).remove();
	 	//reloadTableCreateEditVariant();
	 	///index++;
		$('#isi-popup-itm').append('<tr id=tr-item'+index+'><td><p id='+index+'>'+ $('#edit-variant-name').val()+'</p></td><td><p>'+
					$('#edit-unit-price').val()+'</p></td><td><p>'+$('#edit-sku').val()
					+'</p></td><td><p>'+$('#edit-beginning-stock').val()+'</p></td><td style="display:none"><p>'+$('#edit-alert-at').val()
					+'</p></td> <td style="display:none"><p>'+$('#edit-active-variant').val()+'</p></td>'
					+'<td> <a href="#" id="tombol-edit-variant"> Edit </a> <a href="#" id="delete-variant-data"> X </a>'+'</td></tr>');
	 });
	 
	 $('#edititem-btn-save-variant').on('click', function(evt) {
		 evt.preventDefault;
		 var index=$('#id-item-hidden').val();
		 console.log(index)
		 $("#tr-item"+index).remove();
		 console.log($('#edititem-add-variant-name').val())
		 	//$.each(xxx,function(key,val){})
		 
		 $('#isi-popup-edit').append('<tr id=tr-item'+index+'><td><p id='+index+'>'+ $('#edititem-edit-variant-name').val()+'</p></td><td><p>'+
	    			$('#edititem-edit-unit-price').val()+'</p></td><td><p>'+$('#edititem-edit-sku').val()
	    			+'</p></td><td><p>'+$('#edititem-edit-beginning-stock').val()+'</p></td><td style="display:none"><p>'+$('#edititem-edit-alert-at').val()
	    			+'</p></td><td style="display:none"><p>'+$('#edititem-edit-active-variant').val()+'</p></td>'
	    			+'<td style="display:none"><p>'+$('#variant-id').val()+'</p></td>'
	    			+'<td style="display:none"><p>'+$('#inventory-id').val()+'</p></td>'
	    			+'<td> <a href="#" id="edititem-tombol-edit-variant"> Edit </a> <a href="#" id="edititem-delete-variant-data"> X </a>'+'</td></tr>');
		});
	 
/* =================== [DELETE] VARIANT DATA AT TABLE MODAL-CREATE-DATA ===================================*/
	 $("#isi-popup-itm").on('click','#delete-variant-data',function(){
	        $(this).parent().parent().remove();
	    });
	    
	 $("#isi-popup-edit").on('click','#edititem-delete-variant-data',function(){
	        var element = $(this).parent().parent();
	        var id = element.find('td').eq(7).find('p').text();
	       
	        if(id=='null') {
	        	$(this).parent().parent().remove();
	        } 
	         
	        else  {
	        
	 
	        $(this).parent().parent().remove();
	        idDelete.push(id);	    	
	        }
	        
	    });

/* =================== [DELETE] VARIANT DATA AT MODAL-CREATE-DATA ===================================*/
	 $("#btn-cancel").on('click',function(){
			 clearFormAddItem();	
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
	        $('#modal-edit-variant').modal();
	        $('#edit-variant-name').val(element.find('td').eq(0).find('p').text());
	        $('#edit-unit-price').val(element.find('td').eq(1).find('p').text());
	        $('#edit-sku').val(element.find('td').eq(2).find('p').text());
	        $('#edit-beginning-stock').val(element.find('td').eq(3).find('p').text());
	   	   	$('#edit-alert-at').val(element.find('td').eq(4).find('p').text());
	   		$('#edit-active-variant').val(element.find('td').eq(5).find('p').text());
	   		$('#id-item-hidden-variant-edit').val(element.find('td').eq(0).find('p').attr('id'));
	        console.log(element.find('td').eq(0).find('p').attr('id'))
	    });
	    
	 $("#isi-popup-edit").on('click','#edititem-tombol-edit-variant',function(evt){
		 evt.preventDefault();
	        var element = $(this).parent().parent();
	        $('#edititem-modal-edit-variant').modal();
	        $('#edititem-edit-variant-name').val(element.find('td').eq(0).find('p').text());
	        $('#edititem-edit-unit-price').val(element.find('td').eq(1).find('p').text());
	        $('#edititem-edit-sku').val(element.find('td').eq(2).find('p').text());
	        $('#edititem-edit-beginning-stock').val(element.find('td').eq(3).find('p').text());
	   	   	$('#edititem-edit-alert-at').val(element.find('td').eq(4).find('p').text());
	   		$('#edititem-edit-active-variant').val(element.find('td').eq(5).find('p').text());
	   		$('#variant-id').val(element.find('td').eq(6).find('p').text());
	   		$('#inventory-id').val(element.find('td').eq(7).find('p').text());
	   		$('#id-item-hidden').val(element.find('td').eq(0).find('p').attr('id'));
	    });
	    
/* ============================== [EXECUTE] CREATE DATA UTAMA ======================================*/
		$('#btn-create-data').on('click',function(evt){
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
						 beginning :$(data).find('td').eq(3).text(),
					     alertAtQty :$(data).find('td').eq(4).text()
				 }
		    	
				 var itemVariant = {
						 name : $(data).find('td').eq(0).text(),
						 price : $(data).find('td').eq(1).text(),
					     sku : $(data).find('td').eq(2).text(),
					     active : $(data).find('td').eq(5).text(),
					     itemInventories : [itemInventory]
				 }
				 itemVar.push(itemVariant)
			}); 
		    
		    console.log(itemVar)
		    
		    var item = {
		    	name : $('#add-item-name').val(),
		    	active : active,
		    	category:{
		    		id :  $('#add-category').val()
		    	},
		    	itemVariants : itemVar
		    }
		
		    console.log(item)
		    
		     $.ajax({
		    	url:'${pageContext.request.contextPath}/item/save',
		    	type : 'POST',
		    	data : JSON.stringify(item),
		    	contentType : 'application/JSON',
		    	success : function(){
		    		alert('save success')
		    		window.location = '${pageContext.request.contextPath}/item/';
		    	},
		    	error : function(){
		    		alert('save failed')
		    	}
		    });    
		});
		
		
		$('#edititem-btn-create-data').on('click',function(evt){
			evt.preventDefault();
			var active = "true";
		      $('#edititem-checkbox:checked').each(function(){
		        active=$(this).val()
		      });
		      
		      console.log(active)
		    
		    var itemVar = [];
		    var varInv = [];
		     
		    $('#dt-popup-edit > tbody > tr').each(function(index,data){
		    	var itemInventory = {
		    			 id : $(data).find('td').eq(7).text(),
						 beginning :$(data).find('td').eq(3).text(),
					     alertAtQty :$(data).find('td').eq(4).text(),
					     itemVariant : {
					    	 id : $(data).find('td').eq(6).text()
					     }
				 }
		    	
				 var itemVariant = {
		    			 id : $(data).find('td').eq(6).text(),
						 name : $(data).find('td').eq(0).text(),
						 price : $(data).find('td').eq(1).text(),
					     sku : $(data).find('td').eq(2).text(),
					     active : 0,
					     itemInventories : [itemInventory],
					     item : {
					    	id : $(data).find('td').eq(6).text()
					     }
				 }
				 itemVar.push(itemVariant)
			}); 
		    
		    console.log(itemVar)
		    
		    var item = {
		    	id : $('#edit-item-input-id').val(),
		    	name : $('#edititem-item-name').val(),
		    	active : active,
		    	category:{
		    		id :  $('#edititem-category').val()
		    	},
		    	itemVariants : itemVar
		    }
		
		   
		    
		    if(item.name!==""){
		    	//console.log(item.name)
		    	 $.ajax({
				    	url:'${pageContext.request.contextPath}/item/update',
				    	type : 'PUT',
				    	data : JSON.stringify(item),
				    	contentType : 'application/JSON',
				    	success : function(){
				    		alert('save success')
				    		window.location = '${pageContext.request.contextPath}/item/';
				    	},
				    	error : function(){
				    		alert('save failed')
				    	}
				    });
		    }
		    
		    
		    idDelete.forEach(function(element){
		    	$.ajax({
					url : '${pageContext.request.contextPath}/item/delete-inventory/'+element,
					type:'DELETE',
					success : function (){
						//alert('delete successfully');
						window.location = '${pageContext.request.contextPath}/item/';
					},
					
					error : function(){
						//alert('delete failed');
					} 
					
				});
	    	});
		    
		    idClear.forEach(function(element){
		    	$.ajax({
					url : '${pageContext.request.contextPath}/item/delete-inventory/'+element,
					type:'DELETE',
					success : function (){
						//alert('delete successfully');
						alert('save successfully')
						window.location = '${pageContext.request.contextPath}/item/';
					},
					
					error : function(){
						//alert('delete failed');
					} 
					
				});
		    });  
		    
		});
		
/* =================== [EDIT] VARIANT DATA AT TABLE MODAL-CREATE-DATA ==========================*/
	  $('.edit-data').on('click', function(evt) {
		  	clearFormEditItem();
	    	evt.preventDefault();
	    	var id=$(this).attr('id');	
	    	
	    	console.log(id)
	    		$.ajax({
				url :'${pageContext.request.contextPath}/item/get-one/'+id,
				type :'GET',
				dataType:'json',
				success : function(xxx){	
					$('#edit-itm').modal();
					$('#edit-item-input-id').val(parseInt(id));
				 	var index = 0;
					$.each(xxx,function(key,val){
						$('#edititem-item-name').val(val.itemVariant.item.name);
						$('#edititem-category').val(val.itemVariant.item.category.id);
						$('#isi-popup-edit').append('<tr id=tr-item'+index+'><td><p id='+index+'>'+ val.itemVariant.name +'</p></td><td><p>'+
								val.itemVariant.price +'</p></td><td><p>'+val.itemVariant.sku
								+'</p></td><td><p>'+val.beginning+'</p></td><td style="display:none"><p>'+val.alertAtQty
								+'</p></td> <td style="display:none"><p>'+val.itemVariant.active+'</p></td>'
								+'<td style="display:none"><p>'+val.itemVariant.id+'</p></td>'
								+'<td style="display:none"><p>'+val.id+'</p></td>'
								+'<td> <a href="#" id="edititem-tombol-edit-variant" > Edit </a> <a href="#" id="edititem-delete-variant-data"> X </a>'
								+'</tr>');
						index++;
					})
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
			+'<td> <a href="#" id="tombol-edit-variant"> Edit </a> <a href="#" id="delete-variant-data"> X </a>'+'</td></tr>');
	}
    
    function reloadTableCreateEditVariant(){
    	$('#isi-popup-itm').append('<tr id=tr-item3'+index+'><td><p id='+index+'>'+ $('#edit-variant-name').val()+'</p></td><td><p>'+
    			$('#edit-unit-price').val()+'</p></td><td><p>'+$('#edit-sku').val()
    			+'</p></td><td><p>'+$('#edit-beginning-stock').val()+'</p></td><td style="display:none"><p>'+$('#edit-alert-at').val()
    			+'</p></td> <td style="display:none"><p>'+$('#edit-active-variant').val()+'</p></td>'
    			+'<td> <a href="#" id="tombol-edit-variant"> Edit </a> <a href="#" id="delete-variant-data"> X </a>'+'</td></tr>');
    	}
    
    function reloadTableEdit(){
    	$('#isi-popup-edit').append('<tr><td id='+4+'><p>'+ $('#edititem-add-variant-name').val()+'</p></td><td><p>'+
    			$('#edititem-add-unit-price').val()+'</p></td><td><p>'+$('#edititem-add-sku').val()+'</p></td>'
    			+'<td><p>'+$('#edititem-add-beginning-stock').val()+'</p></td>'
    			+'<td style="display:none"><p>'+$('#edititem-add-alert-at').val()+'</p></td>'
   				+'<td style="display:none"><p>'+$('#edititem-add-active-variant').val()+'</p></td>'
   				+'<td style="display:none"><p>null</p></td>'
   				+'<td style="display:none"><p>null</p></td>'
    			+'<td><a href="#" id="edititem-tombol-edit-variant"> Edit </a> <a href="#" id="edititem-delete-variant-data"> X </a>'+'</td></tr>');
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
		$('#add-category').val('');
		$('#isi-popup-itm').empty();
	}
	
	function clearFormEditItem() {
		$('#edititem-item-name').val('');
		$('#edititem-category').val('');
		$('#isi-popup-edit').empty();
	}
	
	//search
 	$('#search-box').on('input',function(e){
		var keyword = $(this).val();
		//console.log(keyword)
		$.ajax({
			type : 'GET',
			url : '${pageContext.request.contextPath}/item/search-item?search='+keyword,
			dataType : 'json',
			success : function (data){
				//alert('ok')
				//$('#full-data-utama').empty();
				$.each(data,function(key,val){
				$('#full-data-utama').append('<tr><td>'+val.itemVariant.item.name+'-'+val.itemVariant.name+'</td>'
						+ '<td>'+val.itemVariant.item.category.name+'</td>'
						+ '<td>'+val.itemVariant.price+'</td>'
						+ '<td>'+val.endingQty+'</td>'
						+ '<td>LOW</td>'
						+ '<td> <a href="#" id='+val.itemVariant.item.id +' class="edit-data">Edit</a></td>'
						+ '</tr>');
				});
			},
			error : function (){
			}
		});
	});  
});
</script>

</head>
<body>

	<div>Items</div><br/>
	<div class="container">
	<div>
		<div style="float:left;margin-right:600px;">
			<span><input type="text" id="search-box" placeholder="Search"/></span>
		</div>
		
		
		<div align="right" style="float:left;margin-right:30px;">
			<button id="export" class="btn btn-primary btn-md" >Export</button>
		</div>	
		
		<div align="right" style="float:left">
			<button id="create-data-utama" class="btn btn-primary btn-md">Create</button>
		</div>	
		
	
	</div>
	
	<div id="daftar-barang">
		<table id="dt-view-item" class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>Name</th>
				<th>Category</th>
				<th>Unit Price</th>
				<th>In Stock</th>
				<th>Stock Alert</th>
				<th>#</th>
			</tr>
		</thead>
		<tbody id="full-data-utama">
			<c:forEach items="${itemInventories}" var="invent">
				<tr>
					<td>${invent.itemVariant.item.name} - ${invent.itemVariant.name} </td>
					<td>${invent.itemVariant.item.category.name}</td>
					<td>${invent.itemVariant.price}</td>
					<td>${invent.endingQty}</td>
					<td>LOW</td>
					<td><a href="#" id="${invent.itemVariant.item.id}" class="edit-data">Edit</a></td>
				</tr>
			</c:forEach> 
		</tbody>	
		</table>
		</div>	
		<%@ include file="modal/MAIN-Add-Data.jsp"%>
		<%@ include file="modal/MAIN-Edit-Data.jsp"%>
		<%@ include file="modal/VARIANT-Add-Data.jsp"%>
		<%@ include file="modal/VARIANT-Edit-Data.jsp"%>
		<%@ include file="modal/EDITITEM-VARIANT-Add-Data.jsp"%>
		<%@ include file="modal/EDITITEM-VARIANT-Edit-Data.jsp"%>
	</div>

</body>
</html>