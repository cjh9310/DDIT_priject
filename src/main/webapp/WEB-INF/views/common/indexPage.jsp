<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%-- <c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="memberList" value="${memberMap.memberList }" />
<c:set var="boardList" value="${boardMap.boardList }" />
<c:set var="noticeList" value="${noticeMap.noticeList }" />
<c:set var="pdsList" value="${pdsMap.pdsList }" /> --%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Log4Job - 대전광역시 취업정보시스템</title>
<meta name="description" content="Basic Tables">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no, user-scalable=no, minimal-ui">
<!-- Call App Mode on ios devices -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- Remove Tap Highlight on Windows Phone IE -->
<meta name="msapplication-tap-highlight" content="no">
<!-- base css -->
<link id="vendorsbundle" rel="stylesheet" media="screen, print"
	href="<%=request.getContextPath()%>/resources/template/css/vendors.bundle.css">
<link id="appbundle" rel="stylesheet" media="screen, print"
	href="<%=request.getContextPath()%>/resources/template/css/app.bundle.css">
<!-- 테마 변경 -->
<link id="mytheme" rel="stylesheet" media="screen, print" href="">
<link id="myskin" rel="stylesheet" media="screen, print"
	href="<%=request.getContextPath()%>/resources/template/css/skins/skin-master.css">
<!-- Place favicon.ico in the root directory -->
<link rel="apple-touch-icon" sizes="180x180"
	href="<%=request.getContextPath()%>/resources/template/img/favicon/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="<%=request.getContextPath()%>/resources/template/img/favicon/favicon-32x32.png">
<link rel="mask-icon"
	href="<%=request.getContextPath()%>/resources/template/img/favicon/safari-pinned-tab.svg"
	color="#5bbad5">
<link rel="stylesheet" media="screen, print"
	href="<%=request.getContextPath()%>/resources/template/css/miscellaneous/reactions/reactions.css">
<link rel="stylesheet" media="screen, print"
	href="<%=request.getContextPath()%>/resources/template/css/miscellaneous/fullcalendar/fullcalendar.bundle.css">
<link rel="stylesheet" media="screen, print"
	href="<%=request.getContextPath()%>/resources/template/css/miscellaneous/jqvmap/jqvmap.bundle.css">
<link rel="stylesheet" media="screen, print"
	href="<%=request.getContextPath()%>/resources/template/css/datagrid/datatables/datatables.bundle.css">
<link rel="stylesheet" media="screen, print"
	href="<%=request.getContextPath()%>/resources/template/css/fa-solid.css">
<link rel="stylesheet" media="screen, print"
	href="<%=request.getContextPath()%>/resources/template/css/fa-brands.css">
