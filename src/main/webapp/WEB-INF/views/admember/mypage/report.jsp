<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="ReportList" value="${dataMap.reportList }"/>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
.tab-content {
	border-top: 1px solid rgb(233,233,233);
	border-right: 2px solid rgb(233,233,233);
	border-bottom: 2px solid rgb(233,233,233);	
	
	height: 282px;
	overflow: auto;
	position: relative;
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

.col-lg-6 {
	margin: 0px;
	padding: 0px;
}

.col-lg-3 {
	margin: 0px;
	padding: 0px;
}

.col-lg-9 {
	margin: 0px;
	padding: 0px;
}

.row col-lg-12 {
	margin: 0px;
	padding: 0px;
}

</style>



<script>

var cntxtPth = "${pageContext.request.contextPath}";
console.log("cntxtPth = " + cntxtPth)
function openList(falNo) {
	console.log(falNo)
	$.ajax({
		url : 'reportDetail',
		method : 'POST',
		data : {'falNo' : falNo},
		success : function(result) {
			console.log(result);
			$('#openTitle').val(result.falTitle);
			$('#openIndId').val(result.indId);
			$('#openCoName').val(result.coName);
			$('#openCategory').val(result.falCategory);
			$('#openCategoryDetail').val(result.falCategorydetail);
			$('#openOdate').val(result.falOdate);
			$('#openSdate').val(result.falSdate);
			$('#openContent').val(result.falContent);
			
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

			
		}
	})
}



</script>


<main id="js-page-content" role="main" class="page-content">

<!-- -----------------------------------신고내역 리스트 ------------------------------------- -->

	<div class="row">
			<div class="col-6">
				<div id="panel-5" class="panel">
	                <div class="panel-container show">
	                    <div class="panel-content" style="height: 630px;">
	                        <div class="frame-wrap" style="margin-bottom: 20px;">
	                        	<div class="row">
	                        		<div class="col-5">
	                        			<ul class="nav nav-pills" role="tablist">
											<li class="nav-item"><a class="nav-link active" data-toggle="pill"> 신고내역 관리 </a></li>
										</ul>
	                        		</div>
	                        		<div class="col-3" style="text-align: right; padding-right: 2px;">
		                        		<div class="btn-group" style="width: 120px;">
		                        		
			                        		<select class="form-control col-md-3" name="perPageNum" id="perPageNum" 
												onchange="" style="display: none;">
												<option value="10">10개씩</option>
											</select> <!-- 필수! -->
		                        			
                                            <select class="form-control" name="" style="width: 120px;" id="searchType" name="searchType">
												<option>전 체</option>
												<option value="mem" ${cri.searchType eq 'mem' ? 'selected':'' }>작성자</option>
												<option value="co" ${cri.searchType eq 'co' ? 'selected':'' }>기업명</option>
											</select>
                                        </div>
	                        		</div>
		                        	<div class="col-4 mb-3" style="padding-left: 0px;" >
										<div class="input-group-append">
											<input id="button-addon4" type="text" class="form-control"
												placeholder="검색어를 입력하세요" value="${param.keyword }"/>
											<span class="input-group-append">	
												<button class="btn btn-default btn-icon waves-effect waves-themed" type="button" onclick="list_go();" data-card-widget="search">
													<i class="fal fa-search fs-xl"></i>
												</button>
											</span>
										</div>
									</div>
								</div>
	                        
	                        
	                            <table class="table table-bordered table-hover m-0">
	                                <thead class="thead-themed">
	                                    <tr>
	                                        <th style="width: 8%;">NO</th>
	                                        <th style="width: 20%">작성자</th>
	                                        <th style="width: 20%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">신고 기업명</th>
	                                        <th style="width: 20%">신고 유형</th>
	                                        <th style="width: 20%">발생일</th>
	                                        <th style="width: 12%;">처리상태</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:if test="${empty ReportList}">
	                                		<tr>
	                                			<td colspan="6"><strong>해당 내용이 없습니다.</strong> 
	                                		</tr>
	                                	</c:if>
	                                	<c:forEach items="${ReportList }" var="reportList">
	                                		<c:set var="i" value="${i+1 }" />
		                                    <tr onclick="openList('${reportList.falNo}');">
		                                        <td style="text-align: center;"><c:out value="${i }" /></td>
		                                        <td>${reportList.indId }</td>
		                                        <td>${reportList.coName }</td>
		                                        <td>${reportList.falCategory }</td>
		                                        <td>${reportList.falOdate }</td>
		                                        <td>${reportList.repStatus}</td>
		                                    </tr>
		                                </c:forEach>
	                                </tbody>
	                            </table>
	                        </div>
							<%@ include file="../../include/pagination.jsp" %>
	                    </div>
	                </div>
	            </div>	
	            
<!-- --------------------------------------기업검색-------------------------------------------- -->
				<div id="panel-5" class="panel" style="height: 500px;">
	                <div class="panel-container show">
	                    <div class="panel-content" >
			                <div class="frame-wrap">
		                       	<div class="row">
		                       		<div class="col-12" style="margin-bottom: 18px;">
		                       			<ul class="nav nav-pills" role="tablist">
											<li class="nav-item"><a class="nav-link active" data-toggle="pill"> 상세 신고 내역</a></li>
										</ul>
		                       		</div>
								</div>
			                </div>
			                <div class="panel-container show">
			                    <div class="panel-content">
			                        <div class="frame-wrap">
			                            <table class="table table-bordered table-hover m-0">
			                                <thead class="thead-themed">
			                                    <tr>
			                                        <th style="width: 8%;">NO</th>
			                                        <th style="width: 20%">작성자</th>
			                                        <th style="width: 20%; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">신고 기업명</th>
			                                        <th style="width: 20%">신고 유형</th>
			                                        <th style="width: 20%">발생일</th>
			                                        <th style="width: 12%;">처리상태</th>
			                                    </tr>
			                                </thead>
			                                <tbody>			                        
								
											</tbody>
										</table>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
		        </div>	            
			</div>
			
<!-- -----------------------------------상세 신고 내역 ------------------------------------- -->
			
			<div class="col-xl-6">
				<div id="panel-5" class="panel">
	                <div class="panel-container show">
	                    <div class="panel-content" style="height: 1150px;">
	                        <div class="frame-wrap">
	                        	<div class="row">
	                        		<div class="col-12" style="margin-bottom: 18px;">
	                        			<ul class="nav nav-pills" role="tablist">
											<li class="nav-item"><a class="nav-link active" data-toggle="pill"> 상세 신고 내역</a></li>
										</ul>
	                        		</div>
								</div>
							<div id="faqpanel-2" class="panel">
								<div class="panel-container show">
									<div class="panel-content p-0">
										<form class="needs-validation" novalidate method="post"  id="snrRegistForm">
											<div class="panel-content">
												<div class="form-row">
													<div class="col-lg-6 mb-3">
														<label class="form-label" for="validationCustom01"><b>작성자</b></label> 
														<input type="text" class="form-control" id="openIndId"
															value=""  disabled required /> 
													</div>
													
														<div class="col-lg-6 mb-3">
															<label class="form-label" for="validationCustom02"><b>신고 기업명</b>
															</label> <input type="text" class="form-control" id="openCoName"
																 value="" disabled>
														</div>														
														
														<div class="col-lg-6 mb-3">
															<label class="form-label" for="example-date"><b>등록일</b></label> 
															<input class="form-control"
																id="openSdate" type="date" value=""  disabled
																required>
														</div>
														<div class="col-lg-6 mb-3">
															<label class="form-label" for="example-date"><b>발생일</b> </label> 
															<input class="form-control"
																id="openOdate" type="date" value=""
																disabled>
														</div>		
														<div class="col-lg-6 mb-3">
															<label class="form-label" for="validationCustom02"> <b>신고유형</b>
															</label> <input type="text" class="form-control" id="openCategory"
																 value="" disabled>
														</div>	
														<div class="col-lg-6 mb-3">
															<label class="form-label" for="validationCustom02"><b>상세신고유형</b>
															</label> <input type="text" class="form-control" id="openCategoryDetail"
																 value="" disabled>
														</div>																												
																																																
														<div class="col-lg-12 mb-3">
															<label class="form-label" for="validationCustom03"><b>제목</b>
															</label> <input type="text" class="form-control" id="openTitle"
																 value="" disabled>
														</div>
														<div class="col-lg-12 mb-3">
															<label class="form-label" for="validationTextarea1"><b>내용</b></label>
															<textarea class="form-control" id="openContent"
															    rows="10"
																disabled></textarea>
														</div>
														<div class="col-lg-12 mb-2">								
															<div class="card card-outline card-success">
																<div class="card-header">
																	<b>첨부파일 다운로드</b>
																</div>
																<div class="card-footer">
																	<div class="row" id="attachList">
																		<!-- 첨부파일 썸네일 -->
																		<c:forEach items="${report.attachList }" var="attach">
																			<div class="col-md-4 col-sm-4 col-xs-12"  style="cursor:pointer;"
																			 onclick="location.href='<%=request.getContextPath()%>/attach/getFile.do?attNo=${attach.attNo }';">
																			<div class="info-box">	
																			 	<span class="info-box-icon bg-yellow">
																					<i class="fa fa-copy"></i>
																				</span>
																				<div class="info-box-content">
																					<span class ="info-box-text">
																					</span>
																					<span class ="info-box-number">${attach.filename }</span>
																				</div>
																			</div>
																		 </div>			
																		</c:forEach>
																	</div>
																</div>
															</div>
														</div>													
														<div class="col-12 mb-3">
															<label class="form-label" for="validationTextarea1"><b>코몐트 작성</b></label>
															<textarea class="form-control" id="reportComment"
																name="repComment" placeholder="코멘트를 입력하세요." rows="10"
																required></textarea>
														</div>														
														<div class="col-lg-12">
															<div style="float: right;">
																<button class="btn btn-warning ml-auto" id="reportCommentBtn" type="button">코멘트 등록</button>
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

