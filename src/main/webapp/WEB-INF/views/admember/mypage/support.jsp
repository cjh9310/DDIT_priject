<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<c:set var="supportList" value="${dataMap.supportList }" />
<c:set var="memberList" value="${dataMap.memberList }" />
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />


<style>
.tab-content {
	border-top: 1px solid #168;
	height: 300px;
	overflow: auto;
	position: relative;
}

.table table-bordered table-hover w-100 {
	height: 600px;
}

.mytable tr th {
	position: sticky;
	top: 0px;
	background-color: white;
}

#dt-basic-example {
	border-spacing: 0;
	border-collapse: separate;
}
</style>


<main id="js-page-content" role="main" class="page-content">
<div class="row justify-content-center">
	<div class="col-xl-10">
		<div id="panel-7" class="panel">
			<div class="panel-container show">
				<div class="panel-content">
					<div class="row">
						<div class="col-xl-10">
							<ul class="nav nav-pills" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="pill"> 취업상담관리 </a></li>
							</ul>
						</div>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="nav_pills_default-1"
							role="tabpanel">
							<form role="supportModifyForm" method="post"
								action="/ddit/admember/mypage/supportModify"
								name="supportModifyForm">
								<table id="dt-basic-example"
									class="table table-bordered table-hover w-100"
									style="table-layout: fixed; padding: 0;">
									<thead class="mytable">
										<tr>
											<th style="width: 5%; text-align: center;"><b>NO</b></th>
											<th style="width: 12%; text-align: center;"><b>상담신청일자</b></th>
											<th style="width: 10%; text-align: center;"><b>작성자(이름)</b></th>
											<th style="width: 10%; text-align: center;"><b>작성자(ID)</b></th>
											<th style="width: 10%; text-align: center;"><b>상담유형</b></th>
											<th style="width: 20%; text-align: center;"><b>제목</b></th>
											<th style="width: 12%; text-align: center;"><b>상담진행상태</b></th>
											<th style="width: 5%; text-align: center;"><b>수정</b></th>

										</tr>
									</thead>

									<tbody>
										<c:if test="${empty supportList }">
											<tr>
												<td colspan="6"><strong>해당 내용이 없습니다.</strong></td>
											</tr>
										</c:if>
										<c:forEach items="${supportList}" var="support">
											<c:set var="i" value="${i + 1}" />
											<tr onclick="openList('${support.supNo}');">
												<td style="text-align: center;"><c:out value="${i }" /></td>
												<td style="text-align: center;"><fmt:formatDate
														value="${support.supDate }" pattern="yyyy-MM-dd" /></td>
												<td style="text-align: center;"></td>
												<td style="text-align: center;">${support.indId }</td>
												<td style="text-align: center;">${youme.index }<c:if
														test="${support.supType eq 0 }">진로상담 </c:if> <c:if
														test="${support.supType eq 1 }">취업상담 </c:if> <c:if
														test="${support.supType eq 2 }">프로그램상담 </c:if>
												<td
													style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${support.supTitle }</td>
												<td style="text-align: center;"><select
													class="form-control" id="supProcess" name="supProcess" style="height: 32px;">
														<option value="0">상담접수중</option>
														<option value="1">상담중</option>
														<option value="2">상담완료</option>
														<option value="3">상담반려</option>
												</select></td>
												<th
													style="width: 5%; text-align: center; padding-top: 10px; padding-bottom: 0px; padding-right: 0px; padding-left: 0px;">
													<button type="button"
														class="btn-sm btn-warning waves-themed" id="modify"
														onclick="Modify('${support.supNo}')">수정</button>
												</th>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="panel-7" class="panel">
			<div class="panel-container show">
				<div class="panel-content">

					<table id="userTable"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th style="width: 15px;">NO</th>
								<th style="width: 10%;"><input type="text"
									style="border: 0px; width: 25px;" id="supNo" name="supNo"
									readonly></th>
								<th style="width: 10%;">상담유형</th>
								<th style="width: 15%;" id="" colspan="3"><input
									type="text" style="border: 0px; width: 420px;" id="supType"
									name="supType"></th>
								<th style="width: 10%;">상담신청일자</th>
								<th style="width: 25%;"><input type="text"
									style="border: 0px;" id="supDate" name="supDate"></th>

							</tr>
							<tr>
								<th style="width: 15%;">제목</th>
								<th style="width: 40;" id="" colspan="3"><input type="text"
									style="border: 0px; width: 450px;" id="supTitle"
									name="supTitle"></th>
								<th style="width: 13%;">상담진행상태</th>
								<th style="width: 30;" id="" colspan="3"><input type="text"
									style="border: 0px;" id="" name="supProcess"></th>
							</tr>
							<tr>
								<td style="width: 15%; padding-bottom: 150px;">내용</td>
								<th class="" colspan="7"><textarea cols="200" rows="20"
										style="resize: none; border: none" id="supContent"
										name="supContent">
									</textarea></th>
							</tr>
						</thead>
					</table>

				</div>
			</div>
		</div>
	</div>
