<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="card-header py-2 d-flex align-items-center flex-wrap">
	<div class="card-title">기본정보 수정 중</div>
	<button type="button" value="${cer.cerNo}" id="indmembermodifyBtn"
		name="cerModifyForm"
		class="modifyForm_load btn btn-xs btn-icon width-1 fs-xl btn-success ml-auto waves-effect waves-themed">
		<i class="fal fa-check"></i>
	</button>
	<button onclick="nonCheck_reload()"
		class="btn btn-xs btn-icon width-1 fs-xl btn-primary ml-1 waves-effect waves-themed">
		<i class="fal fa-reply"></i>
	</button>
</div>
<form class="needs-validation" novalidate="" method="post" id="indmembermodifyForm">
	<div class="row">
		<div class="col-xl-6">
			<div class="panel-content">
				<div class="form-group">
					<label class="form-label" for="simpleinput">NAME</label> <input
						type="text" class="form-control"name="name"/>
				</div>
				<div class="form-group">
					<label class="form-label" for="example-email-2">BIRTH</label> <input
						type="text" name="indBir" class="form-control" />
				</div>
				<div class="form-group">
					<label class="form-label" for="example-password">GENDER</label> <input
						type="text" name="indGender"class="form-control" placeholder="M 혹은 W만 작성하세요"/>
				</div>
			</div>
		</div>
		<div class="col-xl-6">
			<div class="panel-content">
				<div class="form-group">
					<label class="form-label" for="simpleinput">ADDRESS</label> <input
						type="text" class="form-control" name="indAddr"/>
				</div>
				<div class="form-group">
					<label class="form-label" for="example-password">TEL</label> <input
						type="text"name="tel"class="form-control"/>
				</div>
				<div class="form-group">
					<label class="form-label" for="example-email-2">E-MAIL</label> <input
						type="email" name="email"
						class="form-control" placeholder="Email"/>
				</div>
				
			</div>
		</div> 
	</div>
</form>
<%--  <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
--%>


<%@ include file="/WEB-INF/views/indmember/indmember_js.jsp"%>