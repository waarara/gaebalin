<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="main.jsp">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>개발인</title>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/mobile/css/m_base.css" rel="stylesheet" />
<link href="${context}/mobile/css/m_contents.css" rel="stylesheet" />
<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="js/m_browser.js"></script>
<script src="${context}/js/common.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
<style type="text/css">
.jumbotron {
	background-image: url("./img/jumbotron.jpg");
	background-size: cover;
}
</style>
</head>
<body>
	<div id="m_con">
		<h2>
		<font size="28"><strong> 개발인 </strong></font>	
		</h2>
		<br> <img src="${context}/mobile/main_images/gaebalin.jpg"
			width="400" align="center">

		<div class="main_menu_w">
			<ul>
				<li><a href="${context}/work/product/retrieveProductList.do"><img
						src="${context}/mobile/main_images/book1.png" width="60" height="60" alt="도서구매" /></a>
						<span>도서 구매</span></li>

				<li><a href="${context}/work/introduce/main.do"><img src="${context}/mobile/main_images/introduce1.png"
						alt="개발인소개" width="60" height="60" /></a><span>개발인소개</span></li>

				<li><a href="${context}/work/event/createEvent.do"><img
						src="${context}/mobile/main_images/event1.png" width="60"height="60" alt="행사"/></a>
						<span>행사</span></li>

				<li><a href="${context}/work/sche/retrieveScheList.do"><img
						src="${context}/mobile/main_images/notice1.png" width="60" height="60"
						alt="공지사항" /></a> <span>공지사항</span></li>

				<li><a href="${context}/work/board/retrieveBoardList.do"><img
						src="${context}/mobile/main_images/board1.png" width="60" height="60" alt="게시판" /></a>
						<span>게시판</span></li>

				<li><a href="${context}/user/login.jsp"><img
						src="${context}/mobile/main_images/login2.png" width="60" height="60"
						alt="Login" /></a> <span>Login</span></li>
			</ul>
		</div>
	</div>

	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

