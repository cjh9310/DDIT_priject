<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="recruitList" value="${dataMap.recruitList }" />

<!-- base css -->
<link id="vendorsbundle" rel="stylesheet" media="screen, print"
   href="<%=request.getContextPath()%>/resources/template/css/vendors.bundle.css">
<link id="appbundle" rel="stylesheet" media="screen"
   href="<%=request.getContextPath()%>/resources/template/css/app.bundle.css">



<script type="text/javascript"
   src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<style>
.list-item {
   width: 20%;
   height: 100%;
   display: flex;
   justify-content: center;
   align-items: center;
   border: 1px solid #E5E5E5;
}

.items {
   width: 20%;
   height: 89%;
   display: flex;
   justify-content: center;
}

.careers-new {
   
}

.careers-new p {
   margin: 0;
   padding: 0;
}

.careers-new .border {
   position: relative;
   border: 1px solid #d3dee8;
}

.careers-new .border:before, .careers-new .border:after {
   content: '';
   display: table;
}

.careers-new .border:after {
   clear: both;
}

.careers-new .border .left {
   float: left;
   width: 780px;
   padding: 30px;
}

/* 글 제목*/
.careers-new .border .left .tit-area .tit {
   display: inline-block;
   line-height: 1.5;
   font-size: 1.5174em;
   font-weight: 700;
}

/* | 기준 */
.careers-new .border .left .info {
   display: table;
   width: 100%;
}
/* 지원자격 컬럼 */
.careers-new .border .left .info .column {
   display: table-cell;
   width: 50%;
   margin: 0;
   padding: 20px 0 0 0;
   vertical-align: top;
}
/* 지원자격 제목 */
.careers-new .border .left .info .column .tit {
   display: inline-block;
   margin: 0;
   padding: 0;
   line-height: 2.5;
   border-bottom: 2px solid #333;
}

.careers-new .border .left .info .column .cont {
   padding: 10px 0 0 0;
}

.careers-new .border .left .info .column .cont .right {
   border-left: 1px solid gold;
}

.careers-new .border .left .info .column .cont ul {
   padding: 20px;
}

.careers-new .border .left .info .column .cont ul li {
   position: relative;
   padding: 0 0 0 70px;
}

.careers-new .border .left .info .column .cont ul li strong {
   display: block;
   position: absolute;
   left: 0;
}

.careers-new .border .left .info .column .cont ul li span {
   display: block;
}

.careers-new .border .right {
   float: right;
   width: calc(100% - 70%);
   padding: 19px 30px 0 30px;
}

.careers-new .border .right .info {
   padding-top: 15px;
}

.careers-new .border .right .info ul li {
   position: relative;
   margin: 30px 0 0 0;
   padding: 0 0 0 70px;
}

.careers-new .border .right .info ul li:first-child {
   margin-top: 70px;
}

.careers-new .border .right .info ul li strong {
   display: block;
   position: absolute;
   left: 0;
}

.careers-new .border .right .btn {
   padding: 20px 0 30px 0;
   text-align: center;
}

.careers-new .border .right .btn .button {
   margin: 0 4px;
}

.careers-new .border .right .btn {
   padding: 20px 0 30px 0;
   text-align: center;
}

#button-submit {
   width: calc(100% - 200px);
   margin: auto;
}

#btnSubmit {
   width: 100px;
   margin: auto;
   display: table-cell;
   vertical-align: middle;
}

#column_right {
   border-left: 2px solid gray;
   padding-left: 20px;
}

