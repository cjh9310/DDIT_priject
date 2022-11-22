<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<c:set var="supRecMap" value="${supRecMap}" />
<c:set var="supRecList" value="${supRecMap.supRecList }" />

<c:set var="supOpenMap" value="${supOpenMap}" />
<c:set var="supOpenList" value="${supOpenMap.supOpenList }" />

<c:set var="advRecMap" value="${advRecMap}" />
<c:set var="advRecList" value="${advRecMap.advRecList }" />

<c:set var="advOpenMap" value="${advOpenMap}" />
<c:set var="advOpenList" value="${advOpenMap.advOpenList }" />


<style>

tr {
	cursor:pointer;
}

.custom-scroll {
	height: 522px;
	overflow: auto;
}

.panel-content {
	width: 100%;
	height: 455px;
	overflow: hidden;
}

.panel-conteiner {
	height: 100%;
}

.cardMargin {
	margin: 0px;
}

div {
	width: auto;
	height: 100%;
}
</style>

<main id="js-page-content" role="main" class="page-content">
<div class="row">
	<div class="col-lg-9 col-xl-9 order-lg-3 order-xl-2">
		<div id="panel-7" class="panel">
			<div class="panel-hdr">
				<h2>내가 지원한 채용공고</h2>
				<div class="panel-toolbar pr-3 align-self-end">
					<ul id="nav nav-tabs" class="nav nav-tabs border-bottom-0"
						role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tab_recruit_supplying" role="tab"
							aria-selected="true"> 진행중&nbsp;&nbsp;&nbsp; </a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tab_recruit_end" role="tab" aria-selected="false">
								종료&nbsp;&nbsp;&nbsp; </a></li>
					</ul>
				</div>
			</div>
			<div class="panel-content tab-content p-3">
				<div class="tab-pane fade show active" id="tab_recruit_supplying"
					role="tabpanel">
					<div class="row cardMargin">
						<div class="col-xl-12 panel" style="padding: 0px;">
							<div class="custom-scroll">
								<div>
									<table class="table table-hover table-striped w-100">
										<tbody>
											<c:if test="${empty supRecList}">
												<div class="col-12">
													<a href="javascript:void(0);"
														class="text-center p-3 d-flex flex-column hover-highlight">
														<span class="d-block text-truncate text-muted fs-xs mt-1">
															지원한 채용공고가 존재하지 않습니다.</span>
													</a>
												</div>
											</c:if>
											<c:forEach items="${supRecList}" var="supRec" varStatus="vs">
												<tr role="row" class="odd"
												onclick="window.open('<%=request.getContextPath()%>/indmember/mypage/recruit/supplyResume.do?supNo=${supRec.supNo}&recWantedno=${supRec.recWantedno}','OpenWindow','fullscreen')">
													<td class="dtr-control sorting_1 text-center" tabindex="0">
														지원일자 -<fmt:formatDate value="${supRec.supDate}" pattern="yyyy-MM-dd" />
													</td>
													<td>${supRec.coName}</td>
													<td>${supRec.recWantedtitle}</td>
													<td>${supRec.recRegion}</td>
													<td>${supRec.recReceiptclosedt}</td>
												</tr>
												<!--  모달창 시작 -->
												<div class="modal fade"
													id="default-example-modal-lg-center${vs.index}"
													tabindex="-1" role="dialog" aria-hidden="true"></div>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="tab_recruit_end" role="tabpanel">
					<div class="row cardMargin">
						<div class="col-xl-12 panel" style="padding: 0px;">
							<div class="custom-scroll">
								<div>
									<table class="table table-hover table-striped w-100">
										<tbody>
											<c:if test="${empty supRecList}">
												<div class="col-12">
													<a href="javascript:void(0);"
														class="text-center p-3 d-flex flex-column hover-highlight">
														<span class="d-block text-truncate text-muted fs-xs mt-1">
															지원한 채용공고가 존재하지 않습니다.</span>
													</a>
												</div>
											</c:if>
											<c:forEach items="${supRecList}" var="supRec" varStatus="vs">
												<tr role="row" class="odd"
												onclick="window.open('<%=request.getContextPath()%>/indmember/mypage/recruit/supplyResume.do?supNo=${supRec.supNo}&recWantedno=${supRec.recWantedno}','OpenWindow','fullscreen')">
													<td class="dtr-control sorting_1 text-center" tabindex="0">
														지원일자 -<fmt:formatDate value="${supRec.supDate}" pattern="yyyy-MM-dd" />
													</td>
													<td>${supRec.coName}</td>
													<td>${supRec.recWantedtitle}</td>
													<td>${supRec.recRegion}</td>
													<td>${supRec.recReceiptclosedt}</td>
												</tr>
												<!--  모달창 시작 -->
												<div class="modal fade"
													id="default-example-modal-lg-center${vs.index}"
													tabindex="-1" role="dialog" aria-hidden="true"></div>
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
		<div id="panel-7" class="panel">
			<div class="panel-hdr">
				<h2>
					내가 지원한 공채 <span class="fw-300"></span>
				</h2>
				<div class="panel-toolbar pr-3 align-self-end">
					<ul id="nav nav-tabs" class="nav nav-tabs border-bottom-0"
						role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tab_openrec" role="tab"
							aria-selected="true"> 진행중&nbsp;&nbsp;&nbsp; </a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tab_recruit" role="tab" aria-selected="false">
								종료&nbsp;&nbsp;&nbsp; </a></li>
					</ul>
				</div>
			</div>
			<div class="panel-content tab-content p-3">
				<div class="tab-pane fade show active" id="tab_openrec"
					role="tabpanel">
					<div class="row cardMargin">
						<div class="col-xl-12 panel" style="padding: 0px;">
							<div class="custom-scroll">
								<div>
									<table class="table table-hover table-striped w-100">
										<tbody>
											<c:if test="${empty supOpenList}">
												<div class="col-12">
													<a href="javascript:void(0);"
														class="text-center p-3 d-flex flex-column hover-highlight">
														<span class="d-block text-truncate text-muted fs-xs mt-1">
															지원한 공채가 존재하지 않습니다.</span>
													</a>
												</div>
											</c:if>
											<c:forEach items="${supOpenList}" var="open" varStatus="vs">
												<tr role="row" class="odd" data-toggle="modal"
													data-target="#default-example-modal-lg-center${vs.index}">
													<td class="dtr-control sorting_1 text-center" tabindex="0">
														지원일자 -<fmt:formatDate value="${open.supDate}" pattern="yyyy-MM-dd" />
													</td>
													<td>${open.openConm}</td>
													<td>${open.openTitle}</td>
													<td>${open.openRegion}</td>
													<td>${open.openEdate}</td>
													<%-- <td><fmt:formatDate value="${open.openSdate}"
															pattern="yyyy-MM-dd" /></td> --%>
												</tr>
												<!--  모달창 시작 -->
												<div class="modal fade"
													id="default-example-modal-lg-center${vs.index}"
													tabindex="-1" role="dialog" aria-hidden="true"></div>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade" id="tab_recruit" role="tabpanel">
					<div class="row cardMargin">
						<div class="col-xl-12 panel" style="padding: 0px;">
							<div class="custom-scroll">
								<div>
									<table class="table table-hover table-striped w-100">
										<tbody>
											<c:if test="${empty supOpenList}">
												<div class="col-12">
													<a href="javascript:void(0);"
														class="text-center p-3 d-flex flex-column hover-highlight">
														<span class="d-block text-truncate text-muted fs-xs mt-1">
															지원한 공채가 존재하지 않습니다.</span>
													</a>
												</div>
											</c:if>
											<c:forEach items="${supOpenList}" var="open" varStatus="vs">
												<tr role="row" class="odd" data-toggle="modal"
													data-target="#default-example-modal-lg-center${vs.index}">
													<td class="dtr-control sorting_1" tabindex="0">
														<fmt:formatDate value="${open.supDate}" pattern="yyyy-MM-dd" />
													</td>
													<td>${open.openConm}</td>
													<td>${open.openTitle}</td>
													<td>${open.openRegion}</td>
													<td>20${open.openEdate}</td>
													<%-- <td><fmt:formatDate value="${open.openSdate}"
															pattern="yyyy-MM-dd" /></td> --%>
												</tr>
												<!--  모달창 시작 -->
												<div class="modal fade"
													id="default-example-modal-lg-center${vs.index}"
													tabindex="-1" role="dialog" aria-hidden="true"></div>
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
	<div class="col-lg-3 col-xl-3">
		<div id="panel-7" class="panel">
			<div class="panel-hdr">
				<h2>
					지원 권유받은 채용공고 <span class="fw-300"></span>
				</h2>
				<div class="panel-toolbar pr-3 align-self-end">
					<ul id="nav nav-tabs" class="nav nav-tabs border-bottom-0"
						role="tablist">
					</ul>
				</div>
			</div>
			<div class="panel-content tab-content p-3">
				<div class="tab-pane fade show active" 
					role="tabpanel">
					<div class="row cardMargin">
						<div class="col-xl-12 panel" style="padding: 0px;">
							<div class="custom-scroll">
								<div>
									<table class="table table-hover table-striped w-100">
										<tbody>
											<c:if test="${empty advOpenList}">
												<div class="col-12">
													<a href="javascript:void(0);"
														class="text-center p-3 d-flex flex-column hover-highlight">
														<span class="d-block text-truncate text-muted fs-xs mt-1">
															지원 권유받은 채용공고가 존재하지 않습니다.</span>
													</a>
												</div>
											</c:if>
											<c:forEach items="${advOpenList}" var="adv" varStatus="vs">
												<tr role="row" class="odd" data-toggle="modal"
													data-target="#default-example-modal-lg-center${vs.index}">
													<td class="dtr-control sorting_1 text-center" tabindex="0">
														<fmt:formatDate value="${adv.supDate}" pattern="yyyy-MM-dd" />
													</td>
													<td>${adv.openConm}</td>
													<td>${adv.openTitle}</td>
													<td>${adv.openRegion}</td>
													<td>${adv.openEdate}</td>
													<td><fmt:formatDate value="${open.openSdate}"
															pattern="yyyy-MM-dd" /></td>
												</tr>
												<!--  모달창 시작 -->
												<div class="modal fade"
													id="default-example-modal-lg-center${vs.index}"
													tabindex="-1" role="dialog" aria-hidden="true"></div>
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
		<div id="panel-7" class="panel">
			<div class="panel-hdr">
				<h2>
					지원 권유받은 공채 <span class="fw-300"></span>
				</h2>
				<div class="panel-toolbar pr-3 align-self-end">
					<ul id="nav nav-tabs" class="nav nav-tabs border-bottom-0"
						role="tablist">
					</ul>
				</div>
			</div>
			<div class="panel-content tab-content p-3">
				<div class="tab-pane fade show active" 
					role="tabpanel">
					<div class="row cardMargin">
						<div class="col-xl-12 panel" style="padding: 0px;">
							<div class="custom-scroll">
								<div>
									<table class="table table-hover table-striped w-100">
										<tbody>
											<c:if test="${empty advOpenList}">
												<div class="col-12">
													<a href="javascript:void(0);"
														class="text-center p-3 d-flex flex-column hover-highlight">
														<span class="d-block text-truncate text-muted fs-xs mt-1">
															지원 권유받은 공채가 존재하지 않습니다.</span>
													</a>
												</div>
											</c:if>
											<c:forEach items="${advOpenList}" var="adv" varStatus="vs">
												<tr role="row" class="odd" data-toggle="modal"
													data-target="#default-example-modal-lg-center${vs.index}">
													<td class="dtr-control sorting_1 text-center" tabindex="0">
														<fmt:formatDate value="${adv.supDate}" pattern="yyyy-MM-dd" />
													</td>
													<td>${adv.openConm}</td>
													<td>${adv.openTitle}</td>
													<td>${adv.openRegion}</td>
													<td>${adv.openEdate}</td>
													<td><fmt:formatDate value="${open.openSdate}"
															pattern="yyyy-MM-dd" /></td>
												</tr>
												<!--  모달창 시작 -->
												<div class="modal fade"
													id="default-example-modal-lg-center${vs.index}"
													tabindex="-1" role="dialog" aria-hidden="true"></div>
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





