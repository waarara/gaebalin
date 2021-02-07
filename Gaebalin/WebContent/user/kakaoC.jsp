<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<% if(session.getAttribute("id") != null){ 
               response.sendRedirect("/work/product/goMain.do");//redirect to some page
  }
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes, width=device-width, height=device-height" />
		<meta name="description" content="kakaoC.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>카카오 간편 회원가입</title>
	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
	<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
		<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${context}/css/process.css" rel="stylesheet">
	<script src="${context}/js/jquery-1.9.1.js"></script>
    
	<script src="${context}/js/common.js"></script>
	<script src="${context}/js/jquery.form.js"></script>
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

	<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>

    <!-- 카카오 주소 API -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script type="text/javascript">

	var imageFolder;

	$(document).ready(function(){
// 		$('#dataTables-example').dataTable();
		fn_init();

		imageFolder = "userImg";
		
		fn_setDetailInfo();
	});
	
	function fn_setDetailInfo(){
		$("#id").val('${id}');
		$("#pw").val('${pw}');
		$("#email").val('${email}');
		$("#name").val('${nickname}');
		var test = '${id}';

		console.log("${context}/userImg/" + test + ".jpg");
		$("#userImage").val(test + ".jpg");
		
		var userImage = '${profile}';

		$("#pic").attr("src", userImage);
		
	}

	function fn_save(){
		if(!fn_validation()) return;

		$("#phoneNum").val($("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val());
 		$("#postNum").val($("#sample6_postcode").val());
 		$("#address").val($("#sample6_address").val() + "/" + $("#sample6_detailAddress").val());

 		$("#joinFrm").submit();
	}

	function fn_upload(){
		$("#ajaxform").ajaxSubmit({
	        type: "POST",
	        dataType: 'text',
	        url: $("#ajaxform").attr("action"),
	        data: $("#ajaxform").serialize(),
	        success: function (data) {
	        	data2 = data.replace(/"/gi, "");
	        	console.log(data2);
	        	var imageUrl = "${context}/userImg/" + data2;
	        	$("#pic").attr("src", imageUrl);
	        	$("#userImage").val(data2);
	        },
	        error: function (xhr, status, error) {
	            alert(error);
	        }
	    });
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
	<div id="jumbotron" class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>회원가입</strong>&nbsp;<span class="glyphicon glyphicon glyphicon-pencil"></span></font></h1>
			<p>회원가입을 진심으로 환영합니다.</p>
		</div>
	</div>
	<div class="container">
	<form id="joinFrm" method="post" action="${context}/work/user/createKakaoUser.do" role="form">
		<div class="form-horizontal">
			<hr/>
			<input class="form-control" type="hidden" name="id" id="id" required="required"/>
			<input class="form-control" type="hidden" name="pw" id="pw" required="required"/>
			<div class="form-group">
				<label for="email" class="control-label col-md-2"><b>이메일</b></label>
				<div class="col-md-4">
					<input class="form-control" type="email" name="email" id="email" readonly="readonly" required="required"/>
				</div>
			</div>
			<div class="form-group">
				<label for="name" class="control-label col-md-2"><b>닉네임</b></label>
				<div class="col-md-6">
					<input class="form-control" type="text" id="name" name="nickName" autofocus="autofocus" required="required"/>
				</div>
			</div>
			<div class="form-group">
				<label for="phoneNum" class="control-label col-md-2"><b>연락처</b></label>
				<div class="col-md-2">
					<input class="form-control" type="text" id="phone1" maxlength="3" required="required" onkeydown="return fn_showKeyCode(event)"/>
	     		</div>
				<div class="col-md-2">
					<input class="form-control" type="text" id="phone2" maxlength="4" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
				<div class="col-md-2">
					<input class="form-control" type="text" id="phone3" maxlength="4" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
				<input type="hidden" id="phoneNum" name="phoneNum">
			</div>

			<div class="form-group">
				<label for="postNum" class="control-label col-md-2"><b>주소</b></label>
				<div class="col-md-2">
					<input class="form-control" type="text" id="sample6_postcode" readonly="readonly" placeholder="우편번호" required="required">
				</div>
				<span class="col-md-1">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				</span>
				<input type="hidden" id="postNum" name="postNum">
			</div>
			<div class="form-group">
				<label for="address" class="control-label col-md-2"></label>
				<div class="col-md-6">
					<input class="form-control" type="text" id="sample6_address" readonly="readonly" placeholder="주소">
					<input class="form-control" type="text" id="sample6_detailAddress" placeholder="상세주소">
					<input class="form-control" type="hidden" id="sample6_extraAddress" placeholder="참고항목">
				</div>
				<input type="hidden" id="address" name="address">
			</div>
			<div class="form-group">
				<label class="control-label col-md-2"><b>사진</b></label>
				<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="${context}/backgroundImage/defaultpic.png"><br/>
				<div class="col-md-6">
					<input type="hidden" id="userImage" name="userImage" required="required">
				</div>
			</div>

			<input type="hidden" id="flag" name="flag" value="false">
		</div>
	</form>
	<form id="ajaxform" action="${context}/work/product/saveFile.do" method="post" enctype="multipart/form-data" role="form">
		<div class="form-group">
		<label class="control-label col-md-2"></label>
			<div class="col-md-6">
				<input class="form-control" type="file" id="imageFile" name="imageFile" onchange="fn_upload()"/>
				<input type="hidden" id="imageFolder" name="imageFolder" value="userImg">
			</div>
		</div>
		<br><br><br>
		<div class="form-group">
			<div class="col-md-offset-6 col-md-1">
				<button type="button" class="btn btn-success" onclick="fn_back()">뒤로가기</button>
			</div>
			<div class="col-md-1">
				<button class="btn btn-primary" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_save()">등록하기</button>
			</div>
		</div>
	</form>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>