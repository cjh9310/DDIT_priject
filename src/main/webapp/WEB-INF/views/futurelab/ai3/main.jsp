<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>

<style>
.card-body {
	height: 334px;
}

.ai-spaced {
	height: 90px;
}
</style>

<main id="js-page-content" role="main" class="page-content">
<div class="row">
	<div class="card mb-4 w-100">
		<div
			class="card-body p-4 rounded position-relative align-items-center">
			<div class="d-flex align-items-center mb-g">
				<div class="p-0"
					style="width: 48.89px; height: 48.89px; margin-right: 10px;">
					<video muted autoplay
						style="display: block; width: auto; height: 100%;">
						<source
							src="<%=request.getContextPath()%>/resources/template/media/video/tensorflow_crop.mp4"
							type="video/mp4">
						<strong>Your browser does not support the video tag.</strong>
					</video>
				</div>
				<h1 class="fw-300 m-0 l-h-n">
					<span class="text-contrast"> AI Service List </span> <small
						class="fw-300 m-0 l-h-n"> 준비되어있는 AI Service 리스트를 살펴보세요. </small>
				</h1>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<ul class="mt-xs-3 list-spaced">
						<li>국가 통계 기반 고용동향 예측</li>
						<li>스크랩 정보를 통한 인재 추천</li>
						<li>학과 및 학점 정보를 통한 공모전 추천</li>
					</ul>
				</div>
				<div class="col-lg-6">
					<ul class="mt-xs-3 list-spaced">
						<li>학과 및 학점 정보를 통한 채용공고 추천</li>
						<li>업종 및 연차 정보를 통한 연봉 추천</li>
						<li>검색기록을 통한 강소기업 추천</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<!-- Start 고용동향 예측 -->
		<div class="col-xl-4 mb-4">
			<div class="card h-100 rounded overflow-hidden">
				<div class="card-body p-4">
					<div class="d-flex align-items-center mb-g">
						<img
							src="<%=request.getContextPath()%>/resources/template/img/demo/laravel.png"
							class="mr-3">
						<h1 class="fw-300 m-0 l-h-n">
							<span class="text-contrast">국가 통계 기반 고용동향 예측</span> <small
								class="fw-300 m-0 l-h-n"> Prediction of Employment
								Trends Based</small>
						</h1>
					</div>
					<div class="col">
						고용동향을 통해 보다 전략적인 취업 계획을 수립하세요.
						<ul class="mt-3 list-spaced ai-spaced">
							<li>Python - Tensorflow 기반 추천 서비스</li>
							<li>지역 및 연령대별 실업률/고용률/경제활동참가율 기반</li>
							<li>고용 관련 지표에 대한 향후 예측치를 제공해드립니다.</li>
						</ul>
						<br> <a
							href="<%=request.getContextPath()%>/recruit/empstats.do"
							class="btn btn-sm btn-outline-primary"> AI의 고용동향 예측 이용하기</a>
					</div>
				</div>
			</div>
		</div>
		<!-- End 고용동향 예측 -->
		<!-- Start 인재추천 -->
		<div class="col-xl-4 mb-4">
			<div class="card h-100 rounded overflow-hidden">
				<div class="card-body p-4">
					<div class="d-flex align-items-center mb-g">
						<img
							src="<%=request.getContextPath()%>/resources/template/img/demo/laravel.png"
							class="mr-3">
						<h1 class="fw-300 m-0 l-h-n">
							<span class="text-contrast">스크랩 정보를 통한 인재 추천</span> <small
								class="fw-300 m-0 l-h-n">Recommendation of talent through scrap information
							</small>
						</h1>
					</div>
					<div class="col">
						자사에 가장 적합한 인재상을 찾아보세요.
						<ul class="mt-3 list-spaced ai-spaced">
							<li>Python - Tensorflow 기반 추천 서비스</li>
							<li>기업회원 전용 - 인재 즐겨찾기 기반</li>
							<li>기업이 원하는 인재상에 맞는 인재를 추천해드립니다.</li>
						</ul>
						<br> <a
							href="javascript:window.open('talent/recommand.do','OpenWindow','height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');"
							class="btn btn-sm btn-outline-primary">AI의 인재 추천 이용하기</a>
					</div>
				</div>
			</div>
		</div>
		<!-- End 인재추천 -->
		<div class="col-xl-4 mb-4">
			<div class="card h-100 rounded overflow-hidden position-relative">
				<div class="card-body p-4">
					<div class="d-flex align-items-center mb-g">
						<img
							src="<%=request.getContextPath()%>/resources/template/img/demo/laravel.png"
							class="mr-3">
						<h1 class="fw-300 m-0 l-h-n">
							<span class="text-contrast">학과 및 자격증 정보를 통한 공모전 추천</span> <small
								class="fw-300 m-0 l-h-n">Recommendation of edu and certificate information</small>
						</h1>
					</div>
					<div class="col">
						당신의 이력에 빛을 더해줄 공모전을 찾아보세요.
						<ul class="mt-3 list-spaced ai-spaced">
							<li>Python - Tensorflow 기반 추천 서비스</li>
							<li>개인회원 전용 - 학과 및 자격증 정보 기반</li>
							<li>당신을 더욱 빛나게 해줄 공모전을 추천해드립니다.</li>
						</ul>
						<a
							href="javascript:window.open('contest/recommand.do','OpenWindow','height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');"
							class="btn btn-sm btn-outline-primary">AI의 공모전 추천 이용하기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-4 mb-4">
			<!-- Ajax Flavor -->
			<div class="card h-100 rounded overflow-hidden position-relative">
				<div class="card-body p-4">
					<div class="d-flex align-items-center mb-g">
						<img
							src="<%=request.getContextPath()%>/resources/template/img/demo/laravel.png"
							class="mr-3">
						<h1 class="fw-300 m-0 l-h-n">
							<span class="text-contrast"> 학과 및 학점을 통한 채용공고 추천 </span> <small
								class="fw-300 m-0 l-h-n">Recommendation of job openings through education information</small>
						</h1>
					</div>
					<div class="col">
						나에게 맞는 채용공고를 추천 받아보세요.
						<ul class="mt-3 list-spaced ai-spaced">
							<li>Python - Tensorflow 기반 추천 서비스</li>
							<li>개인회원 전용 - 학과 및 학점 정보 기반</li>
							<li>취업을 원하는 당신에게 맞춤형 채용공고를 추천해드립니다.</li>
						</ul>
						<a
							href="javascript:window.open('recruit/recommand.do','OpenWindow','height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');"
							class="btn btn-sm btn-outline-primary">AI의 채용공고 추천 이용하기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-4 mb-4">
			<!-- Ajax Flavor -->
			<div class="card h-100 rounded overflow-hidden position-relative">
				<div class="card-body p-4">
					<div class="d-flex align-items-center mb-g">
						<img
							src="<%=request.getContextPath()%>/resources/template/img/demo/laravel.png"
							class="mr-3">
						<h1 class="fw-300 m-0 l-h-n">
							<span class="text-contrast"> 업종 및 연차 정보를 통한 연봉 추천 </span> <small
								class="fw-300 m-0 l-h-n">Annual salary recommendations based on industry information</small>
						</h1>
					</div>
					<div class="col">
						업종 및 연차 범위 별 통상적인 연봉을 알아보세요.
						<ul class="mt-3 list-spaced ai-spaced">
							<li>Python - Tensorflow 기반 추천 서비스</li>
							<li>업종 및 연차 정보 기반</li>
							<li>나에게 맞는 적정 연봉 수준을 알아보세요.</li>
						</ul>
						<a
							href="javascript:window.open('salary/recommand.do','OpenWindow','height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');"
							class="btn btn-sm btn-outline-primary"> AI의 연봉 추천 이용하기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-4 mb-4">
			<!-- Ajax Flavor -->
			<div class="card h-100 rounded overflow-hidden position-relative">
				<div class="card-body p-4">
					<div class="d-flex align-items-center mb-g">
						<img
							src="<%=request.getContextPath()%>/resources/template/img/demo/laravel.png"
							class="mr-3">
						<h1 class="fw-300 m-0 l-h-n">
							<span class="text-contrast"> 검색 기록을 통한 강소기업 추천 </span> <small
								class="fw-300 m-0 l-h-n">Recommended for small businesses through search history</small>
						</h1>
					</div>
					<div class="col">
						우리 지역의 강소기업을 추천 받아보세요.
						<ul class="mt-3 list-spaced ai-spaced">
							<li>Python - Tensorflow 기반 추천 서비스</li>
							<li>개인회원 전용 - 검색기록 기반</li>
							<li>우리 지역의 비전있고 튼튼한 기업을 추천해드립니다.</li>
						</ul>
						<a
							href="javascript:window.open('company/recommand.do','OpenWindow','height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');"
							class="btn btn-sm btn-outline-primary"> AI의 강소기업 추천 이용하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</main>
