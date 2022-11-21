<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
th, td {
  text-align: center;
}

.tab-content {
	border-top: 1px solid #168;
	height: 100%;
	overflow: auto;
	position: relative;
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

.fc .fc-popover {
    position: absolute;
    z-index: 2;
    box-shadow: 0 2px 6px rgb(0 0 0 / 15%);
}
</style>
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
	document.getElementById('openSdate').value = new Date().toISOString().substring(0, 10);
	
	$('#recurit-content').hide();
});
</script>
<script>
function openRecDetail(p_seqno) {
	$.ajax({
		type : 'POST',
		url : '<%=request.getContextPath()%>/comember/mypage/opendetail',
		data : {'openSeqno' : p_seqno},
		success : function(result) {
			console.log(result);
			$('#placeholder').empty();
			$('#title').val(result.openTitle);
			$('#address').val(result.openRegion);
			$('#company').val(result.openConm);
			$('#coType').val(result.openCOCL);
			$('#empType').val(result.openType);
			$('#carType').val(result.openCar);
			$('#eduType').val(result.openEdu);
			$('#jobscd').val(result.openJobscd);
			$('#edate').val(result.openEdate);
			$('#sdate').val(result.openSdate);
			$('#cnt').val(result.openCnt);
			$('#edunm').val(result.openEdunm);
			$('#carnm').val(result.openCarnm);
			$('#content').val(result.openContent);
			$('#no').val(result.openSeqno);
		},
		error : function() {
			alert("Error");
		}
	});
};

function recruitDetail(p_recno) {
	$.ajax({
		url : '<%=request.getContextPath()%>/comember/mypage/recdetail',
		type : 'POST',
		data : {'recNo' : p_recno},
		success : function(result) {
			console.log(result);
			$("#rno").val(result.recWantedno);
			$("#recTitle").val(result.recWantedtitle);
			$("#recIndpcd").val(result.recIndtpcdnm);
			$("#recMin").val(result.recMinsal);
			$("#recMax").val(result.recMaxsal);
			$("#recEntertp").val(result.recEntertpnm);
			$("#recMinedu").val(result.recMinedubg);
			$("#recPersonalCnt").val(result.recPersonal);
			$("#recCapital").val(result.recCapitalamt);
			$("#recYrsale").val(result.recYrsalesamt);
			$("#benefits").val(result.recFourins);
			$("#FirmSize").val(result.recBusisize);
			$("#recJobs").val(result.recJobsnm);
			$("#recEdate").val(result.recReceiptclosedt);
			$("#recCnt").val(result.recCollectpsncnt);
			$("#recSalCon").val(result.recSaltpnm);
			$("#recWorkTime").val(result.recWorkdayworkhrcont);
			$("#recPlace").val(result.recRegion);
			$("#recWorkContent").val(result.recJobcont);
		},
		error : function(xhr, status) {
			console.log(xhr, status);
		}
	});
};
</script>
<script>
function cleanDetail() {
	$("#my_div div").empty();
	$("#supplyRec").empty();
	$("#supplyRec").empty();
}
</script>
<script>
function supplyOpenDetail(p_id) {
	window.open("<%=request.getContextPath()%>/comember/mypage/resume.do?id="+p_id, 'detail', 'location=no, width=700, height=1300, status=no, toolbar=no');
}
</script>
<script>
function supplyOpenRec(p_openSeqno){
	var DynamicTable = '';
	$.ajax({
		url : '<%=request.getContextPath()%>/comember/mypage/supplyRec',
		type : 'POST',
		data : {'openSeqno' : p_openSeqno},
		success : function(result) {
			if(result == null) {
				$("#supplyRec").html('<tr><td colspan="5">해당 공고 지원자가 없습니다</td></tr>');
			} else {
				cleanDetail();
				for (var idx in result) {
					var p_id = result[idx].id;
					DynamicTable += '<tr id="supplyRecList" onclick="supplyOpenDetail('+"\'"+result[idx].id+"\'"+')">';
					DynamicTable += '<td style="width : 8%;" id="supplyRecId">'+(Number(idx)+1)+'</td>';
					DynamicTable += '<td style="width : 23%;" id ="supplyRecName">'+result[idx].name+'</td>';
					DynamicTable += '<td style="width : 23%;" id ="supplyRecIndOpen">'+result[idx].indOpen+'</td>';
					DynamicTable += '<td style="width : 23%;" id ="supplyRecResume">'+'버튼양식openwindow형식으로 줄 예정'+'</td>';
					DynamicTable += '<td style="width : 23%;" id ="supplyRecActivity">'+'버튼양식openwindow형식으로 줄 예정'+'</td>';
					DynamicTable += '</tr>';
				}
				$("#supplyRec").append(DynamicTable);
			}
		},
		error : function(result) {
			if(result == "SessionError") {
				window.location.reload(); 
			}
		}
	});
};
</script>
<script>
function findAddr() {	
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            document.getElementById("sample6_address").value = addr;
        }
    }).open();
};
</script>
<script>
function changeOpenBtn() {
	const recBtn = document.getElementById('recBtn');
	const openBtn = document.getElementById('openBtn');
	const openDiv = document.getElementById('openRec-content');
	const recDiv = document.getElementById('recurit-content');
	const openDIVBtn = document.getElementById('openDIVBtn');
	const recDIVBtn = document.getElementById('recDIVBtn');
	
	recBtn.style.display = 'none';
	openBtn.style.display = 'block';
	openDiv.style.display = 'block';
	recDiv.style.display = 'none';
	openDIVBtn.style.display = 'block';
	recDIVBtn.style.display = 'none';
}

