<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date">
<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" />
</c:set>

<c:set var="eduMap" value="${eduMap}" />
<c:set var="eduList" value="${eduMap.eduList}" />

<c:set var="crrMap" value="${crrMap}" />
<c:set var="crrList" value="${crrMap.crrList}" />

<c:set var="cerMap" value="${cerMap}" />
<c:set var="cerList" value="${cerMap.cerList}" />

<c:set var="letMap" value="${letMap}" />
<c:set var="letterList" value="${letMap.letterList}" />
<c:set var="countOpenLetter" value="${letMap.countOpenLetter}" />

<style>
.panel-content {
	width: 100%;
	height: 431px;
}

.resume-area {
	width: 100%;
	height: 965px;
}

.detailForm_load {
	cursor: pointer;
}
</style>

<main id="js-page-content" role="main" class="page-content">
<div class="col-xl-12 col-lg-12 card mb-g">
	<div class="recruit-head panel-conteiner">
		<div class="row w-100 p-0 m-0 h-100">
			<table class="w-100">
				<tr>
					<td style="width:50px;">
						<div class='icon-stack display-3 flex-shrink-0'
							style="margin-left: 10px;">
							<c:choose>
								<c:when test="${recruit.recBookmark != null}">
									<button id="${recruit.recWantedno}" class="bookMark_btn"
										style="background-color: transparent; border: 0px;"
										type="button" value="${recruit.recBookmark}">
										<i name="recremove"
											class="fas fa-star icon-stack-1x opacity-100 color-warning-500"></i>
									</button>
								</c:when>
								<c:when test="${recruit.recBookmark == null}">
									<button name="recregist" id="${recruit.recWantedno}"
										class="bookMark_btn"
										style="background-color: transparent; border: 0px;"
										type="button" value="${recruit.recBookmark}">
										<i name="recregist"
											class="far fa-star icon-stack-1x opacity-100 color-warning-500"></i>
									</button>
								</c:when>
							</c:choose>
						</div>
					</td>
					<td>
						<h2 style="margin: 0px;">${recruit.coName} - ${recruit.recWantedtitle}  -  채용공고 지원중</h2>
						</h2>
					</td>
					<td>
						<button type="button" onclick="rec_supply();"
							class="btn btn-md btn-outline-info waves-effect waves-themed w-100">
							제출하기<span class="fas fa-arrow-alt-right mr-1"></span>
						</button>
					</td>
				</tr>
			</table>
			<%-- <table>
				<tr>
					<td colspan="1" rowspan="3"
						style="width: 45px; padding-right: 16px;">
						<div class='icon-stack display-3 flex-shrink-0'
							style="margin-left: 10px;">
							<c:choose>
								<c:when test="${recruit.recBookmark != null}">
									<button id="${recruit.recWantedno}" class="bookMark_btn"
										style="background-color: transparent; border: 0px;"
										type="button" value="${recruit.recBookmark}">
										<i name="recremove"
											class="fas fa-star icon-stack-1x opacity-100 color-warning-500"></i>
									</button>
								</c:when>
								<c:when test="${recruit.recBookmark == null}">
									<button name="recregist" id="${recruit.recWantedno}"
										class="bookMark_btn"
										style="background-color: transparent; border: 0px;"
										type="button" value="${recruit.recBookmark}">
										<i name="recregist"
											class="far fa-star icon-stack-1x opacity-100 color-warning-500"></i>
									</button>
								</c:when>
							</c:choose>
						</div>
					</h2></td>
				</tr>
				<tr>
					<td colspan="8" style="width: 1400px;">
						<h2 style="margin: 0px;">${recruit.coName}-
							${recruit.recWantedtitle} - 채용공고 지원중</h2>
						</h2>
						<button type="button" onclick="rec_supply()"
							class="btn btn-md btn-outline-info waves-effect waves-themed">
							제출하기<span class="fas fa-arrow-alt-right mr-1"></span>
						</button>
					</td>
				</tr>
			</table> --%>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xl-6 col-lg-6">
		<div class="row">
			<div class="col-lg-12 col-xl-12">
				<div id="panel-1" class="panel">
					<div class="panel-hdr">
						<h2>${recruit.coName} 지원 이력서</h2>
						<div class="btn-group" id="js-demo-nesting" role="group"
							aria-label="Button group with nested dropdown">
							<button type="button"
								class="savePdf btn btn-xs btn-info waves-effect waves-themed">PDF로
								다운로드</button>
						</div>
					</div>
					<div>
						<div class="col-xl-12 panel resume-area" style="padding: 0px;">
							<div class="custom-scroll">
								<div class="p-3" id="resume-area">
									<table class="table text-center" width="800">
										<thead>
											<tr>
												<th class="text-center border-top-0 fw-700" colspan="9"
													height="50"><font size="5">이 력 서</font></th>
											</tr>
										</thead>
										<tr>
											<td class="border p-0" rowspan="5"
												style="width: 126px; height: 176px;"><img
												style="display: block; width: 100%; height: auto;"
												src="<%=request.getContextPath()%>/member/getPicture.do?id=${loginUser.id}"
												onerror="this.onerror=null; this.src='<%=request.getContextPath() %>/resources/template/img/member_default.png';"
												alt="증명사진" /></td>
										</tr>
										<tr>
											<th colspan="3"
												class="thead-themed text-center border fw-700">성 명</th>
											<th colspan="3"
												class="thead-themed text-center border fw-700">생 년 월 일</th>
											<th colspan="3" width="80"
												class="thead-themed text-center border fw-700">E-mail</th>
										</tr>
										<tr>
											<td colspan="3" class="border">${loginUser.name}</td>
											<td colspan="3" class="border">${loginUser.indBir}</td>
											<td colspan="3" class="border">${loginUser.email}</td>
										</tr>
										<tr>
											<th colspan="3" width="50"
												class="thead-themed text-center border fw-700">연 락 처</th>
											<td colspan="6"
												class="thead-themed text-center border fw-700">주소</td>
										</tr>
										<tr>
											<th class="border">${loginUser.tel}</th>
											<td class="border" colspan="8">${loginUser.indAddr}</td>
										</tr>
									</table>
									<div
										class="card-header py-2 d-flex align-items-center flex-wrap">
										<div class="card-title">학력</div>
									</div>
									<table class="table">
										<thead>
											<tr>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">학과계열</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">학교명</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">학과명</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">학점</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">상태</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty eduList}">
												<tr>
													<td class="text-center fw-700" colspan="5">등록된 학력 정보가
														없습니다.<br/><br/>회원정보 관리에서 학력을 동록하세요.</td>
												</tr>
											</c:if>
											<c:forEach items="${eduList}" var="edu">
												<tr>
													<td class="text-center">${edu.eduDep}</td>
													<td class="text-center">${edu.eduName}</td>
													<td class="text-center">${edu.eduMajor}</td>
													<td class="text-center">${edu.eduScore}</td>
													<td class="text-center">
														<c:if test="${edu.eduStatus == 0}">
															<span class="badge badge-primary">${edu.strStatus}</span>
														</c:if> 
														<c:if test="${edu.eduStatus == 1}">
															<span class="badge badge-info">${edu.strStatus}</span>
														</c:if> 
														<c:if test="${edu.eduStatus == 2}">
															<span class="badge badge-success">${edu.strStatus}</span>
														</c:if>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div
										class="card-header py-2 d-flex align-items-center flex-wrap">
										<div class="card-title">경력</div>
									</div>
									<table class="table">
										<thead>
											<tr>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">업종</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">회사명</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">직무</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">직책</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">입사일</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">퇴사일</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty crrList}">
												<tr>
													<td class="text-center fw-700" colspan="6">등록된 경력 정보가
														없습니다.<br/><br/>회원정보 관리에서 경력을 동록하세요.</td>
												</tr>
											</c:if>
											<c:forEach items="${crrList}" var="crr">
												<tr>
													<td class="text-center">${crr.crrSector}</td>
													<td class="text-center">${crr.crrCorname}</td>
													<td class="text-center">${crr.crrJob}</td>
													<td class="text-center">${crr.crrPosition}</td>
													<td class="text-center"><fmt:formatDate
															value="${crr.crrSdate }" pattern="yyyy-MM-dd" /></td>
													<td class="text-center"><fmt:formatDate
															value="${crr.crrEdate }" pattern="yyyy-MM-dd" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<c:if test="${not empty cerList}">
									<div
										class="card-header py-2 d-flex align-items-center flex-wrap">
										<div class="card-title">자격증</div>
									</div>
									<table class="table">
										<thead>
											<tr>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">주최기관</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">자격증명</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">발급일</th>
												<th
													class="text-center border-top-0 table-scale-border-bottom fw-700">갱신일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cerList}" var="cer">
												<tr>
													<td class="text-center">${cer.cerHost}</td>
													<td class="text-center">${cer.cerName}</td>
													<td class="text-center"><fmt:formatDate
															value="${cer.cerSdate }" pattern="yyyy-MM-dd" /></td>
													<td class="text-center"><c:if
															test="${cer.cerEdate == null}">
															<span class="badge badge-info">유효기간없음</span>
														</c:if> <c:if test="${cer.cerEdate < today}">
															<span class="badge badge-danger"> 갱신기간만료</span>
														</c:if> <c:if test="${cer.cerEdate > today}">
															<fmt:formatDate value="${cer.cerEdate }"
																pattern="yyyy-MM-dd" />
														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									</c:if>
									<div
										class="card-header py-2 d-flex align-items-center flex-wrap">
										<div class="card-title">자기소개서</div>
									</div>
									<form method="post" id="recSupplyForm">	
										<table class="table" id="letter_table">
										</table>
										<input type="hidden" name="recWantedno" value="${recruit.recWantedno}" />
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-6 col-lg-6">
		<div>
			<div class="row">
				<div class="col-lg-12 col-xl-12">
					<div id="letManage">
						<div id="panel-1" class="panel">
							<div class="panel-hdr">
								<h2>자기소개서</h2>
								<div class="panel-toolbar ml-2">
									<button type="button" onclick="manage_rendering('letManage')"
										class="btn btn-xs btn-info waves-effect waves-themed">
										자기소개서 관리하기</button>
								</div>
							</div>
							<div>
								<div class="col-xl-12 panel panel-content" style="padding: 0px;">
									<div class="custom-scroll">
										<div class="p-3">
											<table class="table" id="letForm_section">
												<thead>
													<tr>
														<th class="text-center border-top-0 table-scale-border-bottom fw-700">번호</th>
														<th class="text-center border-top-0 table-scale-border-bottom fw-700">제목</th>
														<th class="text-center border-top-0 table-scale-border-bottom fw-700">추가여부</th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${empty letterList}">
														<tr>
															<td class="text-center fw-700" colspan="4">등록된
																자기소개서가 없습니다.</td>
														</tr>
													</c:if>
													<c:forEach items="${letterList}" var="let">
														<tr>
															<td class="text-center">${let.letNo}</td>
															<td class="detailForm_load text-center" id="${let.letSeqno}" name="letDetailForm">${let.letTitle}</td>
															<td class="text-center">
																<button class="supply_add_let" id="${let.letSeqno}" type="button"
																	style="background-color: transparent; border: 0px;">
																	<i class="badge border border-success text-success"> 
																	지원 이력서에 추가하기</i>
																</button>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</main>
