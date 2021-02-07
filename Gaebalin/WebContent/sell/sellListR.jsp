<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="sellListR.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>주문정보</title>

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

    function fn_finalBuy(paramSellCode, paramProductCode, paramSellPrice, paramSellCount, paramProductName,
    		paramEmail, paramName, paramTel, paramAddr, paramPost){
    	if(confirm("구매하시겠습니까?")){
    		var IMP = window.IMP;
		    IMP.init("imp39604047");
		    IMP.request_pay({
		        pg : 'html5_inicis', // version 1.1.0부터 지원.
		        pay_method : 'card',
		        merchant_uid : 'merchant_' + new Date().getTime(),
		        name : paramProductName,
		        amount : '10',
		        buyer_email : paramEmail,
		        buyer_name : paramName,
		        buyer_tel : paramTel,
		        buyer_addr : paramAddr,
		        buyer_postcode : paramPost,
		        m_redirect_url : "${context}/work/sell/updateFinalBuy.do?sellCode=" + paramSellCode + "&sellCount=" + paramSellCount + "&productCode=" + paramProductCode
		    }, function(rsp) {
		        if ( rsp.success ) {
		            var msg = '결제가 완료되었습니다.';
		            msg += '고유ID : ' + rsp.imp_uid;
		            msg += '상점 거래ID : ' + rsp.merchant_uid;
		            msg += '결제 금액 : ' + rsp.paid_amount;
		            msg += '카드 승인번호 : ' + rsp.apply_num;
			        alert(msg);
		            location.href = "${context}/work/sell/updateFinalBuy.do?sellCode=" + paramSellCode + "&sellCount=" + paramSellCount + "&productCode=" + paramProductCode;
		        } else {
		            var msg = '결제에 실패하였습니다.';
		            msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
		        }
		    });			
		}
    }
    
    function fn_delete(paramSellCode){
    	if(confirm("구매를 취소하시겠습니까?")){
	    	location.href = "${context}/work/sell/deleteSell.do?sellCode=" + paramSellCode;
    	}
    }
	
    /*
    function fn_finalBuy(paramSellCode, paramSellCount, paramProductCode, paramSellPrice){
        location.href = "${context}/work/sell/updateFinalBuy.do?sellCode=" + paramSellCode + "&sellCount=" + paramSellCount + "&productCode=" + paramProductCode;
    }
    */
    </script>
</head>
<body>
<jsp:include page="/common/top.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>주문정보</strong>&nbsp;<i class="fa fa-credit-card fa-1x"></i></font></h1>
			<p>주문 정보를 확인해주세요</p>
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
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">상품이미지</th>
			                            <th style="text-align: center; vertical-align: middle; width: 80px;">상품이름</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">상품단가</th>
			                            <th style="text-align: center; vertical-align: middle; width: 50px;">상품수량</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">결제금액</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;">결제</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${dsSellList}" var="dsSellList" varStatus="sellIdx">
			                         <tr>
			                            <td style="text-align: center; vertical-align: middle;">
										<img name="image" width="110px" height="110px" src="${context}/javaImg/${dsSellList.PRODUCT_IMAGE}" class="img-thumbnail">
											<script type="text/javascript">
											 	var productCategoryCd = '${dsSellList.PRODUCT_CATEGORY_CD}';

											 	if(productCategoryCd == 'JA'){
													imageFolder = "javaImg";
												}else if(productCategoryCd == 'PY'){
													imageFolder = "pythonImg";
												}else if(productCategoryCd == 'ED'){
													imageFolder = "educationImg";
												}else if(productCategoryCd == 'CC'){
													imageFolder = "clanguageImg";
												}
												path = $("img[name='image']").eq('${sellIdx.index}').attr("src");

												existFolder = path.split("/")[1];
												$("img[name='image']").eq('${sellIdx.index}').attr("src", path.replace(existFolder, imageFolder));
											</script>
			                            </td>
			                            <td style="text-align: center; vertical-align: middle;">${dsSellList.PRODUCT_NAME}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsSellList.PRODUCT_UNIT_PRICE}원</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsSellList.SELL_COUNT}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsSellList.SELL_PRICE}원</td>
			                            <td style="text-align: center; vertical-align: middle;">
			                            	<button type="button" class="btn btn-primary" onclick="fn_finalBuy('${dsSellList.SELL_CODE}', '${dsSellList.PRODUCT_CODE}', '${dsSellList.SELL_PRICE}', '${dsSellList.SELL_COUNT}', '${dsSellList.PRODUCT_NAME}', 
			                            	'${dsSellList.EMAIL}', '${dsSellList.NICK_NAME}', '${dsSellList.PHONE_NUM}', '${dsSellList.ADDRESS}', '${dsSellList.POST_NUM}')">결제하기</button>
											<button type="button" class="btn btn-danger" onclick="fn_delete('${dsSellList.SELL_CODE}')">삭제</button>
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
		</div>
	</div>
<jsp:include page="/common/foot.jsp"></jsp:include>
</body>
</html>