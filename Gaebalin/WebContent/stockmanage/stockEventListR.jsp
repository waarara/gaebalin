<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="stockEventListR.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>행사관리</title>

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

    function fn_modifyEvent(paramEventNo){
		location.href = "${context}/work/event/updateEvent.do?eventNo=" + paramEventNo;
    }

    function fn_modifyYn(paramEventNo){
    	if(confirm("행사 일정을 승인하겠습니까?")){
			location.href = "${context}/work/event/updateEventYn.do?eventNo=" + paramEventNo;
    	} 
   	}
    
    function fn_createEvent(){
    	location.href = "${context}/work/event/createEvent.do";
    }

    </script>
</head>
<body>
<jsp:include page="/common/top.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>행사관리</strong>&nbsp;<span class="glyphicon glyphicon-list-alt"></span></font></h1>
			<p>행사일정관리 페이지입니다.</p>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="page-header" style="float: right;">
					  <button type="button" class="btn btn-info btn-lg" onclick="fn_createEvent()">행사일정추가</button>
				</div>
			</div>
			<div class="col-md-12">
			    <div class="panel panel-default">
			        <!-- /.panel-heading -->
			        <div class="panel-body">
			            <div class="table-responsive">
			                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
			                    <thead>
			                        <tr>
			                        	<th style="text-align: center; vertical-align: middle; width: 30px;">행사번호</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">행사이미지</th>
			                            <th style="text-align: center; vertical-align: middle; width: 80px;">행사제목</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">행사분류</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">행사참가비</th>
			                            <th style="text-align: center; vertical-align: middle; width: 50px;">행사날짜/시간대</th>
   			                            <th style="text-align: center; vertical-align: middle; width: 50px;">행사위치</th>			                            
   			                            <th style="text-align: center; vertical-align: middle; width: 50px;">행사인원</th>			                            
   			                            <th style="text-align: center; vertical-align: middle; width: 20px;">승인여부</th>			                            
			                            <th style="text-align: center; vertical-align: middle; width: 20px;">정보변경</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${dsEventList}" var="dsEventList" varStatus="eventIdx">
			                         <tr>
			                         	<td style="text-align: center; vertical-align: middle;">${dsEventList.EVENT_NO}</td>
			                            <td style="text-align: center; vertical-align: middle;">
										<img name="image" width="110px" height="110px" src="${context}/conImg/${dsEventList.EVENT_IMAGE}" class="img-thumbnail">
											<script type="text/javascript">
											 	var eventCategoryCd = '${dsEventList.EVENT_CATEGORY_CD}';
											 	if(eventCategoryCd == 'CON'){
													imageFolder = "conImg";
												}else if(eventCategoryCd == 'MET'){
													imageFolder = "metImg";
												}
												path = $("img[name='image']").eq('${eventIdx.index}').attr("src");

												existFolder = path.split("/")[1];
												$("img[name='image']").eq('${eventIdx.index}').attr("src", path.replace(existFolder, imageFolder));
											</script>
			                            </td>
			                            <td style="text-align: center; vertical-align: middle;">${dsEventList.EVENT_TITLE}</td>
			                            <td style="text-align: center; vertical-align: middle;">[${dsEventList.EVENT_CATEGORY_CD_NM}]</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsEventList.EVENT_UNIT_PRICE}원</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsEventList.EVENT_DATE} / ${dsEventList.EVENT_TIME_CD_NM}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsEventList.EVENT_LOC}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsEventList.EVENT_CUR_POP} / ${dsEventList.EVENT_MAX_POP}</td>
			                            <td style="text-align: center; vertical-align: middle;">
			                            <c:if test="${dsEventList.EVENT_YN == 'Y'}">
				                            ${dsEventList.EVENT_YN}
			                            </c:if>
			                            <c:if test="${dsEventList.EVENT_YN != 'Y'}">
			                            	<button type="button" class="btn btn-warning" onclick="fn_modifyYn('${dsEventList.EVENT_NO}')">승인</button>
			                            </c:if>
			                            </td>
			                            <td style="text-align: center; vertical-align: middle;">
			                            	<button type="button" class="btn btn-warning" onclick="fn_modifyEvent('${dsEventList.EVENT_NO}')">정보변경</button>
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