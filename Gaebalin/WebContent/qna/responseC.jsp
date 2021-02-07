<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=yes; width=device-width;height=device-height" />
	<meta name="description" content="responseC.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>문의 답변</title>
	
	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
	<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
    <link href="${context}/css/process.css" rel="stylesheet">
	<script src="${context}/js/jquery-1.9.1.js"></script>

	<script src="${context}/js/common.js"></script>
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
    
	<script type="text/javascript">

	$(document).ready(function(){
		fn_init();
		
		fn_setDetailInfo();

	});

	function fn_save(){
		if(!fn_validation()){
			return;
		}else{
			var qnaContents = String($("#qnaContents").val());

			qnaContents = qnaContents.replace(/\n/gi, "<br/>");

			$("#qnaContents").val(qnaContents);

	 		$("#createResponse").submit();
		}
	}
	
	function fn_setDetailInfo(){
		$("#rawTitle").val('${dsQna.QNA_TITLE}');
		$("#qnaTitle").val('${dsQna.QNA_TITLE}' + '에 대한 답변입니다.');
		$("#rawContents").val('${dsQna.QNA_CONTENTS}');
		$("#qnaNo").val('${dsQna.QNA_NO}');
		$("#qnaDepth").val('${dsQna.QNA_DEPTH}');
		$("#groupNo").val('${dsQna.GROUP_NO}');
		$("#responseUser").val('${dsQna.USER_CODE}');

	}

</script>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container" style="margin-top: 2%; margin-bottom: 10%;">
	<div class="page-header">
		<h1>답변하기</h1>
	</div>
	<form id="createResponse" method="post" action="${context}/work/qna/createResponse.do" role="form">
		<div class="form-horizontal">
			<div class="form-group">
				<label for="rawTitle" class="control-label col-md-1"><b>질문 제목</b></label>
				<div class="col-md-11">
					<input class="form-control" type="text" id="rawTitle" readonly="readonly"/>
				</div>
			</div>
			<div class="form-group">
				<label for="rawContents" class="control-label col-md-1"><b>질문 내용</b></label>
				<div class="col-md-11">
					<textarea class="form-control" id="rawContents" cols="5" rows="10" readonly="readonly"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label for="qnaTitle" class="control-label col-md-1"><b>답변 제목</b></label>
				<div class="col-md-11">
					<input class="form-control" type="text" name="qnaTitle" id="qnaTitle" required="required" maxlength="50" autofocus="autofocus" placeholder="제목을 입력해주세요"/>
				</div>
			</div>
			<div class="form-group">
				<label for="qnaContents" class="control-label col-md-1"><b>답변 내용</b></label>
				<div class="col-md-11">
					<textarea class="form-control" name="qnaContents" id="qnaContents" cols="5" rows="10" required="required" placeholder="본문을 입력해주세요"></textarea>
				</div>
			</div>
			<input type="text" id="qnaNo" name="qnaNo">
			<input type="hidden" id="qnaDepth" name="qnaDepth">
			<input type="text" id="groupNo" name="groupNo">
			<input type="text" id="responseUser" name="responseUser">
		</div>
		<div class="col-md-offset-1 col-md-2">
			<button type="button" class="btn btn-default" onclick="fn_back()">취소</button>
		</div>
		<div class="col-md-offset-8 col-md-1">
			<button class="btn btn-primary" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_save()">등록하기</button>
		</div>
	</form>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>