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
	        <li class="breadcrumb-item active">상담신청 상세보기</li>
	    </ol>
	    
	    	<div></div>
	        <div class="row">
	        	<div class="col-1"></div>
	        	<div class="col-10">
	            <div id="panel-1" class="panel">
	                <div class="panel-hdr">
	                
	                    <b>내가 신청한 멘토링프로그램</b>
	                    <div class="panel-toolbar">
	                    </div>
	                </div>
	                <div class="panel-container show">
	                    <div class="panel-content">
	                        <form>
	                        	<div class="form-group">
	                            	<c:choose>
	                            	<c:when test="${activity.actStatus eq 3 }">
	                            		<b>
	                            			${loginUser.name}님의 요청에 의해 <span class="text-danger"><fmt:formatDate value="${activity.actUdate}" pattern="yyyy-MM-dd"/></span>에 중도포기된 프로그램입니다.
	                            		</b>
	                            	</c:when>
	                            	<c:when test="${activity.menProgress < 0 }">
	                                	<label class="form-label" for="menProgress">멘토링프로그램 시작 전입니다.</label>
	                                	<div class="progress">
                                    		<div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                    	</div>
                                    </c:when>
	                            	<c:when test="${activity.menProgress > 100 }">
	                                	<label class="form-label" for="menProgress">멘토링 진행률</label>
	                                	<div class="progress">
                                    		<div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">100%</div>
                                    	</div>
                                    </c:when>
                               		<c:otherwise>
                               			<label class="form-label" for="menProgress">멘토링 진행률</label>
                               			<div class="progress">
                                      		<div class="progress-bar progress-bar-animated" role="progressbar" style="width: ${activity.menProgress}%;" aria-valuenow="${activity.menProgress}" aria-valuemin="0" aria-valuemax="100">${activity.menProgress}%</div>
										</div>                                  	
                                  	</c:otherwise>
                                    </c:choose>
	                  			</div>
	                        	<div class="form-group">
				                      <label class="form-label" for="menTitle">제목</label>
				                      <input type="text" id="menTitle" name="menTitle" value="${activity.menTitle}" class="form-control" readonly>
				                </div> 
	                        	<div class="form-group">
				                      <label class="form-label" for="menDate">신청일자</label>
				                      <input type="text" id="menDate" name="menDate" value="<fmt:formatDate value="${activity.actDate}" pattern="yyyy-MM-dd" />" class="form-control" readonly>
				                </div>
				                
				                <div class="form-group">
				                      <label class="form-label" for="menDate">멘토링기간</label>
				                      <input type="text" id="menDate" name="menDate" value="<fmt:formatDate value="${activity.menSdate}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${activity.menEdate}" pattern="yyyy-MM-dd" />" class="form-control" readonly>
				                </div>
	                            
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
				            </form>
				             <div><!-- 중도포기시 상태값을 3으로 변경해줄때 필요한 input태그 -->
				                	<input type="hidden" name="actStatus" value="3">
				                </div>
				         </div>
				            
				     </div>
				        
				    </div>
				    
				    <div class="demo" style="text-align: right;">
				    	<c:choose>
				    		<c:when test="${activity.menSdate >= now}">
					          	<button type="button" id="modifyBtn" onclick="location.href='menModifyForm.do?actNo=${activity.actNo}';" class="btn btn-warning btn-pills waves-effect waves-themed">수 정</button>
					          	<button type="button" id="deleteBtn" class="btn btn-danger btn-pills waves-effect waves-themed">삭 제</button>
					         </c:when>	
					         <c:when test="${activity.actStatus eq 3 }"></c:when>
					         <c:when test="${activity.menSdate <= now and activity.menEdate >= now }">
					         	<button type="button" id="modifyStatusBtn"  class="btn btn-warning btn-pills waves-effect waves-themed">중도포기</button>
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
			title: "신청내역을 삭제하시겠습니까?",
         type: "success",
         showCancelButton: true,
         confirmButtonText: "OK"
	}).then(function(result){ 
		if(result.value){
	
	
	$.ajax({
		type:"post" ,
		url: "/ddit/indmember/mypage/menRemove?actNo="+actNo,
		data: actNo,
		
		//contentType : "application/json; charset=utf-8",
		dataType:"text",
		success:(rslt)=>{
			Swal.fire({
				icon: 'success',
				title: '삭제되었습니다!',
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

<script>
$('#modifyStatusBtn').on('click',()=>{
	var actNo = ${activity.actNo};
	//alert(actNo);
	var param = $("input[name=actStatus]").val();
	//alert(param);
	
	 Swal.fire({
        icon: 'warning',
		title: "멘토링프로그램을 중도포기하시겠습니까?",
		text: "포기하실 경우 재참여가  불가능하며 가산점을 받을 수 없습니다.",
        type: "success",
        showCancelButton: true,
        confirmButtonText: "OK"
	}).then(function(result){ 
		if(result.value){
			$.ajax({
				type:"post" ,
				url: "/ddit/indmember/mypage/menModify?actNo="+actNo,
				data: {actStatus:param},
				
				//contentType : "application/json; charset=utf-8",
				dataType:"text",
				success:(rslt)=>{
					Swal.fire({
						icon: 'success',
						title: '멘토링 중도포기 처리되었습니다!',
						showConfirmButton: true
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