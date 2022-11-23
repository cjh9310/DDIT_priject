<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date">
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" />
</c:set>

<c:set var="resumeMap" value="${resumeMap}" />
<c:set var="supInfo" value="${resumeMap.supInfo}" />
<c:set var="eduList" value="${resumeMap.eduList}" />
<c:set var="crrList" value="${resumeMap.crrList}" />
<c:set var="cerList" value="${resumeMap.cerList}" />
<c:set var="letList" value="${resumeMap.letList}" />
<style>
.recruit-content {
	width: 100%;
	height: 490px;
	overflow: auto;
	padding: 30px 80px 30px 80px;
}

.recruit-coinfo {
	width: 100%;
	height: 370px;
}

.search-panel {
	height: 250px;
}

.search-bar {
	height: 40px;
}

.rounded-top {
	margin-bottom: 30px;
}

.recruit-head {
	width: 100%;
	height: 80px;
}

.panel-content {
	width: 100%;
	height: 431px;
}

.resume-area {
	width: 100%;
	height: 965px;
}

.detailForm_load {
	cursor: pointer;
}
</style>

<main id="js-page-content" role="main" class="page-content">
<div class="row">
	<div class="col-xl-6 col-lg-6">
		<div class="card mb-g">
			<div class="recruit-head panel-conteiner">
				<div class="row w-100 p-0 m-0 h-100">
					<table>
						<tr>
							<td colspan="1" rowspan="3"
								style="width: 45px; padding-right: 16px;">
								<div class='icon-stack display-3 flex-shrink-0'
									style="margin-left: 10px;">
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
								</h2>
							</td>
						</tr>
						<tr>
							<td colspan="8" style="width: 1400px;">
								<h2 style="margin: 0px;">${recruit.coName}-
									${recruit.recWantedtitle}</h2>
								</h2>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<div class="card mb-g">
			<div class="recruit-coinfo panel-conteiner">
				<div class="panel-hdr w-100">
					<h2>기업정보</h2>
				</div>
				<div class="row w-100 p-0 m-0 h-100">
					<div class="custom-scroll recruit-content">
						<div class="panel-content" id="recruit" name="list"
							style="margin-right: 10px;">
							<div class="border bg-light rounded-top">
								<div class="table-responsive">
									<table class="table table-sm table-bordered table-hover m-0">
										<thead class="thead-themed text-center">
											<tr>
												<th>기업명</th>
												<th>업종</th>
												<th>지역</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td align="center" valign="middle"><h2>${recruit.coName}<c:choose>
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
													</h2></td>
												<td><h2>${recruit.recIndtpcdnm}</h2></td>
												<td><h2>${recruit.recRegion}</h2></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="border bg-light rounded-top">
								<div class="table-responsive">
									<table class="table table-sm table-bordered table-hover m-0">
										<thead class="thead-themed text-center">
											<tr>
												<th>자본금</th>
												<th>회사규모</th>
												<th>연매출액</th>
												<th>근로자수</th>
												<c:if test="${recruit.recHomepg != null}">
													<th>홈페이지</th>
												</c:if>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><h2>${recruit.recCapitalamt}</h2></td>
												<td><h2>${recruit.recBusisize}</h2></td>
												<td><h2>${recruit.recYrsalesamt}</h2></td>
												<td><h2>${recruit.recPersonal}</h2></td>
												<c:if test="${recruit.recHomepg != null}">
													<td><h2>
															<a href="//${recruit.recHomepg}" target="_blank"> <i
																class="badge border border-success text-success">
																	${recruit.coName} 홈페이지 방문하기</i>
															</a>
														</h2></td>
												</c:if>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="card mb-g p-0">
			<div class="panel-hdr w-100">
				<h2>채용공고 상세정보</h2>
			</div>
			<div class="card-body p-0">
				<div class="custom-scroll recruit-content">
					<div class="panel-content" id="recruit" name="list"
						style="margin-right: 10px;">
						<div class="border bg-light rounded-top">
							<div class="table-responsive">
								<table class="table table-sm table-bordered table-hover m-0">
									<thead class="thead-themed text-center">
										<tr>
											<th style="width: 900px;">직무내용</th>
											<th>등록일</th>
											<th>마감일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="width: 900px;"><h2>${recruit.recJobcont}</h2></td>
											<td><h2>
													<fmt:formatDate value="${recruit.recRegdt}"
														pattern="yyyy-MM-dd" />
												</h2></td>
											<td><h2>
													<c:if test="${recruit.recReceiptclosedt ne '채용시까지'}">
														<fmt:parseDate var="dateString"
															value="${recruit.recReceiptclosedt}" pattern="yyyyMMdd" />
														<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd" />
													</c:if>
													<c:if test="${recruit.recReceiptclosedt eq '채용시까지'}">
											${recruit.recReceiptclosedt}
										</c:if>
												</h2></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="border bg-light rounded-top">
							<div class="table-responsive">
								<table class="table table-sm table-bordered table-hover m-0">
									<thead class="thead-themed text-center">
										<tr>
											<th>경력조건</th>
											<th>학력</th>
											<th>모집인원</th>
											<th>모집집종</th>
											<th>근무예정지</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><h2>${recruit.recEntertpnm}</h2></td>
											<td><h2>${recruit.recMinedubg}</h2></td>
											<td><h2>${recruit.recCollectpsncnt}명</h2></td>
											<td><h2>${recruit.recJobsnm}</h2></td>
											<td><h2>${recruit.recRegion}</h2></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="border bg-light rounded-top">
							<div class="table-responsive">
								<table class="table table-sm table-bordered table-hover m-0">
									<thead class="thead-themed text-center">
										<tr>
											<th>임금조건</th>
											<th>근무시간 / 근무형태</th>
											<th>사회보험</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${recruit.recSaltpnm}</td>
											<td>${recruit.recWorkdayworkhrcont}</td>
											<td>${recruit.recFourins}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-6 col-lg-6">
		<div class="row">
			<div class="col-lg-12 col-xl-12">
				<div id="panel-1" class="panel">
					<div class="panel-hdr">
						<h2>지원 당시 이력서</h2>
						<div class="btn-group" id="js-demo-nesting" role="group"
							aria-label="Button group with nested dropdown">
							<button type="button"
								class="savePdf btn btn-xs btn-info waves-effect waves-themed">PDF로
								다운로드</button>
						</div>
					</div>
					<div>
						<div class="col-xl-12 panel resume-area" style="padding: 0px;">
							<div class="custom-scroll">
								<div class="p-3" id="resume-area">
									<table class="table text-center" width="800">
										<thead>
											<tr>
												<th class="text-center border-top-0 fw-700" colspan="9"
													height="50"><font size="5">이 력 서</font></th>
											</tr>
										</thead>
										<tr>
											<td class="border p-0" rowspan="5"
												style="width: 126px; height: 176px;"><img
												style="display: block; width: 100%; height: auto;"
												src="<%=request.getContextPath()%>/member/getPicture.do?id=${supInfo.indId}"
												onerror="this.onerror=null; this.src='<%=request.getContextPath() %>/resources/template/img/member_default.png';"
												alt="증명사진" /></td>
										</tr>
										<tr>
											<th colspan="3"
												class="thead-themed text-center border fw-700">성 명</th>
											<th colspan="3"
												class="thead-themed text-center border fw-700">생 년 월 일</th>
											<th colspan="3" width="80"
												class="thead-themed text-center border fw-700">E-mail</th>
										</tr>
										<tr>
											<td colspan="3" class="border">${supInfo.supresName}</td>
											<td colspan="3" class="border">${supInfo.supresBir}</td>
											<td colspan="3" class="border">${supInfo.supresEmail}</td>
										</tr>
										<tr>
											<th colspan="3" width="50"
												class="thead-themed text-center border fw-700">연 락 처</th>
											<td colspan="6"
												class="thead-themed text-center border fw-700">주소</td>
										</tr>
										<tr>
											<th class="border">${supInfo.supresTel}</th>
											<td class="border" colspan="8">${supInfo.supresAddr}</td>
										</tr>
									</table>
									<div
										class="card-header py-2 d-flex align-items-center flex-wrap">
										<div class="card-title">학력</div>
									</div>
									<table class="table">
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
													<td class="text-center fw-700" colspan="5">등록된 학력 정보가
														없습니다.<br /> <br />회원정보 관리에서 학력을 동록하세요.
													</td>
												</tr>
											</c:if>
											<c:forEach items="${eduList}" var="edu">
												<tr>
													<td class="text-center">${edu.supeduDep}</td>
													<td class="text-center">${edu.supeduName}</td>
													<td class="text-center">${edu.supeduMajor}</td>
													<td class="text-center">${edu.supeduScore}</td>
													<td class="text-center">
														<c:if test="${edu.eduStatus == 0}">
															<span class="badge badge-primary">${edu.strStatus}</span>
														</c:if> 
														<c:if test="${edu.eduStatus == 1}">
															<span class="badge badge-info">${edu.strStatus}</span>
														</c:if> 
														<c:if test="${edu.eduStatus == 2}">
															<span class="badge badge-success">${edu.strStatus}</span>
														</c:if>
													</td>
												</tr>
											</c:forEach>
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
													<td class="text-center fw-700" colspan="6">등록된 경력 정보가
														없습니다.<br /> <br />회원정보 관리에서 경력을 동록하세요.
													</td>
												</tr>
											</c:if>
											<c:forEach items="${crrList}" var="crr">
												<tr>
													<td class="text-center">${crr.supcrrSec}</td>
													<td class="text-center">${crr.supcrrCor}</td>
													<td class="text-center">${crr.supcrrJob}</td>
													<td class="text-center">${crr.supcrrPos}</td>
													<td class="text-center"><fmt:formatDate
															value="${crr.supcrrSdate }" pattern="yyyy-MM-dd" /></td>
													<td class="text-center"><fmt:formatDate
															value="${crr.supcrrEdate }" pattern="yyyy-MM-dd" /></td>
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
														<td class="text-center">${cer.supcerHost}</td>
														<td class="text-center">${cer.supcerName}</td>
														<td class="text-center"><fmt:formatDate
																value="${cer.supcerSdate }" pattern="yyyy-MM-dd" /></td>
														<td class="text-center"><c:if
																test="${cer.supcerEdate == null}">
																<span class="badge badge-info">유효기간없음</span>
															</c:if> <c:if test="${cer.supcerEdate < today}">
																<span class="badge badge-danger"> 갱신기간만료</span>
															</c:if> <c:if test="${cer.supcerEdate > today}">
																<fmt:formatDate value="${cer.supcerEdate }"
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
										<c:forEach items="${letList}" var="let">
											<thead>
												<tr>
													<th colspan="6"
														class="text-center border-top-0 table-scale-border-bottom fw-700">${let.supletTitle}</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="text-left">${let.supletContent}</td>
												</tr>
											</tbody>
										</c:forEach>
									</table>
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
<script
	src="<%=request.getContextPath()%>/resources/template/js/vendors.bundle.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/template/js/app.bundle.js"></script>

