<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<c:set var="bookmarkMap" value="${bookmarkMap}" />
<c:set var="bookmarkList" value="${bookmarkMap.bookmarkList }" />

<c:set var="supRecMap" value="${supRecMap}" />
<c:set var="supRecList" value="${supRecMap.supRecList }" />

<c:set var="supOpenMap" value="${supOpenMap}" />
<c:set var="supOpenList" value="${supOpenMap.supOpenList }" />

<c:set var="advRecMap" value="${advRecMap}" />
<c:set var="advRecList" value="${advRecMap.advRecList }" />

<c:set var="advOpenMap" value="${advOpenMap}" />
<c:set var="advOpenList" value="${advOpenMap.advOpenList }" />


<style>
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
												<tr role="row" class="odd" data-toggle="modal"
													data-target="#default-example-modal-lg-center${vs.index}">
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
												<tr role="row" class="odd" data-toggle="modal"
													data-target="#default-example-modal-lg-center${vs.index}">
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
	<!-- 연습 -->
	<div id="panel-7" class="panel">
			<div class="panel-hdr">
				<h2>
					내가 지원한 공채 <span class="fw-300"></span>
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
															지원한 공채가 존재하지 않습니다.</span>
													</a>
												</div>
											</c:if>
											<c:forEach items="${advOpenList}" var="adv" varStatus="vs">
												<tr role="row" class="odd" data-toggle="modal"
													data-target="#default-example-modal-lg-center${vs.index}">
													<td class="dtr-control sorting_1 text-center" tabindex="0">
														지원일지 -<fmt:formatDate value="${adv.supDate}" pattern="yyyy-MM-dd" />
													</td>
													<td>${adv.openConm}</td>
													<td>${adv.openTitle}</td>
													<td>${adv.openRegion}</td>
													<td>${adv.openEdate}</td>
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


	<div class="col-lg-3 col-xl-3 order-lg-2 order-xl-3">
		<!-- add : -->
		<div class="card mb-g">
			<div class="row row-grid no-gutters">
				<div class="panel-hdr" style="width: 100%;">
					<h2>관심 기업</h2>
					<div class="panel-toolbar ml-2">
						<button type="button"
							onclick="window.open('<%=request.getContextPath()%>/futurelab/ai3/company/recommand.do','AI의 기업 추천','fullscreen')"
							class="btn btn-xs btn-info waves-effect waves-themed">
							AI에게 더 많은 기업 추천받기</button>
					</div>
				</div>
				<c:if test="${empty bookmarkList}">
					<div class="col-12">
						<a href="javascript:void(0);"
							class="text-center p-3 d-flex flex-column hover-highlight"> <span
							class="d-block text-truncate text-muted fs-xs mt-1">관심 등록된
								기업이 없습니다.</span>
						</a>
					</div>
				</c:if>
				<c:forEach items="${bookmarkList}" var="bookmark">
					<c:if test="${bookmark.bookType == 1}">
						<div class="col-4">
							<a href="javascript:void(0);"
								class="text-center p-3 d-flex flex-column hover-highlight">
								<span class="profile-image"
								style="width:100%; background-size:contain; background-repeat:no-repeat;
								       background-position:center center; background-image: url('${bookmark.coLogo}');"></span>
								<span class="d-block text-truncate text-muted fs-xs mt-1">${bookmark.coName}</span>
							</a>
						</div>
					</c:if>
				</c:forEach>
				<div class="col-12">
					<div class="p-3 text-center">
						<a href="javascript:void(0);" class="btn-link font-weight-bold">더
							보기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="card mb-g">
			<div class="row row-grid no-gutters">
				<div class="panel-hdr" style="width: 100%;">
					<h2>관심 채용공고</h2>
					<div class="panel-toolbar ml-2">
						<button type="button"
							onclick="window.open('<%=request.getContextPath()%>/futurelab/ai3/recruit/recommand.do','AI의 기업 추천','fullscreen')"
							class="btn btn-xs btn-info waves-effect waves-themed">
							AI에게 더 많은 채용공고 추천받기</button>
					</div>
				</div>
				<div class="p-3">
					<div class="custom-scroll">
						<div>
							<table
								class="table table-bordered table-hover table-striped w-100 dataTable no-footer dtr-inline"
								role="grid" aria-describedby="dt-basic-example_info"
								style="width: 1544px;">
								<tbody>
									<c:if test="${empty bookmarkList}">
										<div class="col-12">
											<a href="javascript:void(0);"
												class="text-center p-3 d-flex flex-column hover-highlight">
												<span class="d-block text-truncate text-muted fs-xs mt-1">관심
													등록된 채용공고가 없습니다.</span>
											</a>
										</div>
									</c:if>
									<c:forEach items="${bookmarkList}" var="bookmark">
										<c:if test="${bookmark.bookType == 0}">
											<tr id="1" role="row" class="odd">
												<td class="dtr-control"><span
													class="badge badge-success badge-pill">채용중</span>
													${bookmark.recCoName} - ${bookmark.recWantedtitle}</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- rating -->
	</div>
</div>
</main>





