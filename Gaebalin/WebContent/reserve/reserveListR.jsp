<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="reserveListR.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>예약 확인</title>

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

	<!-- 아임포트 결제 cdn -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

    <script>
	var existFolder = '';
	var imageFolder = '';
	var path = '';

    $(document).ready(function() {
//         $('#dataTables-example').dataTable();

    });

    /*
    function fn_finalBuy(paramReserveNo, paramEventNo, paramReservePrice, paramReservePop, paramEventTitle,
    		paramEmail, paramName, paramTel, paramAddr, paramPost){
    	if(confirm("구매하시겠습니까?")){
    		var IMP = window.IMP;
		    IMP.init("imp39604047");
		    IMP.request_pay({
		        pg : 'html5_inicis', // version 1.1.0부터 지원.
		        pay_method : 'card',
		        merchant_uid : 'merchant_' + new Date().getTime(),
		        name : 'test',
		        amount : '10',
		        buyer_email : paramEmail,
		        buyer_name : paramName,
		        buyer_tel : paramTel,
		        buyer_addr : paramAddr,
		        buyer_postcode : paramPost,
		        m_redirect_url : "${context}/work/reserve/updateFinalBuy.do?reserveNo=" + paramReserveNo + "&reservePop=" + paramReservePop + "&eventNo=" + paramEventNo
		    }, function(rsp) {
		        if ( rsp.success ) {
		            var msg = '결제가 완료되었습니다.';
		            msg += '고유ID : ' + rsp.imp_uid;
		            msg += '상점 거래ID : ' + rsp.merchant_uid;
		            msg += '결제 금액 : ' + rsp.paid_amount;
		            msg += '카드 승인번호 : ' + rsp.apply_num;
			        alert(msg);
			        location.href = "${context}/work/reserve/updateFinalBuy.do?reserveNo=" + paramReserveNo + "&reservePop=" + paramReservePop + "&eventNo=" + paramEventNo;
		        } else {
		            var msg = '결제에 실패하였습니다.';
		            msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
		        }
		    });			
		}
    };
    */
    
	function fn_finalBuy(paramReserveNo, paramEventNo, paramReservePrice, paramReservePop, paramEventTitle,
    		paramEmail, paramName, paramTel, paramAddr, paramPost){
		if(confirm("결제하시겠습니까?")){
        	location.href = "${context}/work/reserve/updateFinalBuy.do?reserveNo=" + paramReserveNo + "&reservePop=" + paramReservePop + "&eventNo=" + paramEventNo;
		}
    };
	
	function fn_updateReserve(paramReserveNo){
		location.href = "${context}/work/reserve/updateReserve.do?reserveNo=" + paramReserveNo;
	};
	
	/*  + "&eventNo=" + paramEventNo + "&userCode=" + paramUserCode */
	function fn_deletePreReserve(paramReserveNo){
		if(confirm("예약을 취소하겠습니까??")){
			alert("예약이 취소됐습니다.");
			location.href = "${context}/work/reserve/deletePreReserve.do?reserveNo=" + paramReserveNo;
		}
	};
	
	function fn_deleteReserve(paramReserveNo, paramEventNo, paramReservePop){
		if(confirm("예약 결제을 취소하겠습니까??")){
			location.href = "${context}/work/reserve/deleteReserve.do?reserveNo=" + paramReserveNo + "&reservePop=" + paramReservePop + "&eventNo=" + paramEventNo;
		}
	};
	
    function fn_review(paramEventNo){
    	location.href = "${context}/work/event/retrieveEvent.do?eventNo=" + paramEventNo;
    };
    
	</script>
