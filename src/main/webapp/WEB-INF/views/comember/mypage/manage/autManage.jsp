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

<c:set var="authReqList" value="${dataMap.authReqList }" />



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


<main id="js-page-content" role="main" class="page-content">
<div class="row">
	<div class="col-xl-12">
		<!--Side Modals-->
			<div class="panel-container show">
					
						<c:if test="${loginUser.coConfirm  eq 'N'}">
						<div class="row justify-content-between">
								<b class="ml-5 mt-3 mb-2">기업회원 권한 요청하기<br> 권한 승인 후 기업 공모전
													등록 및 멘토링 등록이 가능합니다.
								</b>	
							<div style="margin-right: 20px; margin-top: 10px;">
								<button type="button"
									class="btn btn-success btn-pills waves-effect waves-themed"
									data-toggle="modal"
									data-target=".default-example-modal-right-sm" id="authority">권한
									요청하기</button>
							</div>
						</div>					
						</c:if>
						<c:if test="${loginUser.coConfirm  eq 'Y'}">
								<div class="text-danger">이미 권한을 받은 기업입니다. 권한 받은 시점으로부터 1년동안 권한이 유지됩니다.</div>
						</c:if>
					
						
					<!-- Modal Left Large -->
					<div class="modal fade default-example-modal-right-sm"
						tabindex="-1" role="dialog" aria-hidden="true" id="counselModal">
						<div class="modal-dialog modal-dialog-right modal-sm">
							<div class="modal-content">
							<div class="panel-container show">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true"><i class="fal fa-times"></i></span>
									</button>
								</div>
								<div class="modal-body" id="frist">
									<div id="panel-2" class="panel" style="padding:10px;">
										<div class="panel-hdr">
											<h2>권한 신청</h2>
											<div class="panel-toolbar"></div>
										</div>
										<form class="needs-validation" novalidate="" method="post"
											name="myForm" id=myForm
											enctype="multipart/form-data">
											<div class=>

												<div class="form-group mt-3">
													<label class="form-label" for=""><b>작성자</b></label> <input
														type="text" id="coId" name="coId" class="form-control"
														value="${loginUser.id}" readonly>
												</div>

												<div class="form-group">
													<label class="form-label" for=""><b>제목</b>
														<span class="text-danger">*</span> </label> <input type="text"
														class="form-control" id="authTitle" name="authTitle"
														placeholder="제목을 입력해주세요.">
													<div class="invalid-feedback">제목을 입력해주세요.</div>
												</div>

												<div class="form-group">
													<label class="form-label" for=""><b>내용</b><span
														class="text-danger">&nbsp;*</span></label>
													<textarea class="form-control" id="authContent" name="authContent"
														placeholder="ex)멘토링과공모전 등록권한요청합니다." rows="7"></textarea>
													<div class="invalid-feedback">내용을 입력해주세요.</div>
												</div>
												<div class="form-group" style="display:none" >
													<label class="form-label" for=""><b>관리자</b>
														<span class="text-danger">*</span> </label> <input type="text"
														class="form-control" id="adId" name="adId" value="ddit401"
														placeholder="제목을 입력해주세요.">
													<div class="invalid-feedback">제목을 입력해주세요.</div>
												</div>
											</div>
										
											<div class="row justify-content-end mt-3 mr-2 mb-3">
												<button
													class="btn btn-success btn-pills ml-auto waves-effect waves-themed "
													type="button" id="regist" >신청하기</button>
											</div>
											
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
</div>
</main>

<%@ include file="/WEB-INF/views/comember/comember_js.jsp"%>

<script>
$('#regist').click(function() {
		var data = $("#myForm").serializeObject();
		console.log(data);
		$.ajax({
			url : 'authority',
			type : 'POST',
			data : data,			
			success : function(data) {
				window.location.replace(location.href);
			},
			error : function(request, status, error) {
				Swal.fire({
					target: document.getElementById('frist'),
	                icon: 'warning',
					title: "이미 권한신청하였습니다.",
					text: "권한가능여부를 확인중입니다.",
	                type: "success",
	                showCancelButton: false,
	                confirmButtonText: "OK"
// 	                window.location.replace(location.href);
	    		});
			}
		});
	}); 
</script>

<script>
$(document).ready(function(){	
	jQuery.fn.serializeObject = function() {
		var obj = null;
		try {
			if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
				var arr = this.serializeArray();
				if (arr) {
					obj = {};
					jQuery.each(arr, function() {
						obj[this.name] = this.value;
					});
				}
			}
		} catch (e) {
			alert(e.message);
		} finally {
		}

		return obj;
	};
});
</script>
<script>


</script>

<!-- Swal.fire({ -->
<!-- 		  title: '요청하겠습니까?', -->
<!-- 		  icon: 'warning', -->
<!-- 		  showCancelButton: true, -->
<!-- 		  confirmButtonColor: '#3085d6', -->
<!-- 		  cancelButtonColor: '#d33', -->
<!-- 		 cancelButtonText: '아니요', -->
<!-- 		  confirmButtonText: '네' -->
<!-- 	}).then(function (result){ -->
<!-- 		if(result.value){ -->




<!-- 	Swal.fire({ -->
<!-- 			icon:'success', -->
<!-- 			title:'요청했습니다.', -->
<!-- 			showConfirmButton:false, -->
<!-- 			timer:1500 -->
<!-- 		}) -->
<!-- }	 -->
<!-- }); -->