</div>

</main>

<script>
	$(document).ready(function() {
				jQuery.fn.serializeObject = function() {
					var obj = null;
					try {
						if (this[0].tagName
								&& this[0].tagName.toUpperCase() == "FORM") {
							var arr = this.serializeArray();
							if (arr) 
							{
								obj = {};
								jQuery.each(arr, function() 
								{
									obj[this.name] = this.value;
								});
							}
						}
					} catch (e) {
						alert(e.message);
					} finally {
					}

					return obj;
				};
			});
	
</script>

<script>

	
</script>

<script>

function openList(supNo) {
	$.ajax({
		url : 'supportDetail',
		method : 'POST',
		data : {'supNo' : supNo},
		success : function(supportList) {
			$('input[id=supNo]').val(supportList.supNo);
			
			var v_supDate= "";
			var v_supDate= new Date(supportList.supDate);
			
			var v_year = v_supDate.getFullYear();
			
			var v_month = v_supDate.getMonth()+1;
			if (v_month <= 9){
				v_month = "0" + v_month;
			}
			var v_day = v_supDate.getDate();
			if (v_day <= 9){
				v_day = "0" + v_day;
			}
			var v_supDate = v_year+'-'+v_month +'-'+v_day;
			console.log(v_supDate);
			$('input[id=supDate]').val(v_supDate);
			
			var v_supType= "";
			if (supportList.supType == 0){
				v_supType="진로상담";
			}else if(supportList.supType == 1) {
				v_supType="취업상담";
			}else{
				v_supTyp="프로그램상담";
			}
			
			$('input[id=supType]').val(v_supType);
			$('input[id=supTitle]').val(supportList.supTitle);
			$('textarea[id=supContent]').val(supportList.supContent);
			
			var v_supProcess= "";
			if (supportList.supProcess == 0){
				v_supProcess="상담접수중";
			}else if(supportList.supProcess == 1) {
				v_supProcess="상담중";
			}else if(supportList.supProcess == 2){
				v_supProcess="상담완료";
			}else{
				v_supProcess="상담반려";
			}
			$('input[id=supProcess]').val(v_supProcess);

		},
		error : function(request, status, error) {
			 alert("code: " + request.status + "message: " + request.responseText + "error: " + error);
		}		
	});
};
</script>
<script>
 	function Modify(supNo){
 		
 	
 		var supProcess = $("#supProcess option:selected").val();
 //		console.log(supProcess);
 		
 		$.ajax({
 			url : 'supportModify',
 			method : 'POST',
 			data : JSON.stringify({'supNo' : supNo,'supProcess':supProcess	}),
 			contentType:'application/json',
 			success : function(result){
 				window.location.replace(location.href);
 			},
 			error : function(request, status, error) {
 				 alert("code: " + request.status + "message: " + request.responseText + "error: " + error);
 			}
 			
	 	});
 	}
</script>

