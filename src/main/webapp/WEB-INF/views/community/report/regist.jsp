<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

	#background {
		background-image: url('<%=request.getContextPath()%>/resources/template/img/community/report/reportRegist6.png');
		background-repeat: no-repeat;
		background-size: contain;
		background-position: center;
	}

</style>
            
<main id="js-page-content" role="main" class="page-content">
    <!-- ------------------Breadcrumbs--------------------- -->
	<div class="row" id="imgContainer">
		<div class="col-xl-12" id="background" style="height: 1050px; width: 100%;">
			<div class="col-sm-6" style="padding-top: 80px; padding-left: 20px; margin-left: 577px;" >
				<div id="panel-1" class="panel">
	                <div class="panel-container show">
	                    <div class="panel-content">
	                        <form role="falseReportForm" method="POST" action="<%=request.getContextPath()%>/community/report/regist" enctype="multipart/form-data">
	                            <div class="row">
		                            <div class="col-6 mb-3">
										<label class="form-label" for="example-date">아이디 <span
											class="text-danger">*</span></label><input class="form-control"
											id="reId" type="text" name="indId" value="${loginUser.id }" disabled required> 
											<input type="hidden"/>
									</div>
									<div class="col-6 mb-3">
										<label class="form-label" for="example-date">등록일 <span
											class="text-danger">*</span></label> <input class="form-control"
											id="reSdate" type="date" value="" disabled required>
									</div>
									<div class="col-6 mb-3">
										<label class="form-label" for="example-date">신고유형 <span class="text-danger">*</span></label>
	                                    <select class="custom-select" id="selectReport" onchange="funCategory(this)">
	                                        <option selected="">카테고리를 선택하세요</option>
	                                        <option value="reporta">구인광고신고</option>
	                                        <option value="reportb">멘토링 신고</option>
	                                        <option value="reportc">공모전 신고</option>
	                                    </select>
	                                    <input class="form-label" id="rsCategory" name="falCategory" value="" style="display: none;"></input>
	                                </div>	
									<div class="col-6 mb-3">
										<label class="form-label" for="example-date">상세신고유형 <span class="text-danger">*</span></label>
	                                    <select class="custom-select" id="reportOption" onchange="funCategoryDe()">
	                                        <option selected="">상세 신고유형을 선택하세요</option>
	                                    </select>
	                                     <input class="form-label" id="rsCategoryDetail" name="falCategorydetail" value="" style="display: none;"></input>
	                                </div>	
									<div class="col-6 mb-3">
										<label class="form-label" for="example-date">발생일 </label> 
										<input class="form-control"
											id="reOdate" type="date" name="falOdate" value="" required>
									</div>
									<div class="col-6 mb-3">
										<label class="form-label" for="example-date">업체명 <span
											class="text-danger">*</span></label> 
											<input id="reCoId" type="hidden" name="coId" value="" />
											<input class="form-control" id="reCoName" type="text" name="coName" value="" required>
									</div>	
									<div class="col-12 mb-3">
										<label class="form-label" for="example-date">제목 <span
											class="text-danger">*</span></label> <input class="form-control"
											id="reTitle" type="text" name="falTitle" value="" required>
									</div>
									<div class="col-12 mb-3">
										<label class="form-label" for="validationTextarea2"><b>상세내용</b>
											<span class="text-danger">*</span></label>
										<!-- <div id="reContent" name="falContent"></div> -->
										<div id="editor"></div>
										<textarea id="repContent" name="falContent" style="display : none;"></textarea>
										<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
										<!-- <input class="form-label" id="repContent" name="reportContent" value="" style="display: none;"></input> -->
									</div>
									<div class="col-12 mb-3">
										<label class="form-label" for="example-date">첨부파일 
<!-- 											<span class="text-danger">*</span> -->
										</label>
										<div class="form-group">								
											<div class="card card-outline card-success">
												<div class="card-header">
<!-- 													<h5 style="display:inline;line-height:40px;">첨부파일 : </h5> -->
													&nbsp;&nbsp;<button class="btn btn-xs btn-primary"
													onclick="addFile_go(3);"	type="button" id="addFileBtn">파일 첨부</button>
												</div>									
												<div class="card-footer fileInput">
												</div>
											</div>
										</div>
									</div>
									
									<div class="col-12 mt-2">
										<div style="float: right;">
											<button class="btn btn-success ml-auto" id="reportBtn" type="button">등록</button>
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
</main>





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


<!-- --------------------------------검색 팝업----------------------------------- -->

<script>

$("#reCoName").click(function(){
	window.open("<%=request.getContextPath()%>/community/report/coNameSearch" , 'OpenWindow', 'width=600, height=500');
});                                        

</script>



<!-- --------------------------등록일 오늘날짜로------------------------------------ -->
<script>
	document.getElementById('reSdate').value = new Date().toISOString()
			.substring(0, 10);
</script>

<!-- -------------------------- 오늘이후 날짜 선택 안되게------------------------------ -->

<script>

var now_utc = Date.now() 
var timeOff = new Date().getTimezoneOffset()*60000; 
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
document.getElementById("reOdate").setAttribute("max", today);

</script>

<!-- --------------------------- category ------------------------------------- -->

<script>

	function funCategory(e){
		var report_a = ["최저임금 위반","금전요구 및 물품판매","허위구직정보","기타유형"];
		var report_b = ["미흡한 커리큘럼","멘토의 역량부족","기타유형"];
		var report_c = ["심사 이의제기","기타유형"];
		var target = document.getElementById("reportOption");
		
		if(e.value == "reporta" ) {
			var reportd = report_a;
		} else if(e.value == "reportb") {
			var reportd = report_b;
		} else if(e.value == "reportc") {
			var reportd = report_c;
		}
		
		target.options.length = 0;
		
		for (x in reportd) {
			var option = document.createElement("option");
			option.value = reportd[x];
			option.innerHTML = reportd[x];
			target.appendChild(option);
		}
		
		/* select box 값 넣기 */
		var category = $('#selectReport option:checked').text()
		console.log(category);
		$('#rsCategory').val(category);
		
		var categoryDetail = $('#reportOption option:checked').text() 
		console.log(categoryDetail);
		$('#rsCategoryDetail').val(categoryDetail);
		
		} 
	
	function funCategoryDe() {
		
		var categoryDetail = $('#reportOption option:checked').text() 
		console.log(categoryDetail);
		$('#rsCategoryDetail').val(categoryDetail)
		
		}	
	
</script>



<script>
	
	/* form 전송 */
	$('#reportBtn').click(function(){
		$("#repContent").val(editor.getMarkdown());
		console.log(editor.getMarkdown());
		
		$("form[role='falseReportForm']").submit();
	});

</script>


<!-- --------------------------- Toast UI --------------------------------- -->

<script>

const editor = new toastui.Editor({
	  el: document.querySelector('#editor'),
	  initialEditType: 'wysiwyg',
	  previewStyle: 'vertical',
	  viewer: true,
	  hideModeSwitch: true,
      toolbarItems: [
          // 툴바 옵션 설정
          ['heading', 'bold', 'italic', 'strike'],
          ['hr', 'quote'],
          ['table', 'image', 'link'],
        ],
      height: '255px'
	});
		
/* 	document.querySelector('#repContent').insertAdjacentHTML('afterbegin' ,editor.getHTML());
	console.log(editor.getHTML()); */
</script>

<!-- --------------------------- 첨부파일 --------------------------------- -->
<script>
	function nameSearch_callBack(id, nm){
		$('#reCoId').val(id);
		$('#reCoName').val(nm);
	}
</script>