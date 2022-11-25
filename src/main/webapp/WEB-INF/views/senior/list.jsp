<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<c:set var="seniorList" value="${seniorList }" />

<style>

	.col-md-4 img {
	    object-fit:cover;
	    width: 100%;
	    height: 100%;
	}
	
	.col-md-4 {
		padding-left: 2px;
		padding-right: 0px;	
	}
	
	.col-md-5 img {
	    object-fit:cover;
	    width: 100%;
	    height: auto;
	}
	
	.col-md-7 {
		display: flex;
		align-items: center;
	}
	
	#tootitle {
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	}
	
	
</style>

<main id="js-page-content" role="main" class="page-content">

<!-- ------------------Breadcrumbs--------------------- -->
	<div class="row" >
		<div class="col-xl-12">
			<!--Backgrounds-->
			<div id="panel-6" class="panel">
				<div class="panel-container show">
					<div class="demo-v-spacing">
						<ol class="breadcrumb bg-primary-300">
							<li class="breadcrumb-item text-white"><a href="#"
								class="text-white"> <i class="fal fa-home mr-1"></i> 어르신을위한 채용공고
							</a></li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- --------------------------- Card -------------------------------- -->

 	<div class="row" >
	    <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3">
	        <div class="card shadow-1 shadow-hover-5 mb-g">
	            <div class="card-body p-3">
	            <div class="row">
	                <div class="col-md-4">
	                	<img src="<%=request.getContextPath()%>/resources/template/img/senior/icon1.png">
	                </div>
	                <div class="col-md-8 mt-3">
	                	<h5><b>참여연령</b><br> 만 65세이상 기초연금수급자 </h5><br>
	                	<h5><b>근무시간</b><br> 월 30시간이상(일3시간이내) </h5><br>
	                	<h5><b>활동비</b><br> 월 27만원 </h5>
	                </div>
	            </div>
	            </div>
	        </div>
	    </div>
	    
	    <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3">
	        <div class="card shadow-1 shadow-hover-5 mb-g">
	            <div class="card-body p-3">
	            <div class="row">
	                <div class="col-md-4">
	                	<img src="<%=request.getContextPath()%>/resources/template/img/senior/icon2_3.png">
	                </div>
	                <div class="col-md-8 mt-3">
	                	<h5><b>참여연령</b><br> 만 65세이상 </h5><br>
	                	<h5><b>근무시간</b><br> 10개월(월 60시간) </h5><br>
	                	<h5><b>활동비</b><br> 월 71만원 </h5>
	                </div>
	            </div>
	            </div>
	        </div>
	    </div>   
	    
	    <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3">
	        <div class="card shadow-1 shadow-hover-5 mb-g">
	            <div class="card-body p-3">
	            <div class="row">
	                <div class="col-md-4">
	                	<img src="<%=request.getContextPath()%>/resources/template/img/senior/icon3.png">
	                </div>
	                <div class="col-md-8 mt-3">
	                	<h5><b>참여연령</b><br> 만 60세이상 </h5><br>
	                	<h5><b>근무내용 :</b> 단순노무직(경비등), 주유원, 관리사무직, 시험감독관 </h5><br>
	                	<h5><b>근무기간 및 활동비</b><br> 계약에따라 다름 </h5>
	                </div>
	            </div>
	            </div>
	        </div>
	    </div>
	 
	    <div class="col-sm-3 col-md-3 col-lg-3 col-xl-3">
	        <div class="card shadow-1 shadow-hover-5 mb-g">
	            <div class="card-body p-3">
	            <div class="row">
	                <div class="col-md-4">
	                	<img src="<%=request.getContextPath()%>/resources/template/img/senior/icon4_5.png" >
	                </div>
	                <div class="col-md-8 mt-3">
	                	<h5><b>참여연령</b><br> 만 60세이상 </h5><br>
	                	<h5><b>근무시간</b> 기업 근로계약에 따라 다름</h5><br>
	                	<h5><b>활동비</b><br> 기업 근로계약에 따라 다름 </h5>
	                </div>
	            </div>
	            </div>
	        </div>
	    </div>    
	</div>  
	
	
<!-- ------------------------------------------------------------------------------------------ -->		
<!-- 
	<div class="demo">
	    <button type="button" class="btn btn-lg btn-primary waves-effect waves-themed">대덕구</button>
	    <button type="button" class="btn btn-lg btn-primary waves-effect waves-themed">동구</button>
	    <button type="button" class="btn btn-lg btn-primary waves-effect waves-themed">서구</button>
	    <button type="button" class="btn btn-lg btn-primary waves-effect waves-themed">유성구</button>
	    <button type="button" class="btn btn-lg btn-primary waves-effect waves-themed">중구</button>	   
	</div>
 -->
