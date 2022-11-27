<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<c:set var="newsList" value="${dataMap.newsList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />


<style>
.tab-content {
	border-top: 1px solid #168;
	height: 300px;
	overflow: auto;
	position: relative;
}

.table table-bordered table-hover w-100 {
	height: 600px;
}

.mytable tr th {
	position: sticky;
	top: 0px;
	background-color: white;
}

#dt-basic-example {
	border-spacing: 0;
	border-collapse: separate;
}
</style>


<main id="js-page-content" role="main" class="page-content">
<div class="row justify-content-center">
	<div class="col-xl-10">
		<div id="panel-7" class="panel">
			<div class="panel-container show">
				<div class="panel-content">
					<div class="row">
						<div class="col-xl-10">
							<ul class="nav nav-pills" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="pill"> 연봉뉴스관리 </a></li>
							</ul>
						</div>
						<div class="col-xl-2" style="padding-top: 5px;">
							<div style="float: right;">
								<b>등록하기</b> <a href="javascript:void(0);"
									class="btn btn-default btn-xs btn-icon rounded-circle waves-effect waves-themed"
									data-toggle="modal"
									data-target=".default-example-modal-right-sm"> <i
									class="fal fa-plus"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="nav_pills_default-1"
							role="tabpanel">
							<table id="dt-basic-example"
								class="table table-bordered table-hover w-100"
								style="table-layout: fixed; padding: 0;">
								<thead class="mytable">
									<tr>
										<th style="width: 10%; text-align: center;"><b>NO</b></th>
										<th style="width: 40%; text-align: center;"><b>제목</b></th>
										<th style="width: 30%; text-align: center;"><b>한줄제목</b></th>
										<th style="width: 12%; text-align: center;"><b>등록일</b></th>
										<th style="width: 10%; text-align: center;"><b>삭제</b></th>
									</tr>
								</thead>

								<tbody>
									<c:if test="${empty newsList }">
										<tr>
											<td colspan="6"><strong>해당 내용이 없습니다.</strong></td>
										</tr>
									</c:if>
									<c:forEach items="${newsList}" var="news">
										<c:set var="i" value="${i + 1}" />
										<tr onclick="openList('${news.newsNo}');">
											<td style="text-align: center;"><c:out value="${i }" /></td>
											
											<td
												style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${news.newsTitle }</td>
											<td style="text-align: center;">${news.newsOneContent }</td>
											<td style="text-align: center;">${news.newsSdate }</td>
											<td style="text-align: center;"><button type="button"
													class="btn-xs btn-danger waves-themed" id=remove
													onclick="remove(${news.newsNo})">삭제</button></td>
										</tr>
									</c:forEach>
								</tbody>

								<%-- 								<%@ include file="../include/pagination.jsp"%> --%>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="panel-7" class="panel">
			<div class="panel-container show">
				<div class="panel-content">
					<form role="newsModifyForm" method="post"
						action="/ddit/admember/mypage/newsModify" name="newsModifyForm">
						<table id="userTable"
							class="table table-striped table-bordered table-hover">
							<tbody>
								<tr>
									<td style="width: 10%; text-align: center;"><b>NO</b></td>
									<td style="width: 10%;">
										<input type="text" style="border: 0px; width: 50px;" id="newsNo" name="newsNo" readonly></td>
									<td style="width: 15%; text-align: center;"><b>한줄제목</b></td>
									<td style="width: 20%;" id=""><input type="text" style="border: 0px; width: 350px;"
										id="newsOneContent" name="newsOneContent"></td>
									<td style="width: 10%; text-align: center;"><b>등록일</b></td>
									<td style="width: 20%;"><input type="text" disabled required name="newsSdate" style="border: 0px;" id="newsSdate" name="newsSdate"></td>
									<td style="width: 15%; padding-top: 5px;padding-bottom: 0px;padding-right: 0px;padding-left: 23px;">
										<button type="button" class="btn-sm btn-warning waves-themed"
											id="modify" style="width: 100px;" onclick="Modify()"><b>수정</b></button>
									</td>
								
								</tr>
								
								<tr>
									<td style="width: 10%; text-align: center;"><b>제목</b></td>
									<td style="width: 25%;" colspan="2" >
										<input type="text" style="border: 0px; width: 400px;" id="newsTitle" name="newsTitle">
									</td>
									<td style="width: 25%; text-align: center;">
										<b>첨부파일 다운로드</b>
									</td>
									<td style="width: 40%;" colspan="3">
										<div class="row" id="attachList" style="margin-left: 10px; width: 350px;"></div>
									</td>
								</tr>
								<tr>
									<td style="width: 10%; padding-bottom: 150px; text-align: center;"><b>내용</b></td>
									<td class="p-0" colspan="6">
										<div id="summerForUpdate">
											<textarea class="textarea"
												style="border: 0px; height: 200px;" id="textarea-view">
											</textarea>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<textarea class="textarea" style="display: none;"
							id="textarea-hidden" name="newsContent">
							
						</textarea>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="modal fade default-example-modal-right-sm" tabindex="-1"
	role="dialog" aria-hidden="true" id="my_modal">
	<div class="modal-dialog modal-dialog-right modal-sm">
		<div class="modal-content">

			<div class="modal-header">
				<div class="row">
					<div class="col-xl-12">
						<div id="panel-2" class="panel">
							<div class="panel-hdr">
								<h2>
									<b>연봉뉴스</b> <span class="fw-300"><i>
											&nbsp;&nbsp;연봉뉴스 등록</i></span>
								</h2>
								<div class="panel-toolbar">
									<button class="btn btn-panel" data-action="panel-collapse"
										data-toggle="tooltip" data-offset="0,10"
										data-original-title="Collapse"></button>
									<button class="btn btn-panel" data-action="panel-fullscreen"
										data-toggle="tooltip" data-offset="0,10"
										data-original-title="Fullscreen"></button>
									<button class="btn btn-panel" data-action="panel-close"
										data-toggle="tooltip" data-offset="0,10"
										data-original-title="Close"></button>
								</div>
							</div>
							<div class="panel-container show">
								<div class="panel-content p-0">
									<form class="needs-validation" novalidate method="post"
										action="<%=request.getContextPath()%>/admember/mypage/newsRegist"
										name="registForm" id="myForm" enctype="multipart/form-data">
										<div class="panel-content">
											<div class="form-row">
												<div class="col-lg-12 mb-3">
													<label class="form-label" for="validationCustom01">작성자
														<span class="text-danger">*</span>
													</label> <input type="text" class="form-control" id="adId"
														value="${loginUser.id }" disabled required> <input
														type="hidden" name="adId" value="${loginUser.id }" />
													<div class="valid-feedback">Looks good!</div>
												</div>
												<div class="col-lg-12 mb-3">
													<label class="form-label" for="validationCustom02">제목
														<span class="text-danger">*</span>
													</label> <input type="text" class="form-control"
														id="modalNewsTitle" name="newsTitle"
														placeholder="제목을 입력하세요" value="" required>
													<div class="valid-feedback">Looks good!</div>
												</div>
												<div class="col-lg-8 mb-3">
													<label class="form-label" for="example-date">첨부파일</label>
													<div class="form-group">
														<div class="card card-outline card-success">
															<div class="card-header">
																&nbsp;&nbsp;
																<button class="btn btn-xs btn-primary"
																	onclick="addFile_go(3);" type="button" id="addFileBtn">사진
																	첨부</button>
															</div>
															<div class="card-footer fileInput"></div>
														</div>
													</div>
												</div>
												<div class="col-lg-12 mb-3">
													<label class="form-label" for="validationTextarea2"><b>내용</b>
														<span class="text-danger">*</span></label>
													<textarea class="form-control" id="textarea-view-insert"
														name="newsContent" placeholder="내용을 입력해주세요." rows="7"
														required></textarea>
													<div class="valid-feedback">Looks good!</div>
												</div>
												<div class="col-lg-6 mb-3">
													<label class="form-label" for="example-date">등록일 <span
														class="text-danger">*</span></label> <input class="form-control"
														id="modalNewsSdate" type="date" value="" placeholder=""
														disabled required name="newsSdate"> <input
														type="hidden" />
													<div class="valid-feedback">Looks good!</div>
												</div>
												<div class="col-lg-12 mb-3">
													<label class="form-label" for="validationCustom02">한줄등록
														<span class="text-danger">*</span>
													</label> <input type="text" class="form-control"
														id="modalNewsOneContent" name="newsOneContent" value=""
														required>
													<div class="valid-feedback">Looks good!</div>
												</div>

												<div class="col-lg-4 mt-4">
													<div>
														<button class="btn btn-primary ml-auto" id="registBtn"
															type="button">등록</button>
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
</div>



