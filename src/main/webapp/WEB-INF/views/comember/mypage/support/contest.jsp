<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<c:set var="contestMap" value="${contestMap}"/>
<c:set var="mentoringMap" value="${mentoringMap}"/>

<c:set var="contestList" value="${contestMap.contestList}"/>
<c:set var="mentoringList" value="${mentoringMap.mentoringList}"/>
            
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>

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

                    <main id="js-page-content" role="main" class="page-content">
                        <div class="row">
                        	<div class="col-6">
                                <div id="공모전관리탭" class="panel" style="height: 420px;">
                                	<div class="panel-hdr">
										<div class="col-lg-6">
											<h2>공모전 목록</h2>
										</div>
										<div class="col-lg-6">
											<div class="float-right">
												<button type="button" class="btn btn-sm btn-success waves-effect waves-themed" data-toggle="modal" data-target=".contestRegistModal">공모전 등록</button>
											</div>
										</div>
									</div>
                                    <div class="panel-container show">
                                    	<div style="margin-right:18px; text-align:right">
                                    		
                                    		<!-- <a onclick="OpenWindow('supportContestRegistForm.do','글등록',800,700);" class="btn btn-sm btn-success shadow-0">공모전 등록</a> -->
                                    	</div>
                                        <div class="panel-content" style="height: 300px;">
                                            <ul class="nav nav-pills nav-justified" role="tablist">
                                                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#contestListAll">전체</a></li>
                                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#contestListWait">대기</a></li>
                                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#contestListIng">진행중</a></li>
                                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#contestListDone">완료</a></li>
                                            </ul>
                                            <div class="tab-content py-4">
                                                <div class="tab-pane fade show active" id="contestListAll" role="tabpanel" >
                                                	<div class="panel-content">
			                                            <div class="frame-wrap" style="overflow: auto; height: 230px;">
			                                            	<div class="">
			                                                <table class="table table-sm table-hover m-0" style="border-spacing: 0; border-collapse: separate; white-space: nowrap;">
			                                                    <thead class="text-center">
			                                                        <tr style="position: sticky; top: 0px; background-color: white; z-index: 99;">
			                                                        	<th class="border-right">No</th>
			                                                            <th>게시물 등록일</th>
			                                                        	<th>공모전명</th>
			                                                            <th>공모기간</th>
			                                                            <th>진행여부</th>
			                                                            <th></th>
			                                                        </tr>
			                                                    </thead>
			                                                    <tbody>
			                                                    <c:if test="${empty contestList }">
			                                                    	<tr>
			                                                    		<td class="text-center" colspan="5">
			                                                    			<strong>등록된 공모전이 없습니다.</strong>
			                                                    		</td>
			                                                    </c:if>
			                                                    <c:forEach items="${contestList }" var="contest" varStatus="idxRow">
			                                                        <%-- <tr style="cursor:pointer" name="${contest.conNo}" class="contestDetail"> --%>
			                                                        <tr style="cursor:pointer" name="${contest.conNo}" class="contestSupporterListAll" onclick="contestSupporterListB(${contest.conNo},'${contest.conTitle }')"> 
			                                                            <th class="text-center border-right" scope="row">${idxRow.count }</th>
			                                                            <td class="text-center"><fmt:formatDate value="${contest.conDate }" pattern="yyyy-MM-dd"/></td>
			                                                            <td>${contest.conTitle }</td>
			                                                            <td class="text-center"><fmt:formatDate value="${contest.conSdate }" pattern="yyyy-MM-dd"/>
			                                                            						~<fmt:formatDate value="${contest.conEdate }" pattern="yyyy-MM-dd"/>
			                                                            </td>
			                                                            <td class="text-center">
			                                                            <c:if test="${contest.conEdate < now }">종료</c:if>
			                                                            <c:if test="${contest.conSdate <= now and contest.conEdate >= now   }">진행중</c:if>
			                                                            <c:if test="${contest.conSdate > now and contest.conEdate >now }">대기</c:if>
																		</td>
																		<td>
																			<button class="btn btn-sm btn-success waves-effect waves-themed contestAdBtn" value="${contest.conNo}" type="button" >관 리</button>
																		</td>
			                                                        </tr>
			                                                    </c:forEach>		
			                                                    </tbody>
			                                                </table>
			                                               </div>
			                                            </div>
			                                        </div>
                                                </div>
                                                <div class="tab-pane fade" id="contestListWait" role="tabpanel">
													<div class="panel-content">
			                                            <div class="frame-wrap" style="overflow: auto; height: 230px;">
			                                                <table class="table table-sm table-hover m-0" style="border-spacing: 0; border-collapse: separate; white-space: nowrap;">
			                                                    <thead class="text-center">
			                                                        <tr style="position: sticky; top: 0px; background-color: white; z-index: 99;">
			                                                        	<th class="border-right">No</th>
			                                                            <th>게시물 등록일</th>
			                                                        	<th>공모전명</th>
			                                                            <th>공모기간</th>
			                                                            <th>진행여부</th>
			                                                            <th></th>
			                                                        </tr>
			                                                    </thead>
			                                                    <tbody>
			                                                    <c:forEach items="${contestList }" var="contest" varStatus="idxRow">
			                                                    	<c:if test="${contest.conSdate > now and contest.conEdate >now}">
				                                                        <c:set var="count1" value="${count1 + 1}" />
					                                                        <tr style="cursor:pointer" name="${contest.conNo}" class="testcontdetail" onclick="contestSupporterListB(${contest.conNo},'${contest.conTitle }')">
					                                                            <th class="text-center border-right" scope="row">${count1}</th>
					                                                            <td class="text-center"><fmt:formatDate value="${contest.conDate }" pattern="yyyy-MM-dd"/></td>
					                                                            <td>${contest.conTitle }</td>
					                                                            <td class="text-center"><fmt:formatDate value="${contest.conSdate }" pattern="yyyy-MM-dd"/>
					                                                            						~<fmt:formatDate value="${contest.conEdate }" pattern="yyyy-MM-dd"/>
					                                                            </td>
					                                                            <td class="text-center">
						                                                            <c:if test="${contest.conEdate < now }">종료</c:if>
						                                                            <c:if test="${contest.conSdate <= now and contest.conEdate >= now   }">진행중</c:if>
						                                                            <c:if test="${contest.conSdate > now  }">대기</c:if>
																				</td>
																				<td>
																					<button class="btn btn-sm btn-success waves-effect waves-themed contestAdBtn" value="${contest.conNo}" type="button" >관 리</button>
																				</td>
					                                                        </tr>
			                                                        </c:if>
			                                                   	<c:if test="${contest.conSdate > now }">
			                                                        	<c:set value="${contest}" var="contest_wait"/>
		                                                        	</c:if>
				                                                 </c:forEach>
				                                                   	<c:if test="${empty contest_wait}">
	                                                    				<tr>
		                                                    				<td class="text-center" colspan="6">
		                                                    					<strong>대기중인 공모전이 없습니다.</strong>
		                                                    				</td>
	                                                    				</tr>
	                                                    			</c:if>			
			                                                    </tbody>
			                                                </table>
			                                            </div>
			                                        </div>
                                                </div>
                                                <div class="tab-pane fade" id="contestListIng" role="tabpanel">
													<div class="panel-content">
			                                            <div class="frame-wrap" style="overflow: auto; height: 230px;">
			                                                <table class="table table-sm table-hover m-0" style="border-spacing: 0; border-collapse: separate; white-space: nowrap;">
			                                                    <thead class="text-center">
			                                                        <tr style="position: sticky; top: 0px; background-color: white; z-index: 99;">
			                                                        	<th class="border-right">No</th>
			                                                            <th>게시물 등록일</th>
			                                                        	<th>공모전명</th>
			                                                            <th>공모기간</th>
			                                                            <th>진행여부</th>
			                                                            <th></th>
			                                                        </tr>
			                                                    </thead>
			                                                    <tbody>
			                                                        <c:forEach items="${contestList }" var="contest" varStatus="idxRow">
			                                                    	<c:if test="${contest.conEdate > now }">
			                                                    	<c:set var="count2" value="${count2 + 1}" />
			                                                        <tr style="cursor:pointer" name="${contest.conNo}" class="testcontdetail" onclick="contestSupporterListB(${contest.conNo},'${contest.conTitle }')">
			                                                            <th class="text-center border-right" scope="row">${count2}</th>
			                                                            <td class="text-center"><fmt:formatDate value="${contest.conDate }" pattern="yyyy-MM-dd"/></td>
			                                                            <td>${contest.conTitle }</td>
			                                                            <td class="text-center"><fmt:formatDate value="${contest.conSdate }" pattern="yyyy-MM-dd"/>
			                                                            						~<fmt:formatDate value="${contest.conEdate }" pattern="yyyy-MM-dd"/>
			                                                            </td>
			                                                            <td class="text-center">
			                                                            <c:if test="${contest.conEdate < now }">종료</c:if>
			                                                            <c:if test="${contest.conSdate <= now and contest.conEdate >= now   }">진행중</c:if>
			                                                            <c:if test="${contest.conSdate > now  }">대기</c:if>
																		</td>
																		<td>
																			<button class="btn btn-sm btn-success waves-effect waves-themed contestAdBtn" value="${contest.conNo}" type="button" >관 리</button>
																		</td>
			                                                        </tr>
			                                                        </c:if>
			                                                   		<c:if test="${contest.conSdate <= now and contest.conEdate >= now }">
			                                                        	<c:set value="${contest}" var="contest_ing"/>
		                                                        	</c:if>
				                                                 </c:forEach>
				                                                   	<c:if test="${empty contest_ing}">
	                                                    				<tr>
		                                                    				<td class="text-center" colspan="6">
		                                                    					<strong>진행중인 공모전이 없습니다.</strong>
		                                                    				</td>
	                                                    				</tr>
	                                                    			</c:if>		
			                                                    </tbody>
			                                                </table>
			                                            </div>
			                                        </div>
                                                </div>
                                                <div class="tab-pane fade" id="contestListDone" role="tabpanel">
													<div class="panel-content">
			                                            <div class="frame-wrap" style="overflow: auto; height: 230px;">
			                                                <table class="table table-sm table-hover m-0" style="border-spacing: 0; border-collapse: separate; white-space: nowrap;">
			                                                    <thead class="text-center">
			                                                        <tr style="position: sticky; top: 0px; background-color: white; z-index: 99;">
			                                                        	<th class="border-right">No</th>
			                                                            <th>게시물 등록일</th>
			                                                        	<th>공모전명</th>
			                                                            <th>공모기간</th>
			                                                            <th>진행여부</th>
			                                                            <th></th>
			                                                        </tr>
			                                                    </thead>
			                                                    <tbody>
			                                                        <c:forEach items="${contestList }" var="contest" varStatus="idxRow">
			                                                    	<c:if test="${contest.conEdate < now }">
			                                                        <c:set var="count3" value="${count3 + 1}" />
			                                                        <tr style="cursor:pointer" name="${contest.conNo}" class="testcontdetail" onclick="contestSupporterList(${contest.conNo},'${contest.conTitle }')">
			                                                            <th class="text-center border-right" scope="row">${count3}</th>
			                                                            <td class="text-center"><fmt:formatDate value="${contest.conDate }" pattern="yyyy-MM-dd"/></td>
			                                                            <td>${contest.conTitle }</td>
			                                                            <td class="text-center"><fmt:formatDate value="${contest.conSdate }" pattern="yyyy-MM-dd"/>
			                                                            						~<fmt:formatDate value="${contest.conEdate }" pattern="yyyy-MM-dd"/>
			                                                            </td>
			                                                            <td class="text-center">
			                                                            <c:if test="${contest.conEdate < now }">종료</c:if>
			                                                            <c:if test="${contest.conSdate <= now and contest.conEdate >= now   }">진행중</c:if>
			                                                            <c:if test="${contest.conSdate > now  }">대기</c:if>
																		</td>
																		<td>
																			<button class="btn btn-sm btn-success waves-effect waves-themed contestAdBtn" value="${contest.conNo}" type="button" >관 리</button>
																		</td>
			                                                        </tr>
			                                                        </c:if>
			                                                   		<c:if test="${contest.conEdate < now }">
			                                                        	<c:set value="${contest}" var="contest_done"/>
		                                                        	</c:if>
				                                                 </c:forEach>
				                                                   	<c:if test="${empty contest_done}">
	                                                    				<tr>
		                                                    				<td class="text-center" colspan="6">
		                                                    					<strong>종료된 공모전이 없습니다.</strong>
		                                                    				</td>
	                                                    				</tr>
	                                                    			</c:if>		
			                                                    </tbody>
			                                                </table>
			                                            </div>
			                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                       <%--  <%@ include file="/WEB-INF/views/include/pagination.jsp" %>	 --%>
                                         <!-- <div class="frame-wrap">
                                                <nav aria-label="...">
                                                    <ul class="pagination pagination justify-content-center pagination-xs">
                                                        <li class="page-item disabled">
                                                            <a class="page-link" href="#" aria-label="Previous">
                                                                <span aria-hidden="true"><i class="fal fa-chevron-left"></i></span>
                                                            </a>
                                                        </li>
                                                        <li class="page-item active" aria-current="page">
                                                            <span class="page-link">
                                                                1
                                                                <span class="sr-only">(current)</span>
                                                            </span>
                                                        </li>
                                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="#" aria-label="Next">
                                                                <span aria-hidden="true"><i class="fal fa-chevron-right"></i></span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div> -->
                                    </div>
                                </div>
                             </div>
                                
                             <div class="col-6">
                                <div id="cSupporterList" class="panel" style="height: 420px;">
                                	<div class="panel-hdr">
										<div class="col-lg-6">
											<h2>공모전 지원자 목록</h2>
										</div>
										<div class="col-lg-6">
											<div class="float-right">
											 <!-- 버튼 들어갈 자리 -->
											</div>
										</div>
									</div>
                                    <div class="panel-container show">
                                    	<div style="margin-bottom:30px;"></div>
                                       	<div class="panel-content" style="height: 300px;">
		                                      <div class="frame-wrap" style="overflow: auto; height: 230px;"id="ajaxConList">
		                                          <div class="text-center">
		                                          	<h5>공모전 지원자 목록을 보시려면 좌측 공모전을 선택하세요.</h5>
		                                          </div>
		                                          <!-- <table class="table table-sm table-hover m-0">
		                                              <thead class="text-center">
		                                                  
		                                              </thead>
		                                              <tbody>
		                                              	<tr>
                                                 			<td class="text-center" colspan="6">
                                                 				
                                                 			</td>
                                                		</tr>
		                                                  <tr class="text-center" style="cursor:pointer">
		                                                      <th scope="row">1</th>
		                                                      <td>2022-10-18</td>
		                                                      <td>김땡땡</td>
		                                                      <td>010-1234-5678</td>
		                                                      <td><i class="ni ni-paper-clip"></i></td>
		                                                      <td>
		                                                      	<select class="form-control" id="contest_score_select">
		                                                     		<option>0</option>
		                                                     		<option>1</option>
		                                                     		<option>2</option>
		                                                     		<option>3</option>
		                                                 		</select>
		                                             		  </td>
		                                                      <td>
		                                                      	<select class="form-control" id="contest_score_select">
		                                                     		<option>0</option>
		                                                     		<option>1</option>
		                                                     		<option>2</option>
		                                                     		<option>3</option>
		                                                 		</select>
		                                             		  </td>
		                                             		  <td>
		                                             			<a href="javascript:void(0);" class="btn btn-sm btn-success shadow-0" id="js-sweetalert2-example-7">수정</a>
															  </td>
		                                                  </tr>
		                                                  리스트 불러올 조건문 
		                                                  		
		                                              </tbody>
		                                              상담리스트 보여줄 내용이 없을때
		                                              	
		                                          </table> -->
		                                         
		                                      </div>
		                                      
                                  			</div>
                                       </div>
                            		</div>
                            		
                            	</div>
                           	</div>
                            
                        
                            
