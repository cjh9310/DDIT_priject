<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

    
<main id="js-page-content" role="main" class="page-content">
            <ol class="breadcrumb page-breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0);">취업지원</a></li>
                <li class="breadcrumb-item">공모전</li>
                <li class="breadcrumb-item active">공모전 상세보기</li>
            </ol>
            
            <div class="row">
                <div class="col-xl-12">
                    <!-- Kitchen sink example -->
                     <div id="panel-1" class="panel">
                         <div class="panel-hdr">
                             <h2>
								공모전 상세보기  
                             </h2>
                         </div>
                         <div class="panel-container show">
                             <div class="panel-content">
                                 <div style="max-width: 100%;">
                                    
                                    <div>
			                            <div class="row mx-md-n5">
			                                <div class="col px-md-5">
			                                    <div class="p-3">
			                                      	<%-- <img src="<%=request.getContextPath()%>/resources/template/img/support/contest/공모전11.png" 
			                                      		 class="card-img-top" id="clickImg" alt="공모전이미지" style="cursor:pointer" > --%>
			                                      	<img src="<%=request.getContextPath()%>/resources/template/img/support/contest/공모전11.png" 
			                                      		 class="card-img-top" id="clickImg" alt="공모전이미지" onclick="window.open(this.src,'info','width='+this.naturalWidth+' height='+this.naturalHeight+' menubar=no status=no toolbar=no location=no'); return false;" style="cursor:pointer;"/>
			                                    </div>
			                                </div>
		                                    <div class="col px-md-5">
		                                        <div class="p-3">
		                                           	<h3 class="m-0" style="text-align:center;">
		                                         		공모전 응모
		                                    	    </h3>
		                                    	    <form id="registForm">
		                                    	    	<input type="hidden" name="conNo" >
			                                    	    <div style="margin-top:50px;">
				                                    	    <div class="form-group">
		                                                    	<label class="form-label text-muted" for="indId"> 이름</label>
		                                                    	<input type="text" id="indId" name="indId" class="form-control" value="${loginUser.name}" readonly>
		                                                	</div>
				                                    	    <div class="form-group">
		                                                    	<label class="form-label" for="actTel">연락처</label>
		                                                    	<input type="text" id="actTel" name="actTel" class="form-control">
		                                                	</div>
				                                    	    <div class="form-group">
		                                                    	<label class="form-label" for="actEmail">이메일 주소</label>
		                                                    	<input type="text" id="actEmail" name="actEmail" class="form-control">
		                                                	</div>
		                                                	<div class="form-group mb-0">
		                                                    	<label class="form-label">첨부파일</label>
		                                                    	<div class="custom-file">
		                                                        	<input type="file" class="custom-file-input" id="customFile">
		                                                        	<label class="custom-file-label" for="customFile">제출 하실 공모전자료를 업로드해주세요</label>
		                                                    	</div>
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
            	<a href="javascript:void(0);" class="btn btn-success btn-pills waves-effect waves-themed" id="contestReg">신청하기</a>
            </div>
         </div>
     </div>
     </main>
     	<script src="<%=request.getContextPath()%>/resources/template/js/notifications/sweetalert2/sweetalert2.bundle.js"></script>
       	<script src="<%=request.getContextPath()%>/resources/template/js/vendors.bundle.js"></script>
        <script src="<%=request.getContextPath()%>/resources/template/js/app.bundle.js"></script>
<script>
/* $(document).ready(function(){

    $("#contestReg").on("click", function()
    {
        Swal.fire(
        {
            title: "가산점을 부여하시겠습니까?",
            type: "success",
            showCancelButton: true,
            confirmButtonText: "OK"
        }).then(function(result){
            if (result){
            	
                Swal.fire("가산점이 부여되었습니다.", "", "success");
            }
        });
    }else {
    	Swal.fire()
    }
    }); 
}); */
$("#contestReg").on("click", function(){
	alert("눌렀어?");
	
	
	
	var param = $("#registForm").serialize();
	alert(param);
	$.ajax({
		url : 'activityRegist.do',
		type : 'POST',
		data : param,
		cache : false,
		async : true,
		success : function(data){
			window.open("about:blank", "_self").close();
			window.opener.location.reload();
		}
	});
});
</script>
   
     
     
     