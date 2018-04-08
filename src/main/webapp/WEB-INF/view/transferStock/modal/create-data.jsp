<!--a Modal -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="modal-create-data" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 align="center" class="modal-title" id="exampleModalLabel">Transfer Stock</h5>
			</div>
			<div class="modal-body">
				<form class="form-all" style="border:none">
						        			
					<div class="form-group">
						<table>
							<tr><td>Create New Transfer Stock From :</td> <td> <span style="font-weight:bold">&nbsp;${outletLogin.name}</span></td></tr>
						</table>
						<input style="display:none" id="add-transfer-from" value="${outletLogin.id}"/>
					</div>
					
					<div class="form-group">
						<label for="input-region">To</label> <select
							class=form-control id="add-transfer-to">
							<c:forEach var="out" items="${outlets}">
							<c:set var = "outId" scope = "session" value = "${outletLogin.id}"/>
							
							<c:choose>
    		  				<c:when test = "${out.id != outId}">
       			  				<option value="${out.id}">${out.name}</option>
     		 				</c:when>
     		 				</c:choose>
						
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label>Notes</label> <br/>
						<textarea id="add-notes"  class=form-control rows="4" cols="50" name="comment" form="usrform"></textarea>
					</div>
					
					<div style="float:left"> 
						<br/> <label>Transfer Item</label>	
					 </div>
				
					<table id="data-popup-transfer" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>Item</th>
								<th>In Stock</th>
								<th>Trans. Qty</th>
								<th style="display : none">ID VARIANT</th>
								<th>#</th>
							</tr>
						</thead>
						<tbody id="isi-popup-transfer">
							
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
					
					<div>
						<a 	type="submit" id="add-transfer-item" class="btn btn-primary btn-block">Add Transfer Item</a>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
						<button type="button" id="btn-save-submit" class="btn btn-primary">Save & Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

