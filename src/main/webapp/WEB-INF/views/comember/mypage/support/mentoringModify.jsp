<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<c:set var="mentoring" value="${mentoring }"></c:set>
<c:set var="now" value="<%=new java.util.Date()%>" />

<main id="js-page-content" role="main" class="page-content">
	<ol class="breadcrumb page-breadcrumb" style="padding-top: 10px;">
		<li class="breadcrumb-item"><a href="javascript:void(0);">마이페이지</a></li>
		<li class="breadcrumb-item">프로그램</li>
		<li class="breadcrumb-item active">멘토링 상세보기</li>
	</ol>

	<div></div>
	<div class="row">

		<div class="col-xl-12">
			<div id="panel-1" class="panel">
				<div class="panel-hdr">

					<b>멘토링 상세보기</b>

					<div class="panel-toolbar"></div>
				</div>
				<div class="panel-container show">
					<div class="panel-content">
						<div class="row">
							<div class="col-xl-12">
							<form id="modifyForm">
								<div class="form-group">
									<input type="hidden" name="menNo" id="menNo" value=${mentoring.menNo }>
									<input type="hidden" name="coId" id="coId" value=${mentoring.coId }>
									<label for="menDate"><b>게시물 등록일자</b> </label> <input type="text"
										id="menDate" name="menDate"
										value="<fmt:formatDate value="${mentoring.menDate}" pattern="yyyy-MM-dd" />"
										class="form-control" readonly>
								</div>
								<div class="form-group">
									<label for="menTitle"><b>멘토링 명</b> </label> <input type="text"
										id="menTitle" name="menTitle" value="${mentoring.menTitle}"
										class="form-control">
								</div>
								<div class="form-group">
									<label for="menContent"><b>멘토링 내용</b> </label> 
									<textarea class="form-control" id="menContent" name="menContent" placeholder="멘토링내용을 입력해주세요." rows="7" >${mentoring.menContent}</textarea>
								</div>
								<div class="form-group">
									<label for="cf"><b>참여가능 인원 수</b> </label> <label for="numPeople"></label>
									<input type="text" id="numPeople" name="numPeople"
										value="${mentoring.numPeople }" class="form-control" >
								</div>
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<label for="menSdate"><b>멘토링 시작일자</b> </label> <input type="date"
												id="menSdate" name="menSdate"
												value="<fmt:formatDate value="${mentoring.menSdate}" pattern="yyyy-MM-dd" />"
												class="form-control" >
										</div>
									</div>
									<div class="col-6">
										<div class="form-group">
											<label for="menEdate"><b>멘토링 종료일자</b> </label> <input type="date"
												id="menEdate" name="menEdate"
												value="<fmt:formatDate value="${mentoring.menEdate}" pattern="yyyy-MM-dd" />"
												class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group mb-0">
									<label class="form-label text-muted">첨부파일명</label>
									<div class="custom-file">
										<input type="file" class="custom-file-input" id="customFile-2"> 
										<label class="custom-file-label"
											for="customFile-2">
											<!-- 첨부파일자리 -->
										</label>
									</div>
								</div>
								</form>
							</div>

						</div>

					</div>

				</div>

			</div>

			<div class="demo" style="text-align: right;">
				
				<div class="demo" style="text-align: right;">
					<button type="button" id="modifyBtn"
					class="btn btn-success btn-pills waves-effect waves-themed">등 록</button>
					<button type="button" onclick="CloseWindow();"
					class="btn btn-dark btn-pills waves-effect waves-themed">취 소</button>
				</div>
			</div>
		</div>
	</div>
</main>

<script>

 $("#modifyBtn").on("click",function() {
	 var param = $('#modifyForm').serialize();
		 param = param.replaceAll('-','/');
	 var menNo = ${mentoring.menNo};
	 
	 Swal.fire({
         icon: 'warning',
			title: "수정하시겠습니까?",
         type: "success",
         showCancelButton: true,
         confirmButtonText: "OK"
	}).then(function(result){ 
		if(result.value){
		 $.ajax({
				type:"POST",
				url:"mentoringModify.do",
				data:param,
				//contentType: "application.json; charset=utf-8",
				dataType:"text",
				success:(data)=>{
					//alert("수정성공");
					Swal.fire({
							icon: 'success',
							title: '수정되었습니다.',
							showConfirmButton: false,
							timer: 1500
					}).then(function(){
						location.replace("mentoringDetail.do?menNo=" + menNo);
						opener.location.replace(opener.location.href);
						
					});
					
					
				},
				error:(request,status,error)=>{
					
					console.log("failed ajax, code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
		});
		}
	});
});
</script>