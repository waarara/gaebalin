<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="userListR.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>유저 관리</title>

	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/common.js"></script>
	<script src="${context}/js/bootstrap.min.js"></script>

    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

    <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <script src="${context}/js/sb-admin-2.js"></script>

    <script>

	var existFolder = '';
	var imageFolder = '';
	var path = '';

    $(document).ready(function() {
        $('#dataTables-example').dataTable();
    });
    
    function fn_deleteUser(paramUserCode){
    	if(confirm("강퇴하시겠습니까?")){
	    	location.href = "${context}/work/user/deleteUser.do?userCode=" + paramUserCode;
    	}
    };

    </script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<br><br><br>
	<div class="container">
		<div class="page-header">
			<h1>유저 정보</h1>
		</div>
				<div class="col-md-13">
			    <div class="panel panel-default">
			        <!-- /.panel-heading -->
			        <div class="panel-body">
			            <div class="table-responsive">
			                <table class="table table table-bordered table-hover" id="dataTables-example">
			                    <thead>
			                        <tr>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">번호</th>
			                            <th style="text-align: center; vertical-align: middle; width: 80px;">닉네임</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">이메일</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">최근 접속일</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;">비고</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${dsUserList}" var="dsUserList" varStatus="userIdx">
			                         <tr>
			                            <td style="text-align: center; vertical-align: middle;">${dsUserList.USER_CODE}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsUserList.NICK_NAME}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsUserList.EMAIL}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsUserList.CONNECT_DATE}</td>
			                            <td style="text-align: center; vertical-align: middle;">
			                            	<button type="button" class="btn btn-primary" onclick="fn_deleteUser('${dsUserList.USER_CODE}')">강퇴</button>
			                            </td>
			                         </tr>
			                        </c:forEach>
			                    </tbody>
			                </table>
			            </div>
			            <!-- /.table-responsive -->
			        </div>
			        <!-- /.panel-body -->
			    </div>
			    <!-- /.panel -->
			</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>