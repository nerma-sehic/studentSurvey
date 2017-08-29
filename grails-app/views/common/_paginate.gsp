<%@ page import="com.manas.sso.*" contentType="text/html;charset=UTF-8" %>

<div id="itemsPerPage" class="pagination pull-left">
	<g:select id="selectRange" name="selectRange" from="${[5,10,15,25,50]}" class="form-control" value="${rowsPerPage ?:'10'}"/>
</div>

<g:if test="${itemCount > 0}">
<ul class="pagination bootpag">
	<g:set var="from" value="${offsetBy-2}"/>
	<g:set var="to" value="${offsetBy+2}"/>
	<g:if test="${from < 0}">
		<g:set var="from" value="${0}"/>
	</g:if>
	<g:if test="${to > itemCount}">
		<g:set var="to" value="${itemCount}"/>
	</g:if>


	<li class="${from == 0 && offsetBy == 0 ? 'disabled': '' }">
		<a class="${from == 0 && offsetBy == 0 ? 'disabled': '' }" onclick="updatePagination(${offsetBy}-1)" >
			<span aria-hidden="true"><i class="fa fa-chevron-left"></i></span>
		</a>
	</li>
	<g:if test="${from != 0}">

		<li onclick="updatePagination(0)" class="" id="-1">
			<a>1</a>
		</li>
		<li>
			<a class="disabled" >
				<span aria-hidden="true">...</span>
			</a>
		</li>
	</g:if>

	<g:while test="${from <= to}">
	    <li onclick="updatePagination(${from})" class="${from == offsetBy ? 'active':''}" id="${from }">
			<a>${++from}</a>
		</li>
	</g:while>

	<g:if test="${itemCount != to}">
		<li>
			<a class="disabled" >
			<span aria-hidden="true">...</span>
			</a>
		</li>
		<li onclick="updatePagination(${itemCount})" class="" id="${itemCount+1}">
			<a>${itemCount+1}</a>
		</li>
	</g:if>

	<li class="${to == itemCount && offsetBy == itemCount ? 'disabled': '' }">
		<a class="${to == itemCount && offsetBy == itemCount ? 'disabled': ''}" onclick="updatePagination(${offsetBy}+1)">
			<span aria-hidden="true"><i class="fa fa-chevron-right"></i></span>
		</a>
	</li>

</ul>
</g:if>

<script>

	$(".disabled").removeAttr("onclick");
	/*function paginate(pagNum)
	{
		console.log("PAGINATION "+pagNum);
		var label =  $(':selected', $("#userGroupSelect")).closest('optgroup').prop('label');
	    var id = $("#userGroupSelect").val();
	    LoadTasks(label, id, pagNum);
	};*/
	$('#selectRange').change(function(){
		updateRowsPerPage($('#selectRange').val());
	});

</script>