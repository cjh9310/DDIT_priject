<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>

<script type="text/x-handlebars-template" id="ai1-result-template">
{{#each .}}
	<div class="panel-content col-3">
		<div class="card-deck">
			<div class="card">
				<img id="image" class="card-img-top" style="height:440px;"
					src="http://localhost/ddit/getPicture.do?path={{UPLOADPATH}}&filename={{FILENAME}}"
					onerror="this.onerror=null; this.src='<%=request.getContextPath()%>/resources/template/img/support/contest/공모전11.png';"
					alt="대체 이미지가 로드되지 않았습니다." />
			</div>
		</div>
	</div>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="ai2-result-template">
		<div class="d-flex flex-fill">
			<div class="flex-fill" style="margin-top:10px;">
				<img src="<%=request.getContextPath()%>/resources/template/img/empstats_logo4.png"
				     style="display:block; height:100%; width:auto;"></img>			
			</div>
			<button type="button" class="btn btn-outline-success waves-effect waves-themed" style="margin-right:20px;">
				AI의 고용동향 예측 결과 ->
			</button>
		</div>
	{{#each .}}
		<div class="subheader-block d-none d-sm-flex align-items-center">
			<div class="d-inline-flex flex-column justify-content-center mr-3">
				<span class="fw-300 fs-xs d-block opacity-50"> <small>경제활동참가율</small>
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
				<span class="fw-300 fs-xs d-block opacity-50"> <small>고용률</small>
				</span> <span class="fw-500 fs-xl d-block color-success-500">{{response2}}%
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
				<span class="fw-300 fs-xs d-block opacity-50"> <small>실업률</small>
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
	<div class="card-deck col-3 w-100">
		<div class="card shadow-0 mb-g shadow-sm-hover">
			<img src="<%=request.getContextPath()%>/resources/template/img/strength_log4job.png" class="card-img-top" alt="Log4Job-강소기업">
			<div class="card-body" style="cursor: pointer;"
				onclick="location.href='<%=request.getContextPath()%>/openrec/detail.do?openSeqno={{openSeqno}}&openConm={{openConm}}'">
				<h5 class="card-title" data-toggle="tooltip"
					data-placement="top" title=""
					data-filter-tags="{{CO_NAME}} {{CO_NAME}}"
					data-original-title="{{CO_NAME}}">{{CO_NAME}}</h5>
				<p class="card-text" data-toggle="tooltip"
					data-placement="top" title=""
					data-original-title="{{REC_INDTPCDNM}}">{{REC_INDTPCDNM}}</p>
				<p class="card-text" data-toggle="tooltip"
					data-placement="top" title=""
					data-original-title="{{REC_REGION}}">{{REC_REGION}}</p>
			</div>
			<div class="card-body">
					{{#nullCheck CO_BOOKMARK}}
						<button class="bookMark_btn" id="{{CO_NAME}}"
							value="{{CO_BOOKMARK}}" type="button"
							style="background-color: transparent; border: 0px;">
							<i name="comremove"
								class="badge border border-danger text-danger"> 나의
								관심 기업 </i>
						</button>
					{{else}}	
						<button class="bookMark_btn" id="{{CO_NAME}}"
							value="{{CO_BOOKMARK}}" type="button"
							style="background-color: transparent; border: 0px;">
							<i name="comregist"
								class="badge border border-info text-info"> 관심 기업
								등록하기 </i>
						</button>
					{{/nullCheck}}
			</div>
		</div>
	</div>
	{{/each}}
</script>
<script type="text/x-handlebars-template" id="ai4-result-template">
	{{#each .}}
		<div class="card border-top-left-radius-0 border-top-right-radius-0">
	<div class="card-header">
		<a href="javascript:void(0);" class="card-title collapsed"
			aria-expanded="false">
			<table>
				<tr>
					<td colspan="1" rowspan="3"
						style="width: 45px; padding-right: 16px;">
						<div class='icon-stack display-3 flex-shrink-0'>
						{{#nullCheck REC_BOOKMARK}}
							<button id="{{REC_WANTEDNO}}" class="bookMark_btn"
															style="background-color: transparent; border: 0px;"
															type="button" value="{{REC_BOOKMARK}}">
															<i name="recremove"
																class="fas fa-star icon-stack-1x opacity-100 color-warning-500"></i>
														</button>
						{{else}}									
							<button name="recregist" id="{{REC_WANTEDNO}}"
															class="bookMark_btn"
															style="background-color: transparent; border: 0px;"
															type="button" value="{{REC_BOOKMARK}}">
															<i name="recregist"
																class="far fa-star icon-stack-1x opacity-100 color-warning-500"></i>
														</button>
						{{/nullCheck}}
						</div>
					</td>
				</tr>
				<tr onclick="location.href='<%=request.getContextPath()%>/recruit/detail.do?recWantedno={{REC_WANTEDNO}}'">
												<td colspan="8" style="width: 1400px;">
													<h2>{{REC_WANTEDTITLE}}</h2>
												</td>
												<td rowspan="2" style="width: 140px;">
													<i class="badge text-primary"><h4>
														{{REC_REGION}}
														</h4></i>
												</td>
												<td rowspan="2" style="width: 320px;">
													<i class="badge text-primary"><h4>
														경력사항
														&nbsp;:&nbsp;&nbsp;{{REC_ENTERTPNM}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														</h4></i>
												</td>
											</tr>
				<tr>
					<td colspan="4" style="width: 900px;">
						<div class="panel-toolbar ml-2">
							<h4 style="margin: 0px;">{{CO_NAME}}</h4>
							{{#nullCheck CO_BOOKMARK}}
												
																<button class="bookMark_btn" id="{{CO_NAME}}"
																	value="{{CO_BOOKMARK}}" type="button"
																	style="background-color: transparent; border: 0px;">
																	<i name="comremove"
																		class="badge border border-danger text-danger"> 나의
																		관심 기업 </i>
																</button>
					{{else}}	
																<button class="bookMark_btn" id="{{CO_NAME}}"
																	value="{{CO_BOOKMARK}}" type="button"
																	style="background-color: transparent; border: 0px;">
																	<i name="comregist"
																		class="badge border border-info text-info"> 관심 기업
																		등록하기 </i>
																</button>
									{{/nullCheck}}
						</div>
					</td>
					<td colspan="4" style="width: 300px;"></td>
				</tr>
			</table> 
		</a>
	</div>
</div>
	{{/each}}
</script>
<script type="text/x-handlebars-template" id="ai5-result-template">
	{{#each .}}
<div class="panel-content card-wrapper col-3" style="height:286px; margin: 0px;">
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
							   onclick="talentDetail('{id}}')">인재 상세보기</a> 
							<div class="dropdown-multilevel">
                             <div class="dropdown-item">채용 권유하기
							</div>
							
							</div>
						</div>
					</div>
					<div class='icon-stack display-3 flex-shrink-0 panel-toolbar ml-2'>
							{{#nullCheck talBookmark}}
									<button id="{{bookmarkId}}" class="bookMark_btn"
										style="background-color: transparent; border: 0px;"
											type="button" value="{{talBookmark}}">
											<i name="talremove"
												class="fas fa-star icon-stack-1x opacity-100 color-warning-500"></i>
									</button>
								{{else}}
									<button name="talregist" id="{{bookmarkId}}"
										class="bookMark_btn"
										style="background-color: transparent; border: 0px;"
										type="button" value="{{talBookmark}}">
											<i name="talregist"
												class="far fa-star icon-stack-1x opacity-100 color-warning-500"></i>
											</button>
								{{/nullCheck}}
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
					<a class="mt-1 d-block fs-sm fw-400 text-dark"> <i
						class="fas fa-user-graduate text-muted mr-2"></i>최종학력 : {{indFedu}}
					</a> 
					<a class="mt-1 d-block fs-sm fw-400 text-dark"> <i
						class="fas fa-birthday-cake text-muted mr-2"></i>생년월일 : {{indBir}}
					</a> 
					<a href="mailto:{{email}}"
						class="mt-1 d-block fs-sm fw-400 text-dark"> <i
						class="fas fa-mail-bulk text-muted mr-2"></i>이메일 :{{email}}
					</a>
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
				console.log('contest data : ', data);
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
				console.log(data);
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
