<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="card-header py-2 d-flex align-items-center flex-wrap">
	<div class="card-title">${loginUser.name} 회원님의 사업자등록증</div>
	<button onclick="nonCheck_reload()"
		class="btn btn-xs btn-icon width-1 fs-xl btn-primary ml-auto waves-effect waves-themed">
		<i class="fal fa-reply"></i>
	</button>
</div>
<div class="img-container w-100">
	<img id="image" style="display: block; height: 100%; width: auto;"
		src="http://localhost/ddit/comember/mypage/licence.do?folder=${loginUser.id}&filename=${loginUser.id}.jpg"
		onerror="this.onerror=null; this.src='http://localhost/ddit/comember/mypage/licence.do?folder=alt&filename=alt.jpg';"
		alt="대체 이미지가 로드되지 않았습니다." />
</div>


<%@ include file="/WEB-INF/views/comember/comember_js.jsp"%>