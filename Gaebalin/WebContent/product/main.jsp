<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html 
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Undeviating 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20140322

-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes, width=device-width, height=device-height" />
<title>개발인</title>
<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/common.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet" />
<style type="text/css">
li {
	cursor: pointer;
}

a {
	text-decoration: none !important;
}
</style>
</head>

<c:set var="homeUrl">${context}/work/product/goMain.do</c:set>
<c:set var="loginUrl">${context}/work/user/goLogin.do</c:set>

<c:set var="productManageUrl">${context}/work/product/retrieveProductListForManage.do</c:set>
<c:set var="statisticsForStockUrl">${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=JA</c:set>
<c:set var="statisticsForProductUrl">${context}/work/sell/retrieveStatisticsForProduct.do</c:set>

<c:set var="eventManageUrl">${context}/work/event/retrieveEventListForManage.do</c:set>
<c:set var="reserveManageUrl">${context}/work/reserve/retrieveReserveListForManage.do</c:set>
<c:set var="qnaManageUrl">${context}/work/qna/retrieveQnaListForManage.do</c:set>
<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	<c:if test="${sessionScope.grade != 'M'}">
	<div class="wrapper">
		<div id="banner" class="container">
			<img src="${context}/css/images/2.jpg" width="1200" height="500" />
		</div>
		<div id="welcome" class="container">
			<div>
				<h2 style="font-size: 50px;">개발인에 오신것을 환영합니다.</h2>
			</div>
		</div>
		<div id="three-column" class="container">
			<div>
				<span class="arrow-down"></span>
			</div>
			<div id="tbox1">
				<div class="title">
					<h2>가장 많이 팔린 도서</h2>
					<div class="card" style="width: 28rem;">
						<a href="${context}/work/product/retrieveProduct.do?productCode=${dsPop.PRODUCT_CODE}">
							<img id="image" src="${context}/javaImg/${dsPop.PRODUCT_IMAGE}" width="240px;" height="270px;" /></a>
						<script type="text/javascript">
							var productCategoryCd = '${dsPop.PRODUCT_CATEGORY_CD}';
							console.log(productCategoryCd);
							if(productCategoryCd == 'JA'){
								imageFolder = "javaImg";
							}else if(productCategoryCd == 'PY'){
								imageFolder = "pythonImg";
							}else if(productCategoryCd == 'ED'){
								imageFolder = "educationImg";
							}else if(productCategoryCd == 'CC'){
								imageFolder = "clanguageImg";
							}
							path = $("#image").attr("src");

							existFolder = path.split("/")[1];
							$("#image").attr("src", path.replace(existFolder, imageFolder));
						</script>
						<div class="card-body">
							<h5 class="card-title">
								<b>${dsPop.PRODUCT_NAME} | ${dsPop.PRODUCT_UNIT_PRICE}원</b>
							</h5>
						</div>
						<a href="${context}/work/product/retrieveProductList.do" class="button">구매</a>
					</div>
				</div>
			</div>
			<div id="tbox2">
				<div class="title">
					<h2>추천 도서</h2>
					<div class="card" style="width: 28rem;">
						<a href="${context}/work/product/retrieveProduct.do?productCode=P000026">
						<img class="card-img-top" src="${context}/educationImg/양자 컴퓨터 원리와 수학적 기초.jpg" width="240px;" height="270px;" /></a>
						<div class="card-body">
							<h5 class="card-title">
								<b>양자 컴퓨터 원리와 수학적 기초 | 25000원</b>
							</h5>
						</div>
						<a href="${context}/work/product/retrieveProduct.do?productCode=P000026" class="button">Learn More</a>
					</div>
				</div>
			</div>
			<div id="tbox3">
				<div class="title">
					<h2>추천 강의</h2>
					<div class="card" style="width: 28rem;">
						<div class="card-body">
							<br/><h4><a href="javascript:void(window.open('https://youtu.be/ORI4-EXhgC4', '_sub'))"><b>1. HTML의 기초(출처 : 테크보이)</b></a></h4>
							<br/><h4><a href="javascript:void(window.open('https://youtu.be/wpUiN5hBnyc', '_sub'))"><b>2. 코딩의 기초(출처 : 조코딩)</b></a></h4>
							<br/><h4><a href="javascript:void(window.open('https://youtu.be/wjLwmWyItWI', '_sub'))"><b>3. 자바의 기초(출처 : 동빈나)</b></a></h4>
							<br/><h4><a href="javascript:void(window.open('https://youtu.be/kWiCuklohdY', '_sub'))"><b>4. 파이썬의 기초(출처 : 나노코딩)</b></a></h4>							
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="portfolio" class="container">
			<div class="column1">
				<div class="box">
					<h3>게시판</h3>
					<c:forEach items="${dsBoardList}" var="dsBoardList">
					  <ul>
					  <li>
				          <span><a href="${context}/work/board/retrieveBoard.do?boardNo=${dsBoardList.BOARD_NO}">${dsBoardList.BOARD_TITLE}&nbsp;</a><img src="${context}/css/images/new.png" /></span>
						</li>
						<li>
				        <strong>${dsBoardList.BOARD_DATE}</strong>
				        </li>
    				  </ul>
					</c:forEach>
					<a href="${context}/work/board/retrieveBoardList.do" class="button button-small">게시판가기</a>
				</div>
			</div>
			<div class="column2">
				<div class="box">
					<h3>공지사항</h3>
					<c:forEach items="${dsScheList}" var="dsScheList">
						<p><a href="${context}/work/sche/retrieveSche.do?scheNo=${dsScheList.SCHE_NO}">${dsScheList.SCHE_TITLE}</a></p>
					</c:forEach>
					<a href="${context}/work/sche/retrieveScheList.do?" class="button button-small">보러 가기</a>
				</div>
			</div>
			<div class="column3">
				<div class="box">
					<h3>이벤트</h3>
					<c:forEach items="${dsEventList}" var="dsEventList">
						<ul>
							<li><a href="${context}/work/event/retrieveEvent.do?eventNo=${dsEventList.EVENT_NO}">
							${dsEventList.EVENT_TITLE}</a></li>
							<li>${dsEventList.EVENT_DATE} [${dsEventList.EVENT_TIME_CD_NM}]</li>
						</ul>
					</c:forEach>
					<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${context}/work/event/createEvent.do')"
					 class="button button-small">행사 신청</a>
				</div>
			</div>
		</div>
	</div>
	</c:if>
	<div class="container"
		style="background-color: white; margin-bottom: 2%;">
		<c:if test="${sessionScope.id != null && sessionScope.grade == 'M'}">
	  		<p style="font-size: 70px;"><a href="${context}/work/product/goMain.do" style="color: black;"><b>개발인</b></a></p>
		  		<h1>관리자 모드입니다.</h1>
			<div class="container" style="margin-top: 10%; margin-bottom: 10%">
				<div class="row">
					<div class="col-md-4">
					    <a href="${productManageUrl}" class="btn btn-primary" style="width: 100%; height: 250px;" role="button">
							<h1><span class="glyphicon glyphicon-list-alt" style="font-size: 80px; margin-top: 5%;"></span> <br/>재고관리</h1>
						</a>
					</div>
					<div class="col-md-4">
					    <a href="${eventManageUrl}" class="btn btn-danger" style="width: 100%; height: 250px;" role="button">
							<h1><span class="glyphicon glyphicon-gift" style="font-size: 80px; margin-top: 5%;"></span> <br/>행사관리</h1>
						</a>
					</div>
					<div class="col-md-4">
					    <a href="${reserveManageUrl}" class="btn btn-info" style="width: 100%; height: 250px;" role="button">
							<h1><span class="glyphicon glyphicon-calendar" style="font-size: 80px; margin-top: 5%;"></span> <br/>예약관리</h1>
		    		    </a>
					</div>
				</div>
				<br/><br/>
				<div class="row">
					<div class="col-md-4">
					    <a href="${qnaManageUrl}" class="btn btn-primary" style="width: 100%; height: 250px;" role="button">
							<h1><span class="glyphicon glyphicon-headphones" style="font-size: 80px; margin-top: 5%;"></span> <br/>문의관리</h1>
					    </a>
					</div>
					<div class="col-md-4">
					    <a href="/chart/chartdata.jsp" class="btn btn-danger" style="width: 100%; height: 250px;" role="button">
							<h1><span class="glyphicon glyphicon-signal" style="font-size: 80px; margin-top: 5%;"></span> <br/>매출통계</h1>
					    </a>
					</div>
					<div class="col-md-4">
					    <a href="${statisticsForStockUrl}" class="btn btn-info" style="width: 100%; height: 250px;" role="button">
							<h1><span class="glyphicon glyphicon-eye-open" style="font-size: 80px; margin-top: 5%;"></span> <br/>현황통계</h1>
		    		    </a>
					</div>
				</div>
			</div>
		</c:if>
	</div>
</body>
<jsp:include page="../common/foot.jsp" flush="false"></jsp:include>
</html>