</head>
<body>
<jsp:include page="/common/top.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>예약 내역</strong>&nbsp;<i class="fa fa-credit-card fa-1x"></i></font></h1>
			<p>${sessionScope.id}님의 예약 내역입니다.</p>
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
			                        	<th style="text-align: center; vertical-align: middle; width: 30px;">행사번호</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">행사이미지</th>
			                            <th style="text-align: center; vertical-align: middle; width: 80px;">행사제목</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">1인당 참가비</th>
			                            <th style="text-align: center; vertical-align: middle; width: 50px;">참가 인원</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">결제금액</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;">결제</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">변경/취소</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${dsReserveList}" var="dsReserveList" varStatus="reserveIdx">
			                         <tr>
			                         	<td style="text-align: center; vertical-align: middle;">${dsReserveList.RESERVE_NO}</td>
			                            <td style="text-align: center; vertical-align: middle;">
										<img name="image" width="110px" height="110px" src="${context}/conImg/${dsReserveList.EVENT_IMAGE}" class="img-thumbnail">
											<script type="text/javascript">
											 	var eventCategoryCd = '${dsReserveList.EVENT_CATEGORY_CD}';

											 	if(eventCategoryCd == 'CON'){
													imageFolder = "conImg";
												}else if(eventCategoryCd == 'MET'){
													imageFolder = "metImg";
												}
												path = $("img[name='image']").eq('${reserveIdx.index}').attr("src");

												existFolder = path.split("/")[1];
												$("img[name='image']").eq('${reserveIdx.index}').attr("src", path.replace(existFolder, imageFolder));
											</script>
			                            </td>
			                            <td style="text-align: center; vertical-align: middle;">${dsReserveList.EVENT_TITLE}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsReserveList.EVENT_UNIT_PRICE}원</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsReserveList.RESERVE_POP}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsReserveList.RESERVE_PRICE}원</td>
			                            <td style="text-align: center; vertical-align: middle;">
											<c:if test="${dsReserveList.RESERVE_SELL_YN == 'N' and dsReserveList.RESERVE_YN != 'Y'}">
												<span>예약 승인 전</span>
											</c:if>
			                            	<c:if test="${dsReserveList.RESERVE_SELL_YN == 'N' and dsReserveList.RESERVE_YN == 'Y'}">
				                            	<button type="button" class="btn btn-primary" onclick="fn_finalBuy('${dsReserveList.RESERVE_NO}', '${dsReserveList.EVENT_NO}', 
				                            	'${dsReserveList.RESERVE_PRICE}', '${dsReserveList.RESERVE_POP}', '${dsReserveList.EVENT_TITLE}', 
				                            	'${dsReserveList.EMAIL}', '${dsReserveList.NICK_NAME}', '${dsReserveList.PHONE_NUM}', '${dsReserveList.ADDRESS}', '${dsReserveList.POST_NUM}')">결제하기</button>
											</c:if>
											<c:if test="${dsReserveList.RESERVE_SELL_YN == 'Y'}">
												<span>결제 완료</span>
												<button type="button" class="btn btn-primary btn-sm"  style="float:right;" onclick="fn_review('${dsReserveList.EVENT_NO}')"><span class="glyphicon glyphicon-pencil"></span>&nbsp;후기 작성</button>
											</c:if>
											<c:if test="${dsReserveList.RESERVE_SELL_YN == 'A'}">
												<span>결제 완료</span>
												<button type="button" class="btn btn-primary btn-sm"  style="float:right;" onclick="fn_review('${dsReserveList.EVENT_NO}')"><span class="glyphicon glyphicon-pencil"></span>&nbsp;후기 수정</button>
											</c:if>
			                            </td>
                       			        <td style="text-align: center; vertical-align: middle;">
                       			        	<c:if test="${dsReserveList.RESERVE_SELL_YN != 'Y' and dsReserveList.RESERVE_YN != 'Y'}">
												<button type="button" class="btn btn-primary" onclick="fn_deletePreReserve('${dsReserveList.RESERVE_NO}')">예약 취소</button>
											</c:if>
	                       			        <c:if test="${dsReserveList.RESERVE_SELL_YN != 'Y' and dsReserveList.RESERVE_YN == 'Y'}">
		                       			        <button type="button" class="btn btn-primary" onclick="fn_updateReserve('${dsReserveList.RESERVE_NO}')">변경</button>
	                       			        </c:if>
	                       			        <c:if test="${dsReserveList.RESERVE_SELL_YN == 'Y'}">
			                            	<button type="button" class="btn btn-primary" onclick="fn_deleteReserve('${dsReserveList.RESERVE_NO}', '${dsReserveList.EVENT_NO}', '${dsReserveList.RESERVE_POP}')">결제 취소</button>
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