<style>
h3 { margin:0px; }
.top_nab_li { margin-left: 30px; }
</style>
</head>
<!-- BEGIN Body -->
<body class="mod-bg-1 mod-nav-link" >
	<script>
		/**
		 *	This script should be placed right after the body tag for fast execution 
		 *	Note: the script is written in pure javascript and does not depend on thirdparty library
		 **/
		'use strict';
		
		var classHolder = document.getElementsByTagName("BODY")[0],
		/** 
		 * Load from localstorage
		 **/
		themeSettings = (localStorage.getItem('themeSettings')) ? JSON
				.parse(localStorage.getItem('themeSettings')) : {}, themeURL = themeSettings.themeURL
				|| '', themeOptions = themeSettings.themeOptions || '';
		/** 
		 * Load theme options
		 **/
		if (themeSettings.themeOptions) {
			classHolder.className = themeSettings.themeOptions;
			console.log("%c✔ Theme settings loaded", "color: #148f32");
		} else {
			console
					.log(
							"%c✔ Heads up! Theme settings is empty or does not exist, loading default settings...",
							"color: #ed1c24");
		}
		if (themeSettings.themeURL && !document.getElementById('mytheme')) {
			var cssfile = document.createElement('link');
			cssfile.id = 'mytheme';
			cssfile.rel = 'stylesheet';
			cssfile.href = themeURL;
			document.getElementsByTagName('head')[0].appendChild(cssfile);

		} else if (themeSettings.themeURL && document.getElementById('mytheme')) {
			document.getElementById('mytheme').href = themeSettings.themeURL;
		}
		/** 
		 * Save to localstorage 
		 **/
		var saveSettings = function() {
			themeSettings.themeOptions = String(classHolder.className).split(
					/[^\w-]+/).filter(function(item) {
				return /^(nav|header|footer|mod|display)-/i.test(item);
			}).join(' ');
			if (document.getElementById('mytheme')) {
				themeSettings.themeURL = document.getElementById('mytheme')
						.getAttribute("href");
			}
			;
			localStorage
					.setItem('themeSettings', JSON.stringify(themeSettings));
		}
		/** 
		 * Reset settings
		 **/
		var resetSettings = function() {
			localStorage.setItem("themeSettings", "");
		}
	</script>
	<!-- BEGIN Page Wrapper -->
	<header class="page-header" role="banner" style="padding: 0px;">
		<!-- DOC: mobile button appears during mobile width -->
		<div class="hidden-lg-up">
			<a href="#" class="header-btn btn press-scale-down"
				data-action="toggle" data-class="mobile-nav-on"> <i
				class="ni ni-menu"></i>
			</a>
		</div>

		<nav class="navbar navbar-expand-lg navbar-light bg-light"
			style="width: 100%; height: 100%">
			<div class="logo row" style="width: 263px;">
				<a href="<%=request.getContextPath()%>/index.do" style="width:100%;"
					class="page-logo-link press-scale-down d-flex align-items-center position-relative"> 
					<img src="<%=request.getContextPath()%>/resources/template/img/Log4Job_daejeon_logo.png"
						 alt="SmartAdmin WebApp" aria-roledescription="logo"
						 style="display:block; width:100%; height:auto;" />
				</a>
			</div>
			<div style="width:32px;">
			</div>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item dropdown top_nab_li"><a 
						class="nav-link " href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
                           <h3 class="fw-900 color-primary-900">채용정보</h3> 
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/recruit/list.do','M150000')">
								채용공고
							</a>
							<a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/recruit/empstats.do','M160000')">
								고용정보 통계 및 동향
							</a>
						</div></li>
					<li class="nav-item dropdown top_nab_li"><a
						class="nav-link" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">
							<h3 class="fw-900 color-primary-900">공채</h3>
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/openrec/calendar.do','M170000')">공채정보
								달력</a> <a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/openrec/list.do','M180000')">공개채용정보</a>
						</div></li>
					<sec:authorize access="hasAnyRole('ROLE_COUSER')">
					<li class="nav-item dropdown top_nab_li"><a
						class="nav-link" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 
						<h3 class="fw-900 color-primary-900">인재정보</h3> 
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/talent/list.do','M190000')">인재 리스트</a>
						</div></li>
					</sec:authorize>
					<li class="nav-item dropdown top_nab_li"><a
						class="nav-link" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 
						<h3 class="fw-900 color-primary-900">미래연구소</h3> 
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/futurelab/ai1/main.do','M200000')">
								AI의 명함 디자인</a> <a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/futurelab/ai2/main.do','M210000')">
								AI의 증명사진 복장 변환</a> <a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/futurelab/ai3/main.do','M220000')">
								AI의 다양한 추천 서비스</a>
						</div></li>
					<li class="nav-item dropdown top_nab_li"><a
						class="nav-link" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 
						<h3 class="fw-900 color-primary-900">연봉</h3> 
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/salary/list.do','M230000')">연봉
								리스트</a> <a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/salary/news.do','M240000')">연봉
								뉴스</a> <a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/salary/calculator.do','M250000')">연봉
								계산기</a>
						</div></li>
					<li class="nav-item dropdown top_nab_li"><a
						class="nav-link" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 
						<h3 class="fw-900 color-primary-900">취업지원</h3> 
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/support/counsel/main.do','M260000')">취업
								상담</a> 
							<a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/support/mentoring/list.do','M270000')">멘토링</a>
							<a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/support/contest/list.do','M280000')">공모전</a>
						</div></li>
					<li class="nav-item dropdown top_nab_li"><a
						class="nav-link" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 
						<h3 class="fw-900 color-primary-900">커뮤니티</h3> 
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/community/publicwork/list.do','M290000')">공공근로알림</a>
							<a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/community/faq/list.do','M300000')">자주
								묻는 질문(FAQ)</a> <a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/community/report/list.do','M310000')">신고
								게시판</a>
						</div></li>
					<li class="nav-item dropdown top_nab_li"><a
						class="nav-link" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 
						<h3 class="fw-900 color-primary-900">어르신을위한 채용정보</h3> 
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="javascript:goPage('<%=request.getContextPath()%>/senior/list.do','M320000')">시니어
								채용공고</a>
						</div></li>
				</ul>
			</div>
		</nav>

		<div class="ml-auto d-flex">
			<!-- 설정 -->
			<div class="hidden-sm-up">
				<a href="#" class="header-icon" data-action="toggle"
					data-class="mobile-search-on" data-focus="search-field"
					title="Search"> <i class="fal fa-search"></i>
				</a>
			</div>
			<!-- 설정 -->
			<div class="hidden-md-down">
				<a href="#" class="header-icon" data-toggle="modal"
					data-target=".js-modal-settings"> <i class="fal fa-cog"></i>
				</a>
			</div>
			<!-- 알림 -->
			<div>
				<a href="#" class="header-icon" data-toggle="dropdown" title="알림">
					<i class="fal fa-bell"></i> <span class="badge badge-icon" id="allimIcon" style="display : none"></span>
				</a>
				<div class="dropdown-menu dropdown-menu-animated dropdown-xl">
					<div
						class="dropdown-header bg-trans-gradient d-flex justify-content-center align-items-center rounded-top mb-2">
						<h4 class="m-0 text-center color-white">알림</h4>
					</div>
					<ul class="nav nav-tabs nav-tabs-clean" role="tablist">
						<li class="nav-item"><a
							class="nav-link px-4 fs-md js-waves-on fw-500" data-toggle="tab"
							href="#tab-messages" data-i18n="drpdwn.messages"></a></li>
					</ul>
					<div class="tab-content tab-notification">
						
						<div class="tab-pane nav-item" id="tab-messages" role="tabpanel">
							<div class="custom-scroll h-100">
								<ul class="allimList" style="padding-left:0px;">
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 알림 -->
			<!-- 마이페이지 -->
			<div>
				<a href="#" data-toggle="dropdown" title="마이페이지"
					class="header-icon d-flex align-items-center justify-content-center ml-2">
					<img
					src="<%=request.getContextPath() %>/member/getPicture.do?id=${loginUser.id }"
					onerror="this.onerror=null; this.src='<%=request.getContextPath() %>/resources/template/img/member_default.png';"
					alt="회원사진"
					class="rounded-circle profile-image" />
				</a>
				<div class="dropdown-menu dropdown-menu-animated dropdown-lg">
					<div
						class="dropdown-header bg-trans-gradient d-flex flex-row py-4 rounded-top">
						<div
							class="d-flex flex-row align-items-center mt-1 mb-1 color-white">
							<span class="mr-2"> <img
								src="<%=request.getContextPath() %>/member/getPicture.do?id=${loginUser.id }"
								onerror="this.onerror=null; this.src='<%=request.getContextPath() %>/resources/template/img/member_default.png';"
								alt="회원사진"
								class="profile-image">
							</span>
							<div class="info-card-text">
								<div class="fs-lg text-truncate text-truncate-lg">${loginUser.name }</div>
								<span class="text-truncate text-truncate-md opacity-80">${loginUser.email }</span>
							</div>
						</div>
					</div>
					<a class="dropdown-item fw-500 pt-3 pb-3" href="common/logout.do">
						<span data-i18n="drpdwn.page-logout">로그아웃</span> <span
						class="float-right fw-n">${loginUser.email }</span>
					</a>
				</div>
			</div>
			<!-- 마이페이지 -->
		</div>
	</header>
	<div class="page-wrapper">
		<div class="page-inner">
			<!-- BEGIN Left Aside -->
			<aside class="page-sidebar">
				<!-- BEGIN PRIMARY NAVIGATION -->
				<nav id="js-primary-nav" class="primary-nav" role="navigation">
					<div class="nav-filter">
						<div class="position-relative">
							<input type="text" id="nav_filter_input" placeholder="메뉴 검색"
								class="form-control" tabindex="0"> <a href="#"
								onclick="return false;"
								class="btn-primary btn-search-close js-waves-off"
								data-action="toggle" data-class="list-filter-active"
								data-target=".page-sidebar"> <i class="fal fa-chevron-up"></i>
							</a>
						</div>
					</div>
					<div class="row" style="margin:15px;">
						<img style="height: auto; width:100px;"
							src="<%=request.getContextPath() %>/member/getPicture.do?id=${loginUser.id }"
							onerror="this.onerror=null; this.src='<%=request.getContextPath() %>/resources/template/img/member_default.png';"
							class="" alt="회원사진">
						<div style="width:140px; padding:35px 0px 35px 20px;">
							<a href="#" class="d-flex align-items-center text-white"> 
							<span class="text-truncate text-truncate-sm d-inline-block">
								<a style="margin-bottom:5px;" class="d-block">&nbsp;&nbsp;${loginUser.name }&nbsp;</a>
								<a style="margin-bottom:5px;" class="d-block">&nbsp;&nbsp;${loginUser.id }&nbsp;</a>
								<a style="margin-bottom:5px;" class="d-block">&nbsp;&nbsp;${loginUser.typeName }</a>
								<a href="common/logout.do"
									class="btn btn-xs btn-info waves-effect waves-themed">
									로그아웃</a>
							</span>
							</a>
						</div>
					</div>
					<ul id="js-nav-menu" class="nav-menu">
						<li class="nav-title">${loginUser.typeName}마이페이지</li>
						<c:forEach items="${menuList }" var="menu">
							<c:if test="${menu.isnav == 1}">
								<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
									<li><a
										href="javascript:subMenu_go('${menu.mcode }');goPage('<%=request.getContextPath()%>${menu.murl}','${menu.mcode }');"
										title="Application Intel"> <i class="fal fa-cube"></i> <span
											class="nav-link-text fw-700"
											data-i18n="nav.application_intel">${menu.mname}</span>
									</a></li>
								</sec:authorize>
							</c:if>
							<c:if test="${menu.isnav == 2}">
								<sec:authorize access="hasAnyRole('ROLE_COUSER')">
									<li><a
										href="javascript:subMenu_go('${menu.mcode }');goPage('<%=request.getContextPath()%>${menu.murl}','${menu.mcode }');"
										title="Application Intel"> <i class="fal fa-cube"></i> <span
											class="nav-link-text fw-700"
											data-i18n="nav.application_intel">${menu.mname}</span>
									</a></li>
								</sec:authorize>
							</c:if>
							<c:if test="${menu.isnav == 3}">
								<sec:authorize access="hasAnyRole('ROLE_INDUSER')">
									<li><a
										href="javascript:subMenu_go('${menu.mcode }');goPage('<%=request.getContextPath()%>${menu.murl}','${menu.mcode }');"
										title="Application Intel"> <i class="fal fa-cube"></i> <span
											class="nav-link-text fw-700"
											data-i18n="nav.application_intel">${menu.mname}</span>
									</a></li>
								</sec:authorize>
							</c:if>
						</c:forEach>
					</ul>
					<div>
						<div id="carouselExampleSlidesOnly" class="carousel slide"
							data-ride="carousel" data-interval="2000">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img class="d-block w-100" src="<%=request.getContextPath()%>/resources/template/img/demo/gallery/banner1.png"
										data-src="holder.js/800x400?auto=yes&bg=51adf6&fg=ffffff&text=First slide"
										alt="First slide">
								</div>
								<div class="carousel-item">
									<img class="d-block w-100" src="<%=request.getContextPath()%>/resources/template/img/demo/gallery/banner2.png"
										data-src="holder.js/800x400?auto=yes&bg=39a1f4&fg=ffffff&text=Second slide"
										alt="Second slide">
								</div>
								<div class="carousel-item">
									<img class="d-block w-100" src="<%=request.getContextPath()%>/resources/template/img/demo/gallery/banner3.png"
										data-src="holder.js/800x400?auto=yes&bg=2196F3&fg=ffffff&text=Third slide"
										alt="Third slide">
								</div>
							</div>
						</div>
					</div>
				</nav>
				<!-- END PRIMARY NAVIGATION -->
			</aside>
			<!-- END Left Aside -->
			<div class="page-content-wrapper">
				<!-- BEGIN Page Content -->
				<!-- the #js-page-content id is needed for some plugins to initialize -->
				<main id="js-page-content" role="main" class="page-content"
					style="padding:0px;"> <iframe name="ifr" id="ifr"
					src="" frameborder="0"
					scrolling=yes style="width: 100%; height: 100%;">
				</iframe> </main>
				<!-- this overlay is activated only when mobile menu is triggered -->
				<div class="page-content-overlay" data-action="toggle"
					data-class="mobile-nav-on"></div>
				<!-- END Page Content -->
				<!-- BEGIN Page Footer -->
				<footer class="page-footer" role="contentinfo">
					<div class="d-flex align-items-center flex-1 text-muted">
						<span class="hidden-md-down fw-700">2022 © Log4Job - 대전광역시
							취업정보시스템</span>
					</div>
					<div>
						<ul class="list-table m-0">
							<li><a 
								class="text-secondary fw-700">고객센터</a></li>
							<li class="pl-3"><a
								class="text-secondary fw-700">개인정보취급방침</a></li>
							<li class="pl-3"><a
								class="text-secondary fw-700">데이터 출처</a></li>
							<li class="pl-3 fs-xl"><a
								class="text-secondary" target="_blank"><i
									class="fal fa-question-circle" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</footer>
				<!-- END Page Footer -->
				<!-- BEGIN Shortcuts -->
				<!-- END Shortcuts -->
				<!-- BEGIN Color profile -->
				<!-- this area is hidden and will not be seen on screens or screen readers -->
				<!-- we use this only for CSS color refernce for JS stuff -->
				<p id="js-color-profile" class="d-none">
					<span class="color-primary-50"></span> <span
						class="color-primary-100"></span> <span class="color-primary-200"></span>
					<span class="color-primary-300"></span> <span
						class="color-primary-400"></span> <span class="color-primary-500"></span>
					<span class="color-primary-600"></span> <span
						class="color-primary-700"></span> <span class="color-primary-800"></span>
					<span class="color-primary-900"></span> <span class="color-info-50"></span>
					<span class="color-info-100"></span> <span class="color-info-200"></span>
					<span class="color-info-300"></span> <span class="color-info-400"></span>
					<span class="color-info-500"></span> <span class="color-info-600"></span>
					<span class="color-info-700"></span> <span class="color-info-800"></span>
					<span class="color-info-900"></span> <span class="color-danger-50"></span>
					<span class="color-danger-100"></span> <span
						class="color-danger-200"></span> <span class="color-danger-300"></span>
					<span class="color-danger-400"></span> <span
						class="color-danger-500"></span> <span class="color-danger-600"></span>
					<span class="color-danger-700"></span> <span
						class="color-danger-800"></span> <span class="color-danger-900"></span>
					<span class="color-warning-50"></span> <span
						class="color-warning-100"></span> <span class="color-warning-200"></span>
					<span class="color-warning-300"></span> <span
						class="color-warning-400"></span> <span class="color-warning-500"></span>
					<span class="color-warning-600"></span> <span
						class="color-warning-700"></span> <span class="color-warning-800"></span>
					<span class="color-warning-900"></span> <span
						class="color-success-50"></span> <span class="color-success-100"></span>
					<span class="color-success-200"></span> <span
						class="color-success-300"></span> <span class="color-success-400"></span>
					<span class="color-success-500"></span> <span
						class="color-success-600"></span> <span class="color-success-700"></span>
					<span class="color-success-800"></span> <span
						class="color-success-900"></span> <span class="color-fusion-50"></span>
					<span class="color-fusion-100"></span> <span
						class="color-fusion-200"></span> <span class="color-fusion-300"></span>
					<span class="color-fusion-400"></span> <span
						class="color-fusion-500"></span> <span class="color-fusion-600"></span>
					<span class="color-fusion-700"></span> <span
						class="color-fusion-800"></span> <span class="color-fusion-900"></span>
				</p>
				<!-- END Color profile -->
			</div>
		</div>
	</div>
	<!-- END Page Wrapper -->
	<!-- 퀵메뉴 -->
	<nav class="shortcut-menu d-none d-sm-block">
		<input type="checkbox" class="menu-open" name="menu-open"
			id="menu_open" /> <label for="menu_open" class="menu-open-button ">
			<span class="app-shortcut-icon d-block"></span>
		</label> <a href="common/logout.do" class="menu-item btn"
			data-toggle="tooltip" data-placement="left" title="로그아웃"> <i
			class="fal fa-sign-out"></i>
		</a> <a href="#" class="menu-item btn" data-action="app-fullscreen"
			data-toggle="tooltip" data-placement="left" title="풀스크린"> <i
			class="fal fa-expand"></i>
		</a> <a href="#" class="menu-item btn" data-action="app-print"
			data-toggle="tooltip" data-placement="left" title="페이지 인쇄"> <i
			class="fal fa-print"></i>
		</a> 
	</nav>
	<!-- 퀵메뉴 -->
	<!-- BEGIN Page Settings -->
	<div class="modal fade js-modal-settings modal-backdrop-transparent"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-right modal-md">
			<div class="modal-content">
				<div
					class="dropdown-header bg-trans-gradient d-flex justify-content-center align-items-center w-100">
					<h4 class="m-0 text-center color-white">
						Layout Settings <small class="mb-0 opacity-80">User
							Interface Settings</small>
					</h4>
					<button type="button"
						class="close text-white position-absolute pos-top pos-right p-2 m-1 mr-2"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true"><i class="fal fa-times"></i></span>
					</button>
				</div>
				<div class="modal-body p-0">
					<div class="settings-panel">
						<div class="mt-4 d-table w-100 px-5">
							<div class="d-table-cell align-middle">
								<h5 class="p-0">App Layout</h5>
							</div>
						</div>
						<div class="list" id="fh">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="header-function-fixed"></a> <span
								class="onoffswitch-title">Fixed Header</span> <span
								class="onoffswitch-title-desc">header is in a fixed at
								all times</span>
						</div>
						<div class="list" id="nff">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="nav-function-fixed"></a> <span
								class="onoffswitch-title">Fixed Navigation</span> <span
								class="onoffswitch-title-desc">left panel is fixed</span>
						</div>
						<div class="list" id="nfm">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="nav-function-minify"></a> <span
								class="onoffswitch-title">Minify Navigation</span> <span
								class="onoffswitch-title-desc">Skew nav to maximize space</span>
						</div>
						<div class="list" id="nfh">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="nav-function-hidden"></a> <span
								class="onoffswitch-title">Hide Navigation</span> <span
								class="onoffswitch-title-desc">roll mouse on edge to
								reveal</span>
						</div>
						<div class="list" id="nft">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="nav-function-top"></a> <span
								class="onoffswitch-title">Top Navigation</span> <span
								class="onoffswitch-title-desc">Relocate left pane to top</span>
						</div>
						<div class="list" id="fff">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="footer-function-fixed"></a> <span
								class="onoffswitch-title">Fixed Footer</span> <span
								class="onoffswitch-title-desc">page footer is fixed</span>
						</div>
						<div class="list" id="mmb">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="mod-main-boxed"></a> <span
								class="onoffswitch-title">Boxed Layout</span> <span
								class="onoffswitch-title-desc">Encapsulates to a
								container</span>
						</div>
						<div class="expanded">
							<ul class="mb-3 mt-1">
								<li>
									<div class="bg-fusion-50" data-action="toggle"
										data-class="mod-bg-1"></div>
								</li>
								<li>
									<div class="bg-warning-200" data-action="toggle"
										data-class="mod-bg-2"></div>
								</li>
								<li>
									<div class="bg-primary-200" data-action="toggle"
										data-class="mod-bg-3"></div>
								</li>
								<li>
									<div class="bg-success-300" data-action="toggle"
										data-class="mod-bg-4"></div>
								</li>
								<li>
									<div class="bg-white border" data-action="toggle"
										data-class="mod-bg-none"></div>
								</li>
							</ul>
							<div class="list" id="mbgf">
								<a href="#" onclick="return false;" class="btn btn-switch"
									data-action="toggle" data-class="mod-fixed-bg"></a> <span
									class="onoffswitch-title">Fixed Background</span>
							</div>
						</div>
						<div class="mt-4 d-table w-100 px-5">
							<div class="d-table-cell align-middle">
								<h5 class="p-0">Mobile Menu</h5>
							</div>
						</div>
						<div class="list" id="nmp">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="nav-mobile-push"></a> <span
								class="onoffswitch-title">Push Content</span> <span
								class="onoffswitch-title-desc">Content pushed on menu
								reveal</span>
						</div>
						<div class="list" id="nmno">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="nav-mobile-no-overlay"></a> <span
								class="onoffswitch-title">No Overlay</span> <span
								class="onoffswitch-title-desc">Removes mesh on menu
								reveal</span>
						</div>
						<div class="list" id="sldo">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="nav-mobile-slide-out"></a> <span
								class="onoffswitch-title">Off-Canvas <sup>(beta)</sup></span> <span
								class="onoffswitch-title-desc">Content overlaps menu</span>
						</div>
						<div class="mt-4 d-table w-100 px-5">
							<div class="d-table-cell align-middle">
								<h5 class="p-0">Accessibility</h5>
							</div>
						</div>
						<div class="list" id="mbf">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="mod-bigger-font"></a> <span
								class="onoffswitch-title">Bigger Content Font</span> <span
								class="onoffswitch-title-desc">content fonts are bigger
								for readability</span>
						</div>
						<div class="list" id="mhc">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="mod-high-contrast"></a> <span
								class="onoffswitch-title">High Contrast Text (WCAG 2 AA)</span>
							<span class="onoffswitch-title-desc">4.5:1 text contrast
								ratio</span>
						</div>
						<div class="list" id="mcb">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="mod-color-blind"></a> <span
								class="onoffswitch-title">Daltonism <sup>(beta)</sup>
							</span> <span class="onoffswitch-title-desc">color vision
								deficiency</span>
						</div>
						<div class="list" id="mpc">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="mod-pace-custom"></a> <span
								class="onoffswitch-title">Preloader Inside</span> <span
								class="onoffswitch-title-desc">preloader will be inside
								content</span>
						</div>
						<div class="list" id="mpi">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="mod-panel-icon"></a> <span
								class="onoffswitch-title">SmartPanel Icons (not Panels)</span> <span
								class="onoffswitch-title-desc">smartpanel buttons will
								appear as icons</span>
						</div>
						<div class="mt-4 d-table w-100 px-5">
							<div class="d-table-cell align-middle">
								<h5 class="p-0">Global Modifications</h5>
							</div>
						</div>
						<div class="list" id="mcbg">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="mod-clean-page-bg"></a> <span
								class="onoffswitch-title">Clean Page Background</span> <span
								class="onoffswitch-title-desc">adds more whitespace</span>
						</div>
						<div class="list" id="mhni">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="mod-hide-nav-icons"></a> <span
								class="onoffswitch-title">Hide Navigation Icons</span> <span
								class="onoffswitch-title-desc">invisible navigation icons</span>
						</div>
						<div class="list" id="dan">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="mod-disable-animation"></a> <span
								class="onoffswitch-title">Disable CSS Animation</span> <span
								class="onoffswitch-title-desc">Disables CSS based
								animations</span>
						</div>
						<div class="list" id="mhic">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="mod-hide-info-card"></a> <span
								class="onoffswitch-title">Hide Info Card</span> <span
								class="onoffswitch-title-desc">Hides info card from left
								panel</span>
						</div>
						<div class="list" id="mlph">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="mod-lean-subheader"></a> <span
								class="onoffswitch-title">Lean Subheader</span> <span
								class="onoffswitch-title-desc">distinguished page header</span>
						</div>
						<div class="list" id="mnl">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="mod-nav-link"></a> <span
								class="onoffswitch-title">Hierarchical Navigation</span> <span
								class="onoffswitch-title-desc">Clear breakdown of nav
								links</span>
						</div>
						<div class="list" id="mdn">
							<a href="#" onclick="return false;" class="btn btn-switch"
								data-action="toggle" data-class="mod-nav-dark"></a> <span
								class="onoffswitch-title">Dark Navigation</span> <span
								class="onoffswitch-title-desc">Navigation background is
								darkend</span>
						</div>
						<hr class="mb-0 mt-4">
						<div class="mt-4 d-table w-100 pl-5 pr-3">
							<div class="d-table-cell align-middle">
								<h5 class="p-0">Global Font Size</h5>
							</div>
						</div>
						<div class="list mt-1">
							<div class="btn-group btn-group-sm btn-group-toggle my-2"
								data-toggle="buttons">
								<label class="btn btn-default btn-sm" data-action="toggle-swap"
									data-class="root-text-sm" data-target="html"> <input
									type="radio" name="changeFrontSize"> SM
								</label> <label class="btn btn-default btn-sm" data-action="toggle-swap"
									data-class="root-text" data-target="html"> <input
									type="radio" name="changeFrontSize" checked=""> MD
								</label> <label class="btn btn-default btn-sm" data-action="toggle-swap"
									data-class="root-text-lg" data-target="html"> <input
									type="radio" name="changeFrontSize"> LG
								</label> <label class="btn btn-default btn-sm" data-action="toggle-swap"
									data-class="root-text-xl" data-target="html"> <input
									type="radio" name="changeFrontSize"> XL
								</label>
							</div>
							<span class="onoffswitch-title-desc d-block mb-0">Change <strong>root</strong>
								font size to effect rem values (resets on page refresh)
							</span>
						</div>
						<hr class="mb-0 mt-4">
						<div class="mt-4 d-table w-100 pl-5 pr-3">
							<div class="d-table-cell align-middle">
								<h5 class="p-0 pr-2 d-flex">
									Theme colors <a href="#" class="ml-auto fw-400 fs-xs"
										data-toggle="popover" data-trigger="focus"
										data-placement="top" title="" data-html="true"
										data-content="The settings below uses <code>localStorage</code> to load the external <strong>CSS</strong> file as an overlap to the base css. Due to network latency and <strong>CPU utilization</strong>, you may experience a brief flickering effect on page load which may show the intial applied theme for a split second. Setting the prefered style/theme in the header will prevent this from happening."
										data-original-title="<span class='text-primary'><i class='fal fa-exclamation-triangle mr-1'></i> Heads up!</span>"
										data-template="<div class=&quot;popover bg-white border-white&
										quot; role=&quot;tooltip&quot;><div
											class=&quot;arrow&quot;></div>
										<h3 class=&quot;popover-headerbg-transparent&quot;></h3>
										<div class=&quot;popover-bodyfs-xs&quot;></div>
							</div>
							"><i class="fal fa-info-circle mr-1"></i> more info</a>
							</h5>
						</div>
					</div>
					<div class="expanded theme-colors pl-5 pr-3">
						<ul class="m-0">
							<li><a href="#" id="myapp-0" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/"
								data-toggle="tooltip" data-placement="top"
								title="Wisteria (base css)"
								data-original-title="Wisteria (base css)"></a></li>
							<li><a href="#" id="myapp-1" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/css/themes/cust-theme-1.css"
								data-toggle="tooltip" data-placement="top" title="Tapestry"
								data-original-title="Tapestry"></a></li>
							<li><a href="#" id="myapp-2" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/css/themes/cust-theme-2.css"
								data-toggle="tooltip" data-placement="top" title="Atlantis"
								data-original-title="Atlantis"></a></li>
							<li><a href="#" id="myapp-3" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/css/themes/cust-theme-3.css"
								data-toggle="tooltip" data-placement="top" title="Indigo"
								data-original-title="Indigo"></a></li>
							<li><a href="#" id="myapp-4" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/css/themes/cust-theme-4.css"
								data-toggle="tooltip" data-placement="top" title="Dodger Blue"
								data-original-title="Dodger Blue"></a></li>
							<li><a href="#" id="myapp-5" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/css/themes/cust-theme-5.css"
								data-toggle="tooltip" data-placement="top" title="Tradewind"
								data-original-title="Tradewind"></a></li>
							<li><a href="#" id="myapp-6" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/css/themes/cust-theme-6.css"
								data-toggle="tooltip" data-placement="top" title="Cranberry"
								data-original-title="Cranberry"></a></li>
							<li><a href="#" id="myapp-7" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/css/themes/cust-theme-7.css"
								data-toggle="tooltip" data-placement="top" title="Oslo Gray"
								data-original-title="Oslo Gray"></a></li>
							<li><a href="#" id="myapp-8" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/css/themes/cust-theme-8.css"
								data-toggle="tooltip" data-placement="top" title="Chetwode Blue"
								data-original-title="Chetwode Blue"></a></li>
							<li><a href="#" id="myapp-9" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/css/themes/cust-theme-9.css"
								data-toggle="tooltip" data-placement="top" title="Apricot"
								data-original-title="Apricot"></a></li>
							<li><a href="#" id="myapp-10" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/css/themes/cust-theme-10.css"
								data-toggle="tooltip" data-placement="top" title="Blue Smoke"
								data-original-title="Blue Smoke"></a></li>
							<li><a href="#" id="myapp-11" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/css/themes/cust-theme-11.css"
								data-toggle="tooltip" data-placement="top" title="Green Smoke"
								data-original-title="Green Smoke"></a></li>
							<li><a href="#" id="myapp-12" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/css/themes/cust-theme-12.css"
								data-toggle="tooltip" data-placement="top"
								title="Wild Blue Yonder" data-original-title="Wild Blue Yonder"></a>
							</li>
							<li><a href="#" id="myapp-13" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/css/themes/cust-theme-13.css"
								data-toggle="tooltip" data-placement="top" title="Emerald"
								data-original-title="Emerald"></a></li>
							<li><a href="#" id="myapp-14" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/css/themes/cust-theme-14.css"
								data-toggle="tooltip" data-placement="top" title="Supernova"
								data-original-title="Supernova"></a></li>
							<li><a href="#" id="myapp-15" data-action="theme-update"
								data-themesave
								data-theme="<%=request.getContextPath()%>/resources/template/css/themes/cust-theme-15.css"
								data-toggle="tooltip" data-placement="top" title="Hoki"
								data-original-title="Hoki"></a></li>
						</ul>
					</div>
					<hr class="mb-0 mt-4">
					<div class="mt-4 d-table w-100 pl-5 pr-3">
						<div class="d-table-cell align-middle">
							<h5 class="p-0 pr-2 d-flex">
								Theme Modes (beta) <a href="#" class="ml-auto fw-400 fs-xs"
									data-toggle="popover" data-trigger="focus" data-placement="top"
									title="" data-html="true"
									data-content="This is a brand new technique we are introducing which uses CSS variables to infiltrate color options. While this has been working nicely on modern browsers without much issues, some users <strong>may still face issues on Internet Explorer </strong>. Until these issues are resolved or Internet Explorer improves, this feature will remain in Beta"
									data-original-title="<span class='text-primary'><i class='fal fa-question-circle mr-1'></i> Why beta?</span>"
									data-template="<div class=&quot;popover bg-white border-white&
									quot; role=&quot;tooltip&quot;><div class=&quot;arrow&quot;></div>
									<h3 class=&quot;popover-headerbg-transparent&quot;></h3>
									<div class=&quot;popover-bodyfs-xs&quot;></div>
						</div>
						"><i class="fal fa-question-circle mr-1"></i> why beta?</a>
						</h5>
					</div>
				</div>
				<div class="pl-5 pr-3 py-3">
					<div class="ie-only alert alert-warning d-none">
						<h6>Internet Explorer Issue</h6>
						This particular component may not work as expected in Internet
						Explorer. Please use with caution.
					</div>
					<div class="row no-gutters">
						<div class="col-4 pr-2 text-center">
							<div id="skin-default" data-action="toggle-replace"
								data-replaceclass="mod-skin-light mod-skin-dark" data-class=""
								data-toggle="tooltip" data-placement="top" title=""
								class="d-flex bg-white border border-primary rounded overflow-hidden text-success js-waves-on"
								data-original-title="Default Mode" style="height: 80px">
								<div
									class="bg-primary-600 bg-primary-gradient px-2 pt-0 border-right border-primary"></div>
								<div class="d-flex flex-column flex-1">
									<div class="bg-white border-bottom border-primary py-1"></div>
									<div class="bg-faded flex-1 pt-3 pb-3 px-2">
										<div class="py-3"
											style="background: url('img/demo/s-1.png') top left no-repeat; background-size: 100%;"></div>
									</div>
								</div>
							</div>
							Default
						</div>
						<div class="col-4 px-1 text-center">
							<div id="skin-light" data-action="toggle-replace"
								data-replaceclass="mod-skin-dark" data-class="mod-skin-light"
								data-toggle="tooltip" data-placement="top" title=""
								class="d-flex bg-white border border-secondary rounded overflow-hidden text-success js-waves-on"
								data-original-title="Light Mode" style="height: 80px">
								<div class="bg-white px-2 pt-0 border-right border-"></div>
								<div class="d-flex flex-column flex-1">
									<div class="bg-white border-bottom border- py-1"></div>
									<div class="bg-white flex-1 pt-3 pb-3 px-2">
										<div class="py-3"
											style="background: url('img/demo/s-1.png') top left no-repeat; background-size: 100%;"></div>
									</div>
								</div>
							</div>
							Light
						</div>
						<div class="col-4 pl-2 text-center">
							<div id="skin-dark" data-action="toggle-replace"
								data-replaceclass="mod-skin-light" data-class="mod-skin-dark"
								data-toggle="tooltip" data-placement="top" title=""
								class="d-flex bg-white border border-dark rounded overflow-hidden text-success js-waves-on"
								data-original-title="Dark Mode" style="height: 80px">
								<div class="bg-fusion-500 px-2 pt-0 border-right"></div>
								<div class="d-flex flex-column flex-1">
									<div class="bg-fusion-600 border-bottom py-1"></div>
									<div class="bg-fusion-300 flex-1 pt-3 pb-3 px-2">
										<div class="py-3 opacity-30"
											style="background: url('img/demo/s-1.png') top left no-repeat; background-size: 100%;"></div>
									</div>
								</div>
							</div>
							Dark
						</div>
					</div>
				</div>
				<hr class="mb-0 mt-4">
				<div class="pl-5 pr-3 py-3 bg-faded">
					<div class="row no-gutters">
						<div class="col-6 pr-1">
							<a href="#" class="btn btn-outline-danger fw-500 btn-block"
								data-action="app-reset">Reset Settings</a>
						</div>
						<div class="col-6 pl-1">
							<a href="#" class="btn btn-danger fw-500 btn-block"
								data-action="factory-reset">Factory Reset</a>
						</div>
					</div>
				</div>
			</div>
			<span id="saving"></span>
		</div>
	</div>
	</div>
	</div>
	<!-- END Page Settings -->

	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/template/js/vendors.bundle.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/template/js/app.bundle.js"></script>
	<!--summernote  -->
	<script
		src="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- common.js -->
	<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>

	<%@ include file="/WEB-INF/views/common/index_js.jsp"%>