<script>
	$("#resume_delete1").on("click", function() {
		bootbox.confirm({
			title : "정말로 삭제 하시겠습니까?",
			message : "삭제를 원하시면 예, 그렇지 않으면 아니오를 클릭하십시오.",
			buttons : {
				cancel : {
					label : ' 아니요'
				},
				confirm : {
					label : ' 예'
				}
			},
			callback : function(result) {
				console.log('This was logged in the callback: ' + result);
			}
		});
	});
	$("#resume_delete2").on("click", function() {
		bootbox.confirm({
			title : "정말로 삭제 하시겠습니까?",
			message : "삭제를 원하시면 예, 그렇지 않으면 아니오를 클릭하십시오.",
			buttons : {
				cancel : {
					label : ' 아니요'
				},
				confirm : {
					label : ' 예'
				}
			},
			callback : function(result) {
				console.log('This was logged in the callback: ' + result);
			}
		});
	});
	$("#resume_delete3").on("click", function() {
		bootbox.confirm({
			title : "정말로 삭제 하시겠습니까?",
			message : "삭제를 원하시면 예, 그렇지 않으면 아니오를 클릭하십시오.",
			buttons : {
				cancel : {
					label : ' 아니요'
				},
				confirm : {
					label : ' 예'
				}
			},
			callback : function(result) {
				console.log('This was logged in the callback: ' + result);
			}
		});
	});
	botton: [ {
		extend : 'pdfHtml5',
		text : 'PDF',
		titleAttr : 'Generate PDF',
		className : 'btn-outline-danger btn-sm mr-1'
	} ];
