<!-- Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
$('.fileinput').fileinput()
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

<style>
.kv-avatar .krajee-default.file-preview-frame,.kv-avatar .krajee-default.file-preview-frame:hover {
    margin: 0;
    padding: 0;
    border: none;
    box-shadow: none;
    text-align: center;
}
.kv-avatar {
    display: inline-block;
}
.kv-avatar .file-input {
    display: table-cell;
    width: 213px;
}
.kv-reqd {
    color: red;
    font-family: monospace;
    font-weight: normal;
}
</style>

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
					
					<!-- <div>
						<input type='file'  id="images-input" onchange="preview_image(event)"/>
						<img id="output_image" alt="your image" style="max-width: 100%"/>
					</div>z -->
					
					<div class="fileinput fileinput-new" data-provides="fileinput" style="float:left;width:40%">
  						<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
 					<div>
   					 <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span>
   					 <input id="images-input" type="file" name="..." data-parsley-required></span>
    					<a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput" >Remove</a>
  						</div>
						</div>
					
					<div style="float:right;width:60%">
					<div>
						<label for="input-item-name">Item Name</label> <input type="text"
							class="form-control" id="add-item-name" placeholder="Enter item name" data-parsley-required-message="Please insert the item name"
							data-parsley-required>
					</div><br/>
					
					<div>
						<label for="input-region">Category</label> <select
							class=form-control id="add-category">
							<c:forEach var="ctg" items="${categories}">
								<option value="${ctg.id}">${ctg.name}</option>
							</c:forEach>
						</select>
					</div>
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
						<button type="submit" id="btn-cancel" class="btn btn-primary">Clear Form</button>
						<button type="submit" value="validate" id="btn-create-data" class="btn btn-primary">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