</main>

<script>
 	document.getElementById('modalNewsSdate').value = new Date().toISOString()
 			.substring(0, 10);
</script>

<script>

	$("#registBtn").on("click", function() { 
			
			Swal.fire({
				target: document.getElementById('my_modal'),
                icon: 'success',
				title: "등록이 완료되었습니다!",
                type: "success",
                showCancelButton: false,
                confirmButtonText: "OK"
    		}).then(function(){
    			$("#myForm").submit();
    		})
	});
//		var data = $("#myForm").serializeObject();
// 		$.ajax({
// 			url : 'newsRegist',
// 			type : 'POST',
// 			data : data,			
// 			success : function(data) {
// 				Swal.fire({
// 					target: document.getElementById('my_modal'),
// 	                icon: 'success',
// 					title: "뉴스가 등록되었습니다.",
// 					text: "",
// 	                type: "success",
// 	                showCancelButton: false,
// 	                confirmButtonText: "OK"
// 	    		}).then(function(result){
				 
// 					window.location.replace(location.href);
// 	    		});
// 	    	},
// 			error : function(request, status, error) {
// 				 alert("code: " + request.status + "message: " + request.responseText + "error: " + error);
// 			}
// 		});
// 	});


</script>
<script>
// 	$(document).ready(function() {
// 				jQuery.fn.serializeObject = function() {
// 					var obj = null;
// 					try {
// 						if (this[0].tagName
// 								&& this[0].tagName.toUpperCase() == "FORM") {
// 							var arr = this.serializeArray();
// 							if (arr) 
// 							{
// 								obj = {};
// 								jQuery.each(arr, function() 
// 								{
// 									obj[this.name] = this.value;
// 								});
// 							}
// 						}
// 					} catch (e) {
// 						alert(e.message);
// 					} finally {
// 					}

