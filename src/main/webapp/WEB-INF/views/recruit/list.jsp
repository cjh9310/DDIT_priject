<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="recruitList" value="${dataMap.recruitList }" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<!-- base css -->
<link id="vendorsbundle" rel="stylesheet" media="screen, print"
	href="<%=request.getContextPath()%>/resources/template/css/vendors.bundle.css">
<link id="appbundle" rel="stylesheet" media="screen"
	href="<%=request.getContextPath()%>/resources/template/css/app.bundle.css">

<style>
.modal-content {
	width: 100%;
	height: 1000px;
	overflow: auto;
	overflow-y: hidden;
}

.recruit-content {
	width: 100%;
	height: 690px;
	overflow: auto;
}

.recruit-search {
	width: 100%;
	height: 250px;
}

.search-panel {
	height: 250px;
}

.search-bar {
	height: 40px;
}
</style>



<main id="js-page-content" role="main" class="page-content">
<div class="card mb-g">
	<div class="recruit-search panel-conteiner">
		<div class="row w-100 p-0 m-0 h-100">
			<div class="col-xl-1 p-2 m-0 row" style="background-size: cover;">
				<img
					src="<%=request.getContextPath()%>/resources/template/img/rec_search_logo.png"
					alt="채용공고 상세검색" style="display: block; height: 100%; width: auto;" />
			</div>
			<div class="col-xl-7 p-0 m-0 row">
				<div class="col-xl-2 p-2">
					<select style="height: 234px;" multiple=""
						class="search-scroll custom-scrollbar form-control firstBtn">
						<option class="fw-900" style="font-size: 1.0em;" value="서비스업">서비스업</option>
						<option class="fw-900" style="font-size: 1.0em;" value="제조·화학">제조·화학</option>
						<option class="fw-900" style="font-size: 1.0em;" value="IT·웹·통신">IT·웹·통신</option>
						<option class="fw-900" style="font-size: 1.0em;" value="은행·금융업">은행·금융업</option>
						<option class="fw-900" style="font-size: 1.0em;" value="미디어·디자인">미디어·디자인</option>
						<option class="fw-900" style="font-size: 1.0em;" value="교육업">교육업</option>
						<option class="fw-900" style="font-size: 1.0em;" value="의료·제약·복지">의료·제약·복지</option>
						<option class="fw-900" style="font-size: 1.0em;" value="판매·유통">판매·유통</option>
						<option class="fw-900" style="font-size: 1.0em;" value="건설업">건설업</option>
						<option class="fw-900" style="font-size: 1.0em;" value="기관·협회">기관·협회</option>
					</select>
				</div>
				<div class="search-panel col-xl-2 p-2">
					<select style="height: 234px;" multiple=""
						class="search-scroll custom-scrollbar form-control secondBtn">
						<option class="fw-900" style="font-size: 1.0em;" value="서구">대전 서구</option>
						<option class="fw-900" style="font-size: 1.0em;" value="중구">대전 중구</option>
						<option class="fw-900" style="font-size: 1.0em;" value="유성구">대전 유성구</option>
						<option class="fw-900" style="font-size: 1.0em;" value="대덕구">대전 대덕구</option>
						<option class="fw-900" style="font-size: 1.0em;" value="동구">대전 동구</option>
					</select>
				</div>
				<div class="search-panel col-xl-2 col-md-1 p-2">
					<select style="height: 234px;" multiple=""
						class="search-scroll custom-scrollbar form-control thirdBtn">
						<option class="fw-900" style="font-size: 1.0em;" value="관계없음">관계없음</option>
						<option class="fw-900" style="font-size: 1.0em;" value="1년">1년차</option>
						<option class="fw-900" style="font-size: 1.0em;" value="2년">2년차</option>
						<option class="fw-900" style="font-size: 1.0em;" value="3년">3년차</option>
						<option class="fw-900" style="font-size: 1.0em;" value="4년">4년차</option>
						<option class="fw-900" style="font-size: 1.0em;" value="5년">5년차</option>
						<option class="fw-900" style="font-size: 1.0em;" value="6년">6년차</option>
						<option class="fw-900" style="font-size: 1.0em;" value="7년">7년차</option>
						<option class="fw-900" style="font-size: 1.0em;" value="8년">8년차</option>
						<option class="fw-900" style="font-size: 1.0em;" value="9년">9년차</option>
						<option class="fw-900" style="font-size: 1.0em;" value="10년차">10년차</option>
					</select>
				</div>
				<div class="search-panel col-xl-2 p-2">
					<select style="height: 234px;" style="height:234px;" multiple=""
						class="search-scroll custom-scrollbar form-control fourthBtn">
						<option class="fw-900" style="font-size: 1.0em;" value="학력무관">학력무관</option>
						<option class="fw-900" style="font-size: 1.0em;" value="대졸(4년)">대졸(4년)</option>
						<option class="fw-900" style="font-size: 1.0em;" value="대졸(2~3년)">대졸(2~3년)</option>
						<option class="fw-900" style="font-size: 1.0em;" value="고졸">고졸</option>
						<option class="fw-900" style="font-size: 1.0em;" value="대학원">대학원</option>
					</select>
				</div>
				<div class="search-panel col-xl-2 p-2">
					<select style="height: 234px;" multiple=""
						class="search-scroll custom-scrollbar form-control fifthBtn">
						<option class="fw-900" style="font-size: 1.0em;" value="대기업">대기업</option>
						<option class="fw-900" style="font-size: 1.0em;" value="중견기업">중견기업</option>
						<option class="fw-900" style="font-size: 1.0em;" value="중소기업">중소기업</option>
						<option class="fw-900" style="font-size: 1.0em;" value="강소기업">강소기업</option>
						<option class="fw-900" style="font-size: 1.0em;" value="기타">기타</option>
					</select>
				</div>
				<div class="col-xl-1 p-2 m-0 row" style="background-size: cover;">
					<img
						src="<%=request.getContextPath()%>/resources/template/img/recruit_popular.png"
						alt="인기 채용공고" style="display: block; height: 100%; width: auto;" />
				</div>
			</div>
			<div class="col-xl-4 p-0 m-0 row border">
				<div id="carouselExampleInterval" style="padding: 0px;"
					class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<c:forEach items="${recruitList}" var="recruit" varStatus="status">
							<c:choose>
								<c:when test="${status.first}">
									<div class="carousel-item active" data-interval="2000">
								</c:when>
								<c:otherwise>
									<div class="carousel-item" data-interval="2000">
								</c:otherwise>
							</c:choose>
								<div class="card-body">
									<h5 class="card-title fw-700">${recruit.coName}</h5>
									<p class="card-text">
										<fmt:formatDate value="${recruit.recRegdt}"
											pattern="yyyy-MM-dd" />
									</p>
									<p class="card-text">${recruit.recRegion}</p>
									<p class="card-text">${recruit.recWantedtitle}</p>
									<a href="" class="card-link fw-700">${recruit.coName}
										지원하러가기</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<div class="alert alert-info fs-lg p-0" style="margin-bottom: 24px;">
	<div class="input-group p-0 m-0 rounded-top">
		<input type="text"
			class="form-control form-control-lg shadow-inset-2 m-0"
			id="accordion-recruit_filter" placeholder="원하는 채용공고를 다양한 키워드로 검색해보세요" />
		<div class="input-group-append">
			<div class="row justify-content-start" style="width: 700px;"
				id="mainDiv">
				<c:if
					test="${cri.searchBtn1 ne null and cri.searchBtn1 ne 'undefined'}">
					<button
						class="btn btn-outline-info waves-effect waves-themed firstButton"
						value="${cri.searchBtn1}" onclick="deleteDiv(event)">${cri.searchBtn1}&nbsp;X</button>
				</c:if>
				<c:if
					test="${cri.searchBtn2 ne null and cri.searchBtn2 ne 'undefined'}">
					<button
						class="btn btn-outline-info waves-effect waves-themed secondButton"
						value="${cri.searchBtn2}" onclick="deleteDiv(event)">${cri.searchBtn2}&nbsp;X</button>
				</c:if>
				<c:if
					test="${cri.searchBtn3 ne null and cri.searchBtn3 ne 'undefined'}">
					<button
						class="btn btn-outline-info waves-effect waves-themed thirdButton"
						value="${cri.searchBtn3}" onclick="deleteDiv(event)">${cri.searchBtn3}&nbsp;X</button>
				</c:if>
				<c:if
					test="${cri.searchBtn4 ne null and cri.searchBtn4 ne 'undefined'}">
					<button
						class="btn btn-outline-info waves-effect waves-themed fourthButton"
						value="${cri.searchBtn4}" onclick="deleteDiv(event)">${cri.searchBtn4}&nbsp;X</button>
				</c:if>
				<c:if
					test="${cri.searchBtn5 ne null and cri.searchBtn5 ne 'undefined'}">
					<button
						class="btn btn-outline-info waves-effect waves-themed fifthButton"
						value="${cri.searchBtn5}" onclick="deleteDiv(event)">${cri.searchBtn5}&nbsp;X</button>
				</c:if>
				<!-- <div class="btn-group col-3" style="padding:5px;">
					<button type="button"
							class="btn btn-xs btn-info w-100 waves-effect waves-themed">
							서비스업</button>
					<button class="btn btn-xs btn-danger ml-auto waves-effect waves-themed">
						<i class="fal fa-times"></i></button>
				</div>
				
				<div class="btn-group col-3" style="padding:5px;">
					<button type="button"
							class="btn btn-xs btn-info w-100 waves-effect waves-themed">
							대전 대덕구</button>
					<button
						class="btn btn-xs btn-danger ml-auto waves-effect waves-themed">
						<i class="fal fa-times"></i>
					</button>
				</div>
				
				<div class="btn-group col-3" style="padding:5px;">
					<button type="button"
							class="btn btn-xs btn-info w-100 waves-effect waves-themed">
							8년차</button>
					<button
						class="btn btn-xs btn-danger ml-auto waves-effect waves-themed">
						<i class="fal fa-times"></i>
					</button>
				</div>
				
				<div class="btn-group col-3" style="padding:5px;">
					<button type="button"
							class="btn btn-xs btn-info w-100 waves-effect waves-themed">
							대졸(4년)</button>
					<button
						class="btn btn-xs btn-danger ml-auto waves-effect waves-themed">
						<i class="fal fa-times"></i>
					</button>
				</div>
				
				<div class="btn-group col-3" style="padding:5px;">
					<button type="button"
							class="btn btn-xs btn-info w-100 waves-effect waves-themed">
							대기업</button>
					<button
						class="btn btn-xs btn-danger ml-auto waves-effect waves-themed">
						<i class="fal fa-times"></i>
					</button> -->

				<form id="RecruitSearchForm">
					<div class="d-flex justify-content-end">
						<span class="input-group-append">
							<button type="button" onclick="list(1);"
								data-card-widget="search"
								class="btn btn-success btn-pills waves-effect waves-themed "
								style="float: right;" value="ki" id="listGoBtn">기업조회</button>
						</span>
					</div>
					<input type='hidden' name="page" value="" /> <input type='hidden'
						name="perPageNum" value="" /> <input type='hidden'
						name="searchType" value="" />
					<!-- <input type='hidden' name="keyword" value="" />  -->
					<input type="hidden" name="searchBtn1" id="searchBtn1" /> <input
						type="hidden" name="searchBtn2" id="searchBtn2" /> <input
						type="hidden" name="searchBtn3" id="searchBtn3" /> <input
						type="hidden" name="searchBtn4" id="searchBtn4" /> <input
						type="hidden" name="searchBtn5" id="searchBtn5" />
				</form>
			</div>

		</div>
		<!-- <button class="btn btn-outline-default waves-effect waves-themed"
			type="button" id="inputGroupFileAddon04" onclick="list_go(1);"
			value="ki">검색</button>
		<button class="btn btn-outline-default waves-effect waves-themed"
			type="button" id="inputGroupFileAddon04">AI에게 채용공고 추천받기</button> -->
	</div>
