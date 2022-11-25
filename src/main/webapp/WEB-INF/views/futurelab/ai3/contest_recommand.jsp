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
				<div class="row w-100 p-0 m-0 h-100" style="background-image:url('<%=request.getContextPath()%>/resources/template/img/ai/ai_contest.png'); background-size:cover;">
					
				</div>
			</div>
		</div>

		<div class="card mb-g">
			<div class="ai-info panel-conteiner">
				<div class="row w-100 p-0 m-0 h-100">
					<div class="custom-scroll ai-content">
						<div class="panel-content" style="margin-right: 10px;">
							<form id="contestForm">
							<div class="form-group">
								<label class="form-label" for="single-default"> 학과선택 </label> <select
									name="input1" class="select2 form-control w-100"
									id="single-default">
									<optgroup label="업종">
										<option value="0">(고졸) 인문계열</option>
										<option value="1">(고졸) 실업계열</option>
										<option value="2">(고졸) 예체능계열</option>
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
								<label class="form-label" for="single-label"> (국가기술) 자격증
								</label> <select name="input2" class="select2 form-control"
									id="single-label">
									<optgroup label="연차범위">
										<option value="0">경영,회계,사무</option>
										<option value="1">보건,의료</option>
										<option value="2">사회복지,종교</option>
										<option value="3">문화,예술,디자인,방송</option>
										<option value="4">운전,운송</option>
										<option value="5">영업,판매</option>
										<option value="6">이용,숙박,여행,오락,스포츠</option>
										<option value="7">음식서비스</option>
										<option value="8">건설</option>
										<option value="9">광업자원</option>
										<option value="9">기계</option>
										<option value="9">재료</option>
										<option value="9">화학</option>
										<option value="9">섬유,의복</option>
										<option value="9">전기,전자</option>
										<option value="9">정보통신</option>
										<option value="9">식품,가공</option>
										<option value="9">인쇄,목재,가구,공예</option>
										<option value="9">농림어업</option>
										<option value="9">안전관리</option>
										<option value="9">환경,에너지</option>
									</optgroup>
								</select>
							</div>
							<div class="w-100">
								<div class="text-center">
									<button class="btn btn-outline-success waves-effect waves-themed w-100" 
			        						type="button" id="contestSubmit" onclick="ai1_submit()">AI에게 공모전 추천 받아보기</button>
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
						<h2>AI의 공모전 추천 리스트</h2>
					</div>
					<div>
						<div class="col-xl-12 panel airesult-area" style="padding: 0px;">
							<div class="custom-scroll" style="height:100%;">
								<div class="p-3" style="background-image:url('<%=request.getContextPath()%>/resources/template/img/ai/aiTexture.png'); background-repeat:no-repeat;">
									<div class="row" id="ai1panel">


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