#form-check-sty {
   float: left;
   margin: 0 auto;
   padding-left: 0px;
   width: 100%;
}
</style>
</head>
<!-- BEGIN Body -->
<body class="mod-bg-1 mod-nav-link ">


   <!-- END Page Header -->
   <!-- BEGIN Page Content -->
   <!-- the #js-page-content id is needed for some plugins to initialize -->
   <main id="js-page-content" role="main" class="page-content">
   <ol class="breadcrumb page-breadcrumb">
      <li class="breadcrumb-item"><a href="javascript:void(0);">어</a></li>
      <li class="breadcrumb-item">렵</li>
      <li class="breadcrumb-item active">다</li>
      <li class="position-absolute pos-top pos-right d-none d-sm-block"><span
         class="js-get-date"></span></li>
   </ol>
   <h1 class="subheader-title">
      <i class='subheader-icon fal fa-plus-circle'></i> 채용공고 상세검색 <small>채용검색&내용</small>
   </h1>


   <div class="w-75 mx-auto" style="height: 30px;"></div>
   <div class="w-75 mx-auto" style="height: 300px;">
      <div class="w-100 h-100"
         style="float: none; margin: 0 auto; width: 750px;">
         <div class="w-100 row" style="height: 10%;">
            <div class="list-item">업종</div>
            <div class="list-item">근무지역</div>
            <div class="list-item">경력</div>
            <div class="list-item">학력</div>
            <div class="list-item">회사규모</div>
         </div>
         <div class="w-100 row" style="height: 75%;">
            <div class="items overflow-auto">
               <div class="form-check"
                  style="float: left; margin: 0 auto; padding-left: 0px; width: 100%;">
                  <select multiple="" class="form-control firstBtn"
                     style="height: 200px;">
                     <option style="font-size: 1.5em;" value="서비스업">서비스업</option>
                     <option style="font-size: 1.5em;" value="제조·화학">제조·화학</option>
                     <option style="font-size: 1.5em;" value="IT·웹·통신">IT·웹·통신</option>
                     <option style="font-size: 1.5em;" value="은행·금융업">은행·금융업</option>
                     <option style="font-size: 1.5em;" value="미디어·디자인">미디어·디자인</option>
                     <option style="font-size: 1.5em;" value="교육업">교육업</option>
                     <option style="font-size: 1.5em;" value="의료·제약·복지">의료·제약·복지</option>
                     <option style="font-size: 1.5em;" value="판매·유통">판매·유통</option>
                     <option style="font-size: 1.5em;" value="건설업">건설업</option>
                     <option style="font-size: 1.5em;" value="기관·협회">기관·협회</option>
                  </select>
               </div>
            </div>
            <div class="items overflow-auto">
               <div class="form-check "
                  style="float: left; margin: 0 auto; padding-left: 0px; width: 100%;">
                  <select multiple="" class="form-control secondBtn"
                     style="height: 200px;">
                     <option style="font-size: 1.5em;" value="서구">대전 서구</option>
                     <option style="font-size: 1.5em;" value="중구">대전 중구</option>
                     <option style="font-size: 1.5em;" value="유성구">대전 유성구</option>
                     <option style="font-size: 1.5em;" value="대덕구">대전 대덕구</option>
                     <option style="font-size: 1.5em;" value="동구">대전 동구</option>
                  </select>
               </div>
            </div>
            <div class="items overflow-auto">
               <div class="form-check"
                  style="float: left; margin: 0 auto; padding-left: 0px; width: 100%;">
                  <select multiple="" class="form-control thirdBtn"
                     style="height: 200px;">
                     <option style="font-size: 1.5em;" value="관계없음">관계없음</option>
                     <option style="font-size: 1.5em;" value="1년">1년차</option>
                     <option style="font-size: 1.5em;" value="2년">2년차</option>
                     <option style="font-size: 1.5em;" value="3년">3년차</option>
                     <option style="font-size: 1.5em;" value="4년">4년차</option>
                     <option style="font-size: 1.5em;" value="5년">5년차</option>
                     <option style="font-size: 1.5em;" value="6년">6년차</option>
                     <option style="font-size: 1.5em;" value="7년">7년차</option>
                     <option style="font-size: 1.5em;" value="8년">8년차</option>
                     <option style="font-size: 1.5em;" value="9년">9년차</option>
                     <option style="font-size: 1.5em;" value="10년차">10년차</option>
                     
                  </select>
               </div>
            </div>
            <div class="items overflow-auto">
               <div class="form-check"
                  style="float: left; margin: 0 auto; padding-left: 0px; width: 100%;">
                  <select multiple="" class="form-control fourthBtn"
                     style="height: 200px;">
                     <option style="font-size: 1.5em;" value="학력무관">학력무관</option>
                     <option style="font-size: 1.5em;" value="대졸(4년)">대졸(4년)</option>
                     <option style="font-size: 1.5em;" value="대졸(2~3년)">대졸(2~3년)</option>
                     <option style="font-size: 1.5em;" value="고졸">고졸</option>
                     <option style="font-size: 1.5em;" value="대학원">대학원</option>
                  </select>
               </div>
            </div>
            <div class="items overflow-auto">
               <div class="form-check"
                  style="float: left; margin: 0 auto; padding-left: 0px; width: 100%;">
                  <select multiple="" class="form-control fifthBtn"
                     style="height: 200px;">
                     <option style="font-size: 1.5em;" value="대기업">대기업</option>
                     <option style="font-size: 1.5em;" value="중견기업">중견기업</option>
                     <option style="font-size: 1.5em;" value="중소기업">중소기업</option>
                     <option style="font-size: 1.5em;" value="강소기업">강소기업</option>
                     <option style="font-size: 1.5em;" value="기타">기타</option>
                  </select>
               </div>
            </div>
            <!-- d-flex justify-content-start -->
            
               <div class="w-100 row list-item col-lg-12"
                  style="height: 25%; float: none; margin: 0 auto;">
               <div class="float-right col-lg-8 d-flex justify-content-start" id="mainDiv">
                  <c:if test="${cri.searchBtn1 ne null and cri.searchBtn1 ne 'undefined'}">
                     <button class="btn btn-outline-info waves-effect waves-themed firstButton" value="${cri.searchBtn1}" onclick="deleteDiv(event)">${cri.searchBtn1}&nbsp;X</button>
                  </c:if>
                  <c:if test="${cri.searchBtn2 ne null and cri.searchBtn2 ne 'undefined'}">
                     <button class="btn btn-outline-info waves-effect waves-themed secondButton" value="${cri.searchBtn2}" onclick="deleteDiv(event)">${cri.searchBtn2}&nbsp;X</button>
                  </c:if>
                  <c:if test="${cri.searchBtn3 ne null and cri.searchBtn3 ne 'undefined'}">
                     <button class="btn btn-outline-info waves-effect waves-themed thirdButton" value="${cri.searchBtn3}" onclick="deleteDiv(event)">${cri.searchBtn3}&nbsp;X</button>
                  </c:if>
                  <c:if test="${cri.searchBtn4 ne null and cri.searchBtn4 ne 'undefined'}">
                     <button class="btn btn-outline-info waves-effect waves-themed fourthButton" value="${cri.searchBtn4}" onclick="deleteDiv(event)">${cri.searchBtn4}&nbsp;X</button>
                  </c:if>
                  <c:if test="${cri.searchBtn5 ne null and cri.searchBtn5 ne 'undefined'}">
                     <button class="btn btn-outline-info waves-effect waves-themed fifthButton" value="${cri.searchBtn5}" onclick="deleteDiv(event)">${cri.searchBtn5}&nbsp;X</button>
                  </c:if>
                  </div>
               <form class="searchForm"> 
                  <div class="col-lg-4 d-flex justify-content-end" >
                  <span class="input-group-append">
                     <button type="button" onclick="list_go(1);" data-card-widget="search"
                        class="btn btn-success btn-pills waves-effect waves-themed " value="ki">기업조회</button>
                  </span>
                  </div>
                  </form> 
               </div>  
               
               
               <%-- <form class="form-inline my-2 my-lg-0"  name="searchAll" >
                  <div class="w-100 row list-item col-lg-12"
                  style="height: 25%; float: none; margin: 0 auto;" id="mainDiv" value="${param.searchAll }">
                  
                  </div>
               </form>  
               <div class="col-lg-4 d-flex justify-content-end" >
                  <span class="input-group-append">
                     <button type="button" onclick="list_go(1);" data-card-widget="search"
                        class="btn btn-success btn-pills waves-effect waves-themed " value="ki">기업조회</button>
                  </span>
                  </div> --%>
               
               
               
               <%-- <form class="form-inline my-2 my-lg-0">
               <input class="form-control" type="text" name="searchAll" placeholder="검색어를 입력하세요." value="${param.searchAll }"/>
                  <span class="input-group-append">
                     <button class="btn btn-primary" type="button" onclick="list_go(1);" 
                     data-card-widget="search">
                        <i class="fa fa-fw fa-search"></i>
                     </button>
                  </span>
            </form>  --%>
               
               
               
                  </div>
               </div>
               
         </div>
         
   
   <!-- ---------------------------------------------------------------------------------------------------- -->
   <div class="w-75 mx-auto" style="height: 30px;"></div>

   <div id="container">

      <div class="row">

         <div class="col-md-1"></div>
         <div class="col-lg-1 sortable-grid "></div>
      </div>
   </div>
   <div style="padding: 20px;"></div>






   <!-- Main content -->
   <section class="content">
      <div class="card">
         <c:if test="${empty recruitList }">
            <tr>
               <td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
            </tr>
         </c:if>
         <div class="perPage-search row justify-content-end"
            style="margin-top: 10px; margin-bottom: 10px;">
            <select class="form-control-sm mt-5ml-3" " name="perPageNum"
               id="perPageNum" onchange="list_go(1);">
               <option value="12">정렬개수</option>
               <option value="20" ${cri.perPageNum == 20 ? 'selected':''}>20개씩</option>
               <option value="50" ${cri.perPageNum == 50 ? 'selected':''}>50개씩</option>
               <option value="100" ${cri.perPageNum == 100 ? 'selected':''}>100개씩</option>
            </select> <select class="form-control-sm mt-5ml-3" name="searchType"
               id="searchType" onchange="list_go(1)">
               <option value="s" ${cri.searchType eq 's' ? 'selected':'' }>최근등록순</option>
               <option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>마감일순</option>
               <option value="m" ${cri.searchType eq 'm' ? 'selected':'' }>연봉높은순</option>
            </select>
            <form  class="form-inline my-2 my-lg-0 searchForm">
               <input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }"/>
                  <span class="input-group-append">
                     <button class="btn btn-primary" type="button" onclick="list_go(1);" 
                     data-card-widget="search">
                        <i class="fa fa-fw fa-search"></i>
                     </button>
                  </span>
               <input type='hidden' name="page" value="" />
               <input type='hidden' name="perPageNum" value=""/>
               <input type='hidden' name="searchType" value="" />
               <!-- <input type='hidden' name="keyword" value="" />  -->
               <input type="hidden" name="searchBtn1" id="searchBtn1"/>
               <input type="hidden" name="searchBtn2" id="searchBtn2"/>
               <input type="hidden" name="searchBtn3" id="searchBtn3"/>
               <input type="hidden" name="searchBtn4" id="searchBtn4"/>
               <input type="hidden" name="searchBtn5" id="searchBtn5"/>
            </form> 
         </div>

         <div id="container">
            <div class="row">


               <c:forEach items="${recruitList }" var="recruit" varStatus="vs">

                  <div class="col-lg-3">
                     <div id="c_1" class="card border shadow-0 mb-g shadow-sm-hover"
                        data-filter-tags="회사명">
                        <div
                           class="card-body border-faded border-top-0 border-left-0 border-right-0 rounded-top">
                           <div class="info-card-text flex-1">
                              <a href="javascript:void(0);"
                                 class="fs-xl text-truncate text-truncate-lg text-info"
                                 data-toggle="dropdown" aria-expanded="false">${recruit.recWantedtitle }
                              </a> <span class="text-truncate text-truncate-xl">${recruit.coName }</span>
                           </div>

                        </div>

                        <div class="card-body p-0 collapse show">
                           <div class="p-3">
                              <a class="mt-1 d-block fs-sm fw-400 text-dark"> <i
                                 class="fas fa-mobile-alt text-muted mr-2"></i>
                                 ${recruit.recIndtpcdnm }
                              </a> <a class="mt-1 d-block fs-sm fw-400 text-dark"> <i
                                 class="fas fa-mobile-alt text-muted mr-2"></i>
                                 ${recruit.recEntertpnm }
                              </a> <a class="mt-1 d-block fs-sm fw-400 text-dark"> <i
                                 class="fas fa-mouse-pointer text-muted mr-2"></i>
                                 ${recruit.recMinedubg }
                              </a> <span style="float: right;">
                                 <button type="button"
                                    class="btn btn-default waves-effect waves-themed"
                                    data-toggle="modal"
                                    data-target="#default-example-modal-lg-center${vs.index}">Centered
                                    Large</button>
                              </span>
                              <address class="fs-sm fw-400 mt-4 text-muted">
                                 <i class="fas fa-map-pin mr-2"></i> ${recruit.recRegion }
                              </address>

                           </div>
                        </div>
                     </div>
                  </div>



                  <!--  모달창 시작 -->
                  <div class="modal fade"
                     id="default-example-modal-lg-center${vs.index}" tabindex="-1"
                     role="dialog" aria-hidden="true">
                     <span aria-hidden="true"><i class="fal fa-times"></i></span>
                     <!-- x -->
                     <div class="modal-dialog modal-lg modal-dialog-centered"
                        role="document">

                        <div class="modal-content">
                           <div class="card-body">

                              <div id="panel-2" class="panel">
                                 <div class="panel-hdr">
                                    <h2>
                                       <b>채용공고 상세검색</b> <span class="fw-300"></span>
                                    </h2>
                                    <div class="panel-toolbar">
                                       <button class="btn btn-panel" data-action="panel-collapse"
                                          data-toggle="" data-offset="0,10"
                                          data-original-title="Collapse"></button>
                                       <button class="btn btn-panel"
                                          data-action="panel-fullscreen" data-toggle=""
                                          data-offset="0,10" data-original-title="Fullscreen"></button>
                                       <button class="btn btn-panel" data-action="panel-close"
                                          data-toggle="" data-offset="0,10"
                                          data-original-title="Close"></button>
                                    </div>
                                 </div>
                                 <div class="modal-header">
                                    <ul class="nav nav-tabs card-header-tabs">
                                       <li class="nav-item"><a class="nav-link active"
                                          href="#">채용정보</a></li>
                                       <li class="nav-item"><a class="nav-link disabled"
                                          href="#" tabindex="-1" aria-disabled="true">연봉정보</a></li>
                                    </ul>
                                 </div>

                                 <div class="row">
                                    <div class="col-xl-12">

                                       <div class="careers-new" id="modalId${vs.index}">
                                          <!-- border -->
                                          <div class="border">
                                             <div class="left">
                                                <div class="tit-area">
                                                   <p class="tit">${recruit.recWantedtitle }</p>


                                                </div>
                                                <div>
                                                   <h5>모집기간 : ${recruit.recReceiptclosedt }</h5>
                                                </div>
                                                <div class="oback"></div>
                                                <div class="info">
                                                   <div class="column">
                                                      <p class="tit">지원자격</p>


                                                      <div class="cont ">
                                                         <ul>
                                                            <li><strong>경력</strong> <span>
                                                                  ${recruit.recEntertpnm } </span></li>
                                                            <li><strong>학력</strong> <span>
                                                                  ${recruit.recMinedubg } </span></li>
                                                         </ul>
                                                      </div>
                                                   </div>
                                                   <div class="column" id="column_right">
                                                      <p class="tit">근무조건</p>


                                                      <div class="cont">
                                                         <ul>
                                                            <li><strong>지역</strong> <span>
                                                                  ${recruit.recRegion }</span></li>
                                                            <li><strong>임금</strong> <span>
                                                                  ${recruit.recSaltpnm }</span></li>
                                                         </ul>
                                                      </div>
                                                   </div>
                                                </div>
                                                <div class="info">
                                                   <div class="column">
                                                      <p class="tit">고용형태</p>
                                                      <div class="cont">
                                                         <ul>
                                                            <li><strong>근무형태</strong> <span>${recruit.recWorkdayworkhrcont }
                                                            </span></li>
                                                         </ul>
                                                      </div>
                                                   </div>
                                                   <div class="column" id="column_right">
                                                      <p class="tit">복리후생</p>


                                                      <div class="cont">
                                                         <ul>
                                                            <li class="full"><em>${recruit.recFourins }</em></li>
                                                         </ul>
                                                      </div>
                                                   </div>
                                                </div>
                                             </div>
                                             <div class="right">
                                                <div class="logo-company">
                                                   <div class="info">
                                                      <ul>
                                                         <li><strong>기업명</strong>
                                                            <div>${recruit.coName }</div></li>
                                                         <li><strong>업종</strong>
                                                            <div>${recruit.recIndtpcdnm }</div></li>
                                                         <li><strong>기업규모</strong>
                                                            <div>${recruit.recBusisize }</div></li>
                                                         <li><strong>설립년도</strong>
                                                            <div>${recruit.recBusisize }&nbsp;</div></li>
                                                         <li><strong>연매출액</strong>
                                                            <div>${recruit.recYrsalesamt }&nbsp;</div></li>
                                                         <li><strong>홈페이지</strong>
                                                            <div>${recruit.recHomepg }</div></li>

                                                         <li><strong>근로자수</strong>
                                                            <div>${recruit.recPersonal }</div></li>

                                                      </ul>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                       <!-- border -->
                                       <div class="border">
                                          <div class="left">
                                             <div>
                                                <h3>직무내용</h3>
                                             </div>
                                             <div class="info">
                                                <ul>
                                                   <div>${recruit.recJobcont }</div>


                                                </ul>
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
               </c:forEach>
            </div>
            <div class="card-footer">
            </div>
         </div>

      </div>

   </section>
   <!-- ----------------------------------------------------------------------------------------------------- -->
   
      <!-- 채용공고 버튼 -->
   <button type="button"
      class="btn btn-success btn-pills waves-effect waves-themed"
      data-toggle="modal" data-target=".default-example-modal-right-lg">채용공고</button>
   <!-- Modal Left Large -->
   <div class="modal fade default-example-modal-right-lg" tabindex="-1"
      role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-dialog-right modal-lg">
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
                     <h2>공고작성</h2>
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
                  <div class="panel-container show">
                     <div class="panel-content">
                        <div class="panel-tag">
                           <p>공고 글쓰기 페이지</p>
                        </div>
                     </div>
                     <form class="needs-validation" novalidate="" role="form"
                        method="post" action="regist.do" name="registForm" id="frm">
                        <div class="panel-content">
                           <!-- 제목 -->
                           <div class="form-group">
                              <label class="form-label" for="validationCustom01"><b>공고제목</b>
                                 <span class="text-danger">*</span> </label> <input type="text"
                                 class="form-control" id="validationCustom01"
                                 placeholder="제목을 입력해주세요." value="" required=""
                                 name="recWantedtitle">
                              <div class="invalid-feedback">제목을 입력해주세요.</div>
                           </div>
                           <!-- 업종 -->
                           <div class="form-group">
                              <label class="form-label" for="validationCustom03"><b>업종</b>
                                 <span class="text-danger">*</span></label> <select
                                 class="custom-select" required="" name="recIndtpcdnm">
                                 <option value="서비스업">서비스업</option>
                                 <option value="제조·화학">제조·화학</option>
                                 <option value="IT·웹·통신">IT·웹·통신</option>
                                 <option value="은행·금융업">은행·금융업</option>
                                 <option value="미디어·디자인">미디어·디자인</option>
                                 <option value="교육업">교육업</option>
                                 <option value="의료·제약·복지">의료·제약·복지</option>
                                 <option value="판매·유통">판매·유통</option>
                                 <option value="건설업">건설업</option>
                                 <option value="기관·협회">기관·협회</option>
                              </select>
                              <div class="invalid-feedback">상담유형을 선택해주세요.</div>
                           </div>
                           <!-- 기업명 -->
                           <div class="form-group">
                              <label class="form-label" for="example-palaceholder-disabled"><b>기업명</b></label>
                              <input type="text" id="example-palaceholder-disabled"
                                 class="form-control" value="휴하리" readonly name="coName">
                           </div>
                           <!-- 경력 -->
                           <div class="form-group">
                              <label class="form-label" for="validationCustom01"><b>경력</b>
                                 <span class="text-danger">*</span> </label> <input type="text"
                                 class="form-control" id="validationCustom01"
                                 placeholder="최소경력을 입력해주세요." value="" required=""
                                 name="recEntertpnm">
                              <div class="invalid-feedback">최소경력을 입력해주세요.</div>
                           </div>
                           <!--                               학력 -->
                           <div class="form-group">
                              <label class="form-label" for="validationCustom01"><b>학력</b>
                                 <span class="text-danger">*</span> </label> <input type="text"
                                 class="form-control" id="validationCustom01"
                                 placeholder="최소학력을 입력해주세요." value="" required=""
                                 name="recMinedubg">
                              <div class="invalid-feedback">최소학력을 입력해주세요.</div>
                           </div>
                           <!--                               근무지역 -->
                           <div class="form-group">
                              <label class="form-label" for="validationCustom01"><b>근무지역</b>
                                 <span class="text-danger">*</span> </label> <input type="text"
                                 class="form-control" id="validationCustom01"
                                 placeholder="근무지역을 입력해주세요." value="" required=""
                                 name="recRegion">
                              <div class="invalid-feedback">근무지역을 입력해주세요.</div>
                           </div>
                           <!--                               임금 -->
                           <div class="form-group">
                              <label class="form-label" for="validationCustom01"><b>임금(단위:백만원)</b>
                                 <span class="text-danger">*</span> </label> <input type="number"
                                 class="form-control" id="validationCustom01"
                                 placeholder="임금을 입력해주세요." value="" required=""
                                 name="recMinsal">
                              <div class="invalid-feedback">임금을 입력해주세요.</div>
                           </div>
                           <!-- 근무형태 -->
                           <div class="form-group">
                              <label class="form-label" for="validationCustom01"><b>근무형태</b>
                                 <span class="text-danger">*</span> </label> <input type="text"
                                 class="form-control" id="validationCustom01"
                                 placeholder="근무형태를 입력해주세요." value="" required=""
                                 name="recWorkdayworkhrcont">
                              <div class="invalid-feedback">근무형태를 입력해주세요.</div>
                           </div>

                           <div class="form-group">
                              <label class="form-label" for="validationCustom01"><b>복리후생</b>
                                 <span class="text-danger">*</span> </label> <input type="text"
                                 class="form-control" id="validationCustom01"
                                 placeholder="복리후생을 입력해주세요." value="" required=""
                                 name='recFourins'>
                              <div class="invalid-feedback">복리후생을 입력해주세요.예:4대보험</div>
                           </div>

                           <div class="form-group">
                              <label class="form-label" for="validationCustom01"><b>마감일</b>
                                 <span class="text-danger">*</span> </label> <input type="number"
                                 class="form-control" id="validationCustom01"
                                 placeholder="임금을 입력해주세요." value="" required=""
                                 name="recReceiptclosedt">
                              <div class="invalid-feedback">-를 제외하고 마감일을 숫자만 입력해주세요</div>
                           </div>


                           <div class="form-group">
                              <label class="form-label" for="validationTextarea2"><b>직무내용</b>
                                 <span class="text-danger">*</span></label>
                              <textarea class="form-control" id="validationTextarea1"
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
                                 class="custom-control-label" for="invalidCheck">
                                 Agree to terms and conditions <span class="text-danger">*</span>
                              </label>
                              <div class="invalid-feedback">You must agree before
                                 submitting.</div>
                           </div>
                           <div class="modal-footer" style="float:right">
                                  <button id="submit" onclick="regist_go();" type="submit" class="btn btn-success btn-pills ml-auto waves-effect waves-themed">Save changes</button>
                              </div>
                        </div>
                     </form>

                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- -------------------------------------------------------------------------------------------------- -->
   <nav aria-label="Navigation">
   <ul class="pagination justify-content-center m-0">
      <li class="page-item">
         <a class="page-link" href="javascript:list_go(1);">
            <i class="fas fa-angle-double-left"></i>
         </a>
      </li>
      <li class="page-item">
         <a class="page-link" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">
            <i class="fas fa-angle-left"></i>
         </a>                  
      </li>
   
   <c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
      <li class="page-item ${cri.page == pageNum?'active':''}">
         <a class="page-link" href="javascript:list_go('${pageNum}');" >${pageNum }</a>
      </li>
   </c:forEach>
      <li class="page-item">
         <a class="page-link" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">
            <i class="fas fa-angle-right" ></i>
         </a>
      </li>
      <li class="page-item">
         <a class="page-link" href="javascript:list_go('${pageMaker.realEndPage}');">
            <i class="fas fa-angle-double-right"></i>
         </a>
      </li>   
   </ul>