function changeRecBtn() {
	const recBtn = document.getElementById('recBtn');
	const openBtn = document.getElementById('openBtn');
	const openDiv = document.getElementById('openRec-content');
	const recDiv = document.getElementById('recurit-content');
	
	recBtn.style.display = 'block';
	openBtn.style.display = 'none';
	openDiv.style.display = 'none';
	recDiv.style.display = 'block';
	openDIVBtn.style.display = 'none';
	recDIVBtn.style.display = 'block';
}
</script>
<script>
	var now_utc = Date.now() 
	var timeOff = new Date().getTimezoneOffset()*60000; 
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	console.log(today);
	$("#openEdate").attr("min", today);
</script>

<c:set var="openRecList" value="${dataMap.openRecList }" />
<c:set var="recruitList" value="${dataMap2.recruitList }" />
<c:set var="coInfo" value="${dataMap3.coInfo }" />
<c:set var="i" value="0"/>

<main id="js-page-content" role="main" class="page-content">
<ol class="breadcrumb page-breadcrumb">
	<li class="breadcrumb-item"><a href="javascript:void(0);">마이페이지</a></li>
	<li class="breadcrumb-item">취업지원</li>
	<li class="breadcrumb-item active">프로그램 관리</li>
	<li class="position-absolute pos-top pos-right d-none d-sm-block"><span class="js-get-date"></span></li>
