<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
​

<c:set var="memberList" value="${dataMap.memberList }" />
<c:set var="authReqList" value="${dataMap.authReqList }" />
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
									data-toggle="pill"> 권한부여 </a></li>
							</ul>
						</div>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade show active" id="nav_pills_default-1"
							role="tabpanel">
							<form role="" method=""
								action=""
								name="">
								<table id="dt-basic-example"
									class="table table-bordered table-hover w-100"
									style="table-layout: fixed; padding: 0;">
									<thead class="mytable">
										<tr>
											<th style="width: 5%; text-align: center;"><b>NO</b></th>
											<th style="width: 12%; text-align: center;"><b>기업ID</b></th>
											<th style="width: 20%; text-align: center;"><b>제목</b></th>
											<th style="width: 31%; text-align: center;"><b>내용</b></th>
											<th style="width: 10%; text-align: center;"><b>신청일</b></th>
											<th style="width: 10%; text-align: center;"><b>권한승인</b></th>
										</tr>
									</thead>

									<tbody>
										<c:if test="${empty authReqList }">
											<tr>
												<td colspan="7"><strong>해당 내용이 없습니다.</strong></td>
											</tr>
										</c:if>
										<c:forEach items="${authReqList}" var="authReq">
											<c:set var="i" value="${i + 1}" />
											<tr onclick="openList('${authReq.authNo}');">
												<td style="text-align: center;"><c:out value="${i }" /></td>
												<td style="text-align: center;">${authReq.coId}</td>
												<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${authReq.authTitle }</td>
												<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${authReq.authContent }</td>
												
												<td style="text-align: center;">${authReq.authSdate }</td>
												<th style="width: 5%; text-align: center; padding-top: 10px; padding-bottom: 0px; padding-right: 0px; padding-left: 0px;">
													
														<c:if test="${authReq.coConfirm  eq 'N'}">
														<button type="button"
														class="btn-sm btn-warning waves-themed mb-2" id="modify"
														onclick="Modify('${authReq.coId}')">승인
														</button>
														</c:if>
														<c:if test="${ authReq.coConfirm  eq 'Y'}">
																<div class="text-danger">권한부여된기업입니다.</div>
														</c:if>
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
	</div>
</div>

</main>

<script>
 	
	function Modify(coId) {
		Swal.fire({
			title : '승인하시겠습니까?',
			icon : 'warning',
			showCancelButton : true,
			confirmButtonColor : '#3085d6',
			cancelButtonColor : '#d33',
			cancelButtonText : '아니요',
			confirmButtonText : '네'
		}).then(function(result) {
			if (result.value) {
				$.ajax({
					url : 'authReqModify', /* 컨트롤러 만들어야함 */
					method : 'POST',
					data : {
						'coId' : coId
					},
					success : function(data) {
						Swal.fire({
							icon : 'success',
							title : '승인완료했습니다.',
							showConfirmButton : false,
							timer : 1500
						})
						location.reload();
					},
					error : function() {
						alert("실패");
					}
				})
			}
		});
	}
</script>

