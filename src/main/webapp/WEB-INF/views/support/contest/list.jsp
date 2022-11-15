<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<c:set var="contestList" value="${dataMap.contestList }" />
<c:set var="count" value="${dataMap.totalCnt }" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyyMMdd" /></c:set>

<style>
.card-img-top {
	height: 593px;
}
	
.card-body {
	display: block;
}

.card-title {
	width: 334px;
	height: 19.5px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.card-text {
	width: 334px;
	height: 19.5px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>

<main id="js-page-content" role="main" class="page-content">
	<div class="row">
		<div class="col-xl-12">
			<!-- Card decks -->
			<div id="panel-11" class="panel">
				<div class="panel-hdr">
					<h2>
						공모전 <span class="fw-300"></span>
					</h2>
				</div>
				<div class="panel-container show">
					<div class="row" style="padding: 16px 32px 16px 32px;">
						<c:forEach items="${contestList}" var="contest">
							
							<div class="panel-content col-3">
								<div class="card-deck">
									<div class="card">
										<img
											src="<%=request.getContextPath()%>/resources/template/img/support/contest/공모전11.png" class="card-img-top" alt="...">
										<%-- <img src="${contestList[i].imgURL }" class="card-img-top" alt="..."> --%>

										<div class="card-body demo" style="height: 155.87px;">
											<h4 class="card-title" data-toggle="tooltip"
												data-placement="top" title=""
												data-original-title="${contest.conTitle }">${contest.conTitle }</h4>
											<div>
												<span class="card-text"> 
												공모기간 : <fmt:formatDate value="${contest.conSdate }" pattern="yyyy-MM-dd" /> 
														~ <fmt:formatDate value="${contest.conEdate }" pattern="yyyy-MM-dd" />
												</span>
												<c:if test="${contest.conSdate <= now and contest.conEdate >= now }">
													<span class="badge badge-info badge-pill">진행중</span>
												</c:if>
												<c:if test="${contest.conEdate < now }">
													<span class="badge badge-secondary badge-pill">마감</span>
												</c:if>
											</div>
											<div style="text-align: center;">
												<c:if test="${contest.conSdate <= now and contest.conEdate >= now }">
													<button class="btn btn-success btn-pills waves-effect waves-themed detailBtn" type="button" id="detailBtn" value="${contest.conNo }">응모하기</button>
												</c:if>
											</div>
										</div>
										<div class="card-footer text-right">
											<div>
												<fmt:parseNumber value="${now.time /(1000*60*60*24) }" integerOnly="true" var="sysDate" />
												<fmt:parseNumber value="${contest.conEdate.time /(1000*60*60*24)+1 }" integerOnly="true" var="conED" />
												<c:choose>
													<c:when test="${conED-sysDate < 0 }">
														<span class="badge badge-secondary badge-pill">
															끝나써용!
														</span>
													</c:when>
													<c:when test="${conED-sysDate == 0 }">
														<span class="badge badge-warning badge-pill">
															마감 D-day
														</span>
													</c:when>
													<c:when test="${ conED-sysDate < 4 and conED-sysDate ne 0 }">
														<span class="badge badge-danger badge-pill">
															마감임박 D-${conED-sysDate}
														</span>
													</c:when>
													<c:when test="${conED-sysDate >= 4  }">
														<span class="badge badge-warning badge-pill">
															마감 D-${conED-sysDate}
														</span>
													</c:when>
												</c:choose>
<%-- 												<c:if test="${conED-sysDate == 0 }"> --%>
<!-- 													<span class="badge badge-danger badge-pill"> -->
<!-- 														마감 D-day -->
<!-- 													</span> -->
<%-- 												</c:if> --%>
<%-- 												 <c:if test="${conED-sysDate < 0 and conED-sysDate < 4 and conED-sysDate ne 0 }"> --%>
<!-- 													<span class="badge badge-danger badge-pill"> -->
<%-- 														마감임박 D-${conED-sysDate} --%>
<!-- 													</span> -->
<%-- 												</c:if> --%>
<%-- 												 <c:if test="${conED-sysDate >= 4  }"> --%>
<!-- 													<span class="badge badge-warning badge-pill"> -->
<%-- 														마감 D-${conED-sysDate} --%>
<!-- 													</span> -->
<%-- 												</c:if> --%>
<%-- 												 <c:if test="${conED-sysDate < 0 }"> --%>
<!-- 													<span> -->
<!-- 														끝나써용! -->
<!-- 													</span> -->
<%-- 												</c:if> --%>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<script>
$('.detailBtn').on('click',function() {
	alert("아왜안돼");
	var conNo = $(this).val();
	alert(conNo);
	//onclick="OpenWindow('detail.do','공모전 신청화면',990,920)"
	window.open('detail.do?conNo='+conNo, '공모전 신청화면', 990,920);
});
</script>
