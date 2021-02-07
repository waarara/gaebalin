<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes, width=device-width, height=device-height" />
		<meta name="description" content="scheR.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>공지사항 작성</title>
	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
	<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
    <link href="${context}/css/process.css" rel="stylesheet">

	<script src="${context}/js/jquery-1.9.1.js"></script>
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>
	<script src="${context}/js/common.js"></script>
    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){

	});

	//글 삭제
	function fn_delete(){
		var scheNo = '${dsSche.SCHE_NO}';
		if(confirm("정말 글을 삭제하시겠습니까?")){
			location.href = "${context}/work/sche/deleteSche.do?scheNo=" + scheNo;
		}
	}

	//글 수정
	function fn_update(){
		var scheNo = '${dsSche.SCHE_NO}';
		location.href = "${context}/work/sche/updateSche.do?scheNo=" + scheNo;
	}

	//목록으로
	function fn_moveToSche(){
		location.href = "${context}/work/sche/retrieveScheList.do";
	}
</script>
<style type="text/css">
li{
	cursor: default !important;
}
</style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container" style="margin-top: 2%; margin-bottom: 10%;">
	<h1>공지사항<button class="btn btn-success" type="button" style="float: right;" onclick="fn_moveToSche()">목록</button></h1>
	<ul class="list-group">
	  <li class="list-group-item" style="min-height: 100px;">
	  	<span style="font-size: 20px; float: right; margin-right: 5px;"><b>${dsSche.SCHE_HITS}</b></span><span class="glyphicon glyphicon-eye-open fa-2x" style="margin-right: 5px; float: right;"></span>
	  	<font color="lightgray">#${dsSche.SCHE_NO}</font>
	  	<br><br><font size="10px" color="gray">${dsSche.SCHE_TITLE}</font>
	</li>
	  <li class="list-group-item" style="min-height: 400px;">${dsSche.SCHE_CONTENTS}</li>
	</ul>

	<c:if test="${sessionScope.userCode == dsSche.USER_CODE}">
		<div class="row">
			<div class="col-md-1">
				<button class="btn btn-warning" type="button"  onclick="fn_update()">수정</button>
			</div>
			<div class="col-md-offset-10 col-md-1">
				<button class="btn btn-primary" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_delete()">삭제</button>
			</div>
		</div>
	</c:if>

	</div>
<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>