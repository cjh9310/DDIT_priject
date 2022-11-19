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
								<div class="form-group">
									<label for="menDate"><b>게시물 등록일자</b> </label> <input type="text"
										id="menDate" name="menDate"
										value="<fmt:formatDate value="${mentoring.menDate}" pattern="yyyy-MM-dd" />"
										class="form-control" readonly>
								</div>
								<div class="form-group">
									<label for="menTitle"><b>멘토링 명</b> </label> <input type="text"
										id="menTitle" name="menTitle" value="${mentoring.menTitle}"
										class="form-control" readonly>
								</div>
								<div class="form-group">
									<label for="menContent"><b>멘토링 내용</b> </label> 
									<textarea class="form-control" id="menContent" name="menContent" placeholder="멘토링내용을 입력해주세요." rows="7" readonly>${mentoring.menContent}</textarea>
								</div>
								<div class="form-group">
									<label for="cf"><b>참여가능 인원 수</b> </label> <label for="numPeople"></label>
									<input type="text" id="numPeople" name="numPeople"
										value="${mentoring.numPeople }" class="form-control" readonly>
								</div>
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<label for="menSdate"><b>멘토링 시작일자</b> </label> <input type="date"
												id="menSdate" name="menSdate"
												value="<fmt:formatDate value="${mentoring.menSdate}" pattern="yyyy-MM-dd" />"
												class="form-control" readonly>
										</div>
									</div>
									<div class="col-6">
										<div class="form-group">
											<label for="menEdate"><b>멘토링 종료일자</b> </label> <input type="date"
												id="menEdate" name="menEdate"
												value="<fmt:formatDate value="${mentoring.menEdate}" pattern="yyyy-MM-dd" />"
												class="form-control" readonly>
										</div>
									</div>
								</div>
								<div class="form-group mb-0">
									<label class="form-label text-muted">첨부파일명</label>
									<div class="custom-file">
										<input type="file" class="custom-file-input" id="customFile-2"
											disabled=""> <label class="custom-file-label"
											for="customFile-2">
											<!-- 첨부파일자리 -->
										</label>
									</div>
								</div>
							</div>

						</div>

					</div>

				</div>

			</div>

			<div class="demo" style="text-align: right;">
				
					<button type="button" id="modifyBtn"
							onclick="location.href='mentoringModifyForm.do?menNo=${mentoring.menNo}';"
							class="btn btn-warning btn-pills waves-effect waves-themed">수 정</button>
				
				<button type="button" id="deleteBtn"
					class="btn btn-danger btn-pills waves-effect waves-themed">삭 제</button>
				<button type="button" id="listBtn" onclick="CloseWindow();"
					class="btn btn-dark btn-pills waves-effect waves-themed">닫 기</button>
			</div>
		</div>
	</div>
</main>

<script src="<%=request.getContextPath()%>/resources/template/js/vendors.bundle.js"></script>
<script src="<%=request.getContextPath()%>/resources/template/js/app.bundle.js"></script>
<script src="<%=request.getContextPath()%>/resources/template/js/notifications/sweetalert2/sweetalert2.bundle.js"></script>
<script>
$('#deleteBtn').on('click',()=>{
	
	var menNo = ${mentoring.menNo};
	
	 Swal.fire({
         icon: 'warning',
			title: "프로그램을 삭제하시겠습니까?",
         type: "success",
         showCancelButton: true,
         confirmButtonText: "OK"
	}).then(function(result){ 
		if(result.value){
	
		$.ajax({
			type:"post" ,
			url: "/ddit/comember/mypage/mentoringRemove?menNo="+menNo,
			data: menNo,
			dataType:"text",
			success:(rslt)=>{
				
				Swal.fire({
					icon: 'success',
					title: '프로그램이 삭제되었습니다.',
					showConfirmButton: false,
					timer: 1500
			}).then(function(){
				
				window.close();
				window.opener.location.reload();
			})
			},
			error:(request,status,error)=>{
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		}
	});
});
	 
</script>

<script>
	$(function(){
		<c:if test="${mentoring.menEdate < now}">
			$("#modifyBtn").hide();
		</c:if>
	});
</script>