</ol>
<div class="row">
	<!-- 공고등록목록 & 지원자목록 -->
	<div class="col-xl-6" style="height: 1090px; margin-bottom: 24px;">
		<div>
			<div class="col-xl-12">
				<div id="panel-7" class="panel" style="height: 520px;">
					<div class="panel-hdr">
						<div class="col-lg-6">
							<h2>공고등록목록</h2>
						</div>
						<div class="col-lg-6">
							<div class="float-right">
							<button type="button" id="openBtn"
								class="btn btn-success waves-effect waves-themed"
								data-toggle="modal"
								data-target="#openRec-Form">공개채용 등록</button>
								
							<button type="button" id="recBtn" style="display: none;"
								class="btn btn-success waves-effect waves-themed"
								data-toggle="modal"
								data-target="#recruit-Form">일반채용 등록</button>
							</div>
						</div>
					</div>
					<div class="panel-container show">
						<div class="panel-content" style="padding: 5px; height: 400px;">
							<ul class="nav nav-pills nav-fill" role="tablist">
								<li class="nav-item" onclick="changeOpenBtn()"><a class="nav-link active"
									data-toggle="pill" href="#nav_pills_default-1"> 공개채용 </a></li>
								<li class="nav-item" onclick="changeRecBtn()"><a class="nav-link" data-toggle="pill"
									href="#nav_pills_default-2" onclick="cleanDetail();"> 일반채용 </a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade show active" id="nav_pills_default-1"
									role="tabpanel">
									<table id="dt-basic-example"
										class="table table-bordered table-hover w-100"
										style="table-layout: fixed; padding: 0;">
										<thead class="bg-warning-200 mytable" >
											<tr>
												<th style="width: 8%;">No</th>
												<th style="width: 30%;">제목</th>
												<th style="width: 42%;">모집내용</th>
												<th nowrap style="width : 15%;">모집마감일자</th>
												<th nowrap style="width : 15%;">모집인원(명)</th>
											</tr>
										</thead>
										<c:if test="${empty openRecList }">
											<tbody>
												<tr>
													<td colspan="5"><strong>공개채용에 해당 내용이 없습니다.</strong></td>
												</tr>
											</tbody>
										</c:if>
										<tbody>
											<c:forEach items="${openRecList }" var="openRecList">
												<c:set var="i" value="${i + 1}"/>
												<tr onclick="openRecDetail('${openRecList.openSeqno}'); supplyOpenRec('${openRecList.openSeqno }');">
													<td><c:out value="${i }"/></td>
													<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; text-align: left;">${openRecList.openTitle}</td>
													<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; text-align: left;">${openRecList.openContent}</td>
													<td>${openRecList.openEdate}</td>
													<td>${openRecList.openCnt }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade" id="nav_pills_default-2"
									role="tabpanel">
									<table id="dt-basic-example"
										class="table table-bordered table-hover w-100"
										style="table-layout: fixed; padding: 0;">
										<thead class="bg-warning-200 mytable">
											<tr>
												<th style="width: 8%;">No</th>
												<th style="width: 30%;">제목</th>
												<th style="width: 42%;">모집내용</th>
												<th nowrap style="width : 15%;">모집마감일자</th>
												<th nowrap style="width : 15%;">모집인원(명)</th>
											</tr>
										</thead>
										<c:if test="${empty recruitList }">
											<tbody>
												<tr onclick="cleanDetail();">
													<td colspan="6" style="text-align: center;">
													<strong> 일반 채용에 해당 내용이 없습니다.</strong></td>
												</tr>
											</tbody>
										</c:if>
										<tbody>
											<c:forEach items="${recruitList }" var="recruitList">
												<c:set var="i" value="${i + 1}"/>
												<tr onclick="recruitDetail('${recruitList.recWantedno }');">
													<td><c:out value="${i }"/></td>
													<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; text-align: left;">${recruitList.recWantedtitle}</td>
													<td style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; text-align: left;">${recruitList.recJobcont}</td>
													<td>${recruitList.recReceiptclosedt}</td>
													<td>${recruitList.recCollectpsncnt}</td>
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
			<div class="col-xl-12">
				<div id="panel-7" class="panel" style="height: 547px; margin-top: 24px; margin-bottom: 0px;">
					<div class="panel-hdr">
						<h2>
							지원자목록 <span class="fw-300"></span>
						</h2>
					</div>
					<div class="panel-container show">
						<div class="panel-content">
							<table id="userTable"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th style="width: 8%;">No</th>
										<th style="width: 23%;">지원자 이름</th>
										<th style="width: 23%;">이력서 공개여부</th>
										<th style="width : 23%;">이력서 보기</th>
										<th style="width : 23%;">대회 수상 이력</th>
									</tr>
								</thead>
								<!-- tbody 태그 필요 없다. -->
								<tbody id="supplyRec">
			
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 공고 상세보기  -->
	<div class="col-xl-6" style="height: 1090px;">
		<div style="height : 100%; padding: 0px 12px 0px 12px;">
			<div id="panel-1" class="panel" style="height: 100%;">
				<div class="panel-hdr">
					<div class="col-md-9" style="padding : 0px; margin-left: 20px;">
						<h2>공고글 상세보기</h2>					
					</div>
					<div class="col-md-3" style="padding : 0px; margin-left: 50px;">
						<div id="openDIVBtn">						
							<button type="button" class="btn btn-danger waves-effect waves-themed" id="openRecDeleteBtn">삭제</button>
							<button type="button" class="btn btn-warning waves-effect waves-themed" id="openRecModifyBtn">수정</button>
						</div>
						<div id="recDIVBtn" style="display: none;">						
							<button type="button" class="btn btn-danger waves-effect waves-themed" id="RecDeleteBtn">삭제</button>
							<button type="button" class="btn btn-warning waves-effect waves-themed" id="RecModifyBtn">수정</button>
						</div>
					</div>
				</div>
				<div id="AnnouncementContent" class="panel-container show" style="overflow: auto;">
					<!-- 공개 채용 영역 -->
					<div id="openRec-content" class="panel-content" style="height: 1010px;">
						<form id="openRecModifyForm" style="height : 100%;" >
						<div class="panel-content">
		                    <div class="form-group">
		                        <label class="form-label" for="simpleinput"><b>제목</b></label>
		                        <input type="text" id="title" class="form-control" name="openTitle">
		                        <input type="text" style="display: none;" id="no" class="form-control" name="openSeqno">
		                    </div>
		                    <div class="form-group">
								<label class="form-label" for="validationCustom03"><b>업종</b>
								<span class="text-danger">*</span></label> 
								<select class="custom-select" id="jobscd" name="openJobscd">
									<option value="10">서비스업</option>
									<option value="20">제조·화학</option>
									<option value="30">IT·웹·통신</option>
									<option value="40">은행·금융업</option>
									<option value="50">미디어·디자인</option>
									<option value="60">교육업</option>
									<option value="70">의료·제약·복지</option>
									<option value="80">판매·유통</option>
									<option value="90">건설업</option>
									<option value="99">기관·협회</option>
								</select>
							</div>
		                    <div class="form-group">
		                        <label class="form-label" for="example-email-2"><b>회사명</b></label>
		                        <input type="text" value="${loginUser.coNm }" class="form-control" placeholder="" disabled>
		                        <input type="text" value="${loginUser.coNm }" name="openConm" style="display: none; "/>
		                    </div>
		                    <div class="form-group">
		                        <label class="form-label" for="example-email-2"><b>회사주소</b></label>
		                        <input type="text" value="${loginUser.coAddr } ${loginUser.coDeaddr}" class="form-control" placeholder="" disabled>
		                        <input type="text" value="${loginUser.coAddr } ${loginUser.coDeaddr}" name="openRegion" style="display: none; "/>
		                    </div>
		                    <div class="form-group">
		                    	<div class="row" style="margin-left: 0px; margin-right: 0px;">
		                    		<div style = "display: inline; width: 25%; padding: 0px 5px 0px 0px;">
		                    			<label class="form-label" for="example-select"><b>기업형태</b></label>
				                        <select class="form-control" id="coType" name="openCOCL">
				                        	<option value="0">선택하세요</option>
				                            <option value="10">대기업</option>
				                            <option value="20">공기업</option>
				                            <option value="30">공공기관</option>
				                            <option value="40">중견기업</option>
				                            <option value="50">외국계기업</option>
				                        </select>
		                    		</div>
		                    		<div style = "display: inline; width: 25%; padding: 0px 5px 0px 5px;">
		                    			<label class="form-label" for="example-select"><b>고용형태</b></label>
				                        <select class="form-control" id="empType" name="openType">
				                        	<option value="0">선택하세요</option>
				                            <option value="10">정규직</option>
				                            <option value="20">정규직 전환형</option>
				                            <option value="30">비정규직</option>
				                            <option value="40">기간제</option>
				                            <option value="50">시간선택제</option>
				                            <option value="60">기타</option>
				                        </select>
		                    		</div>
		                    		<div style = "display: inline;  width: 25%; padding: 0px 5px 0px 5px;">
		                    			<label class="form-label" for="example-select"><b>경력형태</b></label>
				                        <select class="form-control" id="carType" name="openCar">
				                        	<option value="0">선택하세요</option>
				                            <option value="10">인턴</option>
				                            <option value="20">신입</option>
				                            <option value="30">경력</option>
				                            <option value="40">무관</option>
				                        </select>
		                    		</div>
		                    		<div style = "display: inline;  width: 25%; padding: 0px 0px 0px 5px;">
		                    			<label class="form-label" for="example-select"><b>학력형태</b></label>
				                        <select class="form-control" id="eduType" name="openEdu">
				                        	<option value="0">선택하세요</option>
				                            <option value="10">고등학교졸업</option>
				                            <option value="20">대졸(2,3년)</option>
				                            <option value="30">대졸(4년)</option>
				                            <option value="40">석사</option>
				                            <option value="50">박사</option>
				                            <option value="99">학력무관</option>
				                        </select>
		                    		</div>
		                    	</div>
		                    </div>
		                    <div class="form-group row" style="margin-left: 0px; margin-right: 0px;">
		                    	<div style="display: inline; width : 50%; padding : 0px 5px 0px 0px;">
		                    		<label class="form-label" for="example-date"><b>등록일</b></label>
		                        	<input class="form-control" id="sdate" type="date" name="openSdate" value="" disabled>
		                    	</div>
		                    	<div style="display: inline; width : 50%; padding : 0px 0px 0px 5px;">
		                    		<label class="form-label" for="example-date"><b>마감일</b></label>
		                        	<input class="form-control" id="edate" type="date" name="openEdate" value="">
		                    	</div>
		                    </div>
		                    
		                    <div class="form-group row" style="margin-left: 0px; margin-right: 0px;">
	                    		<div style = "display: inline;  width: 50%; padding: 0px 5px 0px 0px;">
	                    			<label class="form-label" for="example-select"><b>지원학력(상세)</b></label>
			                        <input type="text" id="edunm" class="form-control" name="openEdunm">
	                    		</div>
	                    		<div style = "display: inline;  width: 50%; padding: 0px 0px 0px 5px;">
	                    			<label class="form-label" for="example-select"><b>지원경력(상세)</b></label>
			                        <input type="text" id="carnm" class="form-control" name="openCarnm">
	                    		</div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="form-label" for="simpleinput"><b>직무설명</b></label>
		                        <textarea style="resize: none;" class="form-control" id="content" name="openContent" rows="15"></textarea>
		                    </div>
		                    <div class="form-group row" style="margin-left: 0px; margin-right: 0px;">
		                    	<div style="display: inline; width : 50%; padding : 0px 5px 0px 0px;">
		                    		<label class="form-label" for="example-date"><b>모집인원수(명)</b></label>
		                        	<input class="form-control" id="cnt" type="text" name="openCnt" value="">
		                    	</div>
		                    	<div style="display: inline; width : 50%; padding : 0px 0px 0px 5px;">
		                    		<label class="form-label" for="example-date"><b>마감일</b></label>
		                        	<input class="form-control" id="example-select" type="date" name="openAcptpsn" value="">
		                    	</div>
		                    </div>
		                    </div>
		                </form>
					</div>
					
					<!-- 일반 채용 영역 -->
					<div id="recurit-content" class="panel-content" style="height: 1010px;">
						<form class="needs-validation" novalidate="" method="post"
							name="recuritModifyForm" id="recuritModifyForm">
							<div class="panel-content">
								<!-- 제목 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>제목</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" id="recTitle" placeholder="제목을 입력해주세요." value=""
										required="" name="recWantedtitle">
										<input type="text" style="display: none;" id="rno" class="form-control" name="recWantedno">
									<div class="invalid-feedback">제목을 입력해주세요.</div>
								</div>
								<!-- 업종 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom03"><b>업종</b>
										<span class="text-danger">*</span></label> <select
										class="custom-select" required="" id="recIndpcd" name="recIndtpcdnm">
										<option value="0">서비스업</option>
										<option value="1">제조·화학</option>
										<option value="2">IT·웹·통신</option>
										<option value="3">은행·금융업</option>
										<option value="4">미디어·디자인</option>
										<option value="5">교육업</option>
										<option value="6">의료·제약·복지</option>
										<option value="7">판매·유통</option>
										<option value="8">건설업</option>
										<option value="9">기관·협회</option>
									</select>
									<div class="invalid-feedback">상담유형을 선택해주세요.</div>
								</div>
								<!-- 기업명 -->
								<div class="form-group">
									<label class="form-label" for="example-palaceholder-disabled"><b>기업명</b></label>
									<input type="text" id="example-palaceholder-disabled"
										class="form-control" value="${loginUser.coNm }" disabled=""
										name="coName" readonly="readonly"> <input type="text"
										name="coName" value="${loginUser.coNm }"
										style="display: none;" />
								</div>
								<!-- 최대 최소 금액 -->
								<div class="form-group">
									<div class="row" style="margin-left: 0px; margin-right: 0px;">
										<div
											style="display: inline; width: 50%; padding: 0px 5px 0px 0px;">
											<label class="form-label" for="simpleinput"><b>최소임금액(단위:만원)</b></label>
											<input type="text" name="recMinsal" id="recMin" placeholder="금액을 입력해주세요."
												class="form-control">
										</div>
										<div
											style="display: inline; width: 50%; padding: 0px 5px 0px 5px;">
											<label class="form-label" for="simpleinput"><b>최대임금액(단위:만원)</b></label>
											<input type="text" name="recMaxsal" id="recMax" placeholder="금액을 입력해주세요."
												class="form-control">
										</div>
									</div>
								</div>
								<!--학력 & 경력 -->
								<div class="form-group">
									<div class="row" style="margin-left: 0px; margin-right: 0px;">
										<div
											style="display: inline; width: 50%; padding: 0px 5px 0px 0px;">
											<label class="form-label" for="example-select"><b>경력형태</b></label>
											<select class="form-control" id="recEntertp" name="recEntertpnm">
												<option value="0">선택하세요</option>
												<option value="인턴">인턴</option>
												<option value="신입">신입</option>
												<option value="경력">경력</option>
												<option value="무관">무관</option>
											</select>
										</div>
										<div
											style="display: inline; width: 50%; padding: 0px 5px 0px 5px;">
											<label class="form-label" for="example-select"><b>학력형태</b></label>
											<select class="form-control" id="recMinedu" name="recMinedubg">
												<option value="0">선택하세요</option>
												<option value="고등학교졸업">고등학교졸업</option>
												<option value="대졸(2,3년)">대졸(2,3년)</option>
												<option value="대졸(4년)">대졸(4년)</option>
												<option value="석사">석사</option>
												<option value="박사">박사</option>
												<option value="학력무관">학력무관</option>
											</select>
										</div>
									</div>
								</div>
								<!--근로자수 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>근로자수(단위:명)</b></label>
									<input type="text" class="form-control"
										placeholder="근로자수를 입력해주세요."  required="" id="recPersonalCnt"
										name="recPersonal">
								</div>
								<!-- 자본금 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>자본금(단위:만원)</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="자본금을 입력해주세요."  required="" id="recCapital"
										name="recCapitalamt">
									<div class="invalid-feedback">자본금을 입력해주세요.</div>
								</div>
								<!-- 근무형태 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>연매출액(단위:만원)</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="연매출액를 입력해주세요."  required="" id="recYrsale"
										name="recYrsalesamt">
									<div class="invalid-feedback">연매출액를 입력해주세요.</div>
								</div>
								<!-- 복리후생 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>복리후생</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="복리후생을 입력해주세요."  required="" id="benefits"
										name='recFourins'>
									<div class="invalid-feedback">복리후생을 입력해주세요.예:4대보험</div>
								</div>
								<!-- 회사규모 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>회사규모</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="회사규모를 입력해주세요."  required="" id="FirmSize"
										name='recBusisize'>
									<div class="invalid-feedback">회사규모을 입력해주세요.</div>
								</div>
								<!-- 홈페이지 hidden -->
								<input type="text" style="display: none;" name="recHomepg"
									value="${coInfo.coHomeurl}" />

								<!-- 모집직종 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>모집직종</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="모집직종을 입력해주세요."  required="" id="recJobs"
										name="recJobsnm">
									<div class="invalid-feedback">모집직종을 입력해주세요.</div>
								</div>
								<!-- 모집마감일 -->
								<div class="form-group">
									<label class="form-label" for="example-date"><b>모집기간</b>&nbsp;※마감일을
										선택해주세요</label> <input class="form-control" id="recEdate"
										type="date"  name="recReceiptclosedt">
								</div>
								<!-- 모집인원수 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>모집인원(단위:명)</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="모집인원을 입력해주세요."  required="" id="recCnt"
										name="recCollectpsncnt">
									<div class="invalid-feedback">모집인원을 입력해주세요.</div>
								</div>
								<!-- 임금조건 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>임금조건</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="임금조건을 입력해주세요."  required="" id="recSalCon"
										name="recSaltpnm">
									<div class="invalid-feedback">임금조건을 입력해주세요.</div>
								</div>
								<!-- 근무시간/형태 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>근무시간/형태</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="근무시간/형태을 입력해주세요."  required="" id="recWorkTime"
										name="recWorkdayworkhrcont">
									<div class="invalid-feedback">근무시간/형태을 입력해주세요.</div>
								</div>
								<!-- 근무지 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>근무지</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="근무지(광역시/구)를 입력해주세요."  required="" id="recPlace"
										name="recRegion">
									<div class="invalid-feedback">근무지을 입력해주세요.</div>
								</div>
								<!-- 직무내용 -->
								<div class="form-group">
									<label class="form-label" for="validationTextarea2"><b>직무내용</b>
										<span class="text-danger">*</span></label>
									<textarea class="form-control" 
										placeholder="담당직무의 내용을 입력해주세요." rows="7" required="" id="recWorkContent"
										name="recJobcont"></textarea>
									<div class="invalid-feedback">담당직무의 내용을 입력해주세요.</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade default-example-modal-right" id="recruit-Form" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-right modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"><i class="fal fa-times"></i></span>
				</button>
			</div>
			<div class="modal-body">
				<div id="panel-2" class="panel">
					<div class="panel-hdr">
						<h2>일반채용 작성</h2>
						<div class="panel-toolbar">
							<button class="btn btn-panel" data-action="panel-collapse"
								data-toggle="tooltip" data-offset="0,10"
								data-original-title="Collapse"></button>
							<button class="btn btn-panel" data-action="panel-fullscreen"
								data-toggle="tooltip" data-offset="0,10"
								data-original-title="Fullscreen"></button>
							<button class="btn btn-panel" data-action="panel-close"
								data-toggle="tooltip" data-offset="0,10"
								data-original-title="Close"></button>
						</div>
					</div>
					<div class="panel-container show" style = "height: 100%;">
						<form class="needs-validation" novalidate="" method="post"
							name="recuritForm" id="recuritForm">
							<div class="panel-content">
								<!-- 제목 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>제목</b>
										<span class="text-danger">*</span> </label> 
									<input type="text"
										class="form-control" id=""
										placeholder="제목을 입력해주세요." value="" required=""
										name="recWantedtitle">
									<div class="invalid-feedback">제목을 입력해주세요.</div>
								</div>
								<!-- 업종 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom03"><b>업종</b>
										<span class="text-danger">*</span></label> <select
										class="custom-select" required="" name="recIndtpcdnm">
										<option value="0">서비스업</option>
										<option value="1">제조·화학</option>
										<option value="2">IT·웹·통신</option>
										<option value="3">은행·금융업</option>
										<option value="4">미디어·디자인</option>
										<option value="5">교육업</option>
										<option value="6">의료·제약·복지</option>
										<option value="7">판매·유통</option>
										<option value="8">건설업</option>
										<option value="9">기관·협회</option>
									</select>
									<div class="invalid-feedback">상담유형을 선택해주세요.</div>
								</div>
								<!-- 기업명 -->
								<div class="form-group">
									<label class="form-label" for="example-palaceholder-disabled"><b>기업명</b></label>
									<input type="text" id="example-palaceholder-disabled"
										class="form-control" value="${loginUser.coNm }" disabled=""
										name="coName" readonly="readonly">
									<input type="text" name="coName" value = "${loginUser.coNm }" style="display: none;"/>
								</div>
								<!-- 최대 최소 금액 -->
								<div class="form-group">
			                    	<div class="row" style="margin-left: 0px; margin-right: 0px;">
										<div style = "display: inline;  width: 50%; padding: 0px 5px 0px 0px;">
			                        		<label class="form-label" for="simpleinput"><b>최소임금액(단위:만원)</b></label>
			                        		<input type="text" name="recMinsal" placeholder="금액을 입력해주세요." class="form-control">
			                    		</div>	
			                    		<div style = "display: inline;  width: 50%; padding: 0px 5px 0px 5px;">
			                        		<label class="form-label" for="simpleinput"><b>최대임금액(단위:만원)</b></label>
			                        		<input type="text" name="recMaxsal" placeholder="금액을 입력해주세요." class="form-control">
			                    		</div>				                    	
			                    	</div>
			                    </div>
			                    <!--학력 & 경력 -->
								<div class="form-group">
			                    	<div class="row" style="margin-left: 0px; margin-right: 0px;">
			                    		<div style = "display: inline;  width: 50%; padding: 0px 5px 0px 0px;">
			                    			<label class="form-label" for="example-select"><b>경력형태</b></label>
					                        <select class="form-control" id="example-select" name="recEntertpnm">
					                        	<option value="0">선택하세요</option>
					                            <option value="인턴">인턴</option>
					                            <option value="신입">신입</option>
					                            <option value="경력">경력</option>
					                            <option value="무관">무관</option>
					                        </select>
			                    		</div>
			                    		<div style = "display: inline;  width: 50%; padding: 0px 5px 0px 5px;">
			                    			<label class="form-label" for="example-select"><b>학력형태</b></label>
					                        <select class="form-control" id="example-select" name="recMinedubg">
					                        	<option value="0">선택하세요</option>
					                            <option value="고등학교졸업">고등학교졸업</option>
					                            <option value="대졸(2,3년)">대졸(2,3년)</option>
					                            <option value="대졸(4년)">대졸(4년)</option>
					                            <option value="석사">석사</option>
					                            <option value="박사">박사</option>
					                            <option value="학력무관">학력무관</option>
					                        </select>
			                    		</div>
			                    	</div>
			                    </div>
								<!--근로자수 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>근로자수(단위:명)</b></label>
									<input type="text"
										class="form-control"
										placeholder="근로자수를 입력해주세요." value="" required="" name="recPersonal">
								</div>
								<!-- 자본금 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>자본금(단위:만원)</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="자본금을 입력해주세요." value="" required=""
										name="recCapitalamt">
									<div class="invalid-feedback">자본금을 입력해주세요.</div>
								</div>
								<!-- 근무형태 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>연매출액(단위:만원)</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="연매출액를 입력해주세요." value="" required=""
										name="recYrsalesamt">
									<div class="invalid-feedback">연매출액를 입력해주세요.</div>
								</div>
								<!-- 복리후생 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>복리후생</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="복리후생을 입력해주세요." value="" required=""
										name='recFourins'>
									<div class="invalid-feedback">복리후생을 입력해주세요.예:4대보험</div>
								</div>
								<!-- 회사규모 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>회사규모</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="회사규모를 입력해주세요." value="" required=""
										name='recBusisize'>
									<div class="invalid-feedback">회사규모을 입력해주세요.</div>
								</div>
								<!-- 홈페이지 hidden -->
								<input type="text" style="display: none;" name ="recHomepg" value="${coInfo.coHomeurl}"/>
								<!-- 로고 hidden -->
								
								<!-- 모집직종 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>자본금</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="모집직종을 입력해주세요." value="" required=""
										name="recJobsnm">
									<div class="invalid-feedback">모집직종을 입력해주세요.</div>
								</div>
								<!-- 모집마감일 -->
								<div class="form-group">
									<label class="form-label" for="example-date"><b>모집기간</b>&nbsp;※마감일을
										선택해주세요</label> <input class="form-control" id="example-date"
										type="date" value="" name="recReceiptclosedt">
								</div>
								<!-- 모집인원수 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>모집인원</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="모집인원을 입력해주세요." value="" required=""
										name="recCollectpsncnt">
									<div class="invalid-feedback">모집인원을 입력해주세요.</div>
								</div>
								<!-- 임금조건 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>임금조건</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="임금조건을 입력해주세요." value="" required=""
										name="recSaltpnm">
									<div class="invalid-feedback">임금조건을 입력해주세요.</div>
								</div>
								<!-- 근무시간/형태 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>근무시간/형태</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="근무시간/형태을 입력해주세요." value="" required=""
										name="recWorkdayworkhrcont">
									<div class="invalid-feedback">근무시간/형태을 입력해주세요.</div>
								</div>
								<!-- 근무지 -->
								<div class="form-group">
									<label class="form-label" for="validationCustom01"><b>근무지</b>
										<span class="text-danger">*</span> </label> <input type="text"
										class="form-control" 
										placeholder="근무지을 입력해주세요." value="" required=""
										name="recRegion">
									<div class="invalid-feedback">근무지을 입력해주세요.</div>
								</div>
								<!-- 직무내용 -->
								<div class="form-group">
									<label class="form-label" for="validationTextarea2"><b>직무내용</b>
										<span class="text-danger">*</span></label>
									<textarea class="form-control"
										placeholder="담당직무의 내용을 입력해주세요." rows="7" required=""
										name="recJobcont"></textarea>
									<div class="invalid-feedback">담당직무의 내용을 입력해주세요.</div>
								</div>
							</div>
							<div
								class="panel-content border-faded border-left-0 border-right-0 border-bottom-0 d-flex flex-row align-items-center">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="invalidCheck" required=""> <label
										class="custom-control-label" for="invalidCheck"> Agree
										to terms and conditions <span class="text-danger">*</span>
									</label>
									<div class="invalid-feedback">You must agree before
										submitting.</div>
								</div>
								<button
									class="btn btn-success btn-pills ml-auto waves-effect waves-themed"
									type="button" id="recuritBtn">등록하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade default-example-modal-right" id="openRec-Form" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-dialog-right modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"><i class="fal fa-times"></i></span>
				</button>
			</div>
			<div class="modal-body">
				<div id="panel-2" class="panel">
					<div class="panel-hdr">
						<h2>공개채용 작성</h2>
						<div class="panel-toolbar">
							<button class="btn btn-panel" data-action="panel-collapse"
								data-toggle="tooltip" data-offset="0,10"
								data-original-title="Collapse"></button>
							<button class="btn btn-panel" data-action="panel-fullscreen"
								data-toggle="tooltip" data-offset="0,10"
								data-original-title="Fullscreen"></button>
							<button class="btn btn-panel" data-action="panel-close"
								data-toggle="tooltip" data-offset="0,10"
								data-original-title="Close"></button>
						</div>
					</div>
					<div class="panel-container show" style = "height: 100%;">
						<form class="needs-validation" novalidate="" method="post" action=""
							name="openRecForm" id="openRecForm">
							<div class="panel-content">
								<div class="form-group">
			                        <label class="form-label" for="simpleinput">제목</label>
			                        <input type="text" name="openTitle" class="form-control">
			                    </div>
			                    <div class="form-group">
									<label class="form-label" for="validationCustom03"><b>업종</b>
										<span class="text-danger">*</span></label> 
										<select class="custom-select" required="" name="openJobscd">
											<option value="10">서비스업</option>
											<option value="20">제조·화학</option>
											<option value="30">IT·웹·통신</option>
											<option value="40">은행·금융업</option>
											<option value="50">미디어·디자인</option>
											<option value="60">교육업</option>
											<option value="70">의료·제약·복지</option>
											<option value="80">판매·유통</option>
											<option value="90">건설업</option>
											<option value="99">기관·협회</option>
										</select>
								</div>
			                    <div class="form-group">
			                        <label class="form-label" for="example-email-2">회사명</label>
			                        <input type="text" value="${loginUser.coNm }" class="form-control" placeholder="" disabled>
			                        <input type="text" value="${loginUser.coNm }" name="openConm" style="display: none; "/>
			                    </div>
			                    <div class="form-group">
			                        <label class="form-label" for="example-email-2">회사주소</label>
			                        <input type="text" value="${loginUser.coAddr } ${loginUser.coDeaddr}" class="form-control" placeholder="" disabled>
			                        <input type="text" value="${loginUser.coAddr } ${loginUser.coDeaddr}" name="openRegion" style="display: none; "/>
			                    </div>
			                    <div class="form-group">
			                    	<div class="row" style="margin-left: 0px; margin-right: 0px;">
			                    		<div style = "display: inline; width: 50%; padding: 0px 5px 0px 0px;">
			                    			<label class="form-label" for="example-select">기업형태</label>
					                        <select class="form-control" id="example-select" name="openCOCL">
					                        	<option value="0">선택하세요</option>
					                            <option value="10">대기업</option>
					                            <option value="20">공기업</option>
					                            <option value="30">공공기관</option>
					                            <option value="40">중견기업</option>
					                            <option value="50">외국계기업</option>
					                        </select>
			                    		</div>
			                    		<div style = "display: inline; width: 50%; padding: 0px 5px 0px 5px;">
			                    			<label class="form-label" for="example-select">고용형태</label>
					                        <select class="form-control" id="example-select" name="openType">
					                        	<option value="0">선택하세요</option>
					                            <option value="10">정규직</option>
					                            <option value="20">정규직 전환</option>
					                            <option value="30">비정규직</option>
					                            <option value="40">기간제</option>
					                            <option value="50">시간선택제</option>
					                            <option value="60">기타</option>
					                        </select>
			                    		</div>
			                    	</div>
			                    </div>
			                    <div class="form-group">
			                    	<div class="row" style="margin-left: 0px; margin-right: 0px;">
			                    		<div style = "display: inline;  width: 50%; padding: 0px 5px 0px 0px;">
			                    			<label class="form-label" for="example-select">경력형태</label>
					                        <select class="form-control" id="example-select" name="openCar">
					                        	<option value="0">선택하세요</option>
					                            <option value="10">인턴</option>
					                            <option value="20">신입</option>
					                            <option value="30">경력</option>
					                            <option value="40">무관</option>
					                        </select>
			                    		</div>
			                    		<div style = "display: inline;  width: 50%; padding: 0px 5px 0px 5px;">
			                    			<label class="form-label" for="example-select">학력형태</label>
					                        <select class="form-control" id="example-select" name="openEdu">
					                        	<option value="0">선택하세요</option>
					                            <option value="10">고등학교졸업</option>
					                            <option value="20">대졸(2,3년)</option>
					                            <option value="30">대졸(4년)</option>
					                            <option value="40">석사</option>
					                            <option value="50">박사</option>
					                            <option value="99">학력무관</option>
					                        </select>
			                    		</div>
			                    	</div>
			                    </div>
			                    <div class="form-group">
			                    	<div class="row" style="margin-left: 0px; margin-right: 0px;">
										<div style = "display: inline;  width: 50%; padding: 0px 5px 0px 5px;">
			                        		<label class="form-label" for="simpleinput">지원자격(경력)</label>
			                        		<input type="text" name="openCarnm" class="form-control">
			                    		</div>	
			                    		<div style = "display: inline;  width: 50%; padding: 0px 5px 0px 5px;">
			                        		<label class="form-label" for="simpleinput">지원경력(학력)</label>
			                        		<input type="text" name="openEdunm" class="form-control">
			                    		</div>				                    	
			                    	</div>
			                    </div>
			                    <div class="form-group row" style="margin-left: 0px; margin-right: 0px;">
			                    	<div style="display: inline; width : 50%; padding : 0px 5px 0px 0px;">
			                    		<label class="form-label" for="example-date">채용공고등록일</label>
			                        	<input class="form-control" id="openSdate" type="date" value="" disabled>
			                    	</div>
			                    	<div style="display: inline; width : 50%; padding : 0px 0px 0px 5px;">
			                    		<label class="form-label" for="example-date">채용공고마감일</label>
			                        	<input class="form-control" id="openEdate" type="date" name="openEdate" value="">
			                    	</div>
			                    </div>
			                    <div class="form-group">
			                        <label class="form-label" for="simpleinput">직무설명</label>
			                        <textarea style="resize: none; width: 100%;" class="form-control" name="openContent" id="example-textarea" rows="15"></textarea>
			                    </div>
			                    <div class="form-group row" style="margin-left: 0px; margin-right: 0px;">
			                    	<div style="display: inline; width : 50%; padding : 0px 5px 0px 0px;">
			                    		<label class="form-label" for="example-date">모집인원수(명)</label>
			                        	<input class="form-control" id="openCnt" type="text" name="openCnt" value="">
			                    	</div>
			                    	<div style="display: inline; width : 50%; padding : 0px 0px 0px 5px;">
			                    		<label class="form-label" for="example-date">합격자발표일</label>
			                        	<input class="form-control" id="openEdate" type="date" name="openAcptpsn" value="">
			                    	</div>
			                    </div>
			                    <div>
			                    	<input class="form-control" id="" type="text" name="openLogo" value="${coInfo.coLogo}" style="display: none;">
			                    </div>
								<div class="panel-content border-faded border-left-0 border-right-0 border-bottom-0 d-flex flex-row align-items-center">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											id="invalidCheck" required=""> <label
											class="custom-control-label" for="invalidCheck"> Agree
											to terms and conditions <span class="text-danger">*</span>
										</label>
										<div class="invalid-feedback">You must agree before
											submitting.</div>
									</div>
									<button class="btn btn-success btn-pills ml-auto waves-effect waves-themed" type="button" id="openRecBtn">등록하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</main>

