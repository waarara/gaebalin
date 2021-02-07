<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<meta name="viewport"
	content="initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=yes; width=device-width;height=device-height" />
<head>
<meta charset="UTF-8">
<meta name="description" content="qnaListR.jsp">
<title>문의 내역</title>
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

    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>
	<script src="${context}/js/common.js"></script>
    <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <script src="${context}/js/sb-admin-2.js"></script>


<script type="text/javascript">
	var path = '';
	
	$(document).ready(function() {
	    $('#qnaTable').DataTable({
	    	// 정렬 기능 숨기기
	    	ordering: false,

	    });
	    $('#boardTable-example_filter').parent().remove();
	    $('#boardTable-example_length').parent().remove();


	});

	function fn_createBoard(){
		location.href = "${context}/work/qna/createQna.do";
		
	    $('#dataTables-example').dataTable();
	}
	
	function fn_remove(paramGroupNo){
		location.href = "${context}/work/qna/deleteQna.do?groupNo=" + paramGroupNo;
	}
	
	function fn_save(){
		if(!fn_validation()){
			return;
		}else{
			var qnaContents = String($("#qnaContents").val());

			qnaContents = qnaContents.replace(/\n/gi, "<br/>");

			$("#qnaContents").val(qnaContents);

	 		$("#createResponse").submit();
		}
	}

</script>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>