</nav>   
   </main>
</body>
<!-- 스크롤바 기능 -->
<script>
   var bodyHtml;
   // 업종 버튼
   $(document).ready(function() {
      $(".firstBtn").on("click",function(event) {
         var valueee = event.target.value
         bodyHtml = `<button class="btn btn-outline-info waves-effect waves-themed firstButton" `+ "value="+valueee +` onclick="deleteDiv(event)">`
                  + event.target.value
                  + "&nbsp;  X" + "</button>";
                  $("#mainDiv").append(bodyHtml);
                  console.log(bodyHtml);
               });
   $(document).on("click", ".firstButton", function() {
      });
         });
   // 근무지역 버튼
   $(document).ready(function() {
      $(".secondBtn").on("click",function(event) {
         var valueee = event.target.value
         bodyHtml = `<button class="btn btn-outline-info waves-effect waves-themed secondButton" `+ "value="+valueee +` onclick="deleteDiv(event)">`
                  + event.target.value
                  + "&nbsp;  X" + "</button>";
                  $("#mainDiv").append(bodyHtml);
                  console.log(bodyHtml);
               });
   $(document).on("click", ".secondButton", function() {
      });
         });
   // 경력 버튼
   $(document).ready(function() {
      $(".thirdBtn").on("click",function(event) {
         var valueee = event.target.value
         bodyHtml = `<button class="btn btn-outline-info waves-effect waves-themed thirdButton" `+ "value="+valueee +` onclick="deleteDiv(event)">`
                  + event.target.value
                  + "&nbsp;  X" + "</button>";
                  $("#mainDiv").append(bodyHtml);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
                  console.log(bodyHtml);
               });
   $(document).on("click", ".thirdButton", function() {
      });
         });
   // 학력 버튼
   $(document).ready(function() {
      $(".fourthBtn").on("click",function(event) {
         var valueee = event.target.value
         bodyHtml = `<button class="btn btn-outline-info waves-effect waves-themed fourthButton" `+ "value="+valueee +` onclick="deleteDiv(event)">`
                  + event.target.value
                  + "&nbsp;  X" + "</button>";
                  $("#mainDiv").append(bodyHtml);
                  console.log(bodyHtml);
               });
   $(document).on("click", ".fourthButton", function() {
      });
         });
   // 회사규모 버튼
   $(document).ready(function() {
      $(".fifthBtn").on("click",function(event) {
         var valueee = event.target.value
         bodyHtml = `<button class="btn btn-outline-info waves-effect waves-themed fifthButton" name="searchAll" `+ "value="+valueee +` onclick="deleteDiv(event)">`
                  + event.target.value
                  + "&nbsp;  X" + "</button>";
                  $("#mainDiv").append(bodyHtml);
                  console.log(bodyHtml); 
               });
   $(document).on("click", ".fifthButton", function() {
      });
         });
   // 클릭 시 삭제
   function deleteDiv(e) {
      e.target.remove();
   }
