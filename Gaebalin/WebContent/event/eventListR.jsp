<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="eventListR.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>EVENT</title>
	
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
	</script>
	<style>
		.card-title{
			overflow:hidden;
			text-overflow:ellipsis;
			white-space:nowrap;
		}
	</style>
</head>

<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	<br><br><br>
	<div class="container">
		<div class="page-header">
			<h1>행사 정보</h1>
		</div>
		<div class="jumbotron">
			<div class="row row-cols-1 row-cols-md-3">
				<c:forEach items="${dsEventList}" var="dsEventList"
					varStatus="dsEventIdx">
					<div class="col-md-4"> 
						<div class="card" style="width: 28rem;">
							<a href="${context}/work/event/retrieveEvent.do?eventNo=${dsEventList.EVENT_NO}">
							<img name="image" class="card-img-top" src="${context}/conImg/${dsEventList.EVENT_IMAGE}"
							class="img-thumbnail" width="270px;" height="300px;"></a>
							<script type="text/javascript">
								var eventCategoryCd = '${dsEventList.EVENT_CATEGORY_CD}';

								if (eventCategoryCd == 'CON') {
									imageFolder = "conImg";
								} else if (eventCategoryCd == 'MET') {
									imageFolder = "metImg";
								}
								path = $("img[name='image']").eq(
										'${dsEventIdx.index}').attr("src");

								existFolder = path.split("/")[1];
								$("img[name='image']").eq('${dsEventIdx.index}').attr("src", path.replace(existFolder, imageFolder));
							</script>
							<div class="card-body">
								<h5 class="card-title">
									<b>${dsEventList.EVENT_TITLE}</b>
								</h5>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">인원 :
											${dsEventList.EVENT_CUR_POP} / ${dsEventList.EVENT_MAX_POP}</li>
									<li class="list-group-item">날짜 :
											${dsEventList.EVENT_DATE} / ${dsEventList.EVENT_TIME_CD_NM}</li>
								    <li class="list-group-item"><a href="${context}/work/event/retrieveEvent.do?eventNo=${dsEventList.EVENT_NO}" class="card-link">신청하기</a> </li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>