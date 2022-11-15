<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="empstatsList" value="${empstatsMap.empstatsList}" />

<!DOCTYPE html>
<!-- 
Template Name:  SmartAdmin Responsive WebApp - Template build with Twitter Bootstrap 4
Version: 4.5.1
Author: Sunnyat A.
Website: http://gootbootstrap.com
Purchase: https://wrapbootstrap.com/theme/smartadmin-responsive-webapp-WB0573SK0?ref=myorange
License: You must have a valid license purchased only from wrapbootstrap.com (link above) in order to legally use this theme for your project.
-->
<html lang="en">
<head>
<meta charset="utf-8">
<title>Marketing Dashboard - Application Intel - SmartAdmin
	v4.5.1</title>
<meta name="description" content="Marketing Dashboard">
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
<link id="mytheme" rel="stylesheet" media="screen, print" href="#">
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
	href="<%=request.getContextPath()%>/resources/template/css/datagrid/datatables/datatables.bundle.css">
</head>
<!-- daejeon css start -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/daejeon/css/main.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/daejeon/css/main_respond.css"/>
<!-- daejeon css end -->
<!-- BEGIN Body -->
<!-- Possible Classes

		* 'header-function-fixed'         - header is in a fixed at all times
		* 'nav-function-fixed'            - left panel is fixed
		* 'nav-function-minify'			  - skew nav to maximize space
		* 'nav-function-hidden'           - roll mouse on edge to reveal
		* 'nav-function-top'              - relocate left pane to top
		* 'mod-main-boxed'                - encapsulates to a container
		* 'nav-mobile-push'               - content pushed on menu reveal
		* 'nav-mobile-no-overlay'         - removes mesh on menu reveal
		* 'nav-mobile-slide-out'          - content overlaps menu
		* 'mod-bigger-font'               - content fonts are bigger for readability
		* 'mod-high-contrast'             - 4.5:1 text contrast ratio
		* 'mod-color-blind'               - color vision deficiency
		* 'mod-pace-custom'               - preloader will be inside content
		* 'mod-clean-page-bg'             - adds more whitespace
		* 'mod-hide-nav-icons'            - invisible navigation icons
		* 'mod-disable-animation'         - disables css based animations
		* 'mod-hide-info-card'            - hides info card from left panel
		* 'mod-lean-subheader'            - distinguished page header
		* 'mod-nav-link'                  - clear breakdown of nav links

		>>> more settings are described inside documentation page >>>
	-->
