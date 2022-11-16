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

function openList(falNo) {
	console.log(falNo)
	$.ajax({
		url : 'reportDetail',
		method : 'POST',
		data : {'falNo' : falNo},
		success : function(result) {
			console.log(result);
			$('input[id=openTitle]').val(result.falTitle);
			$('input[id=openIndId]').val(result.indId);
			$('input[id=openCoName]').val(result.coName);
			$('input[id=openCategory]').val(result.falCategory);
			$('input[id=openCategoryDetail]').val(result.falCategorydetail);
			$('input[id=openOdate]').val(result.falOdate);
			$('input[id=openSdate]').val(result.falSdate);
			$('#openContent').val(result.falContent);
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
	                <div class="panel-hdr">
                   		<ul class="nav nav-pills" role="tablist">
							<li class="nav-item"><a class="nav-link active" data-toggle="pill"> 기업 검색 </a></li>
						</ul>
	                </div>
	                <div class="panel-container show">
	                    <div class="panel-content">
	                        <div class="frame-wrap">


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
	                        
                       			<form class="needs-validation" novalidate method="post" name="comentForm" id="myForm">
									
									<div class="row col-lg-12 mb-3">
										<div class="col-lg-1">
											<label class="form-label" style="margin-top: 10px;"><b>제목</b></label> 
										</div>
										<div class="col-lg-11" style="padding-left: 28px;">
											<input type="text" class="form-control" id="openTitle" style="width: 706px;"
												value="" name="" disabled  />
										</div>
									</div>
									
							
									<div class="row col-lg-12 mb-3">
										<div class="col-lg-6">
											<div class="row col-lg-12">
												<div class="col-lg-3" style="padding-left: 10px;">
													<label class="form-label" style="margin-top: 10px;"><b>작성자</b></label> 
												</div>
												<div class="col-lg-9">
													<input type="text" class="form-control" id="openIndId"
														value="" name="" disabled  />
												</div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="row col-lg-12">
												<div class="col-lg-3">
													<label class="form-label" style="margin-top: 10px;"><b>신고 기업명</b></label> 
												</div>
												<div class="col-lg-9">
													<input type="text" class="form-control" id="openCoName"
														value="" name="" disabled  />
												</div>
											</div>
										</div>
									</div>													
									
									<div class="row col-lg-12 mb-3">
										<div class="col-lg-6">
											<div class="row col-lg-12">
												<div class="col-lg-3" style="padding-left: 10px;">
													<label class="form-label" style="margin-top: 10px;"><b>신고유형</b></label> 
												</div>
												<div class="col-lg-9">
													<input type="text" class="form-control" id="openCategory"
														value="" name="" disabled  /> 
												</div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="row col-lg-12">
												<div class="col-lg-3">
													<label class="form-label" style="margin-top: 10px;"><b>상세신고유형</b></label> 
												</div>
												<div class="col-lg-9">
													<input type="text" class="form-control" id="openCategoryDetail"
														value="" name="" disabled  /> 
												</div>
											</div>
										</div>
									</div>														
									
									<div class="row col-lg-12 mb-4">
										<div class="col-lg-6">
											<div class="row col-lg-12">
												<div class="col-lg-3" style="padding-left: 10px;">
													<label class="form-label" style="margin-top: 10px;"><b>발생일</b></label> 
												</div>
												<div class="col-lg-9">
													<input type="date" class="form-control" id="openOdate"
														value="" name="" disabled  />
												</div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="row col-lg-12">
												<div class="col-lg-3">
													<label class="form-label" style="margin-top: 10px;"><b>등록일</b></label> 
												</div>
												<div class="col-lg-9">
													<input type="date" class="form-control" id="openSdate"
														value="" name="" disabled />
												</div>
											</div>
										</div>
									</div>														
											
									<div class="col-lg-12 mt-4">
										<label class="form-label" for="validationTextarea2"><b>내용</b></label>
										<textarea class="form-control" id="openContent" style="height: 250px;"
											name="" disabled></textarea>
									</div>
									
									<div class="col-lg-12 mt-3">
										<label class="form-label" for="validationCustom02"><b>첨부파일 </b></label> 
										<div style="border: solid 1px rgb(233,233,233); height: 70px;">
										
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