<!--멘토링  -->             <div class="row">
                        	<div class="col-6">
                                <div id="멘토링관리탭" class="panel" style="height: 420px;">
                                	<div class="panel-hdr">
										<div class="col-lg-6">
											<h2>멘토링 목록</h2>
										</div>
										<div class="col-lg-6">
											<div class="float-right">
												<button type="button" class="btn btn-sm btn-success waves-effect waves-themed" data-toggle="modal" data-target=".metoringRegistModal">멘토링 등록</button>
											</div>
										</div>
									</div>
                                    <div class="panel-container show">
                                    	<div style="margin-right:18px; text-align:right">
                                    		
                                    		<!-- <a onclick="OpenWindow('supportContestRegistForm.do','글등록',800,700);" class="btn btn-sm btn-success shadow-0">공모전 등록</a> -->
                                    	</div>
                                        <div class="panel-content" style="height: 300px;">
                                            <ul class="nav nav-pills nav-justified" role="tablist">
                                                <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#mentoringListAll">전체</a></li>
                                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#mentoringListWait">대기</a></li>
                                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#mentoringIng">진행중</a></li>
                                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#mentoringDone">종료</a></li>
                                            </ul>
                                            <div class="tab-content py-3">
                                                <div class="tab-pane fade show active" id="mentoringListAll" role="tabpanel" >
                                                	<div class="panel-content">
			                                            <div class="frame-wrap" style="overflow: auto; height: 230px;">
			                                            	<div class="">
			                                                <table class="table table-sm table-hover m-0" style="border-spacing: 0; border-collapse: separate; white-space: nowrap;">
			                                                    <thead class="text-center">
			                                                        <tr style="position: sticky; top: 0px; background-color: white; z-index: 99;">
			                                                        	<th class="border-right">No</th>
			                                                            <th>게시물 등록일</th>
			                                                        	<th>멘토링명</th>
			                                                            <th>기간</th>
			                                                            <th>참가인원수</th>
			                                                            <th>진행여부</th>
			                                                            <th></th>
			                                                        </tr>
			                                                    </thead>
			                                                    <tbody>
			                                                    <c:if test="${empty mentoringList }">
			                                                    	<tr>
			                                                    		<td class="text-center" colspan="6">
			                                                    			<strong>등록된 멘토링이 없습니다.</strong>
			                                                    		</td>
			                                                    </c:if>
			                                                    <c:forEach items="${mentoringList }" var="mentoring" varStatus="idxRow">
			                                                        <%-- <tr style="cursor:pointer" name="${contest.conNo}" class="contestDetail"> --%>
			                                                        <tr style="cursor:pointer" name="${mentoring.menNo}" class="mentoringSupporterList" onclick="mentoringSupporterListB(${mentoring.menNo},'${mentoring.menTitle }')"> 
			                                                            <th class="text-center border-right" scope="row">${idxRow.index+1 }</th>
			                                                            <td class="text-center"><fmt:formatDate value="${mentoring.menDate }" pattern="yyyy-MM-dd"/></td>
			                                                            <td>${mentoring.menTitle }</td>
			                                                            <td class="text-center"><fmt:formatDate value="${mentoring.menSdate }" pattern="yyyy-MM-dd"/>
			                                                            						~<fmt:formatDate value="${mentoring.menEdate }" pattern="yyyy-MM-dd"/>
			                                                            </td>
			                                                            <td class="text-center">${mentoring.indCount}/${mentoring.numPeople }</td>
			                                                            <td class="text-center">
			                                                            <c:if test="${mentoring.menEdate < now }">종료</c:if>
			                                                            <c:if test="${ mentoring.menSdate <= now and mentoring.menEdate >= now }">진행중</c:if>
			                                                            <c:if test="${mentoring.menSdate > now }">대기</c:if>
																		</td>
																		<td>
																			<button class="btn btn-sm btn-success waves-effect waves-themed mentoringAdBtn" value="${mentoring.menNo }" type="button" >관 리</button>
																		</td>
			                                                        </tr>
			                                                    </c:forEach>		
			                                                    </tbody>
			                                                </table>
			                                               </div>
			                                            </div>
			                                        </div>
                                                </div>
                                                <div class="tab-pane fade" id="mentoringListWait" role="tabpanel">
													<div class="panel-content">
			                                            <div class="frame-wrap" style="overflow: auto; height: 230px;">
			                                                <table class="table table-sm table-hover m-0" >
			                                                    <thead class="text-center">
			                                                        <tr style="position: sticky; top: 0px; background-color: white; z-index: 99;">
			                                                        	<th class="border-right">No</th>
			                                                            <th>게시물 등록일</th>
			                                                        	<th>멘토링명</th>
			                                                            <th>기간</th>
			                                                            <th>참가인원수</th>
			                                                            <th>진행여부</th>
			                                                            <th></th>
			                                                        </tr>
			                                                    </thead>
			                                                    <tbody>
			                                                    <c:forEach items="${mentoringList }" var="mentoring">
			                                                    	<c:if test="${mentoring.menSdate > now }">
			                                                    	<c:set var="count4" value="${count4 + 1}" />
			                                                        <tr style="cursor:pointer" name="${mentoring.menNo}" class="mentoringSupporterList" onclick="mentoringSupporterListB(${mentoring.menNo},'${mentoring.menTitle }')"> 
			                                                            <th class="text-center border-right" scope="row">${count4 }</th>
			                                                            <td class="text-center"><fmt:formatDate value="${mentoring.menDate }" pattern="yyyy-MM-dd"/></td>
			                                                            <td>${mentoring.menTitle }</td>
			                                                            <td class="text-center"><fmt:formatDate value="${mentoring.menSdate }" pattern="yyyy-MM-dd"/>
			                                                            						~<fmt:formatDate value="${mentoring.menEdate }" pattern="yyyy-MM-dd"/>
			                                                            </td>
			                                                            <td class="text-center">${mentoring.indCount}/${mentoring.numPeople }</td>
			                                                            <td class="text-center">
			                                                            <c:if test="${mentoring.menEdate < now }">종료</c:if>
			                                                            <c:if test="${mentoring.menSdate <= now and mentoring.menEdate >= now }">진행중</c:if>
			                                                            <c:if test="${mentoring.menSdate > now }">대기</c:if>
																		</td>
																		<td>
																			<button class="btn btn-sm btn-success waves-effect waves-themed mentoringAdBtn" value="${mentoring.menNo }" type="button" >관 리</button>
																		</td>
			                                                        </tr>
			                                                        </c:if>
			                                                   		<c:if test="${mentoring.menSdate > now }">
			                                                        	<c:set value="${mentoring}" var="metoring_wait"/>
		                                                        	</c:if>
				                                                 </c:forEach>
				                                                   	<c:if test="${empty metoring_wait}">
	                                                    				<tr>
		                                                    				<td class="text-center" colspan="6">
		                                                    					<strong>대기중인 멘토링이 없습니다.</strong>
		                                                    				</td>
	                                                    				</tr>
	                                                    			</c:if>	
			                                                    </tbody>
			                                                </table>
			                                            </div>
			                                        </div>
                                                </div>
                                                <div class="tab-pane fade" id="mentoringIng" role="tabpanel">
													<div class="panel-content">
			                                            <div class="frame-wrap" style="overflow: auto; height: 230px;">
			                                                <table class="table table-sm table-hover m-0" >
			                                                    <thead class="text-center">
			                                                        <tr style="position: sticky; top: 0px; background-color: white; z-index: 99;">
			                                                        	<th class="border-right">No</th>
			                                                            <th>게시물 등록일</th>
			                                                        	<th>멘토링명</th>
			                                                            <th>기간</th>
			                                                            <th>참가인원수</th>
			                                                            <th>진행여부</th>
			                                                            <th></th>
			                                                        </tr>
			                                                    </thead>
			                                                    <tbody>
			                                                    <c:forEach items="${mentoringList }" var="mentoring" varStatus="idxRow">
			                                                    	<c:if test="${mentoring.menSdate <= now and mentoring.menEdate >= now }">
			                                                    	<c:set var="count5" value="${count5 + 1}" />
			                                                        <tr style="cursor:pointer" name="${mentoring.menNo}" class="mentoringSupporterList" onclick="mentoringSupporterListB(${mentoring.menNo},'${mentoring.menTitle }')"> 
			                                                            <th class="text-center border-right" scope="row">${count5 }</th>
			                                                            <td class="text-center"><fmt:formatDate value="${mentoring.menDate }" pattern="yyyy-MM-dd"/></td>
			                                                            <td>${mentoring.menTitle }</td>
			                                                            <td class="text-center"><fmt:formatDate value="${mentoring.menSdate }" pattern="yyyy-MM-dd"/>
			                                                            						~<fmt:formatDate value="${mentoring.menEdate }" pattern="yyyy-MM-dd"/>
			                                                            </td>
			                                                            <td class="text-center">${mentoring.indCount}/${mentoring.numPeople }</td>
			                                                            <td class="text-center">
			                                                            <c:if test="${mentoring.menEdate < now }">종료</c:if>
			                                                            <c:if test="${mentoring.menSdate <= now and mentoring.menEdate >= now  }">진행중</c:if>
			                                                            <c:if test="${mentoring.menSdate > now }">대기</c:if>
																		</td>
																		<td>
																			<button class="btn btn-sm btn-success waves-effect waves-themed mentoringAdBtn" value="${mentoring.menNo }" type="button" >관 리</button>
																		</td>
			                                                        </tr>
			                                                        </c:if>
		                                                   			<c:if test="${mentoring.menSdate <= now and mentoring.menEdate >= now }">
			                                                        	<c:set value="${mentoring}" var="metoring_ing"/>
		                                                        	</c:if>
				                                                   	</c:forEach>
				                                                   	<c:if test="${empty metoring_ing}">
	                                                    				<tr>
		                                                    				<td class="text-center" colspan="6">
		                                                    					<strong>진행중인 멘토링이 없습니다.</strong>
		                                                    				</td>
	                                                    				</tr>
	                                                    			</c:if>
			                                                    </tbody>
			                                                </table>
			                                            </div>
			                                        </div>
                                                </div>
                                                <div class="tab-pane fade" id="mentoringDone" role="tabpanel">
													<div class="panel-content">
			                                            <div class="frame-wrap" style="overflow: auto; height: 230px;">
			                                                <table class="table table-sm table-hover m-0">
			                                                    <thead class="text-center">
			                                                        <tr style="position: sticky; top: 0px; background-color: white; z-index: 99;">
			                                                        	<th class="border-right">No</th>
			                                                            <th>게시물 등록일</th>
			                                                        	<th>멘토링명</th>
			                                                            <th>멘토링 기간</th>
			                                                            <th>참여인원수</th>
			                                                            <th>진행여부</th>
			                                                            <th></th>
			                                                        </tr>
			                                                    </thead>
			                                                    <tbody>
			                                                        <c:forEach items="${mentoringList }" var="mentoring" varStatus="idxRow">
			                                                    		<c:if test="${mentoring.menEdate < now }">
			                                                    		<c:set var="count6" value="${count6 + 1}" />
					                                                        <tr style="cursor:pointer" name="${mentoring.menNo}" class="mentoringSupporterList" onclick="mentoringSupporterList(${mentoring.menNo},'${mentoring.menTitle }')"> 
					                                                            <th class="text-center border-right" scope="row">${count6 }</th>
					                                                            <td class="text-center"><fmt:formatDate value="${mentoring.menDate }" pattern="yyyy-MM-dd"/></td>
					                                                            <td>${mentoring.menTitle }</td>
					                                                            <td class="text-center"><fmt:formatDate value="${mentoring.menSdate }" pattern="yyyy-MM-dd"/>
					                                                            						~<fmt:formatDate value="${mentoring.menEdate }" pattern="yyyy-MM-dd"/>
					                                                            </td>
					                                                            <td class="text-center">신청자수/${mentoring.numPeople }</td>
					                                                            <td class="text-center">
						                                                            <c:if test="${mentoring.menEdate < now }">종료</c:if>
						                                                            <c:if test="${mentoring.menEdate >= now and mentoring.menSdate < now }">진행중</c:if>
						                                                            <c:if test="${mentoring.menSdate > now }">대기</c:if>
																				</td>
																				<td>
																					<button class="btn btn-sm btn-success waves-effect waves-themed mentoringAdBtn" value="${mentoring.menNo }" type="button" >관 리</button>
																				</td>
					                                                        </tr>
			                                                        	</c:if>
			                                                        	<c:if test="${mentoring.menEdate < now}">
				                                                        	<c:set value="${mentoring}" var="mentoring_done"/>
			                                                        	</c:if>
				                                                   	</c:forEach>
				                                                   	<c:if test="${empty mentoring_done}">
	                                                    				<tr>
		                                                    				<td class="text-center" colspan="6">
		                                                    					<strong>종료된 멘토링이 없습니다.</strong>
		                                                    				</td>
	                                                    				</tr>
	                                                    			</c:if>
			                                                    </tbody>
			                                                </table>
			                                            </div>
			                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                       <%--  <%@ include file="/WEB-INF/views/include/pagination.jsp" %>	 --%>
                                         <!-- <div class="frame-wrap">
                                                <nav aria-label="...">
                                                    <ul class="pagination pagination justify-content-center pagination-xs">
                                                        <li class="page-item disabled">
                                                            <a class="page-link" href="#" aria-label="Previous">
                                                                <span aria-hidden="true"><i class="fal fa-chevron-left"></i></span>
                                                            </a>
                                                        </li>
                                                        <li class="page-item active" aria-current="page">
                                                            <span class="page-link">
                                                                1
                                                                <span class="sr-only">(current)</span>
                                                            </span>
                                                        </li>
                                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="#" aria-label="Next">
                                                                <span aria-hidden="true"><i class="fal fa-chevron-right"></i></span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div> -->
                                    </div>
                                </div>
                             </div>
                            
                                
                            <div class="col-6">
                                <div id="멘토링지원자 목록탭" class="panel"  style="height: 420px;">
                                	<div class="panel-hdr">
										<div class="col-lg-6">
											<h2>멘토링 지원자 목록</h2>
										</div>
										<div class="col-lg-6">
											<div class="float-right">
												<!-- 버튼 들어갈 자리 -->
											</div>
										</div>
									</div>
                                    <div class="panel-container show">
                                    	<div style="margin-bottom:30px;"></div>
                                       	<div class="panel-content" style="height: 300px;">
		                                      <div class="frame-wrap" id="ajaxCureList">
		                                      	<div class="text-center">
		                                          	<h5>멘토링 지원자 목록을 보시려면 좌측 공모전을 선택하세요.</h5>
		                                          </div>
		                                          <!-- <table class="table table-sm table-hover m-0">
		                                              <thead class="text-center">
		                                                  <tr>
		                                                  	<th>No</th>
		                                                      <th>지원일자</th>
		                                                      <th>지원자명</th>
		                                                      <th>연락처</th>
		                                                      <th>진행상황</th>
		                                                      <th>가산점</th>
		                                                      <th></th>
		                                                  </tr>
		                                              </thead>
		                                              <tbody>
		                                                  <tr class="text-center" style="cursor:pointer">
		                                                      <th scope="row">1</th>
		                                                      <td>2022-10-18</td>
		                                                      <td>김땡땡</td>
		                                                      <td>010-1234-5678</td>
		                                                      <td>
		                                                      	<select class="form-control" id="contest_score_select">
		                                                     		<option>0</option>
		                                                     		<option>1</option>
		                                                     		<option>2</option>
		                                                     		<option>3</option>
		                                                     		<option>4</option>
		                                                 		</select>
		                                             		  </td>
		                                                      <td>
		                                                      	<select class="form-control" id="contest_score_select">
		                                                     		<option>0</option>
		                                                     		<option>1</option>
		                                                     		<option>2</option>
		                                                     		<option>3</option>
		                                                 		</select>
		                                             		  </td>
		                                             		  <td>
		                                             			<a href="javascript:void(0);" class="btn btn-sm btn-success shadow-0" id="js-sweetalert2-example-7">수정</a>
															  </td>
		                                                  </tr>
		                                              </tbody>
		                                          </table> -->
		                                         
		                                      </div>
		                                      
                                  			</div>
                                       </div>
                                       
                            		</div>
                            	</div>
                            	<div class="modal fade default-example-modal-right-sm metoringRegistModal"
												tabindex="-1" role="dialog" aria-hidden="true" id="menModal">
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
																	<h2>멘토링 등록</h2>
																	<div class="panel-toolbar">
																		<button class="btn btn-panel"
																			data-action="panel-collapse" data-toggle="tooltip"
																			data-offset="0,10" data-original-title="Collapse"></button>
																		<button class="btn btn-panel"
																			data-action="panel-fullscreen" data-toggle="tooltip"
																			data-offset="0,10" data-original-title="Fullscreen"></button>
																		<button class="btn btn-panel" data-action="panel-close"
																			data-toggle="tooltip" data-offset="0,10"
																			data-original-title="Close"></button>
																	</div>
																</div>
																<div class="panel-container show">
																	<div class="panel-content">
																		<div class="panel-tag">
									                                        <p>멘토링 등록 페이지</p>
																		</div>
																	</div>
																	<form class="needs-validation" novalidate=""
																		method="post" name="mentoringRegistForm" id="mentoringRegistForm">
																		<div class="panel-content">
																			<!-- <input type="hidden" name="supNo" value="0"> -->
																			<div class="form-group">
									                                        	<label class="form-label" for="menTitle"><b>멘토링명</b> <span class="text-danger">*</span></label>
									                                            <input type="text" class="form-control" id="menTitle" name="menTitle" placeholder="멘토링명을 입력해주세요." >
					                                                            <div class="invalid-feedback">
																					멘토링명을 입력해주세요.
					                                                            </div>
					                                                        </div>
					                                                        <div class="form-group">
									                                        	<label class="form-label" for="menContent"><b>멘토링 내용</b> <span class="text-danger">*</span></label>
									                                            <!-- <input type="text" class="form-control" id="menContent" name="menContent" placeholder="멘토링내용을 입력해주세요." > -->
					                                                            <textarea class="form-control" id="menContent" name="menContent" placeholder="멘토링내용을 입력해주세요." rows="7"></textarea>
					                                                            <div class="invalid-feedback">
																					멘토링내용을 입력해주세요.
					                                                            </div>
					                                                        </div>
					                                                        <div class="form-group">
					                                                            <label class="form-label" for="numPeople"><b>참여가능 인원 수</b> <span class="text-danger">*</span> </label>
					                                                            <input type="text" class="form-control" id="numPeople" name="numPeople" placeholder="참여가능 인원 수를 기입해주세요." >
					                                                            <div class="invalid-feedback">
																					참여가능 인원 수를 기입해주세요.
					                                                            </div>
					                                                        </div>
					                                                        
					                                                       <div class="form-group">
							                                                    <label class="form-label" for="menSdate"><b>멘토링 시작일자</b> <span class="text-danger">*</span></label>
							                                                    <input class="form-control" id="menSdate" type="date" name="menSdate">
							                                                </div> 
							                                                <div class="form-group">
							                                                    <label class="form-label" for="menEdate"><b>멘토링 종료일자</b> <span class="text-danger">*</span></label>
							                                                    <input class="form-control" id="menEdate" type="date" name="menEdate">
							                                                </div>
					                                                        
		
																			<!-- <div class="form-group mb-0">
																				<label class="form-label"><b>첨부파일</b></label>
																				<div class="custom-file">
																					<input type="file" class="custom-file-input" id="customFile">
																					<label class="custom-file-label" for="customFile">파일선택</label>
																				</div>
																			</div> -->
																		</div>
																		<div class="panel-content border-faded border-left-0 border-right-0 border-bottom-0 d-flex flex-row align-items-center">
																			<div class="custom-control custom-checkbox">
																				<input type="checkbox" class="custom-control-input"
																					id="invalidCheck" required=""> <label
																					class="custom-control-label" for="invalidCheck">
																					Agree to terms and conditions <span
																					class="text-danger">*</span>
																				</label>
																				<div class="invalid-feedback">You must agree
																					before submitting.</div>
																			</div>
																				<button class="btn btn-success btn-pills ml-auto waves-effect waves-themed" type="button" id="mentoringRegistBtn">등록하기</button>
																		</div>
																	</form>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											
											<div class="modal fade default-example-modal-right-sm contestRegistModal"
												tabindex="-1" role="dialog" aria-hidden="true" id="conModal">
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
																	<h2>공모전 등록</h2>
																	<div class="panel-toolbar">
																		<button class="btn btn-panel"
																			data-action="panel-collapse" data-toggle="tooltip"
																			data-offset="0,10" data-original-title="Collapse"></button>
																		<button class="btn btn-panel"
																			data-action="panel-fullscreen" data-toggle="tooltip"
																			data-offset="0,10" data-original-title="Fullscreen"></button>
																		<button class="btn btn-panel" data-action="panel-close"
																			data-toggle="tooltip" data-offset="0,10"
																			data-original-title="Close"></button>
																	</div>
																</div>
																<div class="panel-container show">
																	<div class="panel-content">
																		<div class="panel-tag">
									                                        <p>공모전 등록 페이지</p>
																		</div>
																	</div>
																	<form class="needs-validation" novalidate=""
																		method="post" name="registForm" id="registForm">
																		<div class="panel-content">
																			<!-- <input type="hidden" name="supNo" value="0"> -->
																			<div class="form-group">
									                                        	<label class="form-label" for="conTitle"><b>공모전명</b> <span class="text-danger">*</span></label>
									                                            <input type="text" class="form-control" id="conTitle" name="conTitle" placeholder="공모전명을 입력해주세요." >
					                                                            <div class="invalid-feedback">
																					공모전명을 입력해주세요.
					                                                            </div>
					                                                        </div>
					                                                        <div class="form-group">
									                                        	<label class="form-label" for="conContent"><b>공모전 간단소개내용</b> <span class="text-danger">*</span></label>
									                                            <input type="text" class="form-control" id="conContent" name="conContent" placeholder="공모전내용을 입력해주세요." >
					                                                            <div class="invalid-feedback">
																					공모전 간단소개내용을 입력해주세요.
					                                                            </div>
					                                                        </div>
					                                                        <div class="form-group">
					                                                            <label class="form-label" for="conField"><b>공모전 분야</b> <span class="text-danger">*</span> </label>
					                                                            <input type="text" class="form-control" id="conField" name="conField" placeholder="분야를 입력해주세요." >
					                                                            <div class="invalid-feedback">
																					공모분야를 입력해주세요.
					                                                            </div>
					                                                        </div>
					                                                        
					                                                       <div class="form-group">
							                                                    <label class="form-label" for="conSdate"><b>공모시작일자</b> <span class="text-danger">*</span></label>
							                                                    <input class="form-control" id="conSdate" type="date" name="conSdate">
							                                                </div> 
							                                                <div class="form-group">
							                                                    <label class="form-label" for="conEdate"><b>공모마감일자</b> <span class="text-danger">*</span></label>
							                                                    <input class="form-control" id="conEdate" type="date" name="conEdate">
							                                                </div>
					                                                        
					                                                        <div class="form-group">
					                                                            <label class="form-label" for="conAward"><b>시상내용</b> <span class="text-danger">* 시상분야는 대상,최우수,장려 3가지로만 구분되며 가산점은 0~3점까지만 부여가능합니다.</span></label>
					                                                            <input class="form-control" id="conAward" name="conAward" placeholder="ex) 대상 1인(3점) 최우수상 2인(2점) 장려상 2인(1점)"></input>
					                                                            <div class="invalid-feedback">
																					시상하실 내용을 입력해주세요. 
					                                                            </div>
					                                                        </div>
		
																			<!-- <div class="form-group mb-0">
																				<label class="form-label"><b>첨부파일</b></label>
																				<div class="custom-file">
																					<input type="file" class="custom-file-input" id="customFile">
																					<label class="custom-file-label" for="customFile">파일선택</label>
																				</div>
																			</div> -->
																		</div>
																		<div class="panel-content border-faded border-left-0 border-right-0 border-bottom-0 d-flex flex-row align-items-center">
																			<div class="custom-control custom-checkbox">
																				<input type="checkbox" class="custom-control-input"
																					id="invalidCheck" required=""> <label
																					class="custom-control-label" for="invalidCheck">
																					Agree to terms and conditions <span
																					class="text-danger">*</span>
																				</label>
																				<div class="invalid-feedback">You must agree
																					before submitting.</div>
																			</div>
																				<button class="btn btn-success btn-pills ml-auto waves-effect waves-themed" type="button" id="registBtn">등록하기</button>
																		</div>
																	</form>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
                            	
                            </div>
                    </main>
        <%@ include file="/WEB-INF/views/comember/mypage/support/support_js.jsp"%>            
        <script src="<%=request.getContextPath()%>/resources/template/js/vendors.bundle.js"></script>
        <script src="<%=request.getContextPath()%>/resources/template/js/app.bundle.js"></script>
        <script src="<%=request.getContextPath()%>/resources/template/js/notifications/sweetalert2/sweetalert2.bundle.js"></script>
