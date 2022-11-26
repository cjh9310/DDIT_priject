<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date">
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" />
</c:set>

<c:set var="activityMap" value="${activityMap }"/>
<c:set var="memberInfo" value="${activityMap.memberInfo }"/>
<c:set var="contestList" value="${activityMap.contestList }"/>
<c:set var="mentoringList" value="${activityMap.mentoringList }"/>

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

.word {
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
</style>

<main id="js-page-content" role="main" class="page-content">
<div class="row">
	<div class="col-xl-12 col-lg-12">
		<div class="row">
			<div class="col-lg-12 col-xl-12">
				<div id="panel-1" class="panel">
					<div class="panel-hdr">
						<h2>${memberInfo.name}님 참여 이력</h2>
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
													height="50"><font size="5">공모전 및 멘토링 참여 내역</font></th>
											</tr>
										</thead>
										<tr>
											<td class="border p-0" rowspan="5"
												style="width: 126px; height: 176px;"><img
												style="display: block; width: 100%; height: auto;"
												src="<%=request.getContextPath()%>/member/getPicture.do?id=${memberInfo.id}"
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
											<td colspan="3" class="border">${memberInfo.name}</td>
											<td colspan="3" class="border">${memberInfo.indBir}</td>
											<td colspan="3" class="border">${memberInfo.email}</td>
										</tr>
										<tr>
											<th colspan="3" width="50"
												class="thead-themed text-center border fw-700">연 락 처</th>
											<td colspan="6"
												class="thead-themed text-center border fw-700">주소</td>
										</tr>
										<tr>
											<th class="border">${memberInfo.tel}</th>
											<td class="border" colspan="8">${memberInfo.indAddr}</td>
										</tr>
									</table>
									<div
										class="card-header py-2 d-flex align-items-center flex-wrap">
										<div class="card-title">공모전</div>
									</div>
									<!-- 공모전 테이블 -->
									<table class="table">
										<thead>
											<tr>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700" style="width: 340px;">공모전 제목</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700" style="width: 145px;">공모전 카테고리</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700" style="width: 145px;">공모전 진행상황</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700" style="width: 110px;">공모전 시상</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700" style="width: 110px;">공모전 점수</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty contestList}">
												<tr>
													<td class="text-center fw-700" colspan="5">등록된 학력 정보가
														없습니다.<br /> <br />회원정보 관리에서 학력을 동록하세요.
													</td>
												</tr>
											</c:if>
											<c:forEach items="${contestList}" var="con">
												<tr>
													<td class="text-center"><div style="width: 340px;" class="word">${con.conTitle}</div></td>
													<td class="text-center"><div style="width: 145px;" class="word">${con.conField}</div></td>
													<td class="text-center">
														<c:if test="${con.actStatus == 0 }">
															<span class="badge badge-primary">진행중</span>
														</c:if>
														<c:if test="${con.actStatus == 1 }">
															<span class="badge badge-primary">중도포기</span>
														</c:if>
													</td>
													<td class="text-center word" style="width: 110px;">
														<c:if test="${empty con.actPrize}">
															<span class="badge badge-primary">심사중</span>
														</c:if>
														<c:if test="${!empty con.actPrize}">
															<span class="badge badge-primary">심사완료</span>
														</c:if>
													</td>
													<td class="text-center word" style="width: 110px;">${con.actScore }점</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div
										class="card-header py-2 d-flex align-items-center flex-wrap">
										<div class="card-title">멘토링</div>
									</div>
									<!-- 멘토링 테이블 -->
									<table class="table">
										<thead>
											<tr>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">멘토링 제목</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">멘토링 주최</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">진행률</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">기간</th>
												
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty mentoringList}">
												<tr>
													<td class="text-center fw-700" colspan="6">등록된 경력 정보가
														없습니다.<br /> <br />회원정보 관리에서 경력을 동록하세요.
													</td>
												</tr>
											</c:if>
											<c:forEach items="${mentoringList}" var="men">
												<tr style="cursor:pointer;" onclick="ContestDetail(${men.menNo});">
													<td class="text-center" style="width: 44%">${men.menTitle}</td>
													<td class="text-center" style="width: 16%">${men.coNm}</td>
													<td class="text-center" style="width: 11%">${men.menProgress}</td>
													<td class="text-center" style="width: 29%"><fmt:formatDate
															value="${men.menSdate }" pattern="yyyy-MM-dd" /> ~
															<fmt:formatDate
															value="${men.menEdate }" pattern="yyyy-MM-dd" /></td>
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
	</div>
</div>
</main>
<script
	src="<%=request.getContextPath()%>/resources/template/js/vendors.bundle.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/template/js/app.bundle.js"></script>

<script>
function ContestDetail(menNo) {
	const windowReatures = "width=700, height=1300";
	window.open('<%=request.getContextPath()%>/support/mentoring/detail.do?menNo='+menNo, 'ContestDetail', windowReatures);
}
</script>

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