<script src="<%=request.getContextPath()%>/resources/template/js/vendors.bundle.js"></script>
<script src="<%=request.getContextPath()%>/resources/template/js/app.bundle.js"></script>
<%@ include file="/WEB-INF/views/indmember/indmember_js.jsp"%>

<script>
var letterStatus;
function letterTableSetting() {
	
	
	var letterStartMessage = '<tr id="letterStartMessage"><td class="text-center fw-700" colspan="6">아직 추가한 자기소개서가 없습니다.<br/><br/>반드시 하나 이상의 자기소개서는 추가하여 지원하세요!</td></tr>';
	if($('#letter_table').children().length == 0) {
		$('#letter_table').append(letterStartMessage);
		letterStatus = false;
	} else {
		$('#letter_table').children('#letterStartMessage').remove();
		letterStatus = true;
	}

}

letterTableSetting();
</script>
<script>
function rec_supply() {
	
	if(!letterStatus) {
		alert('반드시 한 개 이상의 자기소개서는 추가한 뒤 제출 가능합니다.');
		return;
	}
	
	var recWantedno = '${recruit.recWantedno}';
	
	$.ajax({
		type : "POST",
		url : '<%=request.getContextPath()%>/recruit/supply/check',
		data : {'recWantedno' : recWantedno},
		dataType : 'text',
		success : function(data) {
			if(data == 'SupplyNotAllowed') {
				alert('이미 지원한 채용공고입니다.');
				window.close();
			} else if(data == 'SupplyAllowed') {
				rec_supply_submit();
			}
		},
		error : function(request, status, error) {
			console.log(request, status, error);
		}
	});  
	
}
</script>
<script>

