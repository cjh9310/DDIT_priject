<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="SeniorList" value="${SeniorList }" />

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>

.tab-content {
	border-top: 1px solid rgb(233,233,233);
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
	$(document).ready(
			function() {
				jQuery.fn.serializeObject = function() {
					var obj = null;
					try {
						if (this[0].tagName
								&& this[0].tagName.toUpperCase() == "FORM") {
							var arr = this.serializeArray();
							if (arr) {
								obj = {};
								jQuery.each(arr, function() {
									obj[this.name] = this.value;
								});
							}
						}
					} catch (e) {
						alert(e.message);
					} finally {
					}

					return obj;
				};
			});
	
</script>


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
	                    <div class="panel-content" style="height: 900px;">
	                        <div class="frame-wrap" style="margin-bottom: 20px;">
	                        	<div class="row" style="margin-bottom: 18px;">
	                        		<div class="col-8">
	                        			<ul class="nav nav-pills" role="tablist">
											<li class="nav-item"><a class="nav-link active" data-toggle="pill"> 시니어 채용 리스트 </a></li>
										</ul>
	                        		</div>
	                        		<div class="row col-4" style="float: right;">
	                        			<div class="mr-2">
	                        			<select class="form-control" name="" style="width: 150px;" id="searchType" name="searchType">
											<option>진행상태 검색</option>
											<option value="mem" ${cri.searchType eq '' ? 'selected':'' }>신고접수중</option>
											<option value="co" ${cri.searchType eq '' ? 'selected':'' }>처리중</option>
											<option value="co" ${cri.searchType eq '' ? 'selected':'' }>처리완료</option>
										</select>
										</div>
										<div>
										<button type="button" class="btn btn-success waves-effect waves-themed" data-toggle="modal" data-target=".default-example-modal-left-sm" >새 글 등록</button>
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
	                                        <th style="width: 8%;">NO</th>
	                                        <th style="width: 15%;">일자리유형</th>
	                                        <th style="width: 20%">사업체명</th>
	                                        <th style="width: 30%">제목</th>
	                                        <th style="width: 15%">근무지역</th>
	                                        <th style="width: 12%;">진행상태</th>
	                                    </tr>
	                                </thead>
	                                
	                                <tbody>
	                                	<c:if test="${empty SeniorList}">
	                                		<tr>
	                                			<td colspan="6"><strong>해당 내용이 없습니다.</strong> 
	                                		</tr>
	                                	</c:if>
	                                	<c:forEach items="${SeniorList }" var="seniorList">
	                                		<c:set var="i" value="${i+1 }" />
		                                    <tr onclick="openList('${seniorList.snrNo}');">
		                                        <td style="text-align: center;"><c:out value="${i }" /></td>
		                                        <td>${seniorList.snrType }</td>
		                                        <td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${seniorList.snrConame }</td>
		                                        <td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${seniorList.snrTitle }</td>
		                                        <td>${seniorList.snrWorkplace }</td>
		                                        <td>${seniorList.snrState}</td>
		                                    </tr>
		                                </c:forEach>
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
	                    <div class="panel-content" style="height: 900px;">
	                        <div class="frame-wrap">
	                        	<div class="row">
	                        		<div class="col-12" style="margin-bottom: 18px;">
	                        			<ul class="nav nav-pills" role="tablist">
											<li class="nav-item"><a class="nav-link active" data-toggle="pill"> 채용 상세 내역</a></li>
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
											
									<div class="col-lg-12">
										<label class="form-label" for="validationTextarea2"><b>내용</b></label>
										<textarea class="form-control" id="openContent" style="height: 250px;"
											name="" disabled></textarea>
									</div>
								</form>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>							            
		</div>
<!-- -------------------------------------------------INSERT MODAL------------------------------------------------ -->	

	<div class="modal fade default-example-modal-left-sm" tabindex="-1"
		role="dialog" aria-hidden="true" id="my_modal2">
		<div class="modal-dialog modal-dialog-right modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<div class="row">
						<div class="col-xl-12">
							<div id="faqpanel-2" class="panel">
								<div class="panel-hdr">
									<h2>
										<b>시니어 채용</b> <span class="fw-300"><i> &nbsp;&nbsp;시니어 채용 공고 등록</i></span>
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
									<div class="panel-content">
										<div class="panel-tag">
											<p>
												<b>* 게시물 관리자 필독사항 *</b>
											</p>
											<p>
												필요한 정보들만 간단 명료하게 작성하도록 합니다.
											</p>
										</div>
									</div>
									<div class="panel-content p-0">
										<form class="needs-validation" novalidate method="post"  id="snrForm">
											<div class="panel-content">
												<div class="form-row">
													<div class="col-lg-12 mb-3">
														<label class="form-label" for="validationCustom01">작성자
															<span class="text-danger">*</span>
														</label> <input type="text" class="form-control" id="modalsnrAdId"
															value="${loginUser.id }" disabled required> <input
															type="hidden" name="adId" value="${loginUser.id }" />
														<div class="valid-feedback">Looks good!</div>
													</div>
													<div class="col-lg-4 mb-3">
														<label class="form-label" for="example-date">일자리 유형 <span
															class="text-danger">*</span></label>
														<div class="input-group">
		                                                    <select class="custom-select" id="inputGroupSelect01" onchange="funType()">
		                                                        <option selected="">일자리 유형</option>
		                                                        <option value="1">시니어 인턴십</option>
		                                                        <option value="2">사회서비스형</option>
		                                                        <option value="3">시장형</option>
		                                                        <option value="4">공익활동</option>
		                                                    </select>
		                                                    <div class="valid-feedback">Looks good!</div>
		                                                </div>
		                                                <input class="form-label" id="typeLable" name="snrType" value="" style="display: none;"></input>
													</div>
																											
													<div class="col-lg-4 mb-3">
														<label class="form-label" for="example-date">근무지 <span
															class="text-danger">*</span></label>
														<div class="input-group">
		                                                    <select class="custom-select" id="inputGroupSelect02" onchange="workspaceType()">
		                                                        <option selected="">근무지 선택</option>
		                                                        <option value="1">대전시 대덕구</option>
		                                                        <option value="2">대전시 동구 </option>
		                                                        <option value="3">대전시 서구</option>
		                                                        <option value="4">대전시 유성구</option>
		                                                        <option value="5">대전시 중구</option>
		                                                    </select>
		                                                    <div class="valid-feedback">Looks good!</div>
		                                                </div>
		                                                <input class="form-label" id="workspaceLable" name="snrWorkspace" value="" style="display: none;"></input>
													</div>
													
													<div class="col-lg-4 mb-3">
														<label class="form-label" for="example-date">구인인원 명수 <span
															class="text-danger">*</span></label>
														<div class="input-group">
		                                                    <select class="custom-select" id="inputGroupSelect03" onchange="volumeType()">
		                                                        <option selected="">인원을 선택하세요</option>
		                                                        <option value="1">1</option>
		                                                        <option value="2">2 </option>
		                                                        <option value="3">3</option>
		                                                        <option value="4">4</option>
		                                                        <option value="5">5</option>
		                                                        <option value="6">6</option>
		                                                        <option value="7">7</option>
		                                                        <option value="8">8</option>
		                                                        <option value="9">9</option>
		                                                        <option value="10">10</option>
		                                                        <option value="15">15</option>
		                                                        <option value="20">20</option>
		                                                    </select>
		                                                    <div class="valid-feedback">Looks good!</div>
		                                                </div>
		                                                <input class="form-label" id="volumeLable" name="snrVolume" value="" style="display: none;"></input>
													</div>	
													
													<div class="col-lg-6 mb-3">
														<label class="form-label" for="example-date">등록일 <span
															class="text-danger">*</span></label> <input class="form-control"
															id="snrSdate" type="date" value="" placeholder="" disabled
															required> <input type="hidden"/>
														<div class="valid-feedback">Looks good!</div>
													</div>
													<div class="col-lg-6 mb-3">
														<label class="form-label" for="example-date">마감일 <span
															class="text-danger">*</span></label> <input class="form-control"
															id="modalsnrEdate" type="date" name="snrEdate" value=""
															required>
														<div class="valid-feedback">Looks good!</div>
													</div>		
													
													<div class="col-lg-12 mb-3">
														<label class="form-label" for="validationCustom02"> 사업체명
															 <span class="text-danger">*</span>
														</label> <input type="text" class="form-control" id="modalsnrConame"
															name="snrConame" placeholder="사업체명을 입력하세요" value="" required>
														<div class="valid-feedback">Looks good!</div>
													</div>																																			
																									
													<div class="col-lg-12 mb-3">
														<label class="form-label" for="validationCustom03">제
															목 <span class="text-danger">*</span>
														</label> <input type="text" class="form-control" id="modalsnrTitle"
															name="snrTitle" placeholder="타이틀을 입력하세요" value="" required>
														<div class="valid-feedback">Looks good!</div>
													</div>
													<div class="col-lg-12 mb-3">
														<label class="form-label" for="validationTextarea1"><b>내용</b>
															<span class="text-danger">*</span></label>
														<textarea class="form-control" id="modalsnrContent"
															name="snrContent" placeholder="내용을 간략하게 입력해주세요. (50자 내외)" rows="10"
															required></textarea>
														<div class="valid-feedback">Looks good!</div>
													</div>
													<div class="col-lg-12">
														<div style="float: right;">
															<button class="btn btn-primary ml-auto" id="snrRegistBtn" type="button">등록</button>
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

<!-- --------------------------------------등록일 오늘날짜로------------------------------------ -->
<script>
	document.getElementById('snrSdate').value = new Date().toISOString()
			.substring(0, 10);
</script>

<!-- ------------------------------------- INSERT (MODAL) ----------------------------------- -->
<script>

	function funType(){
		var type = $('#inputGroupSelect01 option:checked').text()
		
		$('#typeLable').val(type)
		console.log($('#typeLable').val());
	};
	
	function workspaceType(){
		var workspace = $('#inputGroupSelect02 option:checked').text()
		
		$('#workspaceLable').val(workspace)
		console.log($('#workspaceLable').val());
	};
	
	function volumeType(){
		var volume = $('#inputGroupSelect03 option:checked').text()
		
		$('#volumeLable').val(volume)
		console.log($('#volumeLable').val());
	};
	
	
	$('#snrRegistBtn').click(function() {
		var data = $("#snrForm").serializeObject();
		console.log(data);
		    $.ajax({
			url : 'seniorRegist',
			type : 'POST',
			data : data,				
			success : function(data) {
				window.location.replace(location.href);
			},
			error : function(request, status, error) {
				 alert("code: " + request.status + "message: " + request.responseText + "error: " + error);
			}
		}); 
	});

</script>


<c:if test="${from eq 'regist' }" >
	<script>
		alert("등록되었습니다.");
		$("#my_modal").modal('hide');
		window.opener.location.reload();			
	</script>
</c:if>
