<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 

<style>
.recruit-content {
	width: 100%;
	height: 490px;
	overflow: auto;
	padding: 30px 160px 30px 160px;
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

td { height: 80px; }
</style>

<main id="js-page-content" role="main" class="page-content">
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
					</h2></td>
				</tr>
				<tr>
					<td colspan="8" style="width: 1400px;">
						<h2 style="margin: 0px;">${recruit.coName}-
							${recruit.recWantedtitle}</h2>
					</h2></td>
				</tr>
			</table>
			<div class="panel-toolbar ml-2">
			<%-- <c:choose>
				<c:when test="${recruit.recReceiptclosedt != '채용시까지'}">
					<fmt:parseDate var="strRecReceiptclosedt" value="${recruit.recReceiptclosedt}" pattern="yyyyMMdd" />
					<fmt:formatDate var="recReceiptclosedt" value="${strRecReceiptclosedt}" pattern="yyyy-MM-dd" />
				</c:when>
				<c:when test="${recruit.recReceiptclosedt == '채용시까지'}">
					<c:set var="recReceiptclosedt" value="${recruit.recReceiptclosedt}" />
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${recReceiptclosedt != '채용시까지' and recReceiptclosedt < today}">
					<button type="button" 
						class="btn btn-lg btn-outline-danger waves-effect waves-themed">
						이미 종료된 채용공고입니다.<span class="fas fa-engine-warning ml-1"></span>
					</button>
				</c:when>
				<c:when test="${recReceiptclosedt == '채용시까지' or recReceiptclosedt >= today}">
					<button type="button" onclick="window.open('<%=request.getContextPath()%>/recruit/supply.do?recWantedno=${recruit.recWantedno}','OpenWindow','fullscreen')"
						class="btn btn-lg btn-outline-info waves-effect waves-themed">
						즉시 입사 지원하기<span class="fas fa-arrow-alt-right ml-1"></span>
					</button>
				</c:when>
			</c:choose> --%>
				<button type="button" onclick="window.open('<%=request.getContextPath()%>/recruit/supply.do?recWantedno=${recruit.recWantedno}','OpenWindow','height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes')"
						class="btn btn-lg btn-outline-info waves-effect waves-themed">
						즉시 입사 지원하기<span class="fas fa-arrow-alt-right ml-1"></span>
					</button>
			</div>
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
															class="badge border border-danger text-danger"> 나의 관심
															기업 </i>
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
												<a href="//${recruit.recHomepg}" target="_blank">
													<i class="badge border border-success text-success"> 
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
									<th style="width:900px;">직무내용</th>
									<th>등록일</th>
									<th>마감일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="width:900px;"><h2>${recruit.recJobcont}</h2></td>
									<td><h2><fmt:formatDate value="${recruit.recRegdt}"
											pattern="yyyy-MM-dd" /></h2></td>
									<%-- <td><h2><c:if test="${recruit.recReceiptclosedt ne '채용시까지'}">
											<fmt:parseDate var="dateString"
												value="${recruit.recReceiptclosedt}" pattern="yyyyMMdd" />
											<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd" />
										</c:if> <c:if test="${recruit.recReceiptclosedt eq '채용시까지'}">
											${recReceiptclosedt}
										</c:if>
									</h2></td> --%>
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
</main>



