<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<c:set var="talentList" value="${dataMap.talentList}" />
<c:set var="talent" value="${talent }" />
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date">
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" />
</c:set>


<style>
.custom-scroll {
	width: 100%;
	height: 690px;
	overflow: auto;
}

.talent-search {
	width: 100%;
	height: 250px;
}

.search-panel {
	height: 250px;
}

.search-bar {
	height: 40px;
}

.talent_card {
	display: block;
}

.card-footer {
	height: 24px;
}

.card-title {
	width: 234px;
	height: 19.5px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.card-text {
	width: 234px;
	height: 19.5px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>

<main id="js-page-content" role="main" class="page-content">
<div class="card mb-g">
	<div class="talent-search panel-conteiner">
		<div class="row w-100 p-0 m-0 h-100">
			<div class="col-xl-1 p-2 m-0 row" style="background-size: cover;">
				<img
					src="<%=request.getContextPath()%>/resources/template/img/talent_degail_logo.png"
					alt="인재 상세검색" style="display: block; height: 100%; width: auto;" />
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
						class="search-scroll custom-scrollbar form-control firstBtn">
						<option class="fw-900" style="font-size: 1.0em;" value="서구">대전 서구</option>
						<option class="fw-900" style="font-size: 1.0em;" value="중구">대전 중구</option>
						<option class="fw-900" style="font-size: 1.0em;" value="유성구">대전 유성구</option>
						<option class="fw-900" style="font-size: 1.0em;" value="대덕구">대전 대덕구</option>
						<option class="fw-900" style="font-size: 1.0em;" value="동구">대전 동구</option>
					</select>
				</div>
				<div class="search-panel col-xl-2 col-md-1 p-2">
					<select style="height: 234px;" multiple=""
						class="search-scroll custom-scrollbar form-control firstBtn">
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
						class="search-scroll custom-scrollbar form-control firstBtn">
						<option class="fw-900" style="font-size: 1.0em;" value="학력무관">학력무관</option>
						<option class="fw-900" style="font-size: 1.0em;" value="대졸(4년)">대졸(4년)</option>
						<option class="fw-900" style="font-size: 1.0em;" value="대졸(2~3년)">대졸(2~3년)</option>
						<option class="fw-900" style="font-size: 1.0em;" value="고졸">고졸</option>
						<option class="fw-900" style="font-size: 1.0em;" value="대학원">대학원</option>
					</select>
				</div>
				<div class="search-panel col-xl-2 p-2">
					<select style="height: 234px;" multiple=""
						class="search-scroll custom-scrollbar form-control firstBtn">
						<option class="fw-900" style="font-size: 1.0em;" value="대기업">대기업</option>
						<option class="fw-900" style="font-size: 1.0em;" value="중견기업">중견기업</option>
						<option class="fw-900" style="font-size: 1.0em;" value="중소기업">중소기업</option>
						<option class="fw-900" style="font-size: 1.0em;" value="강소기업">강소기업</option>
						<option class="fw-900" style="font-size: 1.0em;" value="기타">기타</option>
					</select>
				</div>
				<div class="col-xl-1 p-2 m-0 row" style="background-size: cover;">
					<img
						src="<%=request.getContextPath()%>/resources/template/img/talent_popular.png"
						alt="인기 인재" style="display: block; height: 100%; width: auto;" />
				</div>
			</div>
			<div class="col-xl-4 p-0 m-0 row border">
				<div id="carouselExampleInterval" style="padding: 0px;"
					class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<c:forEach items="${talentList}" var="talent" varStatus="status">
							<c:choose>
								<c:when test="${status.first}">
									<div class="carousel-item active" data-interval="2000">
								</c:when>
								<c:otherwise>
									<div class="carousel-item" data-interval="2000">
								</c:otherwise>
							</c:choose>
							<div class="card talent_card border shadow-0 mb-g shadow-sm-hover"
									data-filter-tags="sesha gray">
									<div
										class="card-body border-faded border-top-0 border-left-0 border-right-0 rounded-top">
										<div class="d-flex flex-row align-items-center">
											<span class="rounded-circle profile-image d-block"> 
											<img
												src="<%=request.getContextPath() %>/member/getPicture.do?id=${talent.id}"
												onerror="this.onerror=null; this.src='<%=request.getContextPath() %>/resources/template/img/member_default.png';"
												alt="회원사진"
												class="profile-image rounded-circle" alt="회원사진" />
											</span>
											<div class="info-card-text flex-1" style="margin-left: 15px;">
												<a href="javascript:void(0);" style="z-index: 1;"
													class="fs-xl text-truncate text-truncate-lg text-info"
													data-toggle="dropdown" aria-expanded="false"
													data-filter-tags="${talent.name}">${talent.name} <i
													class="fal fa-angle-down d-inline-block ml-1 fs-md"></i>
												</a>
												<div class="dropdown-menu" style="z-index: 1;"> 
													<a class="dropdown-item" 
													   onclick="talentDetail('${talent.id}')"
													   data-toggle="modal"
													   data-target="#default-example-modal-lg-center-${talent.id}" >인재 상세보기</a> 
													<div class="dropdown-multilevel">
                                                    <div class="dropdown-item">채용 권유하기
                                                    </div>
                                                    <div class="dropdown-menu">
                                                    <c:if test="${openRecList ne null }">
                                                    <c:forEach items="${openRecList }" var="openRecList">
                                                        <a href="javascript:void(0);"
                                                           type="button"
                                                           onclick="openAdviceRegist('${talent.id}','${openRecList.openSeqno}','${loginUser.id }')"
                                                           class="dropdown-item ${openRecList.openSeqno}"
                                                           data-toggle="modal">${openRecList.openTitle}</a>
                                                    </c:forEach>
                                                    </c:if> 
                                                    <c:if test="${recruitList ne null}">
                                                    <c:forEach items="${recruitList }" var="recruit">
                                                        <a href="javascript:void(0);"
                                                           type="button"
                                                           onclick="recruitAdviceRegist('${talent.id}','${recruit.recWantedno}','${loginUser.id }','${recruit.recWantedtitle}')"
                                                           class="dropdown-item ${recruit.recWantedno}"
                                                           data-toggle="modal">${recruit.recWantedtitle}</a>
                                                    </c:forEach>
                                                    </c:if>
                                                    </div>
                                                </div>
												</div>
											</div>
											<div
												class='icon-stack display-3 flex-shrink-0 panel-toolbar ml-2'>
												<c:choose>
													<c:when test="${talent.talBookmark != null}">
														<button id="${talent.id}" class="bookMark_btn"
															style="background-color: transparent; border: 0px;"
															type="button" value="${talent.talBookmark}">
															<i name="talremove"
																class="fas fa-star icon-stack-1x opacity-100 color-warning-500"></i>
														</button>
													</c:when>
													<c:when test="${talent.talBookmark == null}">
														<button name="talregist" id="${talent.id}"
															class="bookMark_btn"
															style="background-color: transparent; border: 0px;"
															type="button" value="${talent.talBookmark}">
															<i name="talregist"
																class="far fa-star icon-stack-1x opacity-100 color-warning-500"></i>
														</button>
													</c:when>
												</c:choose>
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
												class="fas fa-user-graduate text-muted mr-2"></i>최종학력 : ${talent.indFedu}
											</a> 
											<a class="mt-1 d-block fs-sm fw-400 text-dark"> <i
												class="fas fa-birthday-cake text-muted mr-2"></i>생년월일 : ${talent.indBir}
											</a> 
											<a href="mailto:${talent.email}"
												class="mt-1 d-block fs-sm fw-400 text-dark"> <i
												class="fas fa-mail-bulk text-muted mr-2"></i>이메일 : ${talent.email}
											</a>
											<div class="d-flex flex-row" style="margin-top:10px;">
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
					</c:forEach>
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
			id="accordion-talent_filter" placeholder="원하는 인재 정보를 다양한 키워드로 검색해보세요" />
		<div class="input-group-append">
			<div class="card" style="width: 400px;"></div>
			<button class="btn btn-outline-default waves-effect waves-themed"
				type="button" id="inputGroupFileAddon04">검색</button>
			<button class="btn btn-outline-default waves-effect waves-themed"
				type="button" id="inputGroupFileAddon04">AI에게 인재 추천받기</button>
		</div>
	</div>
</div>
<div class="card mb-g p-0">
	<div class="card-body p-0">
		<div class="custom-scroll">
			<div class="dataload-scroll panel-content" id="talent" name="card">
				<div class="row" id="accordion-talent" name="talent" 
					style="padding: 24px;" id="openAdvRecForm">
					<c:forEach items="${talentList}" var="talent">
						<c:set var="openRecList" value="${dataMap2.openRecList}" />
						<c:set var="recruitList" value="${dataMap3.recruitList }"/>
						<div class="panel-content card-wrapper col-2" style="margin: 0px;">
							<div class="card-deck">
								<div class="card talent_card border shadow-0 mb-g shadow-sm-hover"
									data-filter-tags="sesha gray">
									<div
										class="card-body border-faded border-top-0 border-left-0 border-right-0 rounded-top">
										<div class="d-flex flex-row align-items-center">
											<span class="rounded-circle profile-image d-block"> 
											<img
												src="<%=request.getContextPath() %>/member/getPicture.do?id=${talent.id}"
												onerror="this.onerror=null; this.src='<%=request.getContextPath() %>/resources/template/img/member_default.png';"
												alt="회원사진"
												class="profile-image rounded-circle" alt="회원사진" />
											</span>
											<div class="info-card-text flex-1" style="margin-left: 15px;">
												<a href="javascript:void(0);" style="z-index: 1;"
													class="fs-xl text-truncate text-truncate-lg text-info"
													data-toggle="dropdown" aria-expanded="false"
													data-filter-tags="${talent.name}">${talent.name} <i
													class="fal fa-angle-down d-inline-block ml-1 fs-md"></i>
												</a>
												<div class="dropdown-menu" style="z-index: 1;"> 
													<a class="dropdown-item" 
													   onclick="talentDetail('${talent.id}')"
													   data-toggle="modal"
													   data-target="#default-example-modal-lg-center-${talent.id}" >인재 상세보기</a> 
													<div class="dropdown-multilevel">
                                                    <div class="dropdown-item">채용 권유하기
                                                    </div>
                                                    <div class="dropdown-menu">
                                                    <c:if test="${openRecList ne null }">
                                                    <c:forEach items="${openRecList }" var="openRecList">
                                                        <a href="javascript:void(0);"
                                                           type="button"
                                                           onclick="openAdviceRegist('${talent.id}','${openRecList.openSeqno}','${loginUser.id }')"
                                                           class="dropdown-item ${openRecList.openSeqno}"
                                                           data-toggle="modal">${openRecList.openTitle}</a>
                                                    </c:forEach>
                                                    </c:if> 
                                                    <c:if test="${recruitList ne null}">
                                                    <c:forEach items="${recruitList }" var="recruit">
                                                        <a href="javascript:void(0);"
                                                           type="button"
                                                           onclick="recruitAdviceRegist('${talent.id}','${recruit.recWantedno}','${loginUser.id }','${recruit.recWantedtitle}')"
                                                           class="dropdown-item ${recruit.recWantedno}"
                                                           data-toggle="modal">${recruit.recWantedtitle}</a>
                                                    </c:forEach>
                                                    </c:if>
                                                    </div>
                                                </div>
												</div>
												<%-- <button type="button"
													class="btn btn-default waves-effect waves-themed"
													data-toggle="modal"
													data-target="#default-example-modal-lg-center-${talent.id}"
													onclick="talentDetail('${talent.id}')">
													Centered Large</button> --%>
											</div>
											<div
												class='icon-stack display-3 flex-shrink-0 panel-toolbar ml-2'>
												<c:choose>
													<c:when test="${talent.talBookmark != null}">
														<button id="${talent.id}" class="bookMark_btn"
															style="background-color: transparent; border: 0px;"
															type="button" value="${talent.talBookmark}">
															<i name="talremove"
																class="fas fa-star icon-stack-1x opacity-100 color-warning-500"></i>
														</button>
													</c:when>
													<c:when test="${talent.talBookmark == null}">
														<button name="talregist" id="${talent.id}"
															class="bookMark_btn"
															style="background-color: transparent; border: 0px;"
															type="button" value="${talent.talBookmark}">
															<i name="talregist"
																class="far fa-star icon-stack-1x opacity-100 color-warning-500"></i>
														</button>
													</c:when>
												</c:choose>
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
												class="fas fa-user-graduate text-muted mr-2"></i>최종학력 : ${talent.indFedu}
											</a> 
											<a class="mt-1 d-block fs-sm fw-400 text-dark"> <i
												class="fas fa-birthday-cake text-muted mr-2"></i>생년월일 : ${talent.indBir}
											</a> 
											<a href="mailto:${talent.email}"
												class="mt-1 d-block fs-sm fw-400 text-dark"> <i
												class="fas fa-mail-bulk text-muted mr-2"></i>이메일 : ${talent.email}
											</a>
											<div class="d-flex flex-row" style="margin-top:10px;">
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
							id="default-example-modal-lg-center-${talent.id}" tabindex="-1"
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
														<%-- <td class="border p-0" rowspan="5"
															style="width: 126px; height: 176px;"><img
															style="display: block; width: 100%; height: auto;"
															src="<%=request.getContextPath()%>/member/getPicture.do?id=${talent.id}"
															onerror="this.onerror=null; this.src='<%=request.getContextPath() %>/resources/template/img/member_default.png';"
															alt="증명사진" /></td> --%>
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
														<td colspan="3" class="border">${talent.name}</td>
														<td colspan="3" class="border">${talent.indBir}</td>
														<td colspan="3" class="border">${talent.email}</td>
													</tr>
													<tr>
														<th colspan="3" width="50"
															class="thead-themed text-center border fw-700">연 락 처</th>
														<td colspan="6"
															class="thead-themed text-center border fw-700">주소</td>
													</tr>
													<tr>
														<th class="border">${talent.tel}</th>
														<td class="border" colspan="8">${talent.indAddr}</td>
													</tr>
												</table>
												
												<div
													class="card-header py-2 d-flex align-items-center flex-wrap">
													<div class="card-title">학력</div>
												</div>
												<table class="table" id="${talent.id}-edu-section">
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
												<table class="table" id="${talent.id}-crr-section">
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
																<td class="text-center fw-700" colspan="6">
																등록된 경력 정보가 없습니다.
																</td>
															</tr>
														</c:if>
													</tbody>
												</table>
													<div
														class="card-header py-2 d-flex align-items-center flex-wrap">
														<div class="card-title">자격증</div>
													</div>
													<table class="table" id="${talent.id}-cer-section">
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
															<c:if test="${empty cerList}">
															<tr>
																<td class="text-center fw-700" colspan="6">
																등록된 자격증 정보가 없습니다.
																</td>
															</tr>
														</c:if>
														</tbody>
													</table>
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
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
function openAdviceRegist(p_indId, p_openSeqno, p_coId) {
	$.ajax({
		url : '<%=request.getContextPath()%>/talent/openAdviceRegist',
		type : 'POST',
		data : {'indId' : p_indId, 'toId':p_indId,'openSeqno' : p_openSeqno ,'fromId' : p_coId},
		success : function(result) {
			Swal.fire({
				target: document.getElementById('counselModal'),
                icon: 'success',
				title: "권유가 완료되었습니다.",
				text: "",
                type: "success",
                showCancelButton: false,
                confirmButtonText: "OK"
    		}).then(function(result){
			 
				window.location.replace(location.href);
    		});

      },

		error : function(request, status, error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   }
    });     
}
function recruitAdviceRegist(p_indId, p_recWantedno, p_coId, p_recWantedtitle) {
	$.ajax({
		url : '<%=request.getContextPath()%>/talent/recruitAdviceRegist',
		type : 'POST',
		data : {'indId' : p_indId, 'toId':p_indId,'recWantedno' : p_recWantedno ,'fromId' : p_coId, 'recWantedtitle' : p_recWantedtitle},
		success : function(result) {
			Swal.fire({
				target: document.getElementById('counselModal'),
                icon: 'success',
				title: "권유가 완료되었습니다.",
				text: "",
                type: "success",
                showCancelButton: false,
                confirmButtonText: "OK"
    		}).then(function(result){
			 
				window.location.replace(location.href);
    		});
		},
		error : function(request, status, error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
};

</script>



<%@ include file="/WEB-INF/views/talent/talent_js.jsp"%>
