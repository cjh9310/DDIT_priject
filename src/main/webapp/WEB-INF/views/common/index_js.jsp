<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script>
function subMenu_go(mCode){
	//alert(mCode);	
	if(mCode!="M000000"){	
		
		$.ajax({
			url:"<%=request.getContextPath()%>/subMenu.do?mCode="+mCode,
			method:"get",			
			success:function(data){
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);	
			}
		});
		
	}else{
	}
}

function goPage(url,mCode){
	$('iframe[name="ifr"]').attr("src",url);
	
	// HTML5 지원브라우저에서 사용 가능
	if (typeof(history.pushState) == 'function') {
	    //현재 주소를 가져온다.
	    var renewURL = location.href;
	    //현재 주소 중 .do 뒤 부분이 있다면 날려버린다.
	    renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);
	    
	    if (mCode != 'M000000') {
	        renewURL += "?mCode="+mCode;
	    }
	    //페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
	    history.pushState(mCode, null, renewURL);
	 
	} else {
	    location.hash = "#"+mCode;
	}
}

goPage('<%=request.getContextPath()%>${menu.murl}','${menu.mcode}');
subMenu_go('${menu.mcode}'.substring(0,3)+"0000");
</script>
<script>
    // default list filter
    initApp.listFilter($('#js_default_list'), $('#js_default_list_filter'));
    // custom response message
    initApp.listFilter($('#js-list-msg'), $('#js-list-msg-filter'));
    // 채용공고 리스트 검색 필터
    initApp.listFilter($('#accordion-recruit'), $('#accordion-recruit_filter'));
    // 공채 리스트 검색 필터
    initApp.listFilter($('#accordion-openrec'), $('#accordion-openrec_filter'));
    // 인재 리스트 검색 필터
    initApp.listFilter($('#accordion-talent'), $('#accordion-talent_filter'));
    // nested list filter
    initApp.listFilter($('#js_nested_list'), $('#js_nested_list_filter'));
    //init navigation 
    initApp.buildNavigation($('#js_nested_list'));

