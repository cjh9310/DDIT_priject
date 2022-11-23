<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="falseReportList" value="${dataMap.falseReportList }" />

<style>
#container {
    margin: 0px auto;
    width: 500px;
    height: 375px;
}
#videoElement {
    width: 500px;
    height: 375px;
    background-color: #666;
}
</style>
<!-- END Page Header -->
<!-- BEGIN Page Content -->
<!-- the #js-page-content id is needed for some plugins to initialize -->
<main id="js-page-content" role="main" class="page-content">
<div class="subheader">
	
</div>
<div>
	<div class="row col-xl-12">
		<!-- 상담신청내역 -->
		<div class="col-xl-6">
			<!--Table small-->
			<div id="panel-7" class="panel">
				<div class="panel-hdr">
					<h2>신고내역</h2>
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
				<select class="form-control col-md-3" name="perPageNum"
					id="perPageNum" onchange="" style="display: none;">
					<option value="10">정렬개수</option>
				</select>
				<!-- 필수! -->
				<!-- 필수! -->
				<div class="panel-container show">
					<div class="panel-content">
						<h5 class="frame-heading">신고내역테이블</h5>
						<div class="frame-wrap" style="text-align: center;">
							<table id="DataTable" class="table table-striped table-bordered">
								<thead class="bg-primary-700" style="background-color: #08c5a7;">
									<tr>
										<th>No</th>
										<th>작성일</th>
										<th>카테고리</th>
										<th>제목</th>
										<th>진행상태</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${!empty falseReportList }">
										<c:forEach var="falseReportList" items="${falseReportList }">
											<tr onclick="falseReportDetail(${falseReportList.falNo })">
												<td>${falseReportList.falNo }</td>
												<td>${falseReportList.falOdate }</td>
												<td>${falseReportList.falCategory }</td>
												<td>${falseReportList.falTitle }</td>
												<td>${falseReportList.repStatus }</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>  
 
			<form id="jobForm">	
				<input type='hidden' name="page" value="" />
				<input type='hidden' name="perPageNum" value=""/>
			</form>

 
		 	<!-- pagination -->
		<nav aria-label="Navigation">
			<ul class="pagination justify-content-center m-0">
				<li class="page-item">
					<a class="page-link" href="javascript:list_pagination(1);">
						<i class="fas fa-angle-double-left"></i>
					</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:list_pagination('${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">
						<i class="fas fa-angle-left"></i>
					</a>						
				</li>
			
			<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
				<li class="page-item ${cri.page == pageNum?'active':''}">
					<a class="page-link" href="javascript:list_pagination('${pageNum}');" >${pageNum }</a>
				</li>
			</c:forEach>
				<li class="page-item">
					<a class="page-link" href="javascript:list_pagination('${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">
						<i class="fas fa-angle-right" ></i>
					</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:list_pagination('${pageMaker.realEndPage}');">
						<i class="fas fa-angle-double-right"></i>
					</a>
				</li>	
			</ul>
		</nav>   
		</div>
	
		<div class="col-xl-6">
			<div class="panel">
				<div class="panel-hdr">
					<h2>신고내역 상세보기</h2>
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
					<div class="panel-content">
						<div class="form-group row"
							style="margin-left: 0px; margin-right: 0px;">
							<div
								style="display: inline; width: 33%; padding: 0px 10px 0px 0px;">
								<label class="form-label" for="example-date">글작성일</label> <input
									class="form-control" id="sdate" type="date" name="falSdate"
									value="" disabled>
							</div>
							<div
								style="display: inline; width: 34%; padding: 0px 10px 0px 10px;">
								<label class="form-label" for="example-date">사건발생일</label> <input
									class="form-control" id="odate" type="date" name="falOdate"
									value="">
							</div>
							<div
								style="display: inline; width: 33%; padding: 0px 0px 0px 10px;">
								<label class="form-label" for="example-date">종료일</label> <input
									class="form-control" id="edate" type="date" name="falEdate"
									value="">
							</div>
						</div>
						<div class="form-group">
							<label class="form-label" for="">신고제목</label> <input type="text"
								id="title" name="falTitle" class="form-control" placeholder="">
						</div>
						<div class="form-group">
							<label class="form-label" for="">기업명</label> <input type="text"
								id="conm" name="coName" class="form-control" placeholder=""
								disabled>
						</div>
						<div class="form-group">
							<label class="form-label" for="">신고내용</label>
							<textarea type="text" id="content" name="falContent"
								class="form-control" style="resize: none; width: 100%;"
								rows="10"></textarea>
						</div>
						<div class="form-group">
							<label class="form-label" for="">카테고리</label> <input type="text"
								id="company" name="falCategory" class="form-control"
								placeholder="">
						</div>
						<div class="form-group">
							<label class="form-label" for="">카테고리상세</label> <input
								type="text" id="company" name="falCategorydetail"
								class="form-control" placeholder="">
						</div>
						<div class="col-lg-12 mb-2">
							<div class="card card-outline card-success">
								<div class="card-header">
									<b>첨부파일 다운로드</b>
								</div>
								<div class="card-footer">
									<div class="row" id="attachList"></div>
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
var cntxtPth = "${pageContext.request.contextPath}";

function falseReportDetail(p_falNo) {
	$.ajax({
		url : 'reportDetail',
		type : 'post',
		data : {'falNo' : p_falNo},
		success : function(result) {
			console.log(result);
			$("#title").val(result.falTitle);
			$("#sdate").val(result.falSdate);
			$("#edate").val(result.falEdate);
			$("#odate").val(result.falOdate);
			$("#content").val(result.falContent);
			
			var rowStr = '';
			$('#attachList').empty();
			if(result.attachList.length > 0){
				$.each(result.attachList, function(key, val){
					console.log(val)
					console.log(val.attNo)
					console.log(val.filename)
					console.log(cntxtPth)
						rowStr += '<div class="col-md-4 col-sm-4 col-xs-12"  style="cursor:pointer;" onclick="location.href=\''+ cntxtPth+ '/attach/getFile.do?attNo=' + val.attNo + '\';">'
						rowStr += '<div class="info-box">'
						rowStr += '<span class="info-box-icon bg-yellow">'
						rowStr += '<i class="fa fa-copy"></i>'
						rowStr += '</span>'
						rowStr += '<div class="info-box-content">'
						rowStr +=' <span class ="info-box-text"></span>'
						rowStr +=' <span class ="info-box-number">' + val.filename + '</span>'
						rowStr +=' </div></div></div>'
						
				});
				
			}else{
				rowStr = '<span>저장된 첨부 파일이 없습니다.</span>'
			}
			
			$('#attachList').append(rowStr);
		},
		error : function(){
			alert("Error");
		}
	});
};
</script>

<script>
function list_pagination(page,url){
	//alert(page);
	if(!url) {
		url="report.do";
	}
	
	var jobForm=$('#jobForm');
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	jobForm.attr({
		action:url,
		method:'get'
	}).submit(); 
}

</script>

