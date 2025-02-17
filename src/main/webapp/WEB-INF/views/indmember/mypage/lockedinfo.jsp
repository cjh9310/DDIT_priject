<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date">
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" />
</c:set>

<c:set var="bookmarkMap" value="${bookmarkMap}" />
<c:set var="bookmarkList" value="${bookmarkMap.bookmarkList }" />

<style>
.panel-content {
	width: 100%;
	height: 990px;
	overflow: hidden;
}

.coBookmarkPanel {
	height: 310px;
	overflow: auto;
}

.recBookmarkPanel {
	height: 555px;
	overflow: auto;
}
</style>

<%-- <script>
setTimeout(function FaceUnLock() {
	$.ajax({
		url : '<%=request.getContextPath()%>/indmember/mypage/result',
			type : 'get',
			error : function(xhr, status) {
				console.log(xhr + status);
			},
			success : function(data) {
				console.log(data);
				face_rendering(data);
			}
		});
	}, 5000);
</script>
 --%>
<main id="js-page-content" role="main" class="page-content">
<div class="row">
	<div class="col-lg-6 col-xl-3 order-lg-1 order-xl-1">
		<!-- profile summary -->
		<div class="card mb-g rounded-top">
			<div class="row no-gutters row-grid">
				<div class="col-12">
					<div
						class="d-flex flex-column align-items-center justify-content-center p-4">
						<img src="<%=request.getContextPath()%>/member/getPicture.do?id=${loginUser.id}"
							onerror="this.onerror=null; this.src='<%=request.getContextPath() %>/resources/template/img/member_default.png';"
							class=" shadow-2 img-thumbnail" alt="회원사진" />
						<h5 class="mb-0 fw-700 text-center mt-3">
							${loginUser.name}<small class="text-muted mb-0">${loginUser.email}</small>
						</h5>
						<div class="mt-4 text-center demo">
							<a href="javascript:void(0);" class="fs-xl"
								style="color: #3b5998"> <i class="fab fa-facebook"></i>
							</a> <a href="javascript:void(0);" class="fs-xl"
								style="color: #db3236"> <i class="fab fa-google"></i>
							</a> <a href="javascript:void(0);" class="fs-xl"
								style="color: #0077B5"> <i class="fab fa-instagram"></i>
							</a> <a href="javascript:void(0);" class="fs-xl"
								style="color: #0063DC"> <i class="fab fa-github"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="col-6">
					<div class="text-center py-3">
						<h5 class="mb-0 fw-700">
							0 <small class="text-muted mb-0">공개중인 이력서</small>
						</h5>
					</div>
				</div>
				<div class="col-6">
					<div class="text-center py-3">
						<h5 class="mb-0 fw-700">
							0<small class="text-muted mb-0">진행중인 채용</small>
						</h5>
					</div>
				</div>
				<div class="col-6">
					<div class="text-center py-3">
						<h5 class="mb-0 fw-700">
							0 <small class="text-muted mb-0">진행중인 멘토링</small>
						</h5>
					</div>
				</div>
				<div class="col-6">
					<div class="text-center py-3">
						<h5 class="mb-0 fw-700">
							0<small class="text-muted mb-0">진행중인 공모전</small>
						</h5>
					</div>
				</div>
				<div class="col-12">
					<div class="p-3 text-center">
						<a href="javascript:void(0);" class="btn-link font-weight-bold">프로필사진
							변경하기</a>
					</div>
				</div>
			</div>
		</div>
		<!-- contacts -->
		<div class="card mb-2">
			<div class="card-body">
				<a href="javascript:void(0);"
					class="d-flex flex-row align-items-center">
					<div class='icon-stack display-3 flex-shrink-0'>
						<i
							class="fal fa-circle icon-stack-3x opacity-100 color-primary-400"></i>
						<i class="fas fa-user icon-stack-1x opacity-100 color-primary-500"></i>
					</div>
					<div class="ml-3">
						<strong>나의 개인정보 관리하기</strong> <br> Modifying my personal
						information
					</div>
				</a>
			</div>
		</div>
		<div class="card mb-2">
			<div class="card-body">
				<a href="javascript:void(0);"
					class="d-flex flex-row align-items-center">
					<div class='icon-stack display-3 flex-shrink-0'>
						<i
							class="fal fa-circle icon-stack-3x opacity-100 color-success-400"></i>
						<i
							class="fas fa-user-graduate icon-stack-1x opacity-100 color-success-500"></i>
					</div>
					<div class="ml-3">
						<strong>나의 학력 관리하기</strong> <br> Managing my educational
						background
					</div>
				</a>
			</div>
		</div>
		<div class="card mb-2">
			<div class="card-body">
				<a href="javascript:void(0);"
					class="d-flex flex-row align-items-center">
					<div class='icon-stack display-3 flex-shrink-0'>
						<i class="fal fa-circle icon-stack-3x opacity-100 color-info-400"></i>
						<i
							class="fas fa-handshake icon-stack-1x opacity-100 color-info-500"></i>
					</div>
					<div class="ml-3">
						<strong>나의 경력 관리하기</strong> <br> Managing my career
					</div>
				</a>
			</div>
		</div>
		<div class="card mb-g">
			<div class="card-body">
				<a href="javascript:void(0);"
					class="d-flex flex-row align-items-center">
					<div class='icon-stack display-3 flex-shrink-0'>
						<i
							class="fal fa-circle icon-stack-3x opacity-100 color-warning-400"></i>
						<i
							class="fas fa-file-certificate icon-stack-1x opacity-100 color-warning-500"></i>
					</div>
					<div class="ml-3">
						<strong>나의 자격증 관리하기</strong> <br> Managing my certificate
					</div>
				</a>
			</div>
		</div>
	</div>
	<div class="col-lg-12 col-xl-6 order-lg-3 order-xl-2">
		<div>
			<div id="panel-1" class="panel">
				<div class="panel-hdr">
					<h2>
						${loginUser.name } 회원님의 개인정보<span class="fw-300"></span>
					</h2>
				</div>
				<div class="panel-container show" id="auth_check">
					<div class="panel-content page-wrapper auth" id="faceSection">
						<div class="page-inner bg-brand-gradient">
							<div class="page-content-wrapper bg-transparent m-0">
								<div class="d-flex flex-1"
									style="background: url(<%=request.getContextPath()%>/resources/template/img/svg/pattern-1.svg) no-repeat center; background-size: cover;">
									<div
										class="container py-4 py-lg-5 my-lg-5 px-4 px-sm-0 text-white d-flex align-items-center justify-content-center">
										<div class="form-group">
											<h3>${loginUser.name}회원님,안전한 개인정보 열람을 위해 비밀번호를 입력해주세요.</h3>
											<p class="text-white opacity-50">Please enter your
												password for safe viewing</p>
											<div class="input-group input-group-lg">
												<div class="input-group-append">
													<button class="btn btn-success shadow-0"
														onclick="faceOn(); FaceUnLock();" type="button" id="button-addon5">
														얼굴인식 잠금해제
													</button>
												</div>
												<input type="password" id="password" value=""
													onkeyup="if(window.event.keyCode==13){rendering()}"
													class="form-control" placeholder="Password">
												<div class="input-group-append">
													<button class="btn btn-success shadow-0"
														onclick="rendering()" type="button" id="button-addon5">
														<i class="fal fa-user"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-lg-6 col-xl-3 order-lg-2 order-xl-3">
		<!-- add : -->
		<div class="card mb-g">
			<div class="row row-grid no-gutters">
				<div class="panel-hdr" style="width: 100%;">
					<h2>관심 기업</h2>
					<div class="panel-toolbar ml-2">
						<button type="button"
							onclick="window.open('<%=request.getContextPath()%>/futurelab/ai3/company/recommand.do','OpenWindow','height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes')"
							class="btn btn-xs btn-info waves-effect waves-themed">
							AI에게 기업 추천받기</button>
					</div>
				</div>
				<div class="custom-scroll coBookmarkPanel w-100">
					<div class="p-2 row">
						<c:forEach items="${bookmarkList}" var="bookmark">
							<c:if test="${bookmark.bookType == 1}">
								<div class="col-4">
									<a data-toggle="dropdown"
										class="text-center p-3 d-flex flex-column hover-highlight">
										<span class="profile-image w-100">
											<img id="image" style="display:block; width:100%; height:auto;"
												src="${bookmark.coLogo}"
												onerror="this.onerror=null; this.src='<%=request.getContextPath()%>/resources/template/img/strength_log4job.png';"
												alt="일반채용기업" />
										</span>
										<span class="d-block text-truncate text-muted fs-xs mt-1">${bookmark.coName}</span>
										<div class="dropdown-menu">
											<a class="dropdown-item" onclick="" >
												기업정보
											</a>
											<div class="dropdown-multilevel">
												<div class="dropdown-item">공고 리스트</div>
												<div class="dropdown-menu">
													<a href="javascript:void(0);" type="button" class="dropdown-item">채용공고</a>
													<a href="javascript:void(0);" type="button" class="dropdown-item">채용공고</a>
													<a href="javascript:void(0);" type="button" class="dropdown-item">채용공고</a>
												</div>
											</div>
										</div>
									</a>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
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
							onclick="window.open('<%=request.getContextPath()%>/futurelab/ai3/recruit/recommand.do','OpenWindow','height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes')"
							class="btn btn-xs btn-info waves-effect waves-themed">
							AI에게 채용공고 추천받기</button>
					</div>
				</div>
				<div class="w-100">
					<div class="custom-scroll recBookmarkPanel w-100">
						<div class="p-2">
							<table
								class="table table-bordered table-hover table-striped w-100 dataTable no-footer dtr-inline"
								role="grid" aria-describedby="dt-basic-example_info"
								style="width: 1544px;">
								<tbody>
									<c:forEach items="${bookmarkList}" var="bookmark">
										<c:if test="${bookmark.bookType == 0}">
											<tr id="1" role="row" class="odd" style="cursor:pointer;">
												<td class="dtr-control"><span
													class="badge badge-success badge-pill">채용중</span>
													<a data-toggle="dropdown">${bookmark.recCoName} - ${bookmark.recWantedtitle}
														<div class="dropdown-menu">
															<a class="dropdown-item" onclick="">즐겨찾기 해제 </a> <a
																class="dropdown-item"
																onclick="location.href='<%=request.getContextPath()%>/recruit/detail.do?recWantedno=${bookmark.recWantedno}'">
																채용공고 보러가기 </a>
														</div>
													</a>
												</td>
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
<%@ include file="/WEB-INF/views/indmember/indmember_js.jsp"%>