</script>
<script
	src="<%=request.getContextPath()%>/resources/template/js/html2canvas.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/template/js/jspdf.min.js"></script>
<script>
	$(document).ready(
			function() {
				$('.savePdf').click(
						function() { // pdf저장 button id
							const pdfArea = document
									.querySelector('#resume-area');
							pdfArea.style.height = pdfArea.scrollHeight + 'px';
							html2canvas(pdfArea).then(
									function(canvas) { //저장 영역 div id
										// 캔버스를 이미지로 변환
										var imgData = canvas
												.toDataURL('image/png');

										var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
										var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
										var imgHeight = canvas.height
												* imgWidth / canvas.width;
										var heightLeft = imgHeight;
										var margin = 10; // 출력 페이지 여백설정
										var doc = new jsPDF('p', 'mm');
										var position = 0;

										// 첫 페이지 출력
										doc.addImage(imgData, 'PNG', margin,
												position, imgWidth, imgHeight);
										heightLeft -= pageHeight;

										// 한 페이지 이상일 경우 루프 돌면서 출력
										while (heightLeft >= 20) {
											position = heightLeft - imgHeight;
											doc.addPage();
											doc.addImage(imgData, 'PNG', 0,
													position, imgWidth,
													imgHeight);
											heightLeft -= pageHeight;
										}

										// 파일 저장
										doc.save('file-name.pdf');
									});

						});

			});
</script>


