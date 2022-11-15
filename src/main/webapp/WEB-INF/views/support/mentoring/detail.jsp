<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
			                            <div class="row mx-md-n5">
			                                <div class="col px-md-5">
			                                    <div class="p-3">
			                                      	
			                                    </div>
			                                </div>
		                                    <div class="col px-md-5">
		                                        <div class="p-3">
		                                           	<h3 class="m-0" style="text-align:center;">
		                                         		멘토링 신청
		                                    	    </h3>
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
		                                        </div>
		                                    </div>
			                             </div>
			                         </div>
		                     	</div>
		                     </div>
		                 </div>
                 
             </div>
            <div style="text-align:center; margin:30px; ">
            	<a href="javascript:void(0);" class="btn btn-success btn-pills waves-effect waves-themed" id="js-bootbox-example-9">신청하기</a>
            </div>
         </div>
     </div>
     </main>
     
       <script src="<%=request.getContextPath()%>/resources/template/js/vendors.bundle.js"></script>
        <script src="<%=request.getContextPath()%>/resources/template/js/app.bundle.js"></script>
<script>
$(document).ready(function()
{
    "use strict";

    //A basic message
    

    $("#js-bootbox-example-9").on("click", function()
    {
        bootbox.confirm(
        {
            title: "공모전에 참여하시겠습니까?",
            message: "공모신청 후 취소를 원하실 경우 [마이페이지]에서 취소 가능합니다.",
            buttons:
            {
            	confirm:
                {
                    label: '신 청'
                },
                cancel:
                {
                    label: '취 소'
                }
                
            },
            callback: function(result)
            {
                console.log('This was logged in the callback: ' + result);
            }
        });
    });

});

</script>
   
     