<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="boardListR.jsp">
<meta name="viewport"
	content="initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=yes; width=device-width;height=device-height" />

<title>게시판</title>
<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<script src="${context}/js/jquery-1.9.1.js"></script>

<script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

</head>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/plugins/metisMenu/metisMenu.min.css"
	rel="stylesheet">
<link href="${context}/css/plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<link href="${context}/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>

<script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="${context}/js/common.js"></script>
<script src="${context}/js/sb-admin-2.js"></script>


<script type="text/javascript">
	$(document).ready(function() {
		$('#boardTable').DataTable({
			// 정렬 기능 숨기기
			ordering : false,

		});
		$('#boardTable-example_filter').parent().remove();
		$('#boardTable-example_length').parent().remove();

	});
</script>
<c:set var="loginUrl">${context}/work/user/goLogin.do</c:set>
<c:set var="boardUrl">${context}/work/board/createBoard.do</c:set>
<body>
	<jsp:include page="../common/top.jsp"></jsp:include>

	<div class="container">
		<div class="jumbotron jumbotron-info"
			style="background-color: lightgreen;">
			<h1>
				<font color="green"><strong>게시판</strong>&nbsp;<span
					class="glyphicon glyphicon-blackboard"></span></font>
			</h1>

		</div>
		<div class="col-md-12">
			<div class="page-header" style="margin: 0 auto; float: right">
				<button type="button" class="btn btn-success btn-lg"
					onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${boardUrl}')">글
					작성</button>
			</div>
			<div class="row"></div>
			<div class="col-md-12">
				<div class="panel panel-default">
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover"
								id="boardTable">
								<thead>
									<tr>
										<th
											style="text-align: left; vertical-align: middle; width: 30px;">게시판</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${dsBoardList}" var="dsBoardList"
										varStatus="courseIdx">
										<tr>
											<td style="vertical-align: middle;">
												<div class="col-md-6">
													<a
														href="${context}/work/board/retrieveBoard.do?boardNo=${dsBoardList.BOARD_NO}"><font
														size="3px">${dsBoardList.BOARD_TITLE}</font></a>
												</div>
												<div class="col-md-1">
													<span class="glyphicon glyphicon-thumbs-up fa-1x"></span><b>${dsBoardList.BOARD_RATING}</b>
												</div>
												<div class="col-md-1">
													<span class="glyphicon glyphicon-eye-open fa-1x"></span><b>${dsBoardList.BOARD_HITS}</b>
												</div>
												<div class="col-md-1">
													<span class="glyphicon glyphicon-comment fa-1x"></span><b>${dsBoardList.BOARD_REPLY}</b>
												</div>
												<div class="col-md-1">
													<img alt="User Pic" id="userImage"
														src="${context}/userImg/${dsBoardList.USER_IMAGE}"
														height="21px" width="15px" class="img-circle">${dsBoardList.USER_ID}</div>
												<div class="col-md-1" style="color: gray;">
													<small>${dsBoardList.BOARD_TIMEAGO}</small>
												</div>
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