// 					return obj;
// 				};
// 			});
	
</script>

<script>
	window.onload=function(){
		summernote_go($('#textarea-view'),'<%=request.getContextPath()%>');
		summernote_go($('#textarea-view-insert'),'<%=request.getContextPath()%>');
		summernote_go($('#Content'),'<%=request.getContextPath()%>');	
	}
	
</script>

<script>

	
</script>

<script>
 function remove(newsNo){
	 Swal.fire({
		  title: '삭제하겠습니까?',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		 cancelButtonText: '아니요',
		  confirmButtonText: '네'
	}).then(function (result){
		if(result.value){
		$.ajax({
			url : 'newsRemove',
			type : 'POST',
			data : {'newsNo': newsNo},				
			success : function(data) {
				Swal.fire({
					icon: 'success',
					title: '삭제되었습니다.',
					showConfirmButton: false,
					timer: 1500
			}).then(function(){	
				
				window.location.replace(location.href);
			});
			},
			error : function(request, status, error) {
				 alert("code: " + request.status + "message: " + request.responseText + "error: " + error);
			}
		});
	}
  });		
}

</script>

<script>

var cntxtPth = "${pageContext.request.contextPath}";

function openList(newsNo) {
	
	
	$.ajax({
		url : 'newsDetail',
		method : 'POST',
		data : {'newsNo' : newsNo},
		success : function(newList) {
			console.log(newList)
			$('input[id=newsNo]').val(newList.newsNo);
			$('input[id=newsPicture]').val(newList.newsPicture);
			$('input[id=newsTitle]').val(newList.newsTitle);
			$('input[id=newsOneContent]').val(newList.newsOneContent);
			$('input[id=newsContent]').val(newList.newsContent);
			$('input[id=newsSdate]').val(newList.newsSdate);
			
			$('#summerForUpdate .note-editor .note-editing-area div[role=textbox]').html(newList.newsContent);	
			document.querySelector('#textarea-hidden').innerText=newList.newsContent

			var rowStr = '';
			//첨부파일영역 초기화
			$('#attachList').empty();
			if(newList.attachList.length > 0){
				$.each(newList.attachList, function(key, val){
					console.log(val)
					console.log(val.attNo)
					console.log(val.filename)
					console.log(cntxtPth)
						rowStr += '<div class="col-md-4 col-sm-4 col-xs-12"  style="cursor:pointer;" onclick="location.href=\''+ cntxtPth+ '/attach/getFile.do?attNo=' + val.attNo + '\';">'
						rowStr += '<div class="info-box row">'
						rowStr += '<span class="info-box-icon bg-yellow">'
						rowStr += '<i class="fa fa-copy"></i>'
						rowStr += '</span>'
						rowStr += '<div class="info-box-content">'
						rowStr +=' <span class ="info-box-text"></span>'
						rowStr +=' <span class ="info-box-number">&nbsp;&nbsp; ' + val.filename + '</span>'
						rowStr +=' </div></div></div>'
				});
				
			}else{
				rowStr = '<span> 저장된 첨부 파일이 없습니다.</span>'
			}
			
			$('#attachList').append(rowStr);
		
		}
	});
};

</script>
<script>

function Modify(){
	Swal.fire({
		  title: '수정하겠습니까?',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		 cancelButtonText: '아니요',
		  confirmButtonText: '네'
	}).then(function (result){
		if(result.value){
			
 		var text_content_by_summernote = $('div[role=textbox]').html()
 		
 		document.querySelector('#textarea-hidden').innerText = text_content_by_summernote
 		
 	$("form[role='newsModifyForm']").submit();
 		Swal.fire({
			icon: 'success',
			title: '수정되었습니다.',
			showConfirmButton: false,
			timer: 1500
	}).then(function(){	
		window.location.replace(location.href);
	});
  }	
});
}
</script>


