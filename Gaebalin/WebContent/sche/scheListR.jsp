<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes, width=device-width, height=device-height" />
<meta charset="UTF-8">
<meta name="description" content="scheListR.jsp">
<title>공지사항</title>
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<script src="${context}/js/jquery-1.9.1.js"></script>

    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

</head>
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


	<script type="text/javascript">
		$(document).ready(function() {
			$('#scheTable').DataTable({
		    	// 정렬 기능 숨기기
		    	ordering: false,
	
		    });
		    $('#boardTable-example_filter').parent().remove();
		    $('#boardTable-example_length').parent().remove();
	
	
		});
	
		function fn_createBoard(){
			location.href = "${context}/work/board/createBoard.do";
		}

	</script>
    <script>
		var path = '';
	
	    $(document).ready(function() {
	        $('#dataTables-example').dataTable();
	    });
	
	
	    function fn_createSche(){
	    	location.href = "${context}/work/sche/createSche.do";
	    }
    </script>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color:pink;">
			<h1><font color="red"><strong>공지사항</strong>&nbsp;<span class="glyphicon glyphicon-bullhorn"></span></font></h1>
		</div>
			<div class="col-md-12">
				<c:if test="${sessionScope.id != null && sessionScope.grade == 'M'}">
					<div class="page-header" style="margin:0 auto; float:right">
						  <button type="button" class="btn btn-warning btn-lg" onclick="fn_createSche()">공지사항 등록</button>
					</div>
				</c:if>
		<div class="row">
			</div>
			<div class="col-md-12">
				    <div class="panel panel-default">
				        <!-- /.panel-heading -->
				        <div class="panel-body">
				             <div class="table-responsive">
			                	<table class="table table-striped table-bordered table-hover" id="scheTable">
				                    <thead>
				                        <tr>
				                        	<th style="text-align: left; vertical-align: middle; width: 30px;">공지사항</th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                    	<c:forEach items="${dsScheList}" var="dsScheList" varStatus="scheIdx">
				                         <tr>
				                         	<td style="vertical-align: middle;">
				                         		<div class="col-md-8"><a href ="${context}/work/sche/retrieveSche.do?scheNo=${dsScheList.SCHE_NO}"><font size="5px">${dsScheList.SCHE_TITLE}</font></a></div>
				                         		<div class="col-md-1"><span class="glyphicon glyphicon-eye-open fa-1x"></span><b>${dsScheList.SCHE_HITS}</b></div>
												<div class="col-md-1"><img alt="User Pic" id="userImage" src="${context}/userImg/${dsScheList.USER_IMAGE}" height="21px" width="15px" class="img-circle">${dsScheList.USER_ID}</div>
												<div class="col-md-1" style="color: gray;"><small>${dsScheList.SCHE_TIMEAGO}</small></div>
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
	</div>

<jsp:include page="../common/foot.jsp"></jsp:include>

</body>
</html>