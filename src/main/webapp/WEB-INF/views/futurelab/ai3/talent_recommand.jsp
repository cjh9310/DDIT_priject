<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date">
	<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" />
</c:set>

<style>
.ai-content {
	width: 100%;
	height: 490px;
	overflow: auto;
	padding: 30px 80px 30px 80px;
}

.ai-info {
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

.airesult-area {
	width: 100%;
	height: 965px;
}

.detailForm_load {
	cursor: pointer;
}
</style>

<main id="js-page-content" role="main" class="page-content">
<div class="row">
	<div class="col-xl-4 col-lg-4">
		<div class="card mb-g">
			<div class="recruit-head panel-conteiner">
				<div class="row w-100 p-0 m-0 h-100" style="background-image:url('<%=request.getContextPath()%>/resources/template/img/ai/ai_talent.png'); background-size:cover;">
					
				</div>
			</div>
		</div>

		<div class="card mb-g">
			<div class="ai-info panel-conteiner">
				<div class="row w-100 p-0 m-0 h-100">
					<div class="custom-scroll ai-content">
						<div class="panel-content" style="margin-right: 10px;">
							<form id="talentForm">
								<div class="form-group">
								<input type="hidden" name="co_id" value="${loginUser.id}" />
									<label class="form-label" for="single-default"> 업종 선택 </label>
									<select name="input1" class="select2 form-control w-100"
										id="single-default">
										<optgroup label="업종">
											<option value="0">서비스업</option>
											<option value="1">제조·화학</option>
											<option value="2">IT·웹·통신</option>
											<option value="3">은행·금융업</option>
											<option value="4">미디어·디자인</option>
											<option value="5">교육업</option>
											<option value="6">의료·제약·복지</option>
											<option value="7">판매·유통</option>
											<option value="8">건설업</option>
											<option value="9">기관·협회</option>
										</optgroup>
									</select>
								</div>
								<div class="form-group">
									<label class="form-label" for="single-label"> 연차범위 선택 </label>
									<select name="input2" class="select2 form-control"
										id="single-label">
										<optgroup label="연차범위">
											<option value="0">0 ~ 3년차</option>
											<option value="1">4 ~ 7년차</option>
											<option value="2">8 ~ 11년차</option>
											<option value="3">12 ~ 15년차</option>
											<option value="4">16 ~ 19년차</option>
											<option value="5">20 ~ 23년차</option>
											<option value="6">24 ~ 27년차</option>
											<option value="7">28 ~ 31년차</option>
											<option value="8">32 ~ 35년차</option>
											<option value="9">36 ~ 40년차</option>
										</optgroup>
									</select>
								</div>
								<div class="form-group">
									<label class="form-label" for="single-placeholder">
										학점범위 선택 </label> <select name="input3"
										class="select2-placeholder form-control"
										id="single-placeholder">
										<optgroup label="학점범위">
											<option value="0">고졸</option>
											<option value="1">0.0 ~ 1.0점</option>
											<option value="2">1.1 ~ 1.5점</option>
											<option value="3">1.6 ~ 2.0점</option>
											<option value="4">2.1 ~ 2.5점</option>
											<option value="5">2.6 ~ 3.0점</option>
											<option value="6">3.1 ~ 3.5점</option>
											<option value="7">3.6 ~ 4.0점</option>
											<option value="8">4.1 ~ 4.4점</option>
											<option value="9">4.5 만점</option>
										</optgroup>
									</select>
								</div>
								<div class="w-100">
									<div class="text-center">
										<button class="btn btn-outline-success waves-effect waves-themed w-100" 
			        							type="button" id="talentSubmit" onclick="ai5_submit()">AI에게 인재 리스트 받아보기</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card mb-g p-0">
			<div class="card-body p-0">
				<div class="custom-scroll ai-content">
					<div class="panel-content" style="width:430px;">
						<video muted autoplay
							style="display: block; width: auto; height: 100%; margin-left: 40px;">
							<source
								src="<%=request.getContextPath()%>/resources/template/media/video/tensorflow_crop.mp4"
								type="video/mp4">
							<strong>Your browser does not support the video tag.</strong>
						</video>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-8 col-lg-8">
		<div class="row">
			<div class="col-lg-12 col-xl-12">
				<div id="panel-1" class="panel">
					<div class="panel-hdr">
						<h2>AI의 인재 추천 리스트</h2>
					</div>
					<div>
						<div class="col-xl-12 panel airesult-area" style="padding: 0px;">
							<div class="custom-scroll" style="height:100%;">
								<div class="p-3" style="background-image:url('<%=request.getContextPath()%>/resources/template/img/ai/aiTexture.png'); background-repeat:no-repeat;">
									<div class="row w-100" id="ai5panel" style="margin:0px; padding:0px;">


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
</main>
<%@ include file="/WEB-INF/views/futurelab/ai_js.jsp" %>


