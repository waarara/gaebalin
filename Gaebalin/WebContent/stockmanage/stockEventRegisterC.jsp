<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="stockEventRegisterC.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>행사 등록</title>

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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
    });

	function fn_save(){
		if(confirm("등록하시겠습니까?")){
			if(!fn_validation()) return;

			$("#eventLoc").val($("#sample6_address").val() + "/" + $("#sample6_detailAddress").val());
			alert("행사 일정이 등록되었습니다.");

			$("#createEvent").submit();
		}
	}

	function fn_setEventCategoryCd(){
		eventCategoryCd = $("#eventCategoryCd").val();

		if(eventCategoryCd == 'CON'){
			imageFolder = "conImg";
		}else if(eventCategoryCd == 'MET'){
			imageFolder = "metImg";
		}

		$("#imageFolder").val(imageFolder);
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

	function fn_setEventTimeCd(){
		eventTimeCd = $("#eventTimeCd").val();
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
	
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	
    </script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>행사 등록</strong>&nbsp;<span class="glyphicon glyphicon-list-alt"></span></font></h1>
			<p>행사 일정 등록 페이지입니다.</p>
		</div>
	</div>
	<div class="container">
	<form id="createEvent" method="post" action="${context}/work/event/createEvent.do" role="form">
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
				<label for="postNum" class="control-label col-md-2"><b>행사 위치</b></label>
				<div class="col-md-2">
					<input class="form-control" type="text" id="sample6_postcode" readonly="readonly" placeholder="우편번호" required="required">
				</div>
				<span class="col-md-1">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				</span>
			</div>
			<div class="form-group">
				<label for="address" class="control-label col-md-2"></label>
				<div class="col-md-6">
					<input class="form-control" type="text" id="sample6_address" readonly="readonly" placeholder="주소">
					<input class="form-control" type="text" id="sample6_detailAddress" placeholder="상세주소">
					<input class="form-control" type="hidden" id="sample6_extraAddress" placeholder="참고항목">
				</div>
				<input type="hidden" id="eventLoc" name="eventLoc">
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
					<input class="form-control" type="text" id="eventUnitPrice" name="eventUnitPrice" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
			</div>

			<div class="form-group">
				<label for="eventMaxPop" class="control-label col-md-2"><b>최대 인원</b></label>
				<div class="col-md-3">
					<input class="form-control" type="text" id="eventMaxPop" name="eventMaxPop" required="required" onkeydown="return fn_showKeyCode(event)"/>
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
		<c:if test="${sessionScope.grade == 'M'}">
			<input type="hidden" id="eventYn" name="eventYn" value="Y">
		</c:if>
		<c:if test="${sessionScope.grade != 'M'}">
			<input type="hidden" id="eventYn" name="eventYn" value="N">
		</c:if>
		
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
				<button type="button" class="btn btn-success" onclick="fn_save()">등록하기</button>
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