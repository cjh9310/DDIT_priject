<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<c:set var="mentoring" value="${mentoring }" />

<main id="js-page-content" role="main" class="page-content">
            <ol class="breadcrumb page-breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0);">취업지원</a></li>
                <li class="breadcrumb-item">멘토링</li>
                <li class="breadcrumb-item active">멘토링 상세보기</li>
            </ol>
            
            <div class="row">
                <div class="col-xl-12">
                    <!-- Kitchen sink example -->
                     <div id="panel-1" class="panel">
                         <div class="panel-hdr">
                             <h2>
								멘토링 상세보기  
                             </h2>
                         </div>
                         <div class="panel-container show">
                             <div class="panel-content">
                                 <div style="max-width: 100%;">
                                    
                                    <div>
			                            <div>
			                                <div class="col px-md-5">
			                                    <div class="p-3">
			                                    	<img src="<%=request.getContextPath()%>/resources/template/img/support/mentoring/회계.jpg" class="card-img-top" alt="...">
			                                      	<h4><c:out value="${mentoring.menTitle }"/></h4>
			                                      	<label>멘토링기간 : <fmt:formatDate value="${mentoring.menSdate}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${mentoring.menEdate}" pattern="yyyy-MM-dd" /></label>
			                                      	<label><c:out value="${mentoring.menContent }"/></label>
			                                      	<label><c:out value="${mentoring.menTitle }"/></label>
			                                    </div>
			                                </div>
		                                    <div>
		                                        <div class="p-3">
		                                           	<h3 class="m-0" style="text-align:center;">
		                                         		멘토링 신청 
		                                    	    </h3>
		                                    	    <form id="registForm">
		                                    	    	<input type="hidden" name="menNo" value="" >
			                                    	    <div style="margin-top:50px;">
				                                    	    <div class="form-group">
		                                                    	<label class="form-label text-muted" for="indId">이름</label>
		                                                    	<input type="text" id="indId" name="indId" value="${loginUser.name }" class="form-control" readonly>
		                                                	</div>
				                                    	    <div class="form-group">
		                                                    	<label class="form-label" for="actTel">연락처</label>
		                                                    	<input type="text" id="actTel" name="actTel" class="form-control">
		                                                	</div>
				                                    	    <div class="form-group">
		                                                    	<label class="form-label" for="actEmail">이메일 주소</label>
		                                                    	<input type="text" id="actEmail" name="actEmail" class="form-control">
		                                                	</div>
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
            <div style="text-align:center; margin:30px; ">
            	<c:choose>
            		<c:when test="${mentoring.numPeople - mentoring.indCount eq 0 }">
            			<a href="javascript:void(0);" class="btn btn-danger btn-pills waves-effect waves-themed" id="">모집마감 완료</a>
            		</c:when>
            		<c:otherwise>
            			<h4>${mentoring.numPeople - mentoring.indCount}명 신청가능합니다.</h4>
            			<a href="javascript:void(0);" class="btn btn-success btn-pills waves-effect waves-themed" id="mentoringReg">신청하기</a>
            		</c:otherwise>
            	</c:choose>
            </div>
         </div>
     </div>
     </main>
     
       <script src="<%=request.getContextPath()%>/resources/template/js/vendors.bundle.js"></script>
        <script src="<%=request.getContextPath()%>/resources/template/js/app.bundle.js"></script>


<script>
$("#mentoringReg").on("click", function(){
	
	var param = $("#registForm").serialize();
	//alert(param);
	$.ajax({
		url : 'activityRegist.do',
		type : 'POST',
		data : param,
		cache : false,
		async : true,
		success : function(data){
			alert("멘토링에 응모되었습니다! 신청하신 공모전은 마이페이지에서 확인가능합니다.");
			window.open("about:blank", "_self").close();
			window.opener.location.reload();
		}
	});
});
</script>

<script>
 const url = new URL(window.location.href);
 const urlParams = url.searchParams;
 var menNo = urlParams.get('menNo');
 $('input[name=menNo]').attr('value',menNo);
 
</script>   
     