<div class="container">
	<div class="jumbotron jumbotron-info" style="background-color: lightgreen;">
		<h1><font color="green"><strong>자주묻는질문(FAQ)</strong>&nbsp;<span class="glyphicon glyphicon-blackboard"></span></font></h1>
	</div>
	<div class="row">
		<div class="col-md-12" id="faqAccordion">
	        <div class="panel panel-default ">
	            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question0">
	                 <h4 class="panel-title">
	                    <a href="#" class="ing">Q: 배송은 언제 되나요?</a>
	              </h4>
	            </div>
	            <div id="question0" class="panel-collapse collapse" style="height: 0px;">
	                <div class="panel-body">
	                     <h5><span class="label label-primary">Answer</span></h5>
	
	                    <p>- 영업일 기준 오후 1시 이전 결제 완료 주문건 :  당일 출고됩니다. (일부 상품 제외)

							- 공휴일의 경우 다음 영업일에 출고됩니다.

							(출고된 경우 서울/수도권 지역은 대부분 다음날 수령, 지방은 1~3일 이내에 배송됩니다. 따라서 전체 배송 기간은 (업무일 기준) 3일~7일 정도 소요되며, 
							일부 택배사 사정에 따라 변동될 수 있습니다.)


							※ 주문 상품이 재고 부족일 경우 부득이하게 배송 시간은 달라질 수 있는 점 양해 부탁드립니다.
	                        </p>
	                </div>
	            </div>
	        </div>
	        <div class="panel panel-default ">
	            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question1">
	                 <h4 class="panel-title">
	                    <a href="#" class="ing">Q: 배송 전 취소 하고 싶어요!</a>
	              </h4>
	
	            </div>
	            <div id="question1" class="panel-collapse collapse" style="height: 0px;">
	                <div class="panel-body">
	                     <h5><span class="label label-primary">Answer</span></h5>
	
	                    <p>- 주문 당일 취소를 원하시는 고객님께서는 사이트에서 취소 요청을 해주신 뒤, 고객센터(010-1111-7777)로 문의하여 취소 접수를 부탁드립니다.

							- 취소 접수를 하지 않은 건에 대해서는 상품이 출고되어 주문 취소가 불가합니다. 이 경우 부득이하게 반품으로 처리 될 수 있습니다.
						</p>
	                </div>
	            </div>
	        </div>
	        <div class="panel panel-default ">
	            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question2">
	                 <h4 class="panel-title">
	                    <a href="#" class="ing">Q: 교환/반품시 배송비는 어떻게 되나요?</a>
	              </h4>
	
	            </div>
	            <div id="question2" class="panel-collapse collapse" style="height: 0px;">
	                <div class="panel-body">
	                     <h5><span class="label label-primary">Answer</span></h5>
	
	                    <p>- 단순 변심으로 인한 교환/환불 시 왕복 배송비 발생 됩니다.

						 제품 불량으로 인한 교환/환불 시 배송비는 발생되지 않습니다.
							
						 교환으로 인한 차액 발생시 구매하신 쇼핑몰 또는 카카오 상담톡으로 문의주시면 도와드리겠습니다.
						</p>
	                </div>
	            </div>
	        </div>
	        <div class="panel panel-default ">
	            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question3">
	                 <h4 class="panel-title">
	                    <a href="#" class="ing">Q: 개발인 주소가 어떻게 되나요?</a>
	              </h4>
	
	            </div>
	            <div id="question3" class="panel-collapse collapse" style="height: 0px;">
	                <div class="panel-body">
	                     <h5><span class="label label-primary">Answer</span></h5>
	
	                    <p>서울시 송파구 잠실2동 131-743</p>
	                </div>
	            </div>
	        </div>
	                <div class="panel panel-default ">
	            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question4">
	                 <h4 class="panel-title">
	                    <a href="#" class="ing">Q: 개발인 고객센터 전화번호가 어떻게 되나요?</a>
	              </h4>
	
	            </div>
	            <div id="question4" class="panel-collapse collapse" style="height: 0px;">
	                <div class="panel-body">
	                     <h5><span class="label label-primary">Answer</span></h5>
	                    <p>TEL. 010-1111-7777</p>
	                </div>
	            </div>
	        </div>
	        <div class="panel panel-default ">
	            <div class="panel-heading accordion-toggle collapsed question-toggle" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question5">
	                 <h4 class="panel-title">
	                    <a href="#" class="ing">Q: 개발인 팩스번호가 어떻게 되나요?</a>
	              </h4>
	
	            </div>
	            <div id="question5" class="panel-collapse collapse" style="height: 0px;">
	                <div class="panel-body">
	                     <h5><span class="label label-primary">Answer</span></h5>
	                    <p>FAX. 02-2321-5819</p>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
	    <div class="jumbotron jumbotron-info" style="background-color: gold;">
			<h1><font color="green"><strong>Q&A</strong>&nbsp;<span class="glyphicon glyphicon-blackboard"></span></font>
			<button type="button" class="btn btn-info btn-sm" onclick="fn_createBoard()">문의하기</button></h1>
		</div>
		<div class="col-md-12">
           	<c:forEach items="${dsQnaList}" var="dsQnaList" varStatus="qnaIdx">
			    <div class="panel panel-default">
					<div class="panel-heading">
		                 <h4 class="panel-title">
							<c:if test="${dsQnaList.QNA_DEPTH == 0}">
		                    	[${dsQnaList.QNA_CATEGORY_CD_NM}] ${dsQnaList.QNA_TITLE} / ${dsQnaList.QNA_DATE}
		                         	<button class="btn btn-primary btn-sm" type="button" onclick="fn_remove('${dsQnaList.GROUP_NO}')">삭제하기</button>
							</c:if>
							<c:if test="${dsQnaList.QNA_DEPTH != 0}">
		                    	&emsp; ▶ ${dsQnaList.QNA_TITLE} / ${dsQnaList.NICK_NAME} / ${dsQnaList.QNA_DATE}
							</c:if>
		             	 </h4>
		           	 </div>			        
					<div>
		                <div class="panel-body">
		                    <p>&emsp;&emsp;${dsQnaList.QNA_CONTENTS}
		                    </p>
		                	<c:if test="${dsQnaList.MAX_DEPTH == dsQnaList.QNA_DEPTH && dsQnaList.USER_CODE != sessionScope.userCode}">
								<form id="createResponse" method="post" action="${context}/work/qna/createResponse.do" role="form">
										<div class="form-group">
								
											<label for="qnaTitle" class="control-label col-md-2"><b>답변 제목</b></label>
											<div class="col-md-10">
												<input class="form-control" type="text" name="qnaTitle" id="qnaTitle" maxlength="50" placeholder="제목을 입력해주세요"/>
											</div>
										</div>
										<div class="form-group">
											<label for="qnaContents" class="control-label col-md-2"><b>답변 내용</b></label>
											<div class="col-md-10">
												<textarea class="form-control" name="qnaContents" id="qnaContents" cols="3" rows="6" placeholder="본문을 입력해주세요"></textarea>
											</div>
										</div>
										<input type="text" id="qnaNo" name="qnaNo" value="${dsQnaList.QNA_NO}">
										<input type="hidden" id="qnaDepth" name="qnaDepth" value="${dsQnaList.QNA_DEPTH}">
										<input type="text" id="groupNo" name="groupNo" value="${dsQnaList.GROUP_NO}">
										<input type="text" id="responseUser" name="responseUser" value="${sessionScope.userCode}">
									<div class="col-md-offset-8 col-md-1">
										<button class="btn btn-primary" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_save()">등록하기</button>
									</div>
								</form>
	                         </c:if>
		                </div>
					</div>
		    <!-- /.panel -->
				</div>
			</c:forEach>
	</div>

</div>

<jsp:include page="../common/foot.jsp"></jsp:include>

</body>
</html>