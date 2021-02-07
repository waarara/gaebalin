<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context"><%=request.getContextPath()%></c:set>
<c:set var="uri"><%=request.getRequestURI()%></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Undeviating 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20140322

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style>
div>#menu>ul>li.active-color {
	color: #000;
}

#menu ul ul {
	display: none;
}

#menu a:hover {
	border-bottom: 5px solid #FAED7D;
}

#menu ul ul {
	display: none;
	position: absolute;
	background-color: gray;
}

.submenu {
	height: 0px;	
	transition: height .2s;
/*	width: 600px;	*/
/*	float: left;	*/
}

#menu ul li:hover ul {
	display: block;
	color: red;
	background-color: #dddddd;
}

#menu ul ul li {
	float: none;
}

li {
	cursor: pointer;
}

a {
	text-decoration: none !important;
}
</style>
<script>
	var URI = "${uri}";
	console.log(URI);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>개발인</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="${context}/css/bootstrap.min.css" rel="stylesheet" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"
	rel="stylesheet" />
<script src="${context}/js/common.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
<c:set var="homeUrl">/product/main.jsp</c:set>
<c:set var="loginUrl">/user/login.jsp</c:set>

<c:set var="signUrl">/user/userC.jsp</c:set>
<c:set var="intoduceUrl">/introduce/main.jsp</c:set>

<c:set var="scheListUrl">/sche/scheListR.jsp</c:set>
<c:set var="scheUrl">/sche/scheR.jsp</c:set>

<c:set var="boardListUrl">/board/boardListR.jsp</c:set>
<c:set var="boardUrl">/board/boardR.jsp</c:set>

<c:set var="bookListUrl">/product/productListR.jsp</c:set>
<c:set var="bookPopUrl">/product/productListPop.jsp</c:set>
<c:set var="bookUrl">/product/productR.jsp</c:set>

<c:set var="eventListUrl">/event/eventListR.jsp</c:set>
<c:set var="eventUrl">/event/eventR.jsp</c:set>