</script>

<script>

function rec_supply_submit() {
	
	form = $('#recSupplyForm').serialize();
	
	var coName = '${recruit.coName}';
	
	$.ajax({
		type : "POST",
		url : '<%=request.getContextPath()%>/recruit/supply/submit.do',
		data : form,
		dataType : 'text',
		success : function(data) {
			
			if(data == 'recruitSupplySuccess') {
				alert(coName + '에 대한 채용 지원이 완료되었습니다.');
				AllimRegist();
				opener.parent.goPage('<%=request.getContextPath()%>/indmember/mypage/recruit.do','M100000');
				console.log("goPage() : ",opener.parent.goPage);
				window.close();
			}
		},
		error : function(request, status, error) {
			console.log(request, status, error);
		}
	});  
	
}

</script>

<script>
function AllimRegist() {
	var recWantedno = '${recruit.recWantedno}';
	var coName = '${recruit.coName}';
	var indId = '${loginUser.id}';
	var recWantedtitle = '${recruit.recWantedtitle}';

	$.ajax({
		url : '<%=request.getContextPath()%>/recruit/recAllim',
		type : 'POST',
		data : {'toId':coName,'fromId' : indId, 'recWantedno' : recWantedno, 'recWantedtitle':recWantedtitle},
		success : function(result) {
      },

		error : function(request, status, error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   }
    });     
}
</script>





