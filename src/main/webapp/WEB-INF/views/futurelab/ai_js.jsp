<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script type="text/x-handlebars-template" id="ai1-result-template">
	{{#each .}}
		<div class="col-sm-3 col-md-3 col-xl-3">
			<div id="panel-1" style="height:410px;">
				<div style="text-align:center; margin-top: 15px; margin-bottom: 20px;" >
					<h3> <b>{{field}} 분야 </b></h3>
				</div>
           			<div style="height:300px;" class=" p-3 bg-primary-300 rounded overflow-hidden position-relative text-white">
					<div class="mh-100">
						<p style="text-align:center;">
							<code>공모전 이미지 예정</code>
						</p>
            	    	</div>
        			</div>  
  				<div style="text-align:center; margin-top: 15px;" >
            		{{title}}
            	</div>
			</div>
    	</div>
	{{/each}}
</script>
<script type="text/x-handlebars-template" id="ai2-result-template">
		<div class="mr-2 hidden-md-down">
			<span class="icon-stack icon-stack-lg"> <i
				class="base base-6 icon-stack-3x opacity-100 color-primary-500"></i>
				<i
				class="base base-10 icon-stack-2x opacity-100 color-primary-300 fa-flip-vertical"></i>
				<i class="ni ni-blog-read icon-stack-1x opacity-100 color-white"></i>
			</span>
		</div>
		<div class="d-flex flex-fill">
			<div class="flex-fill">
				<span class="h5">고용동향 예측</span>
				<p>
					Easy Pie Charts
					<code>경제활동참가율</code>
					<code>고용률</code>
					<code>실업률</code>
				</p>
				<a href="javascript:ai2_submit();" class="btn btn-sm btn-outline-primary" >
								AI의 고용동향 예측 결과 -></a>
			</div>
		</div>
	{{#each .}}
		<div class="subheader-block d-none d-sm-flex align-items-center">
			<div class="d-inline-flex flex-column justify-content-center mr-3">
				<span class="fw-300 fs-xs d-block opacity-50"> <small>EXPENSES</small>
				</span> <span class="fw-500 fs-xl d-block color-info-500">{{response1}}%</span>
			</div>
			<span
				class="js-easy-pie-chart color-primary-500 position-relative d-flex align-items-center justify-content-center"
				data-percent="45" data-scalelength="2"> <span
				class="js-percent d-flex align-items-center justify-content-center position-absolute pos-left pos-right pos-top pos-bottom"></span>
			</span>
		</div>
		<div
			class="subheader-block d-none d-sm-flex align-items-center border-faded border-right-0 border-top-0 border-bottom-0 ml-3 pl-3">
			<div class="d-inline-flex flex-column justify-content-center mr-3">
				<span class="fw-300 fs-xs d-block opacity-50"> <small>MY
						PROFITS</small>
				</span> <span class="fw-500 fs-xl d-block color-danger-500">{{response2}}%
				</span>
			</div>
			<span
				class="js-easy-pie-chart color-danger-500 position-relative d-flex align-items-center justify-content-center"
				data-percent="86" data-scalelength="2"> <span
				class="js-percent d-flex align-items-center justify-content-center position-absolute pos-left pos-right pos-top pos-bottom"></span>
			</span>
		</div>
		<div
			class="subheader-block d-none d-sm-flex align-items-center border-faded border-right-0 border-top-0 border-bottom-0 ml-3 pl-3">
			<div class="d-inline-flex flex-column justify-content-center mr-3">
				<span class="fw-300 fs-xs d-block opacity-50"> <small>MY
						PROFITS</small>
				</span> <span class="fw-500 fs-xl d-block color-danger-500">{{response3}}%
				</span>
			</div>
			<span
				class="js-easy-pie-chart color-danger-500 position-relative d-flex align-items-center justify-content-center"
				data-percent="86" data-scalelength="2"> <span
				class="js-percent d-flex align-items-center justify-content-center position-absolute pos-left pos-right pos-top pos-bottom"></span>
			</span>
		</div>
	{{/each}}
</script>
<script type="text/x-handlebars-template" id="ai3-result-template">
	{{#each .}}
			<div class="col-sm-4 col-md-4 col-xl-3">
                <div class="p-3 bg-primary-300 rounded overflow-hidden position-relative text-white mb-g">
                    <div class="">
						<p>
							<code>AI Pick Company!</code>
						</p>
                        <h3 class="display-4 d-block l-h-n m-0 fw-500">
                            <small class="m-0 l-h-n">기업명 : {{CO_NAME}}</small>
                        </h3>
                    </div>
                    <i class="fal fa-user position-absolute pos-right pos-bottom opacity-15 mb-n1 mr-n1" style="font-size:6rem"></i>
                </div>
            </div>
	{{/each}}
</script>
<script type="text/x-handlebars-template" id="ai4-result-template">
	{{#each .}}
		<div class="col-sm-4 col-md-4 col-xl-3">
                <div class="p-3 bg-primary-300 rounded overflow-hidden position-relative text-white mb-g">
                    <div class="">
						<p>
							<code>AI Pick! ID-{{id}}</code>
						</p>
                        <h3 class="display-4 d-block l-h-n m-0 fw-500">
                            <small class="m-0 l-h-n">회사명 : {{CO_NAME}}</small>
                            <small class="m-0 l-h-n">공고명 : {{REC_WANTEDTITLE}}</small>
                        </h3>
                    </div>
                    <i class="fal fa-user position-absolute pos-right pos-bottom opacity-15 mb-n1 mr-n1" style="font-size:6rem"></i>
                </div>
            </div>
	{{/each}}
</script>
<script type="text/x-handlebars-template" id="ai5-result-template">
	{{#each .}}
<div class="panel-content card-wrapper col-3" style="margin: 0px;">
	<div class="card-deck">
		<div class="card talent_card border shadow-0 mb-g shadow-sm-hover"
			data-filter-tags="sesha gray">
			<div class="card-body border-faded border-top-0 border-left-0 border-right-0 rounded-top">
				<div class="d-flex flex-row align-items-center">
					<span class="rounded-circle profile-image d-block">
						<img
						src="<%=request.getContextPath() %>/resources/template/img/member_default.png"
						class="profile-image rounded-circle" alt="회원사진" />
					</span>
					<div class="info-card-text flex-1" style="margin-left:15px;">
						<a href="javascript:void(0);"
							class="fs-xl text-truncate text-truncate-lg text-info"
							data-toggle="dropdown" aria-expanded="false"
							data-filter-tags="{{name}}">
							{{name}}<i class="fal fa-angle-down d-inline-block ml-1 fs-md"></i>
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" 
							   onclick="talentDetail('{{id}}')"
							   data-toggle="modal"
							   data-target="#default-example-modal-lg-center-{{id}}" >인재 상세보기</a> 
							<a class="dropdown-item" href="#">채용 지원 권유하기</a>
						</div>
						<span class="text-truncate text-truncate-xl">Project
							Manager</span>
					</div>
					<div class='icon-stack display-3 flex-shrink-0 panel-toolbar ml-2'>
						<i class="fas fa-star icon-stack-1x opacity-100 color-warning-500"></i>
					</div>
					<button
						class="js-expand-btn btn btn-sm btn-default d-none waves-effect waves-themed"
						data-toggle="collapse"
						data-target="#c_2 > .card-body + .card-body"
						aria-expanded="false">
						<span class="collapsed-hidden">+</span> <span
							class="collapsed-reveal">-</span>
					</button>
				</div>
			</div>
			<div class="card-body p-0 collapse show">
				<div class="p-3">
					<a href="tel:+13174562564"
						class="mt-1 d-block fs-sm fw-400 text-dark"> <i
						class="fas fa-mobile-alt text-muted mr-2"></i>나  이 : {{age}}
					</a> <a href="mailto:oliver.kopyov@smartadminwebapp.com"
						class="mt-1 d-block fs-sm fw-400 text-dark"> <i
						class="fas fa-mouse-pointer text-muted mr-2"></i>
                            	학  력 : {{indFedu}}
                                                                        학  교 : {{eduName}}
					</a>
					<address class="fs-sm fw-400 mt-4 text-muted">
						<i class="fas fa-map-pin mr-2"></i>전  공 : {{eduDep}}
					</address>
					<div class="d-flex flex-row">
						<a href="javascript:void(0);" class="mr-2 fs-xxl"
							style="color: #3b5998"> <i
							class="fab fa-facebook-square"></i>
						</a> <a href="javascript:void(0);" class="mr-2 fs-xxl"
							style="color: #38A1F3"> <i
							class="fab fa-twitter-square"></i>
						</a> <a href="javascript:void(0);" class="mr-2 fs-xxl"
							style="color: #0077B5"> <i class="fab fa-linkedin"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade"
							id="default-example-modal-lg-center-{{id}}" tabindex="-1"
							role="dialog" aria-hidden="true">
							<span aria-hidden="true"><i class="fal fa-times"></i></span>
							<!-- x -->
							<div class="modal-dialog modal-lg modal-dialog-centered"
								role="document">

								<div class="modal-content">
									<div class="card-body">

										<div id="panel-2" class="panel">
											<div class="panel-hdr">
												<h2>
													<b>인재정보</b> <span class="fw-300"></span>
												</h2>
												<div class="panel-toolbar">
													<button class="btn btn-panel" data-action="panel-collapse"
														data-toggle="" data-offset="0,10"
														data-original-title="Collapse"></button>
													<button class="btn btn-panel"
														data-action="panel-fullscreen" data-toggle=""
														data-offset="0,10" data-original-title="Fullscreen"></button>
													<button class="btn btn-panel" data-action="panel-close"
														data-toggle="" data-offset="0,10"
														data-original-title="Close"></button>
												</div>
											</div>

											<!-- 모달 내부 -->
											<div class="p-3">
												<table class="table text-center" width="800">
													<tr>
														<td class="border p-0" rowspan="5"
															style="width: 126px; height: 176px;"><img
															style="display: block; width: 100%; height: auto;"
															src="<%=request.getContextPath()%>/member/getPicture.do?id=${loginUser.id}"
															onerror="this.onerror=null; this.src='<%=request.getContextPath() %>/resources/template/img/member_default.png';"
															alt="증명사진" /></td>
													</tr>
													<tr>
														<th colspan="3"
															class="thead-themed text-center border fw-700">성 명</th>
														<th colspan="3"
															class="thead-themed text-center border fw-700">생 년 월
															일</th>
														<th colspan="3" width="80"
															class="thead-themed text-center border fw-700">E-mail</th>
													</tr>
													<tr>
														<td colspan="3" class="border"></td>
														<td colspan="3" class="border"></td>
														<td colspan="3" class="border"></td>
													</tr>
													<tr>
														<th colspan="3" width="50"
															class="thead-themed text-center border fw-700">연 락 처</th>
														<td colspan="6"
															class="thead-themed text-center border fw-700">주소</td>
													</tr>
													<tr>
														<th class="border"></th>
														<td class="border" colspan="8"></td>
													</tr>
												</table>
												<div
													class="card-header py-2 d-flex align-items-center flex-wrap">
													<div class="card-title">학력</div>
												</div>
												<table class="table" id="{{id}}-edu-section">
													<thead>
														<tr>
															<th
																class="text-center border-top-0 table-scale-border-bottom fw-700">학과계열</th>
															<th
																class="text-center border-top-0 table-scale-border-bottom fw-700">학교명</th>
															<th
																class="text-center border-top-0 table-scale-border-bottom fw-700">학과명</th>
															<th
																class="text-center border-top-0 table-scale-border-bottom fw-700">학점</th>
															<th
																class="text-center border-top-0 table-scale-border-bottom fw-700">상태</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${empty eduList}">
															<tr>
																<td class="text-center fw-700" colspan="5">
																등록된 학력 정보가 없습니다.
																</td>
															</tr>
														</c:if>
													</tbody>
												</table>
												<div
													class="card-header py-2 d-flex align-items-center flex-wrap">
													<div class="card-title">경력</div>
												</div>
												<table class="table">
													<thead>
														<tr>
															<th
																class="text-center border-top-0 table-scale-border-bottom fw-700">업종</th>
															<th
																class="text-center border-top-0 table-scale-border-bottom fw-700">회사명</th>
															<th
																class="text-center border-top-0 table-scale-border-bottom fw-700">직무</th>
															<th
																class="text-center border-top-0 table-scale-border-bottom fw-700">직책</th>
															<th
																class="text-center border-top-0 table-scale-border-bottom fw-700">입사일</th>
															<th
																class="text-center border-top-0 table-scale-border-bottom fw-700">퇴사일</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${empty crrList}">
															<tr>
																<td class="text-center fw-700" colspan="6">등록된 경력
																	정보가 없습니다.<br />
																<br />회원정보 관리에서 경력을 동록하세요.
																</td>
															</tr>
														</c:if>
														<c:forEach items="${crrList}" var="crr">
															<tr>
																<td class="text-center">${crr.crrSector}</td>
																<td class="text-center">${crr.crrCorname}</td>
																<td class="text-center">${crr.crrJob}</td>
																<td class="text-center">${crr.crrPosition}</td>
																<td class="text-center"><fmt:formatDate
																		value="${crr.crrSdate }" pattern="yyyy-MM-dd" /></td>
																<td class="text-center"><fmt:formatDate
																		value="${crr.crrEdate }" pattern="yyyy-MM-dd" /></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
												<c:if test="${not empty cerList}">
													<div
														class="card-header py-2 d-flex align-items-center flex-wrap">
														<div class="card-title">자격증</div>
													</div>
													<table class="table">
														<thead>
															<tr>
																<th
																	class="text-center border-top-0 table-scale-border-bottom fw-700">주최기관</th>
																<th
																	class="text-center border-top-0 table-scale-border-bottom fw-700">자격증명</th>
																<th
																	class="text-center border-top-0 table-scale-border-bottom fw-700">발급일</th>
																<th
																	class="text-center border-top-0 table-scale-border-bottom fw-700">갱신일</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${cerList}" var="cer">
																<tr>
																	<td class="text-center">${cer.cerHost}</td>
																	<td class="text-center">${cer.cerName}</td>
																	<td class="text-center"><fmt:formatDate
																			value="${cer.cerSdate }" pattern="yyyy-MM-dd" /></td>
																	<td class="text-center"><c:if
																			test="${cer.cerEdate == null}">
																			<span class="badge badge-info">유효기간없음</span>
																		</c:if> <c:if test="${cer.cerEdate < today}">
																			<span class="badge badge-danger"> 갱신기간만료</span>
																		</c:if> <c:if test="${cer.cerEdate > today}">
																			<fmt:formatDate value="${cer.cerEdate }"
																				pattern="yyyy-MM-dd" />
																		</c:if></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</c:if>
												<div
													class="card-header py-2 d-flex align-items-center flex-wrap">
													<div class="card-title">자기소개서</div>
												</div>
												<table class="table">
													<c:if test="${empty letterList || (countOpenLetter == 0)}">
														<tr>
															<th colspan="6"
																class="text-center border-top-0 table-scale-border-bottom fw-700">제목</th>
														</tr>
														<tr>
															<td class="text-center fw-700" colspan="6">등록된
																자기소개서가 없습니다.<br />
															<br />나를 표현 해줄 수 있는 자기소개서를 동록하세요.
															</td>
														</tr>
													</c:if>
													<c:forEach items="${letterList}" var="let">
														<c:if test="${let.letIsnav == 1}">
															<thead>
																<tr>
																	<th colspan="6"
																		class="text-center border-top-0 table-scale-border-bottom fw-700">${let.letTitle}</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td class="text-left">${let.letContent}</td>
																</tr>
															</tbody>
														</c:if>
													</c:forEach>
												</table>
											</div>
											<!-- 모달 내부 종료 -->
										</div>
									</div>
								</div>
							</div>
						</div>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="ai6-result-template">
	{{#each .}}
	<div id="recommendContent">
		<br>
		<h1 style="text-align: center">
			<b>"{{response1}}" 업종의 "{{response2}}"년차의 연봉은</b>
		</h1>
		<h1 style="text-align: center">
			<b>"{{response3}}"만원 입니다." </b>
		</h1>
	</div>
{{/each}}
</script>
<script>
	function ai1_submit() {
		var contestForm = $("#contestForm").serialize();

		$.ajax({
			type : "post",
			url : "http://127.0.0.1:5000/contest",
			data : contestForm,
			dataType : 'json',
			success : function(data) {
				printDataByAI(data, $('#ai1panel'), $('#ai1-result-template'));
			},
			error : function(request, status, error) {
				console.log(request, status, error);
			}
		});
	}
</script>
<script>
	function ai2_submit() {

		$.ajax({
			type : "get",
			url : "http://127.0.0.1:5000/trend",
			dataType : 'json',
			success : function(data) {
				printDataByAI(data, $('#ai2panel'), $('#ai2-result-template'));
			},
			error : function(request, status, error) {
				console.log(request, status, error);
			}
		});
	}
</script>
<script>
	function ai3_submit() {
		var companyForm = $("#companyForm").serialize();

		$.ajax({
			type : "post",
			url : "http://127.0.0.1:5000/company",
			data : companyForm,
			dataType : 'json',
			success : function(data) {
				printDataByAI(data, $('#ai3panel'), $('#ai3-result-template'));
			},
			error : function(request, status, error) {
				console.log(request, status, error);
			}
		});
	}
</script>
<script>
	function ai4_submit() {
		var recruitForm = $("#recruitForm").serialize();
		$.ajax({
			type : "post",
			url : "http://127.0.0.1:5000/recruit",
			data : recruitForm,
			dataType : 'json',
			success : function(data) {
				printDataByAI(data, $('#ai4panel'), $('#ai4-result-template'));
			},
			error : function(request, status, error) {
				console.log(request, status, error);
			}
		});
	}
</script>
<script>
	function ai5_submit() {
		var talentForm = $("#talentForm").serialize();

		$.ajax({
			type : "post",
			url : "http://127.0.0.1:5000/talent",
			data : talentForm,
			dataType : 'json',
			success : function(data) {
				printDataByAI(data, $('#ai5panel'), $('#ai5-result-template'));
			},
			error : function(request, status, error) {
				console.log(request, status, error);
			}
		});
	}
</script>
<script>
	function ai6_submit() {
		var salaryForm = $("#salaryForm").serialize();

		$.ajax({
			type : "post",
			url : "http://127.0.0.1:5000/salary",
			data : salaryForm,
			dataType : 'json',
			success : function(data) {
				printDataByAI(data, $('#ai6panel'), $('#ai6-result-template'));
			},
			error : function(request, status, error) {
				console.log(request, status, error);
			}
		});
	}
</script>
<script>
	function ai7_submit() {
		var busicardForm = $("#busicardForm").serialize();
		
		$.ajax({
			type : "post",
			url : "http://127.0.0.1:5000/busicard",
			data : busicardForm,
			dataType : 'json',
			success : function(data) {
				/* window.location.replace(location.href); */
				document.location.reload();
				console.log(data);
			},
			error : function(request, status, error) {
				console.log(request, status, error);
			}
		});
	}
</script>
<script>
	function ai9_submit() {
		var id = '${loginUser.id}';
		
		$.ajax({
			type : "get",
			url : "http://192.168.141.21:5000/idenPicture?id="+id,
			dataType : 'text',
			success : function(data) {
				document.location.reload();
				console.log(data);
			},
			error : function(request, status, error) {
				console.log(request, status, error);
			}
		});
	}
</script>
<script>
	function idenPictureUpload() {
		var formData = new FormData($("#multipartFileForm")[0]);
		console.log($('#idenPictureFile')[0].files[0]);
		formData.append("file",$('#idenPictureFile')[0].files[0]);
		
		$.ajax({
			type : "post",
			url : '<%=request.getContextPath()%>/futurelab/ai1/idenPictureUpload',
			data : formData,
			contentType : false,
		    processData : false,
			dataType : 'text',
			success : function(data) {
				document.location.reload();
				console.log(data);
			},
			error : function(request, status, error) {
				console.log(request, status, error);
			}
		});
	}
</script>
<script>
	function printDataByAI(dataArr, target, templateObject) {
		console.log("handlebars dataArr : " + dataArr);
		var template = Handlebars.compile(templateObject.html());
		var html = template(dataArr);
		target.html(html);
	}
</script>
