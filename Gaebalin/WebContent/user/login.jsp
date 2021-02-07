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

    <meta name="description" content="login.jsp">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="">

    <title>개발인 LOGIN</title>

    <link href="${context}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- jQuery -->
    <script src="${context}/js/jquery-1.9.1.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${context}/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>
	<script src="${context}/js/common.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${context}/js/sb-admin-2.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#pw").keydown(function (key){
				if(key.keyCode == 13){
					ajaxLoginCheck();
				}

			});
		});

		function ajaxLoginCheck(){
			var id = $("#id").val();
			var pw = $("#pw").val();

			var param = {};

			param["id"] = id;
			param["pw"] = pw;

			$.ajax({
				url:"${context}/work/user/ajaxLoginCheck.do",
				contentType:"application/json",
				dataType:"json",
				data:param,
				success:function(result){
					if(result['loginYn'] == 'success'){
						alert("로그인에 성공하였습니다.");
						$("#loginFrm").submit();
					}else{
						alert('로그인에 실패하셨습니다.');
						$("#id").val('');
						$("#pw").val('');
					}
				}
			});
		};


	</script>
</head>

<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div id="jumbotron" class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>LOGIN</strong>&nbsp;<span class="glyphicon glyphicon glyphicon-pencil"></span></font></h1>
			<p>개발인에 오신것을 진심으로 환영합니다.</p>
		</div>
	</div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default"  style="margin-bottom: 57%;">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form action="${context}/work/user/login.do" method="post" role="form" id="loginFrm">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="ID" id="id" name="id" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" id="pw" name="pw" type="password">
                                </div>
                                <div class="form-group">
                                	<span style="float: left;"><a href="${context}/user/idFind.jsp">ID찾기</a>|<a href="${context}/user/pwFind.jsp">PW찾기</a></span>
                                	<span style="float: right;"><a href="${context}/work/user/createUser.do">회원가입</a></span><br>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <button type="button" class="btn btn-lg btn-success btn-block" onclick="ajaxLoginCheck();">Login</button>
                            </fieldset>
                        </form>
                        <br>
                        <div id="naver_id_login" style="text-align:center"><a href="${naver_url}">
						<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
						<div id="kakao_id_login" style="text-align: center"><a href="${kakao_url}">
						<img width="223" src="${context}/userImg/kakao_login.png" /></a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>