<body class="mod-bg-1 mod-nav-link ">
	<!-- DOC: script to save and load page settings -->
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
	<main id="js-page-content" role="main" class="page-content">
	<div class="row">
		<div class="col-lg-12">
			<div id="panel-2" class="panel panel-locked" data-panel-sortable
				data-panel-collapsed data-panel-close>
				<div class="panel-hdr">
					<h2>
						대전광역시 지역구별 고용현황
					</h2>
				</div>
				<div class="panel-container show">
					<div class="panel-content poisition-relative">
						<div class="area_wrap">
							<div class="area_map">
								<svg xmlns="http://www.w3.org/2000/svg" width="367.124"
									height="465.999" viewBox="0 0 367.124 465.999">

                                <g id="map" 
										transform="translate(0 36.999)">
                                    <g id="그룹_15251" 
										data-name="그룹 15251" transform="translate(8 8)">
                                        <path
										id="유성구"
										d="M3853.372,565.924l16.793-10.336,20.176-13.813,7.063-17.826a.684.684,0,0,1,.328-.358l5.164-2.582,4.683-18.06a.679.679,0,0,1,.658-.509h7.82v-10.2a.679.679,0,0,1,.187-.468l6.325-6.657.573-2.866-4.184-4.5a.682.682,0,0,1-.181-.463V466.062a.7.7,0,0,1,.02-.165l2.04-8.16a.68.68,0,0,1,1.06-.385l3.474,2.527,5.8-1.612a.681.681,0,0,1,.5.055l3.046,1.62h4.5l.261-4.038c-.514-1.544-1.1-3.192-1.7-4.888-2.006-5.655-4.279-12.063-4.662-16.845a.848.848,0,0,1,.08-.433,99.51,99.51,0,0,1,7.454-12.569c2.969-5.431,6.686-11.4,10.97-13.657a42.555,42.555,0,0,0,6.046-4.149c4-3.1,8.143-6.3,14.063-5.86a24.462,24.462,0,0,1,7.927-.353c.834.052,1.676.105,2.531.136a85.442,85.442,0,0,0,9.6-1.448l6.3-2.69c4.485-2.478,7.124-5.872,9.39-13.35.176-.581.336-1.178.483-1.785l1.35-10.976-.118-.769a45.244,45.244,0,0,1-.208-16.465c1.144-6.266,1.986-8.051,2.8-9.776a20.994,20.994,0,0,0,1.467-3.9c1.158-4.173-2.032-9.393-5.811-14.066l-.673-.527c-5-3.918-11.521-9.021-16.529-13.619-5.262-3.556-8.5-5.942-9.106-7.851a11.385,11.385,0,0,1-.348-4.644,7.555,7.555,0,0,1,.038-6.753c1.717-3.66,6.453-8.208,14.849-14.242l-.732-.8-3.4-18.359,3.739-21.079-20.059-20.4h-3.4l-11.9,13.6-11.22-1.7-4.362,8.652,9.689,15.554-3.569,6.629-7.395,4.59v22.948l-9.434,6.119-5.1,2.295-3.314,22.183-6.884,3.825-13.259,7.649h-4.59l-6.884,4.335-2.041-1.275V326.9l-5.609-.51V324.6l-9.689-.255-13.259,6.119v3.57l-8.159,3.06-5.018,39.522,1.7,10.2,1.53,2.55-1.53,16.574-1.7,3.825v3.06l-7.731,4.334,1.02,9.944,6.711,7.139-13.851,14.789v4.845l2.04,4.334-.255,2.295-8.924,5.865v4.079l2.04,1.53-3.06,7.9v7.139l-2.04,13.514,4.08,3.825-1.275,7.394-5.609,1.53L3814.8,521.7l3.825,13.769,37.737,26.263Z"
										transform="translate(-3822.803 -258.789)" fill="#fdbe34" />
                                        <g 
										id="대덕구" transform="translate(-8 -45)">
                                            <path id="패스_580"
										data-name="패스 580"
										d="M4835.763,1242.606c-2.578,2.738-8.044,4.462-12.93,5.506l-.4.145a22.567,22.567,0,0,1-2.624.766l-.225.1.522.18h0c-.021.061-1.634,4.863-.025,8.5.853,1.932,2.558,2.818,4.207,3.675,1.479.769,2.876,1.494,3.309,2.938.5,1.675,2.247,9.521,3.344,14.529V1275.2a.68.68,0,0,1,.35-.594l5.752-3.2Z"
										transform="translate(-4645.37 -1064.408)" fill="#fdbe34" />
                                            <path id="패스_582"
										data-name="패스 582"
										d="M4799.14,429.33c-2.417,1.693-8.289,5.952-11.162,9.3a18.123,18.123,0,0,0-3.988,8.139l3.335,6.92c.538.672,1.179,1.393,1.9,2.151l6.523,5.4c4.5,3.026,8.928,6.108,11.426,8.909.568.637,1.143,1.3,1.714,1.971l5.473,4.531a.676.676,0,0,1,.2.29l.105.287a9.9,9.9,0,0,1,3.029,8.261l.606,1.652a.68.68,0,0,1,0,.455l-3.717,10.813-1.485,12.077c0,.082-.319,2.7-.322,2.783-.1,2.283-.205,4.591-.364,6.873.21,1.424.388,2.815.466,4.246a30.341,30.341,0,0,1-3.354,15.177l-.031.251a.687.687,0,0,1-.067.221l-1.621,3.242,1.352,30.422a.68.68,0,0,1-.349.625l-5.771,3.206v7.276l7.363,2.561a.678.678,0,0,1,.359.292l3.578,5.961,6.188-7.736a.68.68,0,0,1,.531-.255h5.651l6.293-16.561a.679.679,0,0,1,.635-.438h7.819a.679.679,0,0,1,.575.317l7.89,12.492,5.633-1.565a.683.683,0,0,1,.182-.025h7.48a.686.686,0,0,1,.1.008l10.037,1.568-.952-13.645-14.307-31.166a.678.678,0,0,1,0-.564l4.019-8.868-3.993-7.181a.679.679,0,0,1-.075-.452l2.46-13.6a.679.679,0,0,1,.443-.52l11.392-4.021,11.715-13.388,11.518-25.746a.675.675,0,0,1,.117-.179l7.034-7.762.61-1.981-5.78-7.82-2.72.34-1.7,6.8-5.78,5.44-4.42,16.32-4.42-5.1,5.1-15.3,1.02-6.8h-7.819l4.42-10.54,9.859,2.72,3.74-5.44-6.8-7.82,6.46-26.859-9.18,1.7-6.459,7.14-4.42,17.68-16.319,13.6-12.24-2.04-8.16-8.5-28.559,3.06-9.488-1.02Z"
										transform="translate(-4616.12 -366.343)" fill="#fdbe34" />
                                        </g>
                                        <path
										id="동구"
										d="M5071.021,789.067l-2.55-1.36-12.24,4.42-.34-8.5,3.4,1.53,5.271-1.7-1.021-4.93-8.329-8.67.611-3.478-2.65-.942-1.021-9.18-7.819.34,5.246-17.052-5.01,5.529-11.515,25.74a.709.709,0,0,1-.109.17l-11.9,13.6a.677.677,0,0,1-.286.193l-11.187,3.948-2.346,12.972,4.041,7.267a.681.681,0,0,1,.025.611l-4.031,8.9,14.229,31a.663.663,0,0,1,.061.236l1.02,14.62a.68.68,0,0,1-.783.719l-10.827-1.692h-7.334l-6.03,1.675a.68.68,0,0,1-.757-.292l-7.96-12.6H4981.9l-6.293,16.561a.68.68,0,0,1-.636.438h-5.793l-6.447,8.058v3.9l9.866,5.815a.681.681,0,0,1,.157.128l10.2,11.22a.687.687,0,0,1,.116.178l12.1,26.894,6.814,1.623a.679.679,0,0,1,.433.324l10.88,19.039a.686.686,0,0,1,.089.337v3.06a.68.68,0,0,1-.68.68h-9.52a.676.676,0,0,1-.408-.136l-6.333-4.749-8.592,8.43a.68.68,0,0,1-.477.195h-5.27v7.478l5.675,4.216a.679.679,0,0,1,.239.765l-2.744,8.069,5.1,4.46a.679.679,0,0,1,.214.353l2.209,9.18a.679.679,0,0,1-.23.685l-10.121,8.3v5.8a.681.681,0,0,1-.28.55l-3.013,2.191,3.867,3.039h4.355a.679.679,0,0,1,.623.408l6.97,15.979a.681.681,0,0,1,.026.473l-2.21,7.14a.681.681,0,0,1-.65.479h-1.981l2.634,8.989a.68.68,0,0,1-.315.782l-8.33,4.759a.681.681,0,0,1-.482.074l-7.525-1.636-1.772,1.266,3.307,15.544a.68.68,0,0,1-.082.492l-2.9,4.831,1.26,3.783a.679.679,0,0,1-.113.639l-5.448,6.837,1.06.776,9.944,1.02,4.589,8.669,12.239,7.9L5012,1090v-6.885l-2.805-3.315,20.4-12.749v-2.8l-2.8-2.8v-5.865l18.1-13.514,7.139-1.53v-4.844l3.825-2.295v-14.534l-4.334-.765-2.04-4.335,3.57-2.8-.765-9.434-3.314-3.314,3.314-12.239-.51-6.375,8.415-9.944v-6.629l-5.355-16.829-.254-4.59,7.9-7.649-2.041-10.454,2.041-3.315V913.3l6.629-9.689-2.04-13.769V883.47l7.394-4.845v-7.394l3.183-6.857,10.2-1.36,8.5-28.219-3.4-10.2,3.4-1.7-1.7-10.88,14.279-11.22,1.7,1.36,10.879-2.04,4.419.68,5.1-3.06-2.379-4.76-11.9-10.54-4.76-18.359-13.259.34-5.44-4.08-6.8,2.38-1.282.948a2.535,2.535,0,0,0,1.282,2.452c2.89,1.36,11.9,2.89,11.9,2.89l8.67,9.01-3.74,9.35-4.419,1.7-8.5-11.05s-5.27-.34-6.12-.17-2.89,5.1-2.89,5.1Z"
										transform="translate(-4771.904 -693.48)" fill="#fdbe34" />
                                        <path
										id="중구"
										d="M4712.864,1683.869a.68.68,0,0,1,.062-.565l2.922-4.87-3.344-15.718a.68.68,0,0,1,.271-.695l2.379-1.7a.679.679,0,0,1,.54-.111l7.565,1.644,7.637-4.364-2.739-9.345a.681.681,0,0,1,.653-.871h2.388l1.987-6.419-6.69-15.34h-4.145a.68.68,0,0,1-.42-.145l-4.76-3.74a.681.681,0,0,1,.02-1.085l3.46-2.516v-5.774a.679.679,0,0,1,.249-.526l10.04-8.229-2.06-8.555-5.277-4.617a.68.68,0,0,1-.2-.731l2.73-8.03-5.552-4.124a.681.681,0,0,1-.274-.546v-8.5a.68.68,0,0,1,.68-.68h5.672l8.812-8.645a.681.681,0,0,1,.885-.059l6.618,4.964h8.613v-2.2l-10.644-18.627-6.853-1.632a.682.682,0,0,1-.463-.382l-12.195-27.1-10.058-11.064-10.111-5.96a.678.678,0,0,1-.335-.586v-4.339l-3.856-6.427-6.734-2.342q-.063,1.179-.113,2.234c-.3,6.026-.459,9.345-2.6,13.567-.949,1.871-2.91,3.815-5.181,6.065l-.613.608-7.131,9.352-4.282,7.688a22.076,22.076,0,0,0-1.083,10.558,8.335,8.335,0,0,1-.248,4.321,12.24,12.24,0,0,1-2.33,3.468c-.14.162-.278.323-.414.484l-2.1,4.519c-.022.253-.038.515-.038.794,0,1.3.05,2.53.1,3.718.138,3.386.257,6.309-.859,9.05a8.812,8.812,0,0,1-2.155,3.213l-1.347,2.448a.849.849,0,0,1-.744.441h-7.759a.143.143,0,0,0-.018.036c-.162.632-.549,1.633-1.04,2.9-.108.279-.222.574-.341.883l-2.318,9.063a3.151,3.151,0,0,0,.13.678c.589,1.82,3.48,10.867,5.963,18.637l20.757,12.053v6.629l-6.913,11.474,5.864,14.789-3.314,7.649v2.04l15.3,3.059,2.8,2.55-1.53,2.805,5.609,11.219,3.57,1.785,2.294,4.589-1.53,6.63,12.121,8.874,5.252-6.592Z"
										transform="translate(-4511.459 -1308.426)" fill="#fdbe34" />
                                        <g
										id="서구" transform="translate(-8 -45)">
                                            <path id="패스_585"
										data-name="패스 585"
										d="M4269.147,1460.239l3.314-19.888,10.5-5c-2.6-8.134-5.96-18.652-6.6-20.628-.888-2.743,1.1-7.889,2.558-11.647.454-1.171.844-2.182.984-2.727l.184-.718a.85.85,0,0,1,.824-.639h.545a12.524,12.524,0,0,1,2.237-.27c2.448-.157,5.4-.348,7.317-2.935l1-1.811a10.558,10.558,0,0,0,.634-2.411v-9.742c0-3.408,1.552-5.208,2.922-6.8l.319-.371,1.179-2.539v-10.692a.85.85,0,0,1,.107-.413l1.337-2.4a40.581,40.581,0,0,1,1.333-3.954c2.768-7.065,7.6-11.859,11.492-15.71q.434-.43.849-.844l4-5.244,1.394-8.281c-.009-.476-.022-.965-.035-1.467-.055-2.126-.117-4.536.039-7.291l-.312-3.007c-.894-4.1-2.073-12.1-2.657-14.04-.227-.756-1.264-1.295-2.465-1.919-1.73-.9-3.884-2.018-4.979-4.5-1.429-3.237-.748-7.045-.3-8.79l-1.466.627a.682.682,0,0,1-.268.055h-15.265L4268.725,1298l-13.2,19.215a8.171,8.171,0,0,0-.427,3l5.283,14.106a.7.7,0,0,1,.042.282l.553,4.5c1.913,5.685,1.9,9.584.544,11.285-.911,1.139-1.188,6.865.092,15.235,1.228,8.03,3.318,14.7,5.324,16.993,4.823,5.512-.112,23.665-3.715,36.92q-.27.99-.524,1.931c-.768,2.839-2.152,4.742-4.115,5.655-3.956,1.84-9.24-.621-13.9-2.792-2.365-1.1-4.6-2.142-5.976-2.228-1.115-.07-1.241.355-1.294.537-.593,2.005,3.236,7.882,7.2,10.113,5.087,2.862,2.278,12.027.928,16.432-.244.8-.456,1.488-.506,1.788a1.5,1.5,0,0,1-1.7,1.313c-1.964-.162-5.092-3.383-5.092-6.893a1.231,1.231,0,0,0-.75-1.194c-2.16-1.125-7.639.132-10.152,1.891-1.66,1.162-1.264,3.017-.414,5.933a14.746,14.746,0,0,1,.776,3.91c0,2.215-4.3,5.986-11.373,11.933-3.735,3.139-7.6,6.386-9.036,8.3-1.835,2.44-.1,4.192,2.89,6.848a15.941,15.941,0,0,1,3.476,3.793,2.623,2.623,0,0,1,.194,2.35c-.854,2.029-4.4,3.031-7.831,4a31.486,31.486,0,0,0-3.978,1.292c-1.106.5-1.3,2.016-1.1,3.7l13.123,10.021,7.649,10.2,3.314,16.574,6.375-1.53,4.335,6.12-2.3,5.609.765,19.124h2.8l9.689-11.219,2.8-8.159,3.825-1.275-.509-8.924,21.163-24.478-4.335-9.944,3.315-7.9-3.569-4.844,5.354-22.948Z"
										transform="translate(-4134.008 -1098.271)" fill="#fdbe34" />
                                            <path id="패스_586"
										data-name="패스 586"
										d="M4044.016,1779.13a32.359,32.359,0,0,1,4.219-1.38c2.613-.738,6.19-1.748,6.726-3.022a.935.935,0,0,0-.119-.877,14.9,14.9,0,0,0-3.114-3.337c-2.668-2.373-5.988-5.325-3.119-9.141,1.554-2.066,5.317-5.229,9.3-8.577,2.684-2.255,5.458-4.587,7.528-6.571,3.005-2.882,3.239-3.836,3.239-4.06a13.391,13.391,0,0,0-.709-3.435c-.76-2.609-1.706-5.857,1.072-7.8,2.708-1.9,8.9-3.573,11.912-2.006a2.936,2.936,0,0,1,1.665,2.7,6.232,6.232,0,0,0,2.179,4.417,3.354,3.354,0,0,0,1.254.766c.084-.417.277-1.047.535-1.89,1.124-3.669,3.758-12.262-.135-14.452-4.149-2.334-8.954-8.854-8-12.077.21-.712.884-1.886,3.031-1.752,1.7.106,3.963,1.162,6.587,2.384,4.112,1.915,9.228,4.3,12.467,2.791,1.509-.7,2.553-2.192,3.192-4.557q.255-.941.525-1.933c1.7-6.238,3.806-14,4.909-20.77,1.244-7.625.963-12.532-.833-14.585-2.676-3.058-4.712-11.229-5.726-17.856-.348-2.275-1.971-13.764.262-16.554.27-.338.6-1.4-.242-4.739-.044-.174-.09-.351-.138-.531l-.07,1.085a.68.68,0,0,1-.679.636h-5.3a.684.684,0,0,1-.32-.079l-2.955-1.573-5.858,1.628a.681.681,0,0,1-.582-.105l-2.925-2.127-1.775,7.1v10.869l4.238,4.564a.679.679,0,0,1,.169.6l-.68,3.4a.677.677,0,0,1-.174.335l-6.273,6.6v10.608a.68.68,0,0,1-.68.68h-7.973l-4.628,17.85a.68.68,0,0,1-.354.438l-5.208,2.6-7.044,17.778a.681.681,0,0,1-.248.311l-20.36,13.94-.028.018-18.572,11.431-3.606,17.79,6.119,16.828,15.7,9.689v8.16l10.561,1.784-.125-4.609C4041.889,1785.659,4040.748,1780.615,4044.016,1779.13Z"
										transform="translate(-3976.681 -1384.496)" fill="#fdbe34" />
                                        </g>
                                    </g>
                                </g>
                            </svg>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div id="panel-3" class="panel panel-locked" data-panel-sortable
				data-panel-collapsed data-panel-close>
				<div class="panel-hdr">
					<h2>
						Effective <span class="fw-300"><i>Marketing</i></span>
					</h2>
				</div>
				<div class="panel-container show">
					<div class="panel-content poisition-relative">
						<div class="pb-5 pt-3">
							<div class="row">
								<div class="col-6 col-xl-3 d-sm-flex align-items-center">
									<div class="p-2 mr-3 bg-info-200 rounded">
										<span class="peity-bar"
											data-peity="{&quot;fill&quot;: [&quot;#fff&quot;], &quot;width&quot;: 27, &quot;height&quot;: 27 }">3,4,5,8,2</span>
									</div>
									<div>
										<label class="fs-sm mb-0">Bounce Rate</label>
										<h4 class="font-weight-bold mb-0">37.56%</h4>
									</div>
								</div>
								<div class="col-6 col-xl-3 d-sm-flex align-items-center">
									<div class="p-2 mr-3 bg-info-300 rounded">
										<span class="peity-bar"
											data-peity="{&quot;fill&quot;: [&quot;#fff&quot;], &quot;width&quot;: 27, &quot;height&quot;: 27 }">5,3,1,7,9</span>
									</div>
									<div>
										<label class="fs-sm mb-0">Sessions</label>
										<h4 class="font-weight-bold mb-0">759</h4>
									</div>
								</div>
								<div class="col-6 col-xl-3 d-sm-flex align-items-center">
									<div class="p-2 mr-3 bg-success-300 rounded">
										<span class="peity-bar"
											data-peity="{&quot;fill&quot;: [&quot;#fff&quot;], &quot;width&quot;: 27, &quot;height&quot;: 27 }">3,4,3,5,5</span>
									</div>
									<div>
										<label class="fs-sm mb-0">New Sessions</label>
										<h4 class="font-weight-bold mb-0">12.17%</h4>
									</div>
								</div>
								<div class="col-6 col-xl-3 d-sm-flex align-items-center">
									<div class="p-2 mr-3 bg-success-500 rounded">
										<span class="peity-bar"
											data-peity="{&quot;fill&quot;: [&quot;#fff&quot;], &quot;width&quot;: 27, &quot;height&quot;: 27 }">6,4,7,5,6</span>
									</div>
									<div>
										<label class="fs-sm mb-0">Clickthrough</label>
										<h4 class="font-weight-bold mb-0">19.77%</h4>
									</div>
								</div>
							</div>
						</div>
						<div id="flotVisit" style="width: 100%; height: 208px;"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div id="panel-1" class="panel">
				<div class="panel-hdr">
					<h2>Marketing profits</h2>
				</div>
				<div class="panel-container show">
					<div class="panel-content bg-subtlelight-fade">
						<div id="js-checkbox-toggles" class="d-flex mb-3">
							<div class="custom-control custom-switch mr-2">
								<input type="checkbox" class="custom-control-input" name="gra-0"
									id="gra-0" checked="checked"> <label
									class="custom-control-label" for="gra-0">Target Profit</label>
							</div>
							<div class="custom-control custom-switch mr-2">
								<input type="checkbox" class="custom-control-input" name="gra-1"
									id="gra-1" checked="checked"> <label
									class="custom-control-label" for="gra-1">Actual Profit</label>
							</div>
							<div class="custom-control custom-switch mr-2">
								<input type="checkbox" class="custom-control-input" name="gra-2"
									id="gra-2" checked="checked"> <label
									class="custom-control-label" for="gra-2">User Signups</label>
							</div>
						</div>
						<div id="flot-toggles" class="w-100 mt-4" style="height: 300px"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div id="panel-4" class="panel">
				<div class="panel-hdr">
					<h2>
						고용동향<span class="fw-300"><i>지역구 및 연령대별 신규취업자수</i></span>
					</h2>
				</div>
				<div class="panel-container show">
					<div class="panel-content">
						<table id="dt-basic-example"
							class="table table-bordered table-hover table-striped w-100 dataTable dtr-inline">
							<thead class="">
								<tr>
									<th>기간</th>
									<th>지역구</th>
									<th>연령대</th>
									<th>신규취업자수 (천명)</th>
									<th>고용률</th>
								</tr>
							</thead>
							<c:if test="${empty empstatsList }">
								<tbody>
									<tr>
										<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
									</tr>
								</tbody>
							</c:if>
							<tbody>
								<c:forEach items="${empstatsList }" var="empstats">
									<tr>
										<td>${empstats.trendPeriod}</td>
										<td>${empstats.disCode}</td>
										<td>${empstats.ageCode}</td>
										<td>${empstats.trendCnt}명</td>
										<td>${empstats.trendRatio}%</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- datatable end -->
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div id="panel-4" class="panel">
				<div class="panel-hdr">
					<h2>
						고용동향<span class="fw-300"><i>지역구 및 연령대별 신규취업자수</i></span>
					</h2>
				</div>
				<div class="panel-container show">
					<div class="panel-content">
						<table id="dt-basic-example"
							class="table table-bordered table-hover table-striped w-100 dataTable dtr-inline">
							<thead class="">
								<tr>
									<th>기간</th>
									<th>지역구</th>
									<th>연령대</th>
									<th>신규취업자수 (천명)</th>
									<th>고용률</th>
								</tr>
							</thead>
							<c:if test="${empty empstatsList }">
								<tbody>
									<tr>
										<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
									</tr>
								</tbody>
							</c:if>
							<tbody>
								<c:forEach items="${empstatsList }" var="empstats">
									<tr>
										<td>${empstats.trendPeriod}</td>
										<td>${empstats.disCode}</td>
										<td>${empstats.ageCode}</td>
										<td>${empstats.trendCnt}명</td>
										<td>${empstats.trendRatio}%</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- datatable end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>
	<!-- this overlay is activated only when mobile menu is triggered -->
	<div class="page-content-overlay" data-action="toggle"
		data-class="mobile-nav-on"></div>
	<!-- END Page Content -->
	<!-- BEGIN Color profile -->
	<!-- this area is hidden and will not be seen on screens or screen readers -->
	<!-- we use this only for CSS color refernce for JS stuff -->
	<p id="js-color-profile" class="d-none">
		<span class="color-primary-50"></span> <span class="color-primary-100"></span>
		<span class="color-primary-200"></span> <span
			class="color-primary-300"></span> <span class="color-primary-400"></span>
		<span class="color-primary-500"></span> <span
			class="color-primary-600"></span> <span class="color-primary-700"></span>
		<span class="color-primary-800"></span> <span
			class="color-primary-900"></span> <span class="color-info-50"></span>
		<span class="color-info-100"></span> <span class="color-info-200"></span>
		<span class="color-info-300"></span> <span class="color-info-400"></span>
		<span class="color-info-500"></span> <span class="color-info-600"></span>
		<span class="color-info-700"></span> <span class="color-info-800"></span>
		<span class="color-info-900"></span> <span class="color-danger-50"></span>
		<span class="color-danger-100"></span> <span class="color-danger-200"></span>
		<span class="color-danger-300"></span> <span class="color-danger-400"></span>
		<span class="color-danger-500"></span> <span class="color-danger-600"></span>
		<span class="color-danger-700"></span> <span class="color-danger-800"></span>
		<span class="color-danger-900"></span> <span class="color-warning-50"></span>
		<span class="color-warning-100"></span> <span
			class="color-warning-200"></span> <span class="color-warning-300"></span>
		<span class="color-warning-400"></span> <span
			class="color-warning-500"></span> <span class="color-warning-600"></span>
		<span class="color-warning-700"></span> <span
			class="color-warning-800"></span> <span class="color-warning-900"></span>
		<span class="color-success-50"></span> <span class="color-success-100"></span>
		<span class="color-success-200"></span> <span
			class="color-success-300"></span> <span class="color-success-400"></span>
		<span class="color-success-500"></span> <span
			class="color-success-600"></span> <span class="color-success-700"></span>
		<span class="color-success-800"></span> <span
			class="color-success-900"></span> <span class="color-fusion-50"></span>
		<span class="color-fusion-100"></span> <span class="color-fusion-200"></span>
		<span class="color-fusion-300"></span> <span class="color-fusion-400"></span>
		<span class="color-fusion-500"></span> <span class="color-fusion-600"></span>
		<span class="color-fusion-700"></span> <span class="color-fusion-800"></span>
		<span class="color-fusion-900"></span>
	</p>
	<!-- END Color profile -->
	</div>
	</div>
	</div>
	<!-- END Page Wrapper -->


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
										<h3 class=&quot;popover-headerbg-transparent&quot;></h3><div
											class=&quot;popover-bodyfs-xs&quot;></div>
							</div>
							"><i class="fal fa-info-circle mr-1"></i> more info</a>
							</h5>
						</div>
					</div>
					<div class="expanded theme-colors pl-5 pr-3">
						<ul class="m-0">
							<li><a href="#" id="myapp-0" data-action="theme-update"
								data-themesave data-theme="" data-toggle="tooltip"
								data-placement="top" title="Wisteria (base css)"
								data-original-title="Wisteria (base css)"></a></li>
							<li><a href="#" id="myapp-1" data-action="theme-update"
								data-themesave data-theme="css/themes/cust-theme-1.css"
								data-toggle="tooltip" data-placement="top" title="Tapestry"
								data-original-title="Tapestry"></a></li>
							<li><a href="#" id="myapp-2" data-action="theme-update"
								data-themesave data-theme="css/themes/cust-theme-2.css"
								data-toggle="tooltip" data-placement="top" title="Atlantis"
								data-original-title="Atlantis"></a></li>
							<li><a href="#" id="myapp-3" data-action="theme-update"
								data-themesave data-theme="css/themes/cust-theme-3.css"
								data-toggle="tooltip" data-placement="top" title="Indigo"
								data-original-title="Indigo"></a></li>
							<li><a href="#" id="myapp-4" data-action="theme-update"
								data-themesave data-theme="css/themes/cust-theme-4.css"
								data-toggle="tooltip" data-placement="top" title="Dodger Blue"
								data-original-title="Dodger Blue"></a></li>
							<li><a href="#" id="myapp-5" data-action="theme-update"
								data-themesave data-theme="css/themes/cust-theme-5.css"
								data-toggle="tooltip" data-placement="top" title="Tradewind"
								data-original-title="Tradewind"></a></li>
							<li><a href="#" id="myapp-6" data-action="theme-update"
								data-themesave data-theme="css/themes/cust-theme-6.css"
								data-toggle="tooltip" data-placement="top" title="Cranberry"
								data-original-title="Cranberry"></a></li>
							<li><a href="#" id="myapp-7" data-action="theme-update"
								data-themesave data-theme="css/themes/cust-theme-7.css"
								data-toggle="tooltip" data-placement="top" title="Oslo Gray"
								data-original-title="Oslo Gray"></a></li>
							<li><a href="#" id="myapp-8" data-action="theme-update"
								data-themesave data-theme="css/themes/cust-theme-8.css"
								data-toggle="tooltip" data-placement="top" title="Chetwode Blue"
								data-original-title="Chetwode Blue"></a></li>
							<li><a href="#" id="myapp-9" data-action="theme-update"
								data-themesave data-theme="css/themes/cust-theme-9.css"
								data-toggle="tooltip" data-placement="top" title="Apricot"
								data-original-title="Apricot"></a></li>
							<li><a href="#" id="myapp-10" data-action="theme-update"
								data-themesave data-theme="css/themes/cust-theme-10.css"
								data-toggle="tooltip" data-placement="top" title="Blue Smoke"
								data-original-title="Blue Smoke"></a></li>
							<li><a href="#" id="myapp-11" data-action="theme-update"
								data-themesave data-theme="css/themes/cust-theme-11.css"
								data-toggle="tooltip" data-placement="top" title="Green Smoke"
								data-original-title="Green Smoke"></a></li>
							<li><a href="#" id="myapp-12" data-action="theme-update"
								data-themesave data-theme="css/themes/cust-theme-12.css"
								data-toggle="tooltip" data-placement="top"
								title="Wild Blue Yonder" data-original-title="Wild Blue Yonder"></a>
							</li>
							<li><a href="#" id="myapp-13" data-action="theme-update"
								data-themesave data-theme="css/themes/cust-theme-13.css"
								data-toggle="tooltip" data-placement="top" title="Emerald"
								data-original-title="Emerald"></a></li>
							<li><a href="#" id="myapp-14" data-action="theme-update"
								data-themesave data-theme="css/themes/cust-theme-14.css"
								data-toggle="tooltip" data-placement="top" title="Supernova"
								data-original-title="Supernova"></a></li>
							<li><a href="#" id="myapp-15" data-action="theme-update"
								data-themesave data-theme="css/themes/cust-theme-15.css"
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
									<h3 class=&quot;popover-headerbg-transparent&quot;></h3><div
										class=&quot;popover-bodyfs-xs&quot;></div>
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
	<!-- base vendor bundle: 
			 DOC: if you remove pace.js from core please note on Internet Explorer some CSS animations may execute before a page is fully loaded, resulting 'jump' animations 
						+ pace.js (recommended)
						+ jquery.js (core)
						+ jquery-ui-cust.js (core)
						+ popper.js (core)
						+ bootstrap.js (core)
						+ slimscroll.js (extension)
						+ app.navigation.js (core)
						+ ba-throttle-debounce.js (core)
						+ waves.js (extension)
						+ smartpanels.js (extension)
						+ src/../jquery-snippets.js (core) -->
	<script
		src="<%=request.getContextPath()%>/resources/template/js/vendors.bundle.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/template/js/app.bundle.js"></script>
	<script type="text/javascript">
		/* Activate smart panels */
		$('#js-page-content').smartPanel();
	</script>
	<!-- The order of scripts is irrelevant. Please check out the plugin pages for more details about these plugins below: -->
	<script
		src="<%=request.getContextPath()%>/resources/template/js/statistics/peity/peity.bundle.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/template/js/statistics/flot/flot.bundle.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/template/js/statistics/easypiechart/easypiechart.bundle.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/template/js/datagrid/datatables/datatables.bundle.js"></script>
	<script>
		/* defined datas */
		var dataTargetProfit = [ [ 1354586000000, 153 ],
				[ 1364587000000, 658 ], [ 1374588000000, 198 ],
				[ 1384589000000, 663 ], [ 1394590000000, 801 ],
				[ 1404591000000, 1080 ], [ 1414592000000, 353 ],
				[ 1424593000000, 749 ], [ 1434594000000, 523 ],
				[ 1444595000000, 258 ], [ 1454596000000, 688 ],
				[ 1464597000000, 364 ] ]
		var dataProfit = [ [ 1354586000000, 53 ], [ 1364587000000, 65 ],
				[ 1374588000000, 98 ], [ 1384589000000, 83 ],
				[ 1394590000000, 980 ], [ 1404591000000, 808 ],
				[ 1414592000000, 720 ], [ 1424593000000, 674 ],
				[ 1434594000000, 23 ], [ 1444595000000, 79 ],
				[ 1454596000000, 88 ], [ 1464597000000, 36 ] ]
		var dataSignups = [ [ 1354586000000, 647 ], [ 1364587000000, 435 ],
				[ 1374588000000, 784 ], [ 1384589000000, 346 ],
				[ 1394590000000, 487 ], [ 1404591000000, 463 ],
				[ 1414592000000, 479 ], [ 1424593000000, 236 ],
				[ 1434594000000, 843 ], [ 1444595000000, 657 ],
				[ 1454596000000, 241 ], [ 1464597000000, 341 ] ]
		var dataSet1 = [ [ 0, 10 ], [ 100, 8 ], [ 200, 7 ], [ 300, 5 ],
				[ 400, 4 ], [ 500, 6 ], [ 600, 3 ], [ 700, 2 ] ];
		var dataSet2 = [ [ 0, 9 ], [ 100, 6 ], [ 200, 5 ], [ 300, 3 ],
				[ 400, 3 ], [ 500, 5 ], [ 600, 2 ], [ 700, 1 ] ];

		$(document)
				.ready(
						function() {

							/* init datatables */
							$('#dt-basic-example')
									.dataTable(
											{
												responsive : true,
												dom : "<'row mb-3'<'col-sm-12 col-md-6 d-flex align-items-center justify-content-start'f><'col-sm-12 col-md-6 d-flex align-items-center justify-content-end'B>>"
														+ "<'row'<'col-sm-12'tr>>"
														+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
												buttons : [
														{
															extend : 'colvis',
															text : 'Column Visibility',
															titleAttr : 'Col visibility',
															className : 'btn-outline-default'
														},
														{
															extend : 'csvHtml5',
															text : 'CSV',
															titleAttr : 'Generate CSV',
															className : 'btn-outline-default'
														},
														{
															extend : 'copyHtml5',
															text : 'Copy',
															titleAttr : 'Copy to clipboard',
															className : 'btn-outline-default'
														},
														{
															extend : 'print',
															text : '<i class="fal fa-print"></i>',
															titleAttr : 'Print Table',
															className : 'btn-outline-default'
														}

												],
												columnDefs : [
														{
															targets : -1,
															title : '',
															orderable : false,
															render : function(
																	data, type,
																	full, meta) {

																/*
																-- ES6
																-- convert using https://babeljs.io online transpiler
																return `
																<a href='javascript:void(0);' class='btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1' title='Delete Record'>
																	<i class="fal fa-times"></i>
																</a>
																<div class='dropdown d-inline-block dropleft '>
																	<a href='#'' class='btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0' data-toggle='dropdown' aria-expanded='true' title='More options'>
																		<i class="fal fa-ellipsis-v"></i>
																	</a>
																	<div class='dropdown-menu'>
																		<a class='dropdown-item' href='javascript:void(0);'>Change Status</a>
																		<a class='dropdown-item' href='javascript:void(0);'>Generate Report</a>
																	</div>
																</div>`;
																	
																ES5 example below:	

																 */
																return "\n\t\t\t\t\t\t<a href='javascript:void(0);' class='btn btn-sm btn-icon btn-outline-danger rounded-circle mr-1' title='Delete Record'>\n\t\t\t\t\t\t\t<i class=\"fal fa-times\"></i>\n\t\t\t\t\t\t</a>\n\t\t\t\t\t\t<div class='dropdown d-inline-block dropleft'>\n\t\t\t\t\t\t\t<a href='#'' class='btn btn-sm btn-icon btn-outline-primary rounded-circle shadow-0' data-toggle='dropdown' aria-expanded='true' title='More options'>\n\t\t\t\t\t\t\t\t<i class=\"fal fa-ellipsis-v\"></i>\n\t\t\t\t\t\t\t</a>\n\t\t\t\t\t\t\t<div class='dropdown-menu'>\n\t\t\t\t\t\t\t\t<a class='dropdown-item' href='javascript:void(0);'>Change Status</a>\n\t\t\t\t\t\t\t\t<a class='dropdown-item' href='javascript:void(0);'>Generate Report</a>\n\t\t\t\t\t\t\t</div>\n\t\t\t\t\t\t</div>";
															},
														},

												]

											});

							/* flot toggle example */
							var flot_toggle = function() {

								var data = [ {
									label : "Target Profit",
									data : dataTargetProfit,
									color : color.info._400,
									bars : {
										show : true,
										align : "center",
										barWidth : 30 * 30 * 60 * 1000 * 80,
										lineWidth : 0,
										/*fillColor: {
											colors: [color.primary._500, color.primary._900]
										},*/
										fillColor : {
											colors : [ {
												opacity : 0.9
											}, {
												opacity : 0.1
											} ]
										}
									},
									highlightColor : 'rgba(255,255,255,0.3)',
									shadowSize : 0
								}, {
									label : "Actual Profit",
									data : dataProfit,
									color : color.warning._500,
									lines : {
										show : true,
										lineWidth : 2
									},
									shadowSize : 0,
									points : {
										show : true
									}
								}, {
									label : "User Signups",
									data : dataSignups,
									color : color.success._500,
									lines : {
										show : true,
										lineWidth : 2
									},
									shadowSize : 0,
									points : {
										show : true
									}
								} ]

								var options = {
									grid : {
										hoverable : true,
										clickable : true,
										tickColor : 'rgba(0,0,0,0.05)',
										borderWidth : 1,
										borderColor : 'rgba(0,0,0,0.05)'
									},
									tooltip : true,
									tooltipOpts : {
										cssClass : 'tooltip-inner',
										defaultTheme : false
									},
									xaxis : {
										mode : "time",
										tickColor : 'rgba(0,0,0,0.05)',
									},
									yaxes : {
										tickColor : 'rgba(0,0,0,0.05)',
										tickFormatter : function(val, axis) {
											return "$" + val;
										},
										max : 1200
									}

								};

								var plot2 = null;

								function plotNow() {
									var d = [];
									$("#js-checkbox-toggles")
											.find(':checkbox')
											.each(
													function() {
														if ($(this).is(
																':checked')) {
															d
																	.push(data[$(
																			this)
																			.attr(
																					"name")
																			.substr(
																					4,
																					1)]);
														}
													});
									if (d.length > 0) {
										if (plot2) {
											plot2.setData(d);
											plot2.draw();
										} else {
											plot2 = $.plot($("#flot-toggles"),
													d, options);
										}
									}

								}
								;

								$("#js-checkbox-toggles").find(':checkbox').on(
										'change', function() {
											plotNow();
										});
								plotNow()
							}
							flot_toggle();
							/* flot toggle example -- end*/

							/* flot area */
							var flotArea = $.plot($('#flot-area'), [ {
								data : dataSet1,
								label : 'New Customer',
								color : color.success._200
							}, {
								data : dataSet2,
								label : 'Returning Customer',
								color : color.info._200
							} ], {
								series : {
									lines : {
										show : true,
										lineWidth : 2,
										fill : true,
										fillColor : {
											colors : [ {
												opacity : 0
											}, {
												opacity : 0.5
											} ]
										}
									},
									shadowSize : 0
								},
								points : {
									show : true,
								},
								legend : {
									noColumns : 1,
									position : 'nw'
								},
								grid : {
									hoverable : true,
									clickable : true,
									borderColor : '#ddd',
									tickColor : 'rgba(0,0,0,0.05)',
									aboveData : true,
									borderWidth : 0,
									labelMargin : 5,
									backgroundColor : 'transparent'
								},
								yaxis : {
									tickLength : 1,
									min : 0,
									max : 15,
									color : '#eee',
									tickColor : 'rgba(0,0,0,0.05)',
									font : {
										size : 0,
										color : '#999'
									}
								},
								xaxis : {
									tickLength : 1,
									color : '#eee',
									tickColor : 'rgba(0,0,0,0.05)',
									font : {
										size : 10,
										color : '#999'
									}
								}

							});
							/* flot area -- end */

							var flotVisit = $.plot('#flotVisit', [
									{
										data : [ [ 3, 0 ], [ 4, 1 ], [ 5, 3 ],
												[ 6, 3 ], [ 7, 10 ], [ 8, 11 ],
												[ 9, 12 ], [ 10, 9 ],
												[ 11, 12 ], [ 12, 8 ],
												[ 13, 5 ] ],
										color : color.success._200
									},
									{
										data : [ [ 1, 0 ], [ 2, 0 ], [ 3, 1 ],
												[ 4, 2 ], [ 5, 2 ], [ 6, 5 ],
												[ 7, 8 ], [ 8, 12 ], [ 9, 9 ],
												[ 10, 11 ], [ 11, 5 ] ],
										color : color.info._200
									} ], {
								series : {
									shadowSize : 0,
									lines : {
										show : true,
										lineWidth : 2,
										fill : true,
										fillColor : {
											colors : [ {
												opacity : 0
											}, {
												opacity : 0.12
											} ]
										}
									}
								},
								grid : {
									borderWidth : 0
								},
								yaxis : {
									min : 0,
									max : 15,
									tickColor : 'rgba(0,0,0,0.05)',
									ticks : [ [ 0, '' ], [ 5, '100K' ],
											[ 10, '200K' ], [ 15, '300K' ] ],
									font : {
										color : '#444',
										size : 10
									}
								},
								xaxis : {

									tickColor : 'rgba(0,0,0,0.05)',
									ticks : [ [ 2, '2am' ], [ 3, '3am' ],
											[ 4, '4am' ], [ 5, '5am' ],
											[ 6, '6am' ], [ 7, '7am' ],
											[ 8, '8am' ], [ 9, '9am' ],
											[ 10, '1pm' ], [ 11, '2pm' ],
											[ 12, '3pm' ], [ 13, '4pm' ] ],
									font : {
										color : '#999',
										size : 9
									}
								}
							});

						});
	</script>
	
</body>
<!-- END Body -->
</html>
