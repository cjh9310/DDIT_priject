<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="member" value="${memberVO}" />

<style>

.panel {
	margin-top: 20px;
	margin-bottom: 20px;
	margin-right: 10px;
	margin-left: 10px;
}

</style>

<main id="js-page-content" role="main" class="page-content">
	<div class="row">
		<div class="col-xl-12">
	    	<div id="panel-1" class="panel">
		        <div class="panel-container show">
		            <div class="panel-content">
		            	<div class="row">
		            		<div class="col-3"></div>
	                 		 	<div class="col-6 mb-3" style="padding-left: 0px;" >
								<div class="input-group-append">
									<input id="button-addon4" type="text" class="form-control" style="width: 300px;"
										placeholder="검색할 업체명을 입력하세요" value=""/>
									<span class="input-group-append">	
										<button class="btn btn-default btn-icon waves-effect waves-themed" id="searchCoName" type="button" data-card-widget="search">
											<i class="fal fa-search fs-xl"></i>
										</button>
									</span>
								</div>
							</div>
						</div>
						<div class="tab-content mt-3">
							<div class="tab-pane fade show active" id="nav_pills_default-1"
								role="tabpanel">
								<table id="dt-basic-example"
									class="table table-bordered table-hover w-100"
									style="table-layout: fixed; padding: 0;">
									<thead class="mytable">
		                                    <tr>
		                                        <th style="width: 20%;">NO</th>
		                                        <th style="width: 80%;">업체명</th>
		                                    </tr>
		                            </thead>
		                            <tbody id = "mytablebody">
                                		<tr>
                                			<td colspan="2"><strong>해당 내용이 없습니다.</strong></td>
                                		</tr>
		                            </tbody>
		                        </table>
							</div>
		                </div>
		            </div>
		        </div>
	        </div>
	    </div>
	</div>
</main>


<script>

<%-- 
$("#searchCoName").on("click", function() {
	var keyword = $("#button-addon4").val();
	var DynamicSearchResult = '';
	$.ajax({
		url : '<%=request.getContextPath()%>/community/report/nameSearch',
		type : 'post',
		data : { "name" : keyword},
		error : function() {
			alert("실패하심");
		},
		success : function(data) {
			if(data == null) {
				$("#mytablebody").html("<tr><td colspan='2'>해당 사항 없음</td></tr>");
			}
			else {
				<c:set var="i" value="${i + 1}" />
				for (var idx in data) {
					DynamicSearchResult += "<tr>";
					DynamicSearchResult += "<td>"+<c:out value='${i}'/>+"</td>";
					DynamicSearchResult += "<td>"+${member.coNm}+"</td>"			
					DynamicSearchResult += "</tr>";
					
		            }
				
		         $("#mytablebody").append(DynamicSearchResult);					
					
				}
			
			console.log(data);
		}
	});
});
 --%>
 
  $("#searchCoName").on("click", function() {
	  
		var keyword = $("#button-addon4").val();
		var v_tblStr = "";
		
		$.ajax({
			url : 'nameSearch',
			type : 'post',
			data : { "name" : keyword}, 
			success : function(data) {
// 				console.log(data[0].coNm);
				// 데이터가 없을경우
				if(!data){
					v_tblStr = '<tr>';
					v_tblStr += '<td colspan="2"><strong>해당 내용이 없습니다.</strong></td>';  
					v_tblStr += '</tr>';  
				}else{
					// tbody 목록 초기화
					$('#mytablebody').empty();
					// for문을 이용하여 목록을 생성한다.
					$.each(data, function(key, val){
						var num = key + 1;
						v_tblStr += '<tr ondblclick="javascript:callBack(\'' + val.id +'\', \''+ val.coNm +'\');">';
						v_tblStr += '<td>' + num +'</td>';  
						v_tblStr += '<td>' + val.coNm +'</td>';  
						v_tblStr += '</tr>';  
					});
					$('#mytablebody').append(v_tblStr);
				}
			},
			error : function(request, status, error) {
				 alert("code: " + request.status + "message: " + request.responseText + "error: " + error);
			}
		})
  });
  
  function callBack(id, coNm){
	  self.close();
	  window.opener.nameSearch_callBack(id,coNm);
	  
  }
  
  
  
</script>