<script>

document.addEventListener('DOMContentLoaded', () => {
	var webSocket = new WebSocket("ws:192.168.141.25/<%=request.getContextPath()%>/readit");
	
	webSocket.onopen = function(e){
		console.log("접속됨");
	} 
	
	webSocket.onmessage = function(e){
		console.log(e.data);
		var allim = '${allim.toId}';
		console.log("asd"+allim);
	}
	$.ajax({
		url : '<%=request.getContextPath()%>/allim/list',
		type : 'GET',
		dataType:"json",
		success : function(result) {
	        // 로그인 유저가 개인회원 
			if('${loginUser.typeName}' == '개인회원'){
			console.log('${loginUser.typeName}');
			console.log("ajax1",result);
			var openCount = result.alertForOpenList.count;
			var recCount = result.alertForRecList.count;
			var count = openCount + recCount;
			console.log(count);
			var open = result.alertForOpenList;
			var rec = result.alertForRecList;
			var flag = true;
			if(openCount == 0 & recCount == 0){
				var v_list = 
				`<li class="">
					<a href="#" class="d-flex align-items-center pageUrl" >
						<span class="status mr-2"> <span
								class="profile-image rounded-circle d-inline-block" style=""></span>
						</span> <span class="d-flex flex-column flex-1 ml-1"> <span
								class="name">......</span> 
								<span class="msg-a fs-sm">새 알림이 없습니다</span> <span class="fs-nano text-muted mt-1">
								시간</span>
						</span>
					</a>
				</li>`;
				$('.allimList').append(v_list);
			}else{
				$('#allimIcon').css("display", "block");
				$('#allimIcon').html(count);
				for(var i=0; i<recCount; i++){
					console.log("rec 됨");
					var unreadList = 
						`<div class="alert alert-success alert-dismissible fade show" role="alert">
		                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		                    <span aria-hidden="true"><i class="fal fa-times"></i></span>
		                </button>
		                <strong>`+rec.almList[i].coNm+`에서 </strong>`+rec.almList[i].recWantedtitle+`</a>에서 입사 권유가 도착했습니다.
		            </div>`;
				$('.allimList').append(unreadList);
				}
				for(var i=0; i<openCount; i++){
					var unreadList = 
					`<div class="alert alert-success alert-dismissible fade show" role="alert">
	                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	                    <span aria-hidden="true"><i class="fal fa-times"></i></span>
	                </button>
	                <strong>`+open.almList[i].coNm+`에서 </strong>`+open.almList[i].openTitle+`</a>에서 입사 권유가 도착했습니다.
	            </div>`;
				$('.allimList').append(unreadList);
				
				}
			}
		}	
		    //로그인 유저가 기업회원 기준
			if('${loginUser.typeName}' == '기업회원'){
				console.log('${loginUser.typeName}');
				console.log("ajax2",result);
				var recCount = result.alertForRecNameList.count;
				var openCount = result.alertForOpenNameList.count;
				var count = recCount + openCount;
				var rec = result.alertForRecNameList;
				var open = result.alertForOpenNameList;
	// ------------------------------------------------------------------------
				if(openCount == 0 & recCount == 0){
					var v_list = 
						`<li class="">
							<a href="#" class="d-flex align-items-center pageUrl" >
								<span class="status mr-2"> <span
										class="profile-image rounded-circle d-inline-block" style=""></span>
								</span> <span class="d-flex flex-column flex-1 ml-1"> <span
										class="name">......</span> 
										<span class="msg-a fs-sm">새 알림이 없습니다</span> <span class="fs-nano text-muted mt-1">
										시간</span>
								</span>
							</a>
						</li>`;
						$('.allimList').append(v_list);
				}else{
					$('#allimIcon').css("display", "block");
					$('#allimIcon').html(count);
					// 채용
					console.log("rec됨");
					for(var i=0; i<recCount; i++){
						var unreadList = 
							`<div class="alert alert-success alert-dismissible fade show" role="alert">
			                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			                    <span aria-hidden="true"><i class="fal fa-times"></i></span>
			                </button>
			                `+rec.almList[i].recWantedtitle+`</a>에 입사 지원요청이 도착했습니다.
			            </div>`;
						
					$('.allimList').append(unreadList);
					}
					// 공채
					for(var i=0; i<openCount; i++){
						console.log("open 됨");
						var unreadList = 
							`<div class="alert alert-success alert-dismissible fade show" role="alert">
			                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			                    <span aria-hidden="true"><i class="fal fa-times"></i></span>
			                </button>
			                `+open.almList[i].openTitle+`</a>에 입사 지원요청이 도착했습니다.
			            </div>`;
						
					$('.allimList').append(unreadList);
					
					}
				}
			}
		
		
		},
		error : function(request, status, error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	
});



</script>

</body>
<!-- END Body -->
</html>