</div>

<div class="card mb-g p-0">
	<div class="card-body p-0">
		<div class="custom-scroll recruit-content">
			<div class="dataload-scroll panel-content" id="recruit" name="list"
				style="margin-right: 10px;">
				<div class="border bg-light rounded-top">
					<div id="accordion-recruit" name="recruit"
						class="accordion accordion-hover accordion-clean js-list-filter">
						<c:forEach items="${recruitList}" var="recruit" varStatus="vs">
							<div class="card border-top-left-radius-0 border-top-right-radius-0">
								<div class="card-header">
									<a href="javascript:void(0);" class="card-title collapsed"
										aria-expanded="false"
										data-filter-tags="${recruit.coName} ${recruit.recWantedtitle} ${recruit.recWantedno} ${recruit.recRegion} ${recruit.recEntertpnm}">
										<table>
											<tr>
												<td colspan="1" rowspan="3"
													style="width: 45px; padding-right: 16px;">
													<div class='icon-stack display-3 flex-shrink-0'>
														<c:choose>
															<c:when test="${recruit.recBookmark != null}">
																<button id="${recruit.recWantedno}" class="bookMark_btn"
																	style="background-color: transparent; border: 0px;"
																	type="button" value="${recruit.recBookmark}">
																	<i name="recremove"
																		class="fas fa-star icon-stack-1x opacity-100 color-warning-500"></i>
																</button>
															</c:when>
															<c:when test="${recruit.recBookmark == null}">
																<button name="recregist" id="${recruit.recWantedno}"
																	class="bookMark_btn"
																	style="background-color: transparent; border: 0px;"
																	type="button" value="${recruit.recBookmark}">
																	<i name="recregist"
																		class="far fa-star icon-stack-1x opacity-100 color-warning-500"></i>
																</button>
															</c:when>
														</c:choose>
													</div>
												</td>
											</tr>
											<tr onclick="location.href='<%=request.getContextPath()%>/recruit/detail.do?recWantedno=${recruit.recWantedno}'">
												<td colspan="8" style="width: 1400px;">
													<h2>${recruit.recWantedtitle}</h2>
												</td>
												<td rowspan="2" style="width: 140px;">
													<i class="badge text-primary"><h4>
														${recruit.recRegion}
														</h4></i>
												</td>
												<td rowspan="2" style="width: 320px;">
													<i class="badge text-primary"><h4>
														경력사항
														&nbsp;:&nbsp;&nbsp;${recruit.recEntertpnm}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														</h4></i>
												</td>
												<td colspan="4" rowspan="2" style="width: 300px;">
													<i class="badge text-primary">
														<h4>마감일 &nbsp;:&nbsp;
															<c:if test="${recruit.recReceiptclosedt ne '채용시까지'}">
																<fmt:parseDate var="dateString"
																	value="${recruit.recReceiptclosedt}" pattern="yyyyMMdd" />
																<fmt:formatDate value="${dateString}"
																	pattern="yyyy-MM-dd" />
															</c:if>
															<c:if test="${recruit.recReceiptclosedt eq '채용시까지'}">
															${recruit.recReceiptclosedt}
														</c:if>
														</h4>
													</i>
												</td>
											</tr>
											<tr>
												<td colspan="4" style="width: 900px;">
													<div class="panel-toolbar ml-2">
														<h4 style="margin: 0px;">${recruit.coName}</h4>
														<c:choose>
															<c:when test="${recruit.coBookmark != null}">
																<button class="bookMark_btn" id="${recruit.coName}"
																	value="${recruit.coBookmark}" type="button"
																	style="background-color: transparent; border: 0px;">
																	<i name="comremove"
																		class="badge border border-danger text-danger"> 나의
																		관심 기업 </i>
																</button>
															</c:when>
															<c:when test="${recruit.coBookmark == null}">
																<button class="bookMark_btn" id="${recruit.coName}"
																	value="${recruit.coBookmark}" type="button"
																	style="background-color: transparent; border: 0px;">
																	<i name="comregist"
																		class="badge border border-info text-info"> 관심 기업
																		등록하기 </i>
																</button>
															</c:when>
														</c:choose>
													</div>
												</td>
												<td colspan="4" style="width: 300px;"></td>
											</tr>
										</table> <span class="ml-auto" data-toggle="collapse"
										data-target="#accordion-recruit-${recruit.recWantedno}">
											<span class="collapsed-reveal"> <i
												class="fal fa-chevron-up fs-xl"></i>
										</span> <span class="collapsed-hidden"> <i
												class="fal fa-chevron-down fs-xl"></i>
										</span>
									</span>
									</a>
								</div>
								<div id="accordion-recruit-${recruit.recWantedno}"
									class="collapse" data-parent="#accordion-recruit" style="">
									<div class="card-body">${recruit.recWorkdayworkhrcont}</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<span class="filter-message js-filter-message"></span>
				</div>
			</div>
		</div>
	</div>
