<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
​

<c:set var="supportList" value="${dataMap.supportList }" />
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
											<th style="width: 8%; text-align: center;"><b>상담신청일자</b></th>
											<th style="width: 10%; text-align: center;"><b>작성자(이름)</b></th>
											<th style="width: 10%; text-align: center;"><b>작성자(ID)</b></th>
											<th style="width: 8%; text-align: center;"><b>상담유형</b></th>
											<th style="width: 15%; text-align: center;"><b>제목</b></th>
											<th style="width: 12%; text-align: center;"><b>상담진행상태</b></th>
											<th style="width: 10%; text-align: center;"><b>상담사</b></th>
											<th style="width: 5%; text-align: center;"><b>수정</b></th>

										</tr>
									</thead>

									<tbody>
										<c:if test="${empty supportList }">
											<tr>
												<td colspan="7"><strong>해당 내용이 없습니다.</strong></td>
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
												<td style="text-align: center;">
												<c:if test="${support.supType eq 0 }">진로상담 </c:if> <c:if
														test="${support.supType eq 1 }">취업상담 </c:if> <c:if
														test="${support.supType eq 2 }">프로그램상담 </c:if>
												<td
													style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${support.supTitle }</td>
												<td style="text-align: center;"><select
													class="form-control" id="supProcess${i }" name="supProcess" style="height: 32px;">
														<option value="0" ${support.supProcess == 0 ? 'selected':''}>상담접수중</option>
														<option value="1" ${support.supProcess == 1 ? 'selected':''}>상담중</option>
														<option value="2" ${support.supProcess == 2 ? 'selected':''}>상담완료</option>
														<option value="3" ${support.supProcess == 3 ? 'selected':''}>상담반려(상담내용불일치)</option>
												</select></td>
												
												<td style="text-align: center;"><select
													class="form-control" id="counselorName${i }" name="counselorName" style="height: 32px;">
														<option value="0" ${support.counselorName == 0 ? 'selected':''}> 상담사 선택</option>
														<option value="1" ${support.counselorName == 1 ? 'selected':''}>박혜인 상담사</option>
														<option value="2" ${support.counselorName == 2 ? 'selected':''}>이수진 상담사</option>
														<option value="3" ${support.counselorName == 3 ? 'selected':''}>김민지 상담사</option>
														<option value="4" ${support.counselorName == 4 ? 'selected':''}>김채원 상담사</option>
												</select>
												</td>
												<th
													style="width: 5%; text-align: center; padding-top: 10px; padding-bottom: 0px; padding-right: 0px; padding-left: 0px;">
													<button type="button"
														class="btn-sm btn-warning waves-themed" id="modify"
														onclick="Modify('${support.supNo}',${i })">수정</button>
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
					<form id="supportModifyForm">
				
					<table id="userTable"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th style="width: 15px;">NO</th>
								<th style="width: 10%;"><input type="text"
									style="border: 0px; width: 40px;" id="supNo" name="supNo"
									readonly></th>
								<th style="width: 10%;">상담유형</th>
								<th style="width: 5%;" id="" colspan="1"><input
									type="text" style="border: 0px; width: 200px;" id="supType"
									name="supType"></th>
								<th style="width:10%">작성자(ID)</th> 
								<th style="width: 15%;"><input type="text"
									style="border: 0px; width: 150px;" id="indId" name="indId"
									readonly></th>
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
								<th style="width: 30;" id="" colspan="1"><input type="text"
									style="border: 0px;" id="supProcesss" name="supProcess"></th>
								<th style="width: 13%;">상담사</th>
								<th style="width: 30;" id="" colspan="1"><input type="text"
									style="border: 0px;" id="counselorNames" name="counselorName"></th>
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
	</form>
				</div>
			</div>
		</div>
	</div>
</div>

</main>

<script>

	
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
			$('input[id=supProcesss]').val(v_supProcess);
			
			var v_counselorName= "";
			if (supportList.counselorName == 0){
				v_counselorName="상담사 선택";
			}else if(supportList.counselorName == 1) {
				v_counselorName="박혜인 상담사";
			}else if(supportList.counselorName == 2) {
				v_counselorName="이수진 상담사";
			}else if(supportList.counselorName == 3){
				v_counselorName="김민지 상담사";
			}else{
				v_counselorName="김채원 상담사";
			}
			$('input[id="counselorNames"]').val(v_counselorName);
			$('input[id="indId"]').val(supportList.indId);

		},
		error : function(request, status, error) {
			 alert("code: " + request.status + "message: " + request.responseText + "error: " + error);
		}		
	});
};
</script>
<script>
 	function Modify(supNo,index){
 		var v_supProcess = $("#supProcess"+index+" option:selected").val();
 		var v_counselorName = $("#counselorName"+index+" option:selected").val();
 		Swal.fire({
 			  title: '수정하겠습니까?',
 			  icon: 'warning',
 			  showCancelButton: true,
 			  confirmButtonColor: '#3085d6',
 			  cancelButtonColor: '#d33',
 			 cancelButtonText: '아니요',
 			  confirmButtonText: '네'
 		}).then(function (result){
 			if(result.value){
 			$.ajax({
 	 			url : 'supportModify',
 	 			method : 'POST',
 	 			data : JSON.stringify({'supNo' : supNo,'supProcess':v_supProcess,'counselorName':v_counselorName }),
 	 			contentType:'application/json',
 	 			success : function(data) {
 					Swal.fire({
 						icon: 'success',
 						title: '수정되었습니다.',
 						showConfirmButton: false,
 						timer: 1500
 				}).then(function(){	
 					
 					window.location.replace(location.href);
 				});
 				},
 				error : function(request, status, error) {
 					 alert("code: " + request.status + "message: " + request.responseText + "error: " + error);
 				}
 			});
 		}
 	  });		
 	}
</script>


<script>
$(document).ready(function(){	
	jQuery.fn.serializeObject = function() {
		var obj = null;
		try {
			if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
				var arr = this.serializeArray();
				if (arr) {
					obj = {};
					jQuery.each(arr, function() {
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

