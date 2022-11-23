<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			<div class="col-xl-1 p-2 m-0 row" style="background-size: cover;">
				<img src="${openRec.openLogo}" class="card-img-top" alt="..."  style="display: block; height: 100%; width: auto;" />
			</div>
			<table>
				<tr>
					<td colspan="8" style="width: 1400px;">
						<h2 style="margin:0px 0px 0px 60px;">${openRec.openConm} - ${openRec.openTitle}</h2>
					</td>
				</tr>
			</table>
			<div class="panel-toolbar ml-2">
				<button type="button" onclick="window.open('<%=request.getContextPath()%>/openrec/supply.do?openSeqno=${openRec.openSeqno}','OpenWindow','fullscreen')"
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
										<th>지역</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td align="center" valign="middle"><h2>${openRec.openConm}
											<c:choose>
												<c:when test="${openRec.coBookmark != null}">
													<button class="bookMark_btn" id="${openRec.openConm}"
														value="${openRec.coBookmark}" type="button"
														style="background-color: transparent; border: 0px;">
														<i name="comremove"
															class="badge border border-danger text-danger"> 나의 관심
															기업 </i>
													</button>
												</c:when>
												<c:when test="${openRec.coBookmark == null}">
													<button class="bookMark_btn" id="${openRec.openConm}"
														value="${openRec.coBookmark}" type="button"
														style="background-color: transparent; border: 0px;">
														<i name="comregist"
															class="badge border border-info text-info"> 관심 기업
															등록하기 </i>
													</button>
												</c:when>
											</c:choose>
										</h2></td>
										<td><h2>${openRec.openRegion}</h2></td>
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
										<th>홈페이지</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><h2>${corporation.coContent}</h2></td>
										<td><h2>${corporation.coSummary}</h2></td>
										<td><h2>${corporation.coBusino}</h2></td>
										<td><h2>
											<a href="${corporation.coHomeurl}" target="_blank">
												<i class="badge border border-success text-success"> 
													${openRec.openConm} 홈페이지 방문하기</i>
											</a>
										</h2></td>
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
		<h2>공채 상세정보</h2>
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
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="width:900px;"><h2>${openRec.openContent}</h2></td>
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
									<th>근무예정지</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><h2>${openRec.openCarnm}</h2></td>
									<td><h2>${openRec.openEdunm}</h2></td>
									<td><h2>${openRec.openCnt}명</h2></td>
									<td><h2>${openRec.openRegion}</h2></td>
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
									<th>채용시작일</th>
									<th>채용마감일</th>
									<th>합격자발표일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><h2>${openRec.openSdate}</h2></td>
									<td><h2>${openRec.openEdate}</h2></td>
									<td><h2>${openRec.openAcptpsn}</h2></td>
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