</head>
<body>
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<span class="icon icon-cog"></span>
				<h1>
					<a href="${context}/work/product/goMain.do">개발인</a>
				</h1>
			</div>
			<div id="menu">
				<ul>
					<c:choose>
						<c:when test="${uri == homeUrl}"><li class="active"><a href="${context}/work/product/goMain.do">Home</a></li></c:when>
						<c:otherwise><li><a href="${context}/work/product/goMain.do">Home</a></li></c:otherwise>
					</c:choose>
					<c:if test="${sessionScope.grade != 'M'}">
						<c:choose>
							<c:when test="${uri == intoduceUrl}">
								<li class="active"><a href="${context}/work/introduce/main.do">용어 소개</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${context}/work/introduce/main.do">용어 소개</a></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${uri == bookListUrl || uri == bookPopUrl || uri == bookUrl}"><li class="active"></c:when>
							<c:otherwise><li></c:otherwise>
						</c:choose>
						<a href="${context}/work/product/retrieveProductList.do">도서구매</a>
							<ul class="submenu">
								<li><a href="${context}/work/product/retrieveProductListPop.do"
									style="color: black; font-size: 10px;">인기 도서&nbsp;</a></li>
								<li><a href="${context}/work/product/retrieveProductList.do?productCategoryCd=JA"
									style="color: black; font-size: 10px;">자바&nbsp;</a></li>
								<li><a href="${context}/work/product/retrieveProductList.do?productCategoryCd=PY"
									style="color: black; font-size: 10px;">파이썬&nbsp;</a></li>
								<li><a href="${context}/work/product/retrieveProductList.do?productCategoryCd=ED"
									style="color: black; font-size: 10px;">교양서적&nbsp;</a></li>
								<li><a href="${context}/work/product/retrieveProductList.do?productCategoryCd=CC"
									style="color: black; font-size: 10px;">C언어&nbsp;</a></li>
							</ul>
						</li>
						<c:choose>
							<c:when test="${uri == eventListUrl || uri == eventUrl}"><li class="active"></c:when>
							<c:otherwise><li></c:otherwise>
						</c:choose>
						<a href="${context}/work/event/retrieveEventList.do">강연과 모임</a>
							<ul class="submenu">
								<li><a href="${context}/work/event/retrieveEventList.do?eventCategoryCd=CON"
									style="color: black; font-size: 10px;">강연&nbsp;</a></li>
								<li><a href="${context}/work/event/retrieveEventList.do?eventCategoryCd=MET"
									style="color: black; font-size: 10px;">모임&nbsp;</a></li>
							</ul>
						</li>
					</c:if>
					<c:choose>
						<c:when test="${uri == boardUrl || uri == boardListUrl}">
							<li class="active"><a href="${context}/work/board/retrieveBoardList.do">게시판</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${context}/work/board/retrieveBoardList.do">게시판</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${uri == scheUrl || uri == scheListUrl}">
							<li class="active"><a href="${context}/work/sche/retrieveScheList.do">공지사항</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${context}/work/sche/retrieveScheList.do">공지사항</a></li>
						</c:otherwise>
					</c:choose>
					<c:if test="${sessionScope.id == null}">
						<c:choose>
							<c:when test="${uri == signUrl}">
								<li class="active"><a href="${context}/work/user/createUser.do" title="">회원가입</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${context}/work/user/createUser.do" title="">회원가입</a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
					<li>
						<c:if test="${sessionScope.id != null && sessionScope.grade != 'M'}">
							<li><a href="#">마이페이지</a>
								<ul class="submenu">
									<li><a href="${context}/work/user/updateUser.do" style="color: black; font-size: 10px;">정보수정&nbsp;</a></li>
									<li><a href="${context}/work/cart/retrieveCartList.do" style="color: black; font-size: 10px;">장바구니&nbsp;</a></li>
									<li><a href="${context}/work/sell/retrieveBuyList.do" style="color: black; font-size: 10px;">구매내역&nbsp;</a></li>
									<li><a href="${context}/work/qna/retrieveQnaList.do" style="color: black; font-size: 10px;">문의내역&nbsp;</a></li>
									<li><a href="${context}/work/reserve/retrieveReserveList.do" style="color: black; font-size: 10px;">예약내역&nbsp;</a></li>
									<li><a href="${context}/work/event/createEvent.do" style="color: black; font-size: 10px;">행사신청&nbsp;</a></li>
								</ul>
							</li>
						</c:if>
						<c:if test="${sessionScope.id != null && sessionScope.grade == 'M'}">
							<li><a href="#">관리페이지</a>
								<ul class="submenu">
									<li><a href="http://10.61.67.81:8000/gaebalin" style="color: black; font-size: 10px;">크롤링 페이지&nbsp;</a></li>
									<li><a href="javascript:void(window.open('http://10.61.67.81:6060', '_blank','width=480, height=600'))"
									 style="color: black; font-size: 10px;">딥러닝&nbsp;</a></li>
									<li><a href="${context}/work/user/retrieveUserListForM.do" style="color: black; font-size: 10px;">유저관리&nbsp;</a></li>
									<li><a href="${context}/work/product/retrieveProductListForManage.do" style="color: black; font-size: 10px;">재고관리&nbsp;</a></li>
									<li><a href="${context}/work/qna/retrieveQnaListForManage.do" style="color: black; font-size: 10px;">문의관리&nbsp;</a></li>
									<li><a href="${context}/work/reserve/retrieveReserveListForManage.do" style="color: black; font-size: 10px;">예약관리&nbsp;</a></li>
									<li><a href="/chart/chartdata.jsp" style="color: black; font-size: 10px;">월간판매량&nbsp;</a></li>
								</ul>
							</li>
						</c:if>
					</li>
					<c:if test="${sessionScope.id == null}">
						<c:choose>
							<c:when test="${uri == loginUrl}">
								<li class="active"><a href="${context}/work/user/goLogin.do"><strong>LOGIN</strong></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${context}/work/user/goLogin.do"><strong>LOGIN</strong></a></li>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${sessionScope.id != null}">
						<li><a href="${context}/work/user/logout.do"><strong>LOGOUT</strong></a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>