<script>
	$("#resume_delete1").on("click", function() {
		bootbox.confirm({
			title : "정말로 삭제 하시겠습니까?",
			message : "삭제를 원하시면 예, 그렇지 않으면 아니오를 클릭하십시오.",
			buttons : {
				cancel : {
					label : ' 아니요'
				},
				confirm : {
					label : ' 예'
				}
			},
			callback : function(result) {
				console.log('This was logged in the callback: ' + result);
			}
		});
	});
	$("#resume_delete2").on("click", function() {
		bootbox.confirm({
			title : "정말로 삭제 하시겠습니까?",
			message : "삭제를 원하시면 예, 그렇지 않으면 아니오를 클릭하십시오.",
			buttons : {
				cancel : {
					label : ' 아니요'
				},
				confirm : {
					label : ' 예'
				}
			},
			callback : function(result) {
				console.log('This was logged in the callback: ' + result);
			}
		});
	});
	$("#resume_delete3").on("click", function() {
		bootbox.confirm({
			title : "정말로 삭제 하시겠습니까?",
			message : "삭제를 원하시면 예, 그렇지 않으면 아니오를 클릭하십시오.",
			buttons : {
				cancel : {
					label : ' 아니요'
				},
				confirm : {
					label : ' 예'
				}
			},
			callback : function(result) {
				console.log('This was logged in the callback: ' + result);
			}
		});
	});
	botton: [ {
		extend : 'pdfHtml5',
		text : 'PDF',
		titleAttr : 'Generate PDF',
		className : 'btn-outline-danger btn-sm mr-1'
	} ];
