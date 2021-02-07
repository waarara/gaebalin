<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="stockEventRegisterU.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>행사 일정 관리</title>

	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/common.js"></script>
	<script src="${context}/js/jquery.form.js"></script>
	<script src="${context}/js/bootstrap.min.js"></script>
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

    <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <script src="${context}/js/sb-admin-2.js"></script>
    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>

    <script>

    var eventCategoryCd;
    var eventTimeCd;
    var imageFolder;

    $(document).ready(function() {
        $('#dataTables-example').dataTable();
        
        $( "#eventDate" ).datepicker({
	    	dateFormat: 'yy-mm-dd',
	    	changeMonth: true,
	        changeYear: true,
	        yearRange: "1980:2020"
	    });

        fn_init();

        fn_setEventCategoryCd();

        fn_setEventTimeCd();

      //U페이지 해당
		fn_setDetailInfo();
    });

	function fn_setDetailInfo(){
		$("#eventNo").val('${dsEvent.EVENT_NO}');
		$("#eventTitle").val('${dsEvent.EVENT_TITLE}');
		$("#eventCategoryCd").val('${dsEvent.EVENT_CATEGORY_CD}');
		$("#eventContents").val('${dsEvent.EVENT_CONTENTS}');
		$("#eventLoc").val('${dsEvent.EVENT_LOC}');
		$("#eventDate").val('${dsEvent.EVENT_DATE}');
		$("#eventTimeCd").val('${dsEvent.EVENT_TIME_CD}');
		$("#eventUnitPrice").val('${dsEvent.EVENT_UNIT_PRICE}');
		$("#eventCurPop").val('${dsEvent.EVENT_CUR_POP}');
		$("#eventMaxPop").val('${dsEvent.EVENT_MAX_POP}');

		var eventImage = '${dsEvent.EVENT_IMAGE}';
		eventImage = eventImage.replace(/"/gi, "");

		$("#pic").attr("src", '${context}/' + imageFolder + '/' + eventImage);
		$("#eventImage").val(eventImage);
	}

	function fn_save(){
		if(confirm("변경하시겠습니까?")){
			if(!fn_validation()) return;

			alert("행사 정보가 변경되었습니다.");

			$("#updateEvent").submit();
		}
	}

	function fn_setEventCategoryCd(){
		eventCategoryCd = '${dsEvent.EVENT_CATEGORY_CD}';

		if(eventCategoryCd == 'CON'){
			imageFolder = "conImg";
		}else if(eventCategoryCd == 'MET'){
			imageFolder = "metImg";
		}

		$("#imageFolder").val(imageFolder);
	}

	
	function fn_setEventTimeCd(){
		eventTimeCd = '${dsEvent.EVENT_TIME_CD}';
	}
	
	function fn_upload(){
		$("#ajaxform").ajaxSubmit({
	        type: "POST",
	        dataType: 'text',
	        url: $("#ajaxform").attr("action"),
	        data: $("#ajaxform").serialize(),
	        success: function (data) {
	        	data2 = data.replace(/"/gi, "");
	        	var imageUrl = "${context}/" + imageFolder + "/" + data2;
	        	$("#pic").attr("src", imageUrl);
	        	$("#eventImage").val(data2);
	        },
	        error: function (xhr, status, error) {
	            alert(error);
	        }
	    });
	}

	function fn_checkCategory(){
		if(eventCategoryCd == undefined){
			alert("행사 분류를 먼저 선택해주세요.");
			return false;
		} else if(eventTimeCd == undefined){
			alert("행사 시간을 선택해주세요.");
			return false;
		}
	}
    </script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>제품수정</strong>&nbsp;<span class="glyphicon glyphicon-list-alt"></span></font></h1>
			<p>제품수정 페이지입니다.</p>
		</div>
	</div>
	<div class="container">
	<form id="updateEvent" method="post" action="${context}/work/event/updateEvent.do" role="form">
		<div class="form-horizontal">
			<div class="form-group" style="margin-top: 5%;">
				<label for="eventTitle" class="control-label col-md-2"><b>행사 이름</b></label>
				<div class="col-md-4">
					<input class="form-control" type="text" name="eventTitle" id="eventTitle" required="required" autofocus="autofocus"/>
				</div>
			</div>

			<div class="form-group">
				<label for="eventCategoryCd" class="control-label col-md-2"><b>분류</b></label>
				<div class="col-md-2">
		        	<select class="form-control" id="eventCategoryCd" name="eventCategoryCd" required="required" onchange="fn_setEventCategoryCd()">
						<c:forEach items="${dsCode1}" var="code1">
							<option value="${code1.commCd}">${code1.commCdNm}</option>
						</c:forEach>
		     		</select>
	     		</div>
			</div>
			<div class="form-group">
				<label for="eventContents" class="control-label col-md-2"><b>행사 내용</b></label>
				<div class="col-md-6">
					<input class="form-control" type="text" name="eventContents" id="eventContents" required="required" />
	     		</div>
			</div>
			<div class="form-group">
				<label for="eventLoc" class="control-label col-md-2"><b>행사 위치</b></label>
				<div class="col-md-4">
					<input class="form-control" type="text" name="eventLoc" id="eventLoc" required="required" />
	     		</div>
			</div>
			<div class="form-group">
				<label for="eventDate" class="control-label col-md-2"><b>행사 날짜</b></label>
				<div class="col-md-3">
					<input class="form-control" type="date" id="eventDate" name="eventDate" required="required" />
				</div>
			</div>
			<div class="form-group">
				<label for="eventTimeCd" class="control-label col-md-2"><b>행사 시간</b></label>
				<div class="col-md-2">
		        	<select class="form-control" id="eventTimeCd" name="eventTimeCd" required="required" onchange="fn_setEventTimeCd()">
						<c:forEach items="${dsCode2}" var="code2">
							<option value="${code2.commCd}">${code2.commCdNm}</option>
						</c:forEach>
		     		</select>
	     		</div>
			</div>

			<div class="form-group">
				<label for="eventUnitPrice" class="control-label col-md-2"><b>참가비</b></label>
				<div class="col-md-3">
					<input class="form-control" type="number" id="eventUnitPrice" name="eventUnitPrice" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
			</div>
			<div class="form-group">
				<label for="eventCurPop" class="control-label col-md-2"><b>현재 인원</b></label>
				<div class="col-md-3">
					<input class="form-control" type="number" id="eventCurPop" name="eventCurPop" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
			</div>
			<div class="form-group">
				<label for="eventMaxPop" class="control-label col-md-2"><b>최대 인원</b></label>
				<div class="col-md-3">
					<input class="form-control" type="number" id="eventMaxPop" name="eventMaxPop" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-2"><b>행사이미지</b></label>
				<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="${context}/backgroundImage/defaultpic.png"><br/>
				<div class="col-md-6">
					<input type="hidden" id="eventImage" name="eventImage" required="required">
				</div>
			</div>
		</div>
		<input type="hidden" id="eventNo" name="eventNo">
	</form>

	<form id="ajaxform" action="${context}/work/product/saveFile.do" method="post" enctype="multipart/form-data" role="form">
		<div class="form-group">
		<label class="control-label col-md-2"></label>
			<div class="col-md-6">
				<input class="form-control" type="file" id="imageFile" name="imageFile" onchange="fn_upload()" onclick="return fn_checkCategory()"/>
				<input type="hidden" id="imageFolder" name="imageFolder">
			</div>
		</div>
		<br><br><br>
		<div class="form-group">
		<label class="control-label col-md-12"></label>
			<div class="col-md-1 col-md-offset-8">
				<button type="button" class="btn btn-success" onclick="fn_save()">수정하기</button>
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-success" onclick="fn_back()">뒤로가기</button>
			</div>
		</div>
	</form>

	</div>

	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>