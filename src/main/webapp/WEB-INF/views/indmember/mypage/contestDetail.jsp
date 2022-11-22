<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<c:set var="activity" value="${activity }"/>
<c:set var="now" value="<%=new java.util.Date()%>" />

<main id="js-page-content" role="main" class="page-content">
	    <ol class="breadcrumb page-breadcrumb" style="padding-top: 10px;">
	        <li class="breadcrumb-item"><a href="javascript:void(0);">마이페이지</a></li>
	        <li class="breadcrumb-item">프로그램</li>
	        <li class="breadcrumb-item active">내가 신청한 공모전 상세보기</li>
	    </ol>
	    
	    	<div></div>
	        <div class="row">
	        	<div class="col-1"></div>
	        	<div class="col-10">
	            <div id="panel-1" class="panel">
	                <div class="panel-hdr">
	                    
	                    <b>내가 신청한 공모전</b>
	                    
	                    <div class="panel-toolbar">
	                    </div>
	                </div>
	                <div class="panel-container show">
	                    <div class="panel-content">
	                        <form>
	                        	<div class="form-group">
				                      <label class="form-label" for="conTitle">제목</label>
				                      <input type="text" id="conTitle" name="conTitle" value="${activity.conTitle}" class="form-control" readonly>
				                </div> 
	                        	<div class="form-group">
				                      <label class="form-label" for="actDate">신청일자</label>
				                      <input type="text" id="actDate" name="actDate" value="<fmt:formatDate value="${activity.actDate}" pattern="yyyy-MM-dd" />" class="form-control" readonly>
				                </div>
				                
				                <%-- <div class="form-group">
				                      <label class="form-label" for="conDate">공모기간</label>
				                      <input type="text" id="conDate" name="conDate" value="<fmt:formatDate value="${activity.conSdate}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${activity.conEdate}" pattern="yyyy-MM-dd" />" class="form-control" readonly>
				                </div> --%>
	                            <div class="form-group">
	                                <label class="form-label" for="indId">신청자 명</label>
	                                <input type="text" id="indId" name="indId" value="${loginUser.name}"class="form-control" readonly>
	                  			</div>
	                            
	                            <div class="form-group">
	                                <label class="form-label" for="actTel">연락처</label>
	                                <input type="text" id="actTel" name="actTel" value="${activity.actTel}"class="form-control" readonly>
	                  			</div>
	                            <div class="form-group">
	                                <label class="form-label" for="actEmail">이메일</label>
	                                <input type="text" id="actEmail" name="actEmail" value="${activity.actEmail}"class="form-control" readonly>
	                  			</div>
				                <div class="form-group mb-0">
                                    <label class="form-label text-muted">첨부파일명</label>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="customFile-2" disabled="">
                                        <label class="custom-file-label" for="customFile-2">첨부파일명</label>
                                    </div>
                                </div>
				            </form>
				         </div>
				            
				     </div>
				        
				    </div>
				    
				    <div class="demo" style="text-align: right;">
				    	<c:choose>
				    		<c:when test="${activity.conSdate <= now and activity.conEdate >= now }">
					          	<button type="button" id="modifyBtn" onclick="location.href='conModifyForm.do?actNo=${activity.actNo}';" class="btn btn-warning btn-pills waves-effect waves-themed">수 정</button>
					          	<button type="button" id="deleteBtn"  class="btn btn-danger btn-pills waves-effect waves-themed">삭 제</button>
					         </c:when>	
					         
					         <c:otherwise></c:otherwise>
			          	</c:choose>
			          	<button type="button" id="listBtn" onclick="window.close();" class="btn btn-dark btn-pills waves-effect waves-themed">닫 기</button>
			        </div>
			        </div>
			     </div>
			</main>
			
<script>
$('#deleteBtn').on('click',()=>{
	var actNo = ${activity.actNo};
	//alert(actNo);
	 Swal.fire({
         icon: 'warning',
			title: "공모전 응모를 취소하시겠습니까?",
         type: "success",
         showCancelButton: true,
         confirmButtonText: "OK"
	}).then(function(result){ 
		if(result.value){
	
			$.ajax({
				type:"post" ,
				url: "/ddit/indmember/mypage/conRemove?actNo="+actNo,
				data: actNo,
				
				//contentType : "application/json; charset=utf-8",
				dataType:"text",
				success:(rslt)=>{
					Swal.fire({
						icon: 'success',
						title: '취소되었습니다!',
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
})
</script>