</script>
<!-- 채용등록 -->
<c:if test="${from eq 'regist' }">
   <script>
      alert("등록되었습니다.");
   </script>
</c:if>
<script>
   function regist_go() {
      var form = document.registForm;
      form.submit();
   }
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

function list_go(page,url){
   //alert(page);
   if(!url) url="list.do";
   

   var buttonList1 = $(".firstButton");
   var buttonList2 = $(".secondButton");
   var buttonList3 = $(".thirdButton");
   var buttonList4 = $(".fourthButton");
   var buttonList5 = $(".fifthButton");
   
   var firstButton = buttonList1.val();
   console.log(firstButton);
   var secondButton = buttonList2.val();
   console.log(secondButton);
   var thirdButton = buttonList3.val();
   console.log(thirdButton);
   var fourthButton = buttonList4.val();
   console.log(fourthButton);
   var fifthButton = buttonList5.val();
   console.log(fifthButton);
   
   document.getElementById('searchBtn1').value = firstButton;
   document.getElementById('searchBtn2').value = secondButton;
   document.getElementById('searchBtn3').value = thirdButton;
   document.getElementById('searchBtn4').value = fourthButton;
   document.getElementById('searchBtn5').value = fifthButton;
   
   

   
   var searchForm=$('.searchForm');
   searchForm.find("[name='page']").val(page);
   searchForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
   searchForm.find("[name='searchType']").val($('select[name="searchType"]').val());
   searchForm.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
    
   searchForm.attr({
   action:url,
   method:'get'
   }).submit(); 
   
//    var jobForm=$('#jobForm');
//    jobForm.find("[name='page']").val(page);
//    jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
//    jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
//    var test2 = jobForm.find("[name='keyword']").val($('input[name="keyword"]').val());
//    var test123 = jobForm.find("[name='searchAll']").val($('input[name="searchAll"]').val());
//    console.log("test123 "+ JSON.stringify( test123));
//    console.log("test2 "+ JSON.stringify(test2));
//    jobForm.attr({
//       action:url,
//       method:'get'
//    }).submit(); 
}
</script>



<script
   src="<%=request.getContextPath()%>/resources/js/vendors.bundle.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/app.bundle.js"></script>
</body>
<!-- END Body -->
</html>