<script>
    $('#js_change_tab_direction input').on('change', function(){
        var newclass = $('input[name=radioNameTabDirection]:checked', '#js_change_tab_direction').val();
        $('#js_change_tab_direction').parent('.panel-tag').next('.nav.nav-tabs').removeClass().addClass(newclass);
    });
    $('#js_change_pill_direction input').on('change', function(){
        var newclass = $('input[name=radioNamePillDirection]:checked', '#js_change_pill_direction').val();
        $('#js_change_pill_direction').parent('.panel-tag').next('.nav.nav-pills').removeClass().addClass(newclass);
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
<script>
		$("#registBtn").on("click", function() { //신청하기 버튼을 클릭하였을 때
			
			
			var param = $("#registForm").serialize();
			param = param.replaceAll('-','/');
			
			$.ajax({
				url : 'contestRegist.do',
				type : 'POST',
				data : param,
				cache: false,
	            async: true,
				success : function(data) {
					Swal.fire({
						target: document.getElementById('conModal'),
		                icon: 'success',
						title: "프로그램이 등록되었습니다.",
		                type: "success",
		                showCancelButton: false,
		                confirmButtonText: "OK"
		    		}).then(function(result){
					 
						window.location.replace(location.href);
					
		    		});
					
				},
				error : function(request, status, error) {
					 alert("code: " + request.status + "message: " + request.responseText + "error: " + error);
				}
			});
		});
</script>
<script>
		$("#mentoringRegistBtn").on("click", function() { //신청하기 버튼을 클릭하였을 때
			
			
			var param = $("#mentoringRegistForm").serialize();
			param = param.replaceAll('-','/');
			//alert(param);
			
			$.ajax({
				url : 'mentoringRegist.do',
				type : 'POST',
				data : param,
				cache: false,
	            async: true,
				success : function(data) {
					Swal.fire({
						target: document.getElementById('menModal'),
		                icon: 'success',
						title: "프로그램이 등록되었습니다.",
		                type: "success",
		                showCancelButton: false,
		                confirmButtonText: "OK"
		    		}).then(function(result){
					 
						window.location.replace(location.href);
					
		    		});
					
				},
				error : function(request, status, error) {
					 alert("code: " + request.status + "message: " + request.responseText + "error: " + error);
				}
			
		});
	});		
</script>

<script>
	$('.contestAdBtn').on('click', function(){
		
		var conNo = $(this).val();
		//alert(conNo);
		
		window.open('contestDetail.do?conNo='+ conNo,'공모전 상세보기','width=900,height=750,left=300');
				
		
	});
	
$('.mentoringAdBtn').on('click', function(){
		
		var menNo = $(this).val();
		//alert(menNo);
		
		window.open('mentoringDetail.do?menNo='+ menNo,'멘토링 상세보기','width=900,height=750,left=300');
				
		
	});
</script>
<!-- mentoring -->

<!-- 종료전 상태에서 가산점 수정 안되게 -->
<script>

function mentoringSupporterListB(m,t){  

   $.ajax({
      url:"mentoringSupporterList",
      type:"get",
      data: {menNo: m},
      dataType:"json",
      success: function(data) {
    	  ajaxHtmlMentoringB(data,t);
	},
      error:function(){alert("error");
      console.log(data)}
   });
}

   function ajaxHtmlMentoringB(data,t){
	   console.log(t);
	   if(data.activityMenList.length == 0){
		  var html = "<div class = text-center>";
			 html += "<h5>'"+ t +"'</br>"+"멘토링에 지원한 인원이 없습니다.</h5>";
			 html += "</div>";
			 
	   }else {
			console.log(data)
			
			var html = "<div class='frame-wrap' id='ajaxCureList'>";
               	html += "<table class='table table-sm table-hover m-0'>";
               	html += "<thead class='text-center'>";
		        html += "<tr>";
		        html += "<th>No</th>";
		        html += "<th>지원일자</th>";
		        html += "<th>지원자명</th>";
		        html += "<th>회원ID</th>";
		        html += "<th>연락처</th>";
		        html += "<th></th>";
		        html += "</tr>";
		        html += "</thead>";
		        html += "<tbody>";
			
		      /* var html="<table class='table table-bordered' id='userListTable'>";
		      html+="<tr>";
		      html+="<th>진료일자</th>";
		      html+="<th>진료의사</th>";
		      html+="<th>진료내역</th>";
		      html+="<th>이름</th>";
		      html+="<th>연령|성별</th>";
		          
		      html+="</tr>"; */
	   }
      
      
      $.each(data.activityMenList, (index, obj)=>{
    	  
    	  	html +=	"<tr class='text-center' style='cursor:pointer'>";
          	html +=	"<th scope='row'>"+index+"</th>";
            html +=	"<td>"+moment(obj.actDate).format("YYYY-MM-DD")+"</td>";
            html +=	"<td>"+obj.name+"</td>";
            html +=	"<td>"+obj.indId+"</td>";
            html +=	"<td>"+obj.actTel+"</td>";
            
            if(obj.actStatus == 3){
            	html += "<td>중도포기</td>";
            }else{
            	html += "<td></td>";
            }
			html += "</tr>";
      })
      html+="</tbody>";
      html+="</table>";
      html+="</div>";
      
      $("#ajaxCureList").html(html);
      //$("#mentoringScoreSelect").val(obj.actScore);
   }



</script>

<!-- 종료된 상태일때 가산점 줄 수 있게  -->
<script>

function mentoringSupporterList(m,t){  

   $.ajax({
      url:"mentoringSupporterList",
      type:"get",
      data: {menNo: m},
      dataType:"json",
      success: function(data) {
    	  ajaxHtmlMentoring(data,t);
	},
      error:function(){alert("error");
      console.log(data)}
   });
}

   function ajaxHtmlMentoring(data,t){
	   console.log(t);
	   if(data.activityMenList.length == 0){
		  var html = "<div class = text-center>";
			 html += "<h5>'"+ t +"'</br>"+"멘토링에 지원한 인원이 없습니다.</h5>";
			 html += "</div>";
			 
	   }else {
			console.log(data)
			
			var html = "<div class='frame-wrap' id='ajaxCureList'>";
               	html += "<table class='table table-sm table-hover m-0'>";
               	html += "<thead class='text-center'>";
		        html += "<tr>";
		        html += "<th>No</th>";
		        html += "<th>지원일자</th>";
		        html += "<th>지원자명</th>";
		        html += "<th>회원ID</th>";
		        html += "<th>연락처</th>";
		        html += "<th>진행상황</th>";
		        html += "<th>가산점</th>";
		        html += "<th></th>";
		        html += "</tr>";
		        html += "</thead>";
		        html += "<tbody>";
			
		      /* var html="<table class='table table-bordered' id='userListTable'>";
		      html+="<tr>";
		      html+="<th>진료일자</th>";
		      html+="<th>진료의사</th>";
		      html+="<th>진료내역</th>";
		      html+="<th>이름</th>";
		      html+="<th>연령|성별</th>";
		          
		      html+="</tr>"; */
	   }
      
      
      $.each(data.activityMenList, (index, obj)=>{
    	  
    	  	html +=	"<tr class='text-center' style='cursor:pointer'>";
          	html +=	"<th scope='row'>"+index+"</th>";
            html +=	"<td>"+moment(obj.actDate).format("YYYY-MM-DD")+"</td>";
            html +=	"<td>"+obj.name+"</td>";
            html +=	"<td>"+obj.indId+"</td>";
            html +=	"<td>"+obj.actTel+"</td>";
            html +=	"<td>"+ +"</td> ";
         	html +=	"<td>";
            html +=	"<select class='form-control' id='"+obj.actNo+"'>";
            
            if(obj.actScore == 0){
                html +=	"<option value=0 selected>없음</option>";
            }else {
                html +=	"<option value=0>없음</option>";            	
            }

            if(obj.actScore == 1){
                html +=	"<option value=1 selected>1점</option>";
            }else {
                html +=	"<option value=1>1점</option>";            	
            }

            if(obj.actScore == 2){
                html +=	"<option value=2 selected>2점</option>";
            }else {
                html +=	"<option value=2>2점</option>";            	
            }

            if(obj.actScore == 3){
                html +=	"<option value=3 selected>3점</option>";
            }else {
                html +=	"<option value=3>3점</option>";            	
            }

            /* html +=	"<option value=1>1점</option>";
            html +=	"<option value=2>2점</option>";
            html +=	"<option value=3>3점</option>"; */
            html +=	"</select>";
         	html +=	"</td>";
     		html +=	"<td>";
     		html +=	"<button class='btn btn-sm btn-success shadow-0' onclick='scoreModifyBtn("+obj.actNo+")'>수정</button>";
     		html += "</td>";
			html += "</tr>";
      })
      html+="</tbody>";
      html+="</table>";
      html+="</div>";
      
      $("#ajaxCureList").html(html);
      //$("#mentoringScoreSelect").val(obj.actScore);
   }



</script>

<script> //가산점 부여
function scoreModifyBtn(a){
	Swal.fire({
                icon: 'warning',
				title: "가산점을 부여하시겠습니까?",
                type: "success",
                showCancelButton: true,
                confirmButtonText: "OK"
    }).then(function(result){
    		if(result.value){
    			$.ajax({
    				type:"put",
    				url:"/ddit/comember/mypage/mentoringScoreModify",
    				contentType:"application/json; charset=UTF-8",
    				data: JSON.stringify({
    					actNo:a,
    					actScore:$('#'+a).val()
    				}),
    				success:function(p_rslt){
						console.log(p_rslt)
    					
    					Swal.fire({
  							icon: 'success',
  							title: '가산점이 부여 되었습니다.',
  							showConfirmButton: false,
  							timer: 1500
						})
    				},
    				error:(request,status,error)=>{
    					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    				}
    			})
    		}
    });	
}
</script>
<!-- contest -->
<!-- 가산점 수정 없는 함수-->
<script>

function contestSupporterListB(c,t){  
   console.log(event.target);
   $.ajax({
      url:"contestSupporterList",
      type:"get",
      data: {conNo: c},
      dataType:"json",
      success: function(data){
    	  ajaxHtmlContestB(data,t)
      },
      error:function(){alert("error");
      console.log(data)}
   });
}

   function ajaxHtmlContestB(data,t){
	   if(data.activityList.length == 0){
		  var html = "<div class = text-center>";
			 html += "<h5>'"+ t +"'</br>"+"공모전에 지원한 인원이 없습니다.</h5>";
			 html += "</div>";
			 
	   }else {
			console.log(data)
			
			var html = "<div class='frame-wrap' id='ajaxConList'>";
               	html += "<table class='table table-sm table-hover m-0'>";
               	html += "<thead class='text-center'>";
		        html += "<tr>";
		        html += "<th>No</th>";
		        html += "<th>지원일자</th>";
		        html += "<th>지원자명</th>";
		        html += "<th>연락처</th>";
		        html += "<th>제출파일</th>";
		        html += "</tr>";
		        html += "</thead>";
		        html += "<tbody>";
			
		      /* var html="<table class='table table-bordered' id='userListTable'>";
		      html+="<tr>";
		      html+="<th>진료일자</th>";
		      html+="<th>진료의사</th>";
		      html+="<th>진료내역</th>";
		      html+="<th>이름</th>";
		      html+="<th>연령|성별</th>";
		          
		      html+="</tr>"; */
	   }
      
      
      $.each(data.activityList, (index, obj)=>{
    	  
    	  	html +=	"<tr class='text-center' style='cursor:pointer'>";
          	html +=	"<th scope='row'>"+index+"</th>";
            html +=	"<td>"+moment(obj.actDate).format("YYYY-MM-DD")+"</td>";
            html +=	"<td>"+obj.indId+"</td>";
            html +=	"<td>"+obj.actTel+"</td>";
            html +=	"<td>"+ +"</td>";
			html += "</tr>";
      })
      html+="</tbody>";
      html+="</table>";
      html+="</div>";
      
      $("#ajaxConList").html(html);
   }

</script>

<!-- 가산점 수정하는 폼 있는 함수 -->
<script>

function contestSupporterList(c,t){  
   console.log(event.target);
   $.ajax({
      url:"contestSupporterList",
      type:"get",
      data: {conNo: c},
      dataType:"json",
      success: function(data){
    	  ajaxHtmlContest(data,t)
      },
      error:function(){alert("error");
      console.log(data)}
   });
}

   function ajaxHtmlContest(data,t){
	   if(data.activityList.length == 0){
		  var html = "<div class = text-center>";
			 html += "<h5>'"+ t +"'</br>"+"공모전에 지원한 인원이 없습니다.</h5>";
			 html += "</div>";
			 
	   }else {
			console.log(data)
			
			var html = "<div class='frame-wrap' id='ajaxConList'>";
               	html += "<table class='table table-sm table-hover m-0'>";
               	html += "<thead class='text-center'>";
		        html += "<tr>";
		        html += "<th>No</th>";
		        html += "<th>지원일자</th>";
		        html += "<th>지원자명</th>";
		        html += "<th>연락처</th>";
		        html += "<th>제출파일</th>";
		        html += "<th>시상내용</th>";
		        html += "<th>가산점</th>";
		        html += "<th></th>";
		        html += "</tr>";
		        html += "</thead>";
		        html += "<tbody>";
			
		      /* var html="<table class='table table-bordered' id='userListTable'>";
		      html+="<tr>";
		      html+="<th>진료일자</th>";
		      html+="<th>진료의사</th>";
		      html+="<th>진료내역</th>";
		      html+="<th>이름</th>";
		      html+="<th>연령|성별</th>";
		          
		      html+="</tr>"; */
	   }
      
      
      $.each(data.activityList, (index, obj)=>{
    	  
    	  	html +=	"<tr class='text-center' style='cursor:pointer'>";
          	html +=	"<th scope='row'>"+index+"</th>";
            html +=	"<td>"+moment(obj.actDate).format("YYYY-MM-DD")+"</td>";
            html +=	"<td>"+obj.indId+"</td>";
            html +=	"<td>"+obj.actTel+"</td>";
            html +=	"<td>"+ +"</td>";
            html +=	"<td>";
            html +=	"<select class='form-control' id='contest_score_select'>";
            html +=	"<option>0</option>";
            html += "<option>1</option>";
            html += "<option>2</option>";
            html += "<option>3</option>";
            html +=	"</select>";
         	html +=	"</td>";
         	html +=	"<td>";
            html +=	"<select class='form-control' id='contest_score_select'>";
            html +=	"<option>0</option>";
            html +=	"<option>1</option>";
            html +=	"<option>2</option>";
            html +=	"<option>3</option>";
            html +=	"</select>";
         	html +=	"</td>";
     		html +=	"<td>";
     		html +=	"<a href='javascript:void(0);' class='btn btn-sm btn-success shadow-0' id='js-sweetalert2-example-7'>수정</a>";
     		html += "</td>";
			html += "</tr>";
      })
      html+="</tbody>";
      html+="</table>";
      html+="</div>";
      
      $("#ajaxConList").html(html);
   }

</script>
  