</script>
<script>
Handlebars.registerHelper("nullCheck", function(element, options) {
    if(element != null) { 
    	return options.fn(this);
    } else if(element == null) {
    	return options.inverse(this);
    }
});
</script>
<script type="text/x-handlebars-template" id="scroll-recruit-list">
{{#each recruitList}}
<div class="card border-top-left-radius-0 border-top-right-radius-0">
	<div class="card-header">
		<a href="javascript:void(0);" class="card-title collapsed"
			aria-expanded="false"
			data-filter-tags="{{coName}} {{recWantedtitle}} {{recRegion}} {{recEntertpnm}}">
			<table>
				<tr>
					<td colspan="1" rowspan="3"
						style="width: 45px; padding-right: 16px;">
						<div class='icon-stack display-3 flex-shrink-0'>
							
								{{#nullCheck recBookmark}}
									<button id="{{recWantedno}}" class="bookMark_btn"
																	style="background-color: transparent; border: 0px;"
																	type="button" value="{{recBookmark}}">
																	<i name="recremove"
																		class="fas fa-star icon-stack-1x opacity-100 color-warning-500"></i>
																</button>
								{{else}}									
									<button name="recregist" id="{{recWantedno}}"
																	class="bookMark_btn"
																	style="background-color: transparent; border: 0px;"
																	type="button" value="{{recBookmark}}">
																	<i name="recregist"
																		class="far fa-star icon-stack-1x opacity-100 color-warning-500"></i>
																</button>
								{{/nullCheck}}

						</div>
					</td>
				</tr>
				<tr onclick="location.href='<%=request.getContextPath()%>/recruit/detail.do?recWantedno={{recWantedno}}'">
					<td colspan="8" style="width: 1400px;">
						<h2>{{recWantedtitle}}</h2>
					</td>
					<td colspan="4" style="width: 300px;"><h4>
							등록일&nbsp;&nbsp;:&nbsp;&nbsp;

						</h4></td>
					<td rowspan="2" style="width: 320px;">
						<h4>
							경력사항
							&nbsp;:&nbsp;&nbsp;{{recEntertpnm}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<h4>
					</td>
					<td rowspan="2" style="width: 140px;">
						<h4>
							{{recRegion}}
							<h4>
					</td>
				</tr>
				<tr>
					<td colspan="4" style="width: 900px;">
						<div class="panel-toolbar ml-2">
							<h4 style="margin: 0px;">{{coName}}</h4>
							
						</div>
					</td>
					<td colspan="4" style="width: 300px;"></td>
					<td>
						<h4>
							마감일 &nbsp;:&nbsp;
							
						</h4>
					</td>
				</tr>
			</table> <span class="ml-auto" data-toggle="collapse"
			data-target="#accordion-recruit-{{recWantedno}}">
				<span class="collapsed-reveal"> <i
					class="fal fa-chevron-up fs-xl"></i>
			</span> <span class="collapsed-hidden"> <i
					class="fal fa-chevron-down fs-xl"></i>
			</span>
		</span>
		</a>
	</div>
	<div id="accordion-recruit-{{recWantedno}}"
		class="collapse" data-parent="#accordion-recruit" style="">
		<div class="card-body">{{recWorkdayworkhrcont}}</div>
	</div>
</div>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="scroll-openrec-card">
{{#each openRecList}}
<div class="panel-content card-wrapper col-2" style="margin:0px;">
	<div class="card-deck">
		<div class="card shadow-0 mb-g shadow-sm-hover">
			<img src="{{openLogo}}" class="card-img-top" alt="...">
			<div class="card-body">
				<h5 class="card-title" data-toggle="tooltip"
					data-placement="top" title=""
					data-filter-tags="{{openConm}} {{openTitle}}"
					data-original-title="{{openConm}}">{{openConm}}</h5>
				<p class="card-text" data-toggle="tooltip"
					data-placement="top" title=""
					data-original-title="{{openTitle}}">{{openTitle}}</p>
			</div>
			<div class="card-footer">
				<small class="text-muted">마감일:{{openEdate}}</small>
			</div>
		</div>
	</div>
</div>
{{/each}}
</script>
<script type="text/x-handlebars-template" id="scroll-talent-card">
{{#each talentList}}
<div class="panel-content card-wrapper col-2" style="margin: 0px;">
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
						class="fas fa-mobile-alt text-muted mr-2"></i> {{tel}}
					</a> <a href="mailto:oliver.kopyov@smartadminwebapp.com"
						class="mt-1 d-block fs-sm fw-400 text-dark"> <i
						class="fas fa-mouse-pointer text-muted mr-2"></i>
						{{email}}
					</a>
					<address class="fs-sm fw-400 mt-4 text-muted">
						<i class="fas fa-map-pin mr-2"></i> {{indAddr}}
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
<script>
	   /* 채용공고 / 공채정보 / 인재정보 - 리스트 및 카드의 무한 스크롤 로직 */
       $('.dataload-scroll').scroll(function(){
    	   
    	    var parameter = $(this).attr('id');
    	    
    	    var viewType = $(this).attr('name');
    	    
        	var listParent = $('#accordion-' + parameter);
        	var childCount = $(listParent).children().length;
        	var scrollHeight = $(this).prop('scrollHeight');
        	var outerHeight = $(this).outerHeight();
        	var scrollTop = $(this).scrollTop();

			var startNum = childCount + 1;
			var endNum = childCount + 18;
			
			if((scrollTop+outerHeight) >= (scrollHeight - 100)) {
				var ajaxOption = {
					url : '<%=request.getContextPath()%>/' + parameter + '/scrollList.do?startNum=' + startNum + '&endNum=' + endNum,
					async : true,
					type : "GET",
					dataType : "json",
					cache : false
				};
				
				$.ajax(ajaxOption).done(function(data) {
					console.log("json data : ",data);
					printDataByScroll(data, $('#accordion-' + parameter), $('#scroll-' + parameter + "-" + viewType));
					$('.bookMark_btn').click(function() {
						
						var button = $(this);
						var depth = button.children('i').attr('name');
						var uri = depth.substr(3,7);
						var authName = '${loginUser.authName}';
						var indId = '${loginUser.id}';
						
						if(authName != 'ROLE_INDUSER') {
							alert('관심 등록은 개인회원만 사용 가능한 기능입니다.');
							return;
						}
						
						var flag;
						var url;
						
						var value = button.val();
						var pkey = button.attr('id');
						
						if(uri == 'regist') {
							flag = true;
						} else if(uri == 'remove') {
							flag = false;
						}
						
						if(flag) {
							url = '<%=request.getContextPath()%>/bookmark/' + uri;
						} else {
							url = '<%=request.getContextPath()%>/bookmark/' + uri;
						}
						
						var recWantedno;
						var bookType;
						var coName;
						
						if(depth.substr(0,3) == "rec") {
							recWantedno = pkey;
							bookType = 0;
						} else if(depth.substr(0,3) == "com") {
							coName = pkey;
							bookType = 1;
						}
						
						data = {indId : indId,
								recWantedno : recWantedno,
								bookType : bookType,
								coName : coName};
						
						var ajaxOption = {
								url : url,
								async : true,
								type : "POST",
								data : data,
								dataType : "text",
								cache : false
							};
					
							$.ajax(ajaxOption).done(function(data) {
								if(data=='recBookmarkRegistSuccess' && depth.substr(0,3) == "rec") {
									button.children('i').remove();
									button.prepend('<i name="recremove" class="fas fa-star icon-stack-1x opacity-100 color-warning-500"></i>');
								} else if(data=='recBookmarkRegistSuccess' && depth.substr(0,3) == "com") {
									button.children('i').remove();
									button.prepend('<i name="comremove" class="badge border border-danger text-danger">나의 관심 기업</i>');
								} else if(data=='recBookmarkRemoveSuccess' && depth.substr(0,3) == "rec") {
									button.children('i').remove();
									button.prepend('<i name="recregist" class="far fa-star icon-stack-1x opacity-100 color-warning-500"></i>');
								} else if(data=='recBookmarkRemoveSuccess' && depth.substr(0,3) == "com") {
									button.children('i').remove();
									button.prepend('<i name="comregist" class="badge border border-info text-info">관심 기업 등록하기</i>');
								}
							});
							
					});
				});			
			}
        });
</script>

<script>
	function list(page,url) {
		alert("검색");
		if (!url)
			url = "list.do";

		var buttonList1 = $(".firstButton");
		var buttonList2 = $(".secondButton");
		var buttonList3 = $(".thirdButton");
		var buttonList4 = $(".fourthButton");
		var buttonList5 = $(".fifthButton");

		var firstButton = buttonList1.val();
		console.log("첫번쨰" + firstButton);
		var secondButton = buttonList2.val();
		console.log("두번쨰" + secondButton);
		var thirdButton = buttonList3.val();
		console.log("세번쨰" + thirdButton);
		var fourthButton = buttonList4.val();
		console.log("네번쨰" + fourthButton);
		var fifthButton = buttonList5.val();
		console.log("다섯번쨰" + fifthButton);

		document.getElementById('searchBtn1').value = firstButton;
		document.getElementById('searchBtn2').value = secondButton;
		document.getElementById('searchBtn3').value = thirdButton;
		document.getElementById('searchBtn4').value = fourthButton;
		document.getElementById('searchBtn5').value = fifthButton;
		
		var searchForm=$('.searchForm');
		searchForm.find("[name='page']").val(1);
		searchForm.find("[name='perPageNum']").val(0);

		searchForm.attr({
			action : url,
			method : 'get'
		}).submit();
	};
</script>

<script>
	function printDataByScroll(dataArr, target, templateObject) {
		console.log("handlebars dataArr : " + dataArr);
		var template = Handlebars.compile(templateObject.html());
		var html = template(dataArr);
		target.append(html);
	}
</script>

<script>
$(document).ready(function() {
	
	$('.bookMark_btn').click(function() {
		
		var button = $(this);
		var depth = button.children('i').attr('name');
		var uri = depth.substr(3,7);
		var authName = '${loginUser.authName}';
		var indId = '${loginUser.id}';
		
		if(authName != 'ROLE_INDUSER') {
			alert('관심 등록은 개인회원만 사용 가능한 기능입니다.');
			return;
		}
		
		var flag;
		var url;
		
		var value = button.val();
		var pkey = button.attr('id');
		
		if(uri == 'regist') {
			flag = true;
		} else if(uri == 'remove') {
			flag = false;
		}
		
		if(flag) {
			url = '<%=request.getContextPath()%>/bookmark/' + uri;
		} else {
			url = '<%=request.getContextPath()%>/bookmark/' + uri;
		}
		
		var recWantedno;
		var bookType;
		var coName;
		
		if(depth.substr(0,3) == "rec") {
			recWantedno = pkey;
			bookType = 0;
		} else if(depth.substr(0,3) == "com") {
			coName = pkey;
			bookType = 1;
		}
		
		data = {indId : indId,
				recWantedno : recWantedno,
				bookType : bookType,
				coName : coName};
		
		var ajaxOption = {
				url : url,
				async : true,
				type : "POST",
				data : data,
				dataType : "text",
				cache : false
			};
	
			$.ajax(ajaxOption).done(function(data) {
				if(data=='recBookmarkRegistSuccess' && depth.substr(0,3) == "rec") {
					button.children('i').remove();
					button.prepend('<i name="recremove" class="fas fa-star icon-stack-1x opacity-100 color-warning-500"></i>');
				} else if(data=='recBookmarkRegistSuccess' && depth.substr(0,3) == "com") {
					button.children('i').remove();
					button.prepend('<i name="comremove" class="badge border border-danger text-danger">나의 관심 기업</i>');
				} else if(data=='recBookmarkRemoveSuccess' && depth.substr(0,3) == "rec") {
					button.children('i').remove();
					button.prepend('<i name="recregist" class="far fa-star icon-stack-1x opacity-100 color-warning-500"></i>');
				} else if(data=='recBookmarkRemoveSuccess' && depth.substr(0,3) == "com") {
					button.children('i').remove();
					button.prepend('<i name="comregist" class="badge border border-info text-info">관심 기업 등록하기</i>');
				}
			});
			
	});
	
});
</script>