<script>
	document.getElementById('openSdate').value = new Date().toISOString().substring(0, 10);
</script>

<script>
/* 일반채용 Insert */
$('#recuritBtn').on('click', function() {
	var recuritParam = $('#recuritForm').serializeObject();
	
	console.log(recuritParam);
	
	$.ajax({
		url : 'recruitRegist',
		type : 'post',
		data : recuritParam,
		error : function(xhr, status) {
			alert("실패");
		},
		success : function(data) {
			alert("성공");
			location.reload();
		}
	}); 
});
</script>

<script>
/* 공개채용 Insert */
$('#openRecBtn').on("click", function() {
	var openRecParam = $("#openRecForm").serializeObject();
	
	console.log(openRecParam);
	
	$.ajax({
		url : 'openRecRegist',
		type : 'post',
		data : openRecParam,
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data) {
			$("#openRec-Form").modal('hide');
			location.reload();   
		},
		error : function(xhr,status) {
			alert("등록 실패 했습니다");
		}
	});
});
</script>

<script>
$('#RecModifyBtn').on('click',function() {
	var recuritModifyForm = $("#recuritModifyForm").serializeObject();
	
	console.log(recuritModifyForm);
});
</script>

<script>
/* 공개채용 수정 */
$('#openRecModifyBtn').on('click', function() {
	var openRecModifyForm = $('#openRecModifyForm').serializeObject();
	
	console.log(openRecModifyForm);
	
	$.ajax({
		url : 'openRecModify',
		type : 'post',
		data : openRecModifyForm,
		success : function(data) {
			alert("수정 완료했습니다.");
			location.reload();
		},
		error : function(xhr,status) {
			alert("수정 실패 했습니다");
		}
	});
});
</script>

<script>
/* 일반채용 Delete*/
$('#RecDeleteBtn').on('click', function() {
	var recno = $('#rno').val();
	
	$.ajax({
		url : 'recruitDelete',
		type : 'post',
		data : {'recno' : recno},
		error : function(xhr, status) {
			alert("실패");
		},
		success : function(data) {
			alert("성공");
			location.reload();
		}
	}); 
});
</script>


<script>
/* 공개채용 삭제 */
$('#openRecDeleteBtn').on('click', function() {
	var seqno = $('#no').val();
	
	$.ajax({
		url : 'openRecDelete',
		type : 'post',
		data : {'openSeqno' : seqno} ,
		success : function() {
			alert("삭제완료되었습니다.");
			location.reload();
		},
		error : function() {
			alert("삭제실패하였습니다.");
		}
	});
});
</script>

<script>
	(function() {
		'use strict';
		window.addEventListener('load', function() {
			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.getElementsByClassName('needs-validation');
			// Loop over them and prevent submission
			var validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
	})();
</script>
