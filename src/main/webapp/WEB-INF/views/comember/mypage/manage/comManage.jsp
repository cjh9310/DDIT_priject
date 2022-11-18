<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="card-header py-2 d-flex align-items-center flex-wrap">
	<div class="card-title">사업자등록증 등록하고 기본정보 업데이트하기</div>
	<button onclick="nonCheck_reload()"
		class="btn btn-xs btn-icon width-1 fs-xl btn-primary ml-auto waves-effect waves-themed">
		<i class="fal fa-reply"></i>
	</button>
</div>
<form id="licenceFileForm" method="post" enctype="multipart/form-data">
	<div class="panel-content" style="height: 70px;">
		파일 : <input type="file" name='file' id="licenceFile" />	
		<button type="button" onclick="licenceFileUpload()" id="licenceFileSubmit"
			class="btn btn-xs btn-info ml-auto waves-effect waves-themed">
			파일 등록</button>
	</div>
</form>
<div class="card-header py-2 d-flex align-items-center flex-wrap">
	<div class="card-title">기본정보 수정 중</div>
	<button type="button" value="${cer.cerNo}" id="comembermodifyBtn"
		name="cerModifyForm"
		class="modifyForm_load btn btn-xs btn-icon width-1 fs-xl btn-success ml-auto waves-effect waves-themed">
		<i class="fal fa-check"></i>
	</button>
	<button onclick="nonCheck_reload()"
		class="btn btn-xs btn-icon width-1 fs-xl btn-primary ml-1 waves-effect waves-themed">
		<i class="fal fa-reply"></i>
	</button>
</div>
<form class="needs-validation" novalidate="" method="post" id="comembermodifyForm">
	<div class="row">
		<div class="col-xl-6">
			<div class="panel-content">
				<div class="form-group">
					<label class="form-label" for="simpleinput">기업 이름</label> <input
						type="text" class="form-control"name="coNm" value="${loginUser.coNm }" readonly/>
				</div>
				<div class="form-group">
					<label class="form-label" for="example-email-2">주소</label> <input
						type="text" name="coAddr" class="form-control" value="${loginUser.coAddr }"/>
				</div>
				<div class="form-group">
					<label class="form-label" for="example-password">우편번호</label> <input
						type="text" name="coAddrno"class="form-control" value="${loginUser.coAddrno }"/>
				</div>
			</div>
		</div>
		<div class="col-xl-6">
			<div class="panel-content">
				<div class="form-group">
					<label class="form-label" for="simpleinput">사업자번호</label> <input
						type="text" class="form-control" name="coRegNo" value="${loginUser.coRegNo }" />
				</div>
				<div class="form-group">
					<label class="form-label" for="example-password">상세 주소</label> <input
						type="text"name="coDeaddr"class="form-control" value="${loginUser.coDeaddr }"/>
				</div>
				<div class="form-group">
					<label class="form-label" for="example-email-2">>홈페이지 주소</label> <input
						type="text" name="coLink" class="form-control" value="${loginUser.coLink }"/>
				</div>
				
			</div>
		</div> 
	</div>
</form>
<%--  <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
--%>


<%@ include file="/WEB-INF/views/comember/comember_js.jsp"%>