<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
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
			                                      		 class="card-img-top" id="clickImg" alt="공모전이미지" onclick="window.open(this.src,'OpenWindow','width='+this.naturalWidth+' height='+this.naturalHeight+' menubar=no status=no toolbar=no location=no'); return false;" style="cursor:pointer;"/>
			                                    </div>
			                                </div>
		                                    <div class="col px-md-5">
		                                        <div class="p-3">
		                                           	<h3 class="m-0" style="text-align:center;">
		                                         		공모전 응모
		                                    	    </h3>
		                                    	    <form id="registForm" name="registForm" method="post" action="activityRegist" enctype="multipart/form-data">
		                                    	    	<input type="hidden" name="conNo" value="" >
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
		                                                	<div>
		                                                		<label class="form-label" for="example-date">첨부파일</label>
																<div class="form-group">								
																	<div class="card card-outline card-success">
																		<div class="card-header">
																			&nbsp;&nbsp;<button class="btn btn-xs btn-primary"
																			onclick="addFile_go(1);" type="button" id="addFileBtn">파일 첨부</button>
																		</div>									
																		<div class="card-footer fileInput">
																		</div>
																	</div>
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

$("#contestReg").on("click", function(){
	

	Swal.fire({
        icon: 'warning',
		title: "응모하시겠습니까?",
        type: "success",
        showCancelButton: true,
        confirmButtonText: "OK"
	}).then(function(){
		
		$("form[name='registForm']").submit();
		
	})/* .then(function(){
		Swal.fire({
            icon: 'success',
			title: "신청되었습니다.",
            type: "success",
            showCancelButton: false,
            confirmButtonText: "OK"
		
		})
			
	}).then(function(){
		window.close();
	})  */
		
	});	


	//var param = $("#registForm").serialize();
	//alert(param);
	/* 
	let formData = new FormData($("form[name=registForm]")[0]);
	formData.append("uploadFile",$('input[name=uploadFile]')[0].files[0]);
	
	Swal.fire({
        icon: 'warning',
		title: "응모하시겠습니까?",
        type: "success",
        showCancelButton: true,
        confirmButtonText: "OK"
	}).then(function(data){
		$.ajax({
			url : '/ddit/support/contest/activityRegist',
			type : 'POST',
			data : formData,
			cache: false,
            contentType:false,  //formData 쓸때만 필요!
			processData:false, //formData 쓸때만 필요!
			success : function(data){
				if(data == "ok"){
					Swal.fire({
						icon: 'success',
						title: '신청되었습니다!',
						text: '신청하신 공모전은 [마이페이지]-[프로그램관리]에서 확인가능합니다.',
						showConfirmButton: true,
						confirmButtonText: "OK"
					}).then(function(){
						window.close();
		    			//window.opener.location.reload();
		    		
					})
				}
			},
			error:(request,status,error)=>{
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});	
}); */

</script>


<c:if test="${from eq 'regist'}" >
<script>
	Swal.fire({
	    icon: 'success',
		title: "신청되었습니다.",
	    type: "success",
	    showCancelButton: false,
	    confirmButtonText: "OK"
		
	}).then(function(){
		window.close();
	});
</script>
</c:if>


<script>
 const url = new URL(window.location.href);
 const urlParams = url.searchParams;
 var conNo = urlParams.get('conNo');
 $('input[name=conNo]').attr('value',conNo);
 
</script>
   
<!-- --------------------------파일등록------------------------------------ -->
<script>
	
	window.onload=function(){
		$('.fileInput').on('change','input[type="file"]',function(event){
			//alert(this.files[0].size);
			if(this.files[0].size>1024*1024*50){
	 			alert("파일 용량이 50MB를 초과하였습니다.");
	 			this.click();
	 			this.value="";	 					
	 			return false;
	 		} 
		});
	}

	$(function () {
	    $(document).on('click', '.btn-add', function (e) {
	        e.preventDefault();
	
	        var controlForm = $('.controls:first'),
	            currentEntry = $(this).parents('.entry:first'),
	            newEntry = $(currentEntry.clone()).appendTo(controlForm);
	
	        newEntry.find('input').val('');
	        controlForm.find('.entry:not(:last) .btn-add')
	            .removeClass('btn-add').addClass('btn-remove')
	            .removeClass('btn-success').addClass('btn-danger')
	            .html('<span class="fa fa-trash"></span>');
	    }).on('click', '.btn-remove', function (e) {
	        $(this).parents('.entry:first').remove();
	
	        e.preventDefault();
	        return false;
	    });
	});
</script>  
 
     
     