<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="stockQnaListR.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>관리자 문의관리</title>

	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/bootstrap.min.js"></script>
	<script src="${context}/js/common.js"></script>
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

    function fn_createResponse(paramQnaNo){
		location.href = "${context}/work/qna/createResponse.do?qnaNo=" + paramQnaNo;
    }

    </script>
</head>
<body>
<jsp:include page="/common/top.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>문의관리</strong>&nbsp;<span class="glyphicon glyphicon-list-alt"></span></font></h1>
			<p>문의관리 페이지입니다.</p>
		</div>

		<div class="row">
			<div class="col-md-12">
			    <div class="panel panel-default">
			        <!-- /.panel-heading -->
			        <div class="panel-body">
			            <div class="table-responsive">
			                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
			                    <thead>
			                        <tr>
			                        	<th style="text-align: center; vertical-align: middle; width: 30px;">문의번호</th>
   			                            <th style="text-align: center; vertical-align: middle; width: 50px;">문의제목</th>			                            
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">문의날짜</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;">문의종류</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;">답변하기</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${dsQnaList}" var="dsQnaList" varStatus="qnaIdx">
			                         <tr>
			                         	<td style="text-align: center; vertical-align: middle;">${dsQnaList.GROUP_NO}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsQnaList.QNA_TITLE}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsQnaList.QNA_DATE}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsQnaList.QNA_CATEGORY_CD_NM}</td>
			                            <td style="text-align: center; vertical-align: middle;">
										<c:if test="${sessionScope.userCode != dsQnaList.USER_CODE && dsQnaList.QNA_DEPTH == dsQnaList.MAX_DEPTH}">
			                            	<button type="button" class="btn btn-warning" onclick="fn_createResponse('${dsQnaList.QNA_NO}')">답변</button>
			                            </c:if>
			                            <c:if test="${dsQnaList.QNA_DEPTH % 2 == 1}">
			                            	[답변 완료]
			                            </c:if>
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
			<!-- /.col-lg-12 -->
			<div class="col-md-1 col-md-offset-11">
				<button type="button" class="btn btn-success btn-lg"  style="float:right;" onclick="fn_back()">뒤로가기</button>
			</div>
		</div>
	</div>
<jsp:include page="/common/foot.jsp"></jsp:include>
</body>
</html>