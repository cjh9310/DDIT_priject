<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 이거 밑에 response 필요 -->
<%
	response.setHeader("Access-Control-Allow-Origin", "*");
%>

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>

		<div class="panel-content page-wrapper auth">
			<iframe style="width:100%; height:auto;" src="http://127.0.0.1:5005/video"></iframe>
		</div>

<!-- 이거 밑에 script 필요 -->
<%@ include file="/WEB-INF/views/indmember/indmember_js.jsp"%>