<!-- ------------------------------------------------------------------------------------------ -->	
	
	
	<div class="row">
	    <!-- Card decks -->
	    <div class="col-sm-12">
	        <div class="panel-container show">
	            <div class="panel-content">
	                <div class="card-deck">
					    <c:forEach items="${seniorList }" var="senior">
						    <div class="col-sm-4 col-md-4 col-lg-4 col-xl-4 mt-4">
						        <div class="card shadow-1 shadow-hover-5 mb-g">
						            <div class="card-header p-3">
							            <div class="row">
							                <div class="col-md-5" >
							                	<c:choose>
							                		<c:when test="${senior.snrType  == '1'}">
							                			<img src="<%=request.getContextPath()%>/resources/template/img/senior/icon5_1.png">
							                		</c:when>
							                		<c:when test="${senior.snrType  == '2'}">
							                			<img src="<%=request.getContextPath()%>/resources/template/img/senior/icon6.png">
							                		</c:when>
							                		<c:when test="${senior.snrType  == '3'}">
							                			<img src="<%=request.getContextPath()%>/resources/template/img/senior/icon8.png">
							                		</c:when>
							                		<c:when test="${senior.snrType  == '4'}">
							                			<img src="<%=request.getContextPath()%>/resources/template/img/senior/icon7.png">
							                		</c:when>								                										                									                		
							                	</c:choose>
							                	
							                </div>
							                <div class="col-md-7">
							                	<div class="title" id="tooltitle" style="width: 300px; height: 60px;">
							                		<h3><b>${senior.snrTitle }</b></h3>
							                	</div>
							                </div>
							            </div>
						            </div>
						            <div class="card-body" >
						            	<div class="row">
							            	<div class="col-6" style="height: 60px;">
							            		<h5><b>사업체명 : </b> ${senior.snrConame }</h5>
							            	</div>
							            	<div class="col-6" style="height: 50px;">
							            		<h5><b>구인인원 명수 : </b> &nbsp ${senior.snrVolume }명 </h5>
							            	</div>							            	
							            	<div class="col-6" style="height: 60px;">
							            		<h5><b>연락처 : </b> ${senior.snrTel } </h5>
							            	</div>							            	
							            	<div class="col-6" style="height: 50px;">
							            		<h5><b>근무지역 : </b> 
								            		<c:choose>
								                		<c:when test="${senior.snrWorkplace  == '1'}">
								                			대전광역시 대덕구
								                		</c:when>
								                		<c:when test="${senior.snrWorkplace  == '2'}">
								                			대전광역시 동구
								                		</c:when>
								                		<c:when test="${senior.snrWorkplace  == '3'}">
								                			대전광역시 서구
								                		</c:when>
								                		<c:when test="${senior.snrWorkplace  == '4'}">
								                			대전광역시 유성구
								                		</c:when>
								                		<c:when test="${senior.snrWorkplace  == '5'}">
								                			대전광역시 중구
								                		</c:when>								                										                										                									                		
								                	</c:choose>
							            		 </h5><br>
							            	</div>
						            	</div>
						            	<div style="height: 50px;">
						            		<h4><b>${senior.snrContent }</b></h4>
						            	</div>
						            </div>
		            	            <div class="card-footer" style="padding-top:10px; padding-bottom: 4px; margin: 0;">
		            	            	<div class="row" style="margin-right: 10px; float: right;">
		            	            	<div style="margin-right: 10px;">
		            	            		<h4><b>모집기간 : ${senior.snrSdate} ~ ${senior.snrEdate}</b></h4>
		            	            	</div>
		            	            	<div>
						            		<c:choose>
						                		<c:when test="${senior.snrState  == '진행중'}">
						                			<h4><span class="badge badge-success">${senior.snrState}</span></h4>
						                		</c:when>
						                		<c:when test="${senior.snrState  == '마감임박'}">
						                			<h4><span class="badge badge-danger">${senior.snrState}</span></h4>
						                		</c:when>
						                		<c:when test="${senior.snrState  == '종료'}">
						                			<h4><span class="badge badge-secondary">${senior.snrState}</span></h4>
						                		</c:when>
						                	</c:choose>
						                </div>
						                </div>
                      		  		</div>
						        </div>
						    </div> 
                        </c:forEach>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</main>                                     
    
            
                    