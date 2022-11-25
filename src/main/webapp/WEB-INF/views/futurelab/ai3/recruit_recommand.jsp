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
				<div class="row w-100 p-0 m-0 h-100" style="background-image:url('<%=request.getContextPath()%>/resources/template/img/ai/ai_recruit.png'); background-size:cover;">
					
				</div>
			</div>
		</div>

		<div class="card mb-g">
			<div class="ai-info panel-conteiner">
				<div class="row w-100 p-0 m-0 h-100">
					<div class="custom-scroll ai-content">
						<div class="panel-content" style="margin-right: 10px;">
							<form id="recruitForm">
								<div class="form-group">
								 	<input type="hidden" id="indId" name="indId" value="${loginUser.id}"/>
									<label class="form-label" for="single-default"> 학과계열 선택 </label>
									<select name="input1" class="select2 form-control w-100"
										id="single-default">
										<optgroup label="업종">
											<option value="0">고교 인문계열</option>
											<option value="1">고교 실업계열</option>
											<option value="2">고교 예체능계열</option>
											<option value="3">인문계열</option>
											<option value="4">사회계열</option>
											<option value="5">교육계열</option>
											<option value="6">자연계열</option>
											<option value="7">공학계열</option>
											<option value="8">의약계열</option>
											<option value="9">예체능계열</option>
										</optgroup>
									</select>
								</div>
								<div class="form-group">
									<label class="form-label" for="single-label"> 학점범위 선택 </label>
									<select name="input2" class="select2 form-control"
										id="single-label">
										<optgroup label="연차범위">
											<option value="0">고졸</option>
											<option value="1">2.1 ~ 2.5</option>
											<option value="2">2.6 ~ 3.0</option>
											<option value="3">3.1 ~ 3.5</option>
											<option value="4">3.6 ~ 4.0</option>
											<option value="5">4.1 ~ 4.5</option>
										</optgroup>
									</select>
								</div>
								<div class="w-100">
									<div class="text-center">
										<button class="btn btn-outline-success waves-effect waves-themed w-100" 
			        							type="button" id="recruitSubmit" onclick="ai4_submit()">AI에게 채용공고 리스트 받아보기</button>
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
						<h2>AI의 채용공고 추천 리스트</h2>
					</div>
					<div>
						<div class="col-xl-12 panel airesult-area" style="padding: 0px;">
							<div class="custom-scroll" style="height:100%;">
								<div class="p-3" style="background-image:url('<%=request.getContextPath()%>/resources/template/img/ai/aiTexture.png'); background-repeat:no-repeat;">
									<div class="row w-100" id="ai4panel" style="margin:0px; padding:0px;">


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


