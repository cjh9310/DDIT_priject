<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<c:set var="contest" value="${contest }"></c:set>


<div class="panel-hdr">
	<div class="col-lg-6">
		<h2>공모전 지원자 목록 ${contest.coTitle }</h2>
	</div>
	<div class="col-lg-6">
		<div class="float-right">
			<!-- 버튼 들어갈 자리 -->
		</div>
	</div>
</div>
<div class="panel-container show">
	<div style="margin-bottom: 30px;"></div>
	<div class="panel-content" style="height: 300px;">
		<div class="frame-wrap" style="overflow: auto; height: 180px;">
			<table class="table table-sm table-hover m-0">
				<thead class="text-center">
					<tr>
						<th>No</th>
						<th>지원일자</th>
						<th>지원자명</th>
						<th>연락처</th>
						<th>첨부파일</th>
						<th>가산점</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr class="text-center" style="cursor: pointer">
						<th scope="row">1</th>
						<td>2022-10-18</td>
						<td>김땡땡</td>
						<td>010-1234-5678</td>
						<td>-</td>
						<td><select class="form-control" id="contest_score_select">
								<option>0</option>
								<option>1</option>
						</select></td>
						<td><a href="javascript:void(0);"
							class="btn btn-sm btn-success shadow-0"
							id="actScore">수정</a></td>
					</tr>
					<!--리스트 불러올 조건문  -->

				</tbody>
				<!-- 상담리스트 보여줄 내용이 없을때 -->

			</table>

		</div>

	</div>
</div>
<script>
$(document).ready(function() {
	
	$('.contestSupporterDetail').click(function() {
		
		alert("확인");
         
         <%-- var pkey = $(this).val();
         var parameter = $(this).attr("name");
         
         $.ajax({
            type : "get",
            url : "<%=request.getContextPath()%>/indmember/mypage/remove.do?pkey=" + pkey + "&parameter=" + parameter,
            success : function() {
               manage_rendering(parameter); /* education일 경우 -> eduManage */
            },
            error : function(request, status, error) {
               console.log(request, status, error);
            }
         });          --%>  
      });
});
</script>