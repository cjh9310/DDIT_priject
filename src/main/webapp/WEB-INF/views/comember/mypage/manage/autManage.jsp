<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date">
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" />
</c:set>

<c:set var="crrMap" value="${crrMap}" />
<c:set var="crrList" value="${crrMap.crrList }" />


<style>
.panel-content {
	width: 100%;
	height: 990px;
	overflow: hidden;
}
</style>

<div class="card-header py-2 d-flex align-items-center flex-wrap">
	<div class="card-title">권한 관리 중</div>
	<button
		class="btn btn-xs btn-icon width-1 fs-xl btn-info ml-auto waves-effect waves-themed">
		<i class="fal fa-plus"></i>
	</button>
	<button onclick="nonCheck_reload()"
		class="btn btn-xs btn-icon width-1 fs-xl btn-primary ml-1 waves-effect waves-themed">
		<i class="fal fa-reply"></i>
	</button>
</div>

<table class="table table-clean table-sm align-self-end">
	<tbody>
		<tr class="text-left">

			<td style="padding-top: 20px; padding-left: 30px;"><b>기업 회원
					권한 요청하기<br> 권한 승인 후 기업 공모전 등록 및 멘토링 등록이 가능합니다.
			</b>
				<button type="button"
					class="btn btn-primary waves-effect waves-themed "
					style="margin-left: 200px; margin-botton: 20px;"
					id="authority">권한 요청하기</button> 
				<c:if test="${loginUser.coConfirm eq y }">
					<td class="text-center fw-700 ">이미 권한을 받은 기업입니다.</td>
				</c:if>
		</tr>
	</tbody>
</table>

<%@ include file="/WEB-INF/views/comember/comember_js.jsp"%>

<script>
$('#authority').click(function() {
	
	Swal.fire({
		  title: '요청하겠습니까?',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		 cancelButtonText: '아니요',
		  confirmButtonText: '네'
	}).then(function (result){
		if(result.value){
			
		
			
			
	Swal.fire({
			icon:'success',
			title:'요청했습니다.',
			showConfirmButton:false,
			timer:1500
		})
}	
});
}); 
</script>

<!-- $('#registBtn').click(function() { -->
<!-- 		var data = $("#myForm").serializeObject(); -->
<!-- 		console.log(data); -->
<!-- 		$.ajax({ -->
<!-- 			url : 'newsRegist', -->
<!-- 			type : 'POST', -->
<!-- 			data : data,			 -->
<!-- 			success : function(data) { -->
<!-- 				window.location.replace(location.href); -->
<!-- 			}, -->
<!-- 			error : function(request, status, error) { -->
<!-- 				 alert("code: " + request.status + "message: " + request.responseText + "error: " + error); -->
<!-- 			} -->
<!-- 		}); -->
<!-- 	});  -->