</script>
<script
	src="<%=request.getContextPath()%>/resources/template/js/html2canvas.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/template/js/jspdf.min.js"></script>
<script>
	$(document).ready(
			function() {
				$('.savePdf').click(
						function() { // pdf저장 button id
							const pdfArea = document
									.querySelector('#resume-area');
							pdfArea.style.height = pdfArea.scrollHeight + 'px';
							html2canvas(pdfArea).then(
									function(canvas) { //저장 영역 div id
										// 캔버스를 이미지로 변환
										var imgData = canvas
												.toDataURL('image/png');

										var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
										var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
										var imgHeight = canvas.height
												* imgWidth / canvas.width;
										var heightLeft = imgHeight;
										var margin = 10; // 출력 페이지 여백설정
										var doc = new jsPDF('p', 'mm');
										var position = 0;

										// 첫 페이지 출력
										doc.addImage(imgData, 'PNG', margin,
												position, imgWidth, imgHeight);
										heightLeft -= pageHeight;

										// 한 페이지 이상일 경우 루프 돌면서 출력
										while (heightLeft >= 20) {
											position = heightLeft - imgHeight;
											doc.addPage();
											doc.addImage(imgData, 'PNG', 0,
													position, imgWidth,
													imgHeight);
											heightLeft -= pageHeight;
										}

										// 파일 저장
										doc.save('file-name.pdf');
									});

						});

			});
</script>
<script>
$(document).ready(function() {
	
	$(document).on("click",".supply_add_let",function(){
			
		var button = $(this);
		
		var letSeqno = button.attr('id');	
			
		var letter_table = $('#letter_table');
		
		var ajaxOption = {
				url : '<%=request.getContextPath()%>/indmember/getLetter.do?letSeqno=' + letSeqno,
				async : true,
				type : "GET",
				dataType : "json",
				cache : false
			};
			
		$.ajax(ajaxOption).done(function(data) {
			console.log("letter data : ", data);
			var tableTemplate = '<thead id="letter_'+letSeqno+'"><tr><th colspan="6" class="text-center border-top-0 table-scale-border-bottom fw-700">'+data.letTitle+'</th></tr></thead>'+
	        '<tbody id="letter_'+letSeqno+'"><tr><td class="text-left">'+data.letContent+'</td></tr>'+
	        '<input type="hidden" name="letTitle" value="'+data.letTitle+'" /><input type="hidden" name="letContent" value="'+data.letContent+'" /></tbody>';
			letter_table.append(tableTemplate);
			letterTableSetting();
			var td = button.parent('td');
			var button_del = '<button class="supply_del_let" id="'+letSeqno+'" type="button"'+
							 'style="background-color: transparent; border: 0px;">'+
							 '<i class="badge border border-danger text-danger">지원 이력서에서 삭제하기</i></button>';
			td.children('button').remove();
			td.append(button_del);
			
		});

	});

});

</script>
<script>

$(document).ready(function() {
	
	$(document).on("click",".supply_del_let",function(){
		
		var button = $(this);
		var letSeqno = button.attr('id');
		var letter_table = $('#letter_table');
		var td = button.parent('td');
		var button_add = '<button class="supply_add_let" id="'+letSeqno+'" type="button"'+
		 				 'style="background-color: transparent; border: 0px;">'+
		 				 '<i class="badge border border-success text-success">지원 이력서에 추가하기</i></button>';
		letter_table.children('#letter_'+letSeqno).remove();
		letterTableSetting();
		td.children('button').remove();
		td.append(button_add);
		
	});

});
</script>



