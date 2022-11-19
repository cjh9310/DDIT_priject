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
									placeholder="검색할 업체명을 입력하세요" value="${param.name }"/>
								<span class="input-group-append">	
									<button class="btn btn-default btn-icon waves-effect waves-themed" type="button" onclick="list_go();" data-card-widget="search">
										<i class="fal fa-search fs-xl"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="tab-content mt-5">
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
	                            <tbody>
                                	<c:if test="${empty member}">
                                		<tr>
                                			<td colspan="6"><strong>해당 내용이 없습니다.</strong> 
                                		</tr>
                                	</c:if>	  
                                	<c:forEach items="${member }" val="memberList">
                                		<c:set var="i" value="${i+1 }"/>
                                		 	<td><c:out value="${i }" /></td>
                                		 	<td>${memberList.id }</td>
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