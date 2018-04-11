<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script>

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result)
                .width(150)
                .height(200)	;
        };

        reader.readAsDataURL(input.files[0]);
    }
}
	
</script>

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


<div class="modal fade" id="modal-create-data" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	 <div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel" align="center">Create Item Data</h5>
			</div>
			<div class="modal-body">
				<form style="border:none" id="form-add-data" class="form-all">
				 	<div class="row" id="div-alert" style="display:none;">
						<div class="col-xs-12">
							<div id="tampilan-alert" class="alert alert-sukses" role="alert">
								<strong>Sukses!</strong> Data Berhasil Disimpan.
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="input-item-name">Item Name</label> <input type="text"
							class="form-control" id="add-item-name" placeholder="Enter item name" data-parsley-required-message="Please insert the item name"
							data-parsley-required>
					</div>
					
					<div>
						<label for="input-region">Category</label> <select
							class=form-control id="add-category">
							<c:forEach var="ctg" items="${categories}">
								<option value="${ctg.id}">${ctg.name}</option>
							</c:forEach>
						</select>
					</div>
					
						<div style="clear: both	"></div>	

					<div class="form-group" style="display:none" >
						<label for="input-active">Active</label>
						<form id="input-active-add">
							<input name="selector[]" id=add-checkbox" class="ads_Checkbox"
								type="checkbox" value="true"> </input> 
						</form>
					</div>
					
					<div style="float:left"> 
						<br/> <label for="input-active">Variant List</label>	
					 </div>
					 
					 <div style="float:right"> 
					 	<button type="submit" id="btn-add-variant" class="btn btn-primary">Add Variant</button>
					 </div>		
					<table id="dt-popup-item" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>Variant Name</th>
								<th>Unit Price</th>
								<th>SKU</th>
								<th>Beginning Stock</th>
								<th style="display:none">Alert At</th>
								<th style="display:none">Active</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody id="isi-popup-itm">
							
					<%-- 		<c:forEach items="${itemInventories}" var="invent">
								<tr>
									<td>${invent.itemVariant.name}</td>
									<td>${invent.itemVariant.price}</td>
									<td>${invent.itemVariant.sku}</td>
									<td>${invent.beginning}</td>
									<td><a href="#">Edit</a>
									<a href="#">X</a></td>
									</td>
								</tr>
							</c:forEach>  --%>
						</tbody>
					</table>

					<div class="modal-footer">
						
						<button type="button" class="btn btn-primary" data-dismiss="modal">Back</button>
						<button type="submit" id="btn-cancel" class="btn btn-primary">Cancel</button>
						<button type="submit" value="validate" id="btn-create-data" class="btn btn-primary">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