</div>

</main>

<!-- <script>
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
</script> -->

<script>
	/* 
	 + `<button class="btn btn-xs btn-danger ml-auto waves-effect waves-themed firstButton" onclick="deleteDiv(event)">`
	 +"<i class="fal fa-times"></i>"
	 +"</button>"; */

	var bodyHtml;
	// 업종 버튼
	$(document)
			.ready(
					function() {
						$(".firstBtn")
								.on(
										"click",
										function(event) {
											var valueee = event.target.value
											bodyHtml = `<button class="btn btn-xs btn-info w-100% waves-effect waves-themed firstButton" `
													+ "value="
													+ valueee
													+ ` onclick="deleteDiv(event)">`
													+ event.target.value
													+ "</button>";
											+`<button class="btn btn-xs btn-danger ml-auto waves-effect waves-themed">`
													+ "</button>";

											$("#mainDiv").append(bodyHtml);
											console.log(bodyHtml);
										});
						$(document).on("click", ".firstButton", function() {
						});
					});
	// 근무지역 버튼
	$(document)
			.ready(
					function() {
						$(".secondBtn")
								.on(
										"click",
										function(event) {
											var valueee = event.target.value
											bodyHtml = `<button class="btn btn-outline-info waves-effect waves-themed secondButton" `
													+ "value="
													+ valueee
													+ ` onclick="deleteDiv(event)">`
													+ event.target.value
													+ "&nbsp;  X" + "</button>";
											$("#mainDiv").append(bodyHtml);
											console.log(bodyHtml);
										});
						$(document).on("click", ".secondButton", function() {
						});
					});
	// 경력 버튼
	$(document)
			.ready(
					function() {
						$(".thirdBtn")
								.on(
										"click",
										function(event) {
											var valueee = event.target.value
											bodyHtml = `<button class="btn btn-outline-info waves-effect waves-themed thirdButton" `
													+ "value="
													+ valueee
													+ ` onclick="deleteDiv(event)">`
													+ event.target.value
													+ "&nbsp;  X" + "</button>";
											$("#mainDiv").append(bodyHtml);
											console.log(bodyHtml);
										});
						$(document).on("click", ".thirdButton", function() {
						});
					});
	// 학력 버튼
	$(document)
			.ready(
					function() {
						$(".fourthBtn")
								.on(
										"click",
										function(event) {
											var valueee = event.target.value
											bodyHtml = `<button class="btn btn-outline-info waves-effect waves-themed fourthButton" `
													+ "value="
													+ valueee
													+ ` onclick="deleteDiv(event)">`
													+ event.target.value
													+ "&nbsp;  X" + "</button>";
											$("#mainDiv").append(bodyHtml);
											console.log(bodyHtml);
										});
						$(document).on("click", ".fourthButton", function() {
						});
					});
	// 회사규모 버튼
	$(document)
			.ready(
					function() {
						$(".fifthBtn")
								.on(
										"click",
										function(event) {
											var valueee = event.target.value
											bodyHtml = `<button class="btn btn-outline-info waves-effect waves-themed fifthButton" name="searchAll" `
													+ "value="
													+ valueee
													+ ` onclick="deleteDiv(event)">`
													+ event.target.value
													+ "&nbsp;  X" + "</button>";
											$("#mainDiv").append(bodyHtml);
											console.log(bodyHtml);
										});
						$(document).on("click", ".fifthButton", function() {
						});
					});
	// 클릭 시 삭제
	function deleteDiv(e) {
		e.target.remove();
	}
</script>





