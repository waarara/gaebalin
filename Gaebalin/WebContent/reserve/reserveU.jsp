<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="reserveU.jsp">
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

	var price = '${dsReserve.EVENT_UNIT_PRICE}';
	
    $(document).ready(function() {
        $('#dataTables-example').dataTable();
        

        fn_init();

      //U페이지 해당
		fn_setDetailInfo();
      
    });

	function fn_setDetailInfo(){
		$("#reserveNo").val('${dsReserve.RESERVE_NO}');
		$("#reservePop").val('${dsReserve.RESERVE_POP}');
		$("#eventTitle").val('${dsReserve.EVENT_TITLE}');
		$("#eventLoc").val('${dsReserve.EVENT_LOC}');
		$("#eventDate").val('${dsReserve.EVENT_DATE}/${dsReserve.EVENT_TIME_CD_NM}');
		$("#eventNo").val('${dsReserve.EVENT_NO}');
		$("#eventPrice").val(price);
	}

	function fn_save(){
		if(confirm("변경하시겠습니까?")){
			if(!fn_validation()) return;
			var save_pop = $("#reservePop").val();
			var sava_price = save_pop * price;

			$("#reservePrice").val(sava_price);
			alert("예약 정보가 변경되었습니다.");
			
			$("#updateReserve").submit();
		}
	}


    </script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>예약수정</strong>&nbsp;<span class="glyphicon glyphicon-list-alt"></span></font></h1>
			<p>예약 수정 페이지입니다.</p>
		</div>
	</div>
	<div class="container">
	<form id="updateReserve" method="post" action="${context}/work/reserve/updateReserve.do" role="form">
		<div class="form-horizontal">
			<div class="form-group" style="margin-top: 5%;">
				<label for="reserveNo" class="control-label col-md-2"><b>예약 번호</b></label>
				<div class="col-md-3">
					<input class="form-control" type="text" id="reserveNo" name="reserveNo" readonly="readonly" onkeydown="return fn_showKeyCode(event)"/>
				</div>
			</div>
			<div class="form-group" >
				<label for="eventTitle" class="control-label col-md-2"><b>행사 이름</b></label>
				<div class="col-md-4">
					<input class="form-control" type="text" id="eventTitle" disabled="disabled"/>
				</div>
			</div>
			<div class="form-group">
				<label for="eventLoc" class="control-label col-md-2"><b>행사 위치</b></label>
				<div class="col-md-4">
					<input class="form-control" type="text" id="eventLoc" disabled="disabled"/>
	     		</div>
			</div>
			<div class="form-group">
				<label for="eventDate" class="control-label col-md-2"><b>행사 시간</b></label>
				<div class="col-md-3">
					<input class="form-control" type="text" id="eventDate" disabled="disabled"/>
				</div>
			</div>
			<div class="form-group">
				<label for="reservePrice" class="control-label col-md-2"><b>1인당 참가비</b></label>
				<div class="col-md-3">
					<input class="form-control" type="number" id="eventPrice" name="eventPrice" disabled="disabled" onkeydown="return fn_showKeyCode(event)"/>
				</div>
			</div>
			<div class="form-group">
				<label for="reservePop" class="control-label col-md-2"><b>현재 인원</b></label>
				<div class="col-md-3">
					<input type="number" class="form-control"  id="reservePop" name="reservePop" min="1" max="1000" width="100%" required="required">
				</div>
			</div>
			<input type="hidden" id="eventNo" name="eventNo">
			<input type="hidden" id="reservePrice" name="reservePrice">
		</div>
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