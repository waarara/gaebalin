<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 
	<meta name="description" content="cartBuyList.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>장바구니</title>

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

    <script src="${context}/js/sb-admin-2.js"></script>

    <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

	
	<!-- 아임포트 결제 cdn -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script>
	var existFolder = '';
	var imageFolder = '';
	var path = '';
	
	var counting = ${dsCart.COUNTING};
   	var cart_list = [];
   	var product_list = [];
   	var price_list = [];
   	var count_list = [];
   	

   	function test(){
   		console.log(product_list);
       	console.log(price_list);
       	console.log(count_list);
   	};
    
    function ajaxBuyAll(){
		var param = {};
		
		param["counting"] = counting;
		param["cart"] = cart_list;
		param["code"] = product_list;
		param["price"] = price_list;
		param["count"] = count_list;

		$.ajax({
			url:"${context}/work/sell/ajaxBuyAll.do",
			contentType:"application/json",
			dataType:"json",
			data:param,
			traditional:true,
			success:function(result){
				if(result['buyYn'] == 'success'){
					console.log("no error");
				}else{
					console.log("error!");
					test();
				}
			}
		});
    };

    function fn_allbuy(paramTotalCount, paramTotalPrice, paramEmail, paramName,
    		paramTel, paramAddr, paramPost){
    	ajaxBuyAll();
    	setTimeout(function() {
	    	location.href = "${context}/work/sell/retrieveBuyList.do";
    		}, 2000);
    };
   	
    /*
    function fn_allbuy(paramTotalCount, paramTotalPrice, paramEmail, paramName,
    		paramTel, paramAddr, paramPost){
    	if(confirm("구매하시겠습니까?")){
    		var IMP = window.IMP;
		    IMP.init("imp39604047");
		    IMP.request_pay({
		        pg : 'html5_inicis', // version 1.1.0부터 지원.
		        pay_method : 'card',
		        merchant_uid : 'merchant_' + new Date().getTime(),
		        name : '종합 외 ' + paramTotalCount + '권',
		        amount : '10',
		        buyer_email : paramEmail,
		        buyer_name : paramName,
		        buyer_tel : paramTel,
		        buyer_addr : paramAddr,
		        buyer_postcode : paramPost,
		        m_redirect_url : "${context}/work/sell/retrieveBuyList.do"
		    }, function(rsp) {
		        if ( rsp.success ) {
		        	ajaxBuyAll();
		            var msg = '결제가 완료되었습니다.';
		            msg += '고유ID : ' + rsp.imp_uid;
		            msg += '상점 거래ID : ' + rsp.merchant_uid;
		            msg += '결제 금액 : ' + rsp.paid_amount;
		            msg += '카드 승인번호 : ' + rsp.apply_num;
			        alert(msg);
		    		location.href = "${context}/work/sell/retrieveBuyList.do";
		        } else {
		            var msg = '결제에 실패하였습니다.';
		            msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
		        }
		    });	
    	}
    };
    */

    </script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>구매 목록</strong>&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span></font></h1>
			<p>${sessionScope.id}님의 구매 목록입니다.</p>
		</div>
		<div class="row">
			<div class="col-md-12">
			    <div class="panel panel-default">
			        <!-- /.panel-heading -->
			        <div class="panel-body">
			            <div class="table-responsive">
			                <table class="table table-striped table-bordered table-hover" id="">
			                    <thead>
			                        <tr>
			                        	<th style="text-align: center; vertical-align: middle; width: 10px;">No</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;">상품이미지</th>
			                            <th style="text-align: center; vertical-align: middle; width: 40px;">상품이름</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;">상품단가</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">상품수량</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${dsCartList}" var="dsCartList" varStatus="cartIdx">
			                         <tr>
			                         	<td style="text-align: center; vertical-align: middle;">${cartIdx.count}</td>
			                            <td style="text-align: center; vertical-align: middle;">
										<a href="${context}/work/product/retrieveProduct.do?productCode=${dsCartList.PRODUCT_CODE}">
											<img name="image" width="110px" height="110px" src="${context}/binderImg/${dsCartList.PRODUCT_IMAGE}" class="img-thumbnail">
										</a>
											<script type="text/javascript">
											 	var productCategoryCd = '${dsCartList.PRODUCT_CATEGORY_CD}';

											 	if(productCategoryCd == 'JA'){
													imageFolder = "javaImg";
												}else if(productCategoryCd == 'PY'){
													imageFolder = "pythonImg";
												}else if(productCategoryCd == 'ED'){
													imageFolder = "educationImg";
												}else if(productCategoryCd == 'CC'){
													imageFolder = "clanguageImg";
												}
												path = $("img[name='image']").eq('${cartIdx.index}').attr("src");

												existFolder = path.split("/")[1];
												$("img[name='image']").eq('${cartIdx.index}').attr("src", path.replace(existFolder, imageFolder));
												
												var cartCode = '${dsCartList.CART_CODE}';
												var productCode = '${dsCartList.PRODUCT_CODE}';
												var sellPrice = '${dsCartList.CART_PRICE}';
												var sellCount = '${dsCartList.CART_COUNT}';
												cart_list.push(cartCode);
												product_list.push(productCode);
												price_list.push(sellPrice);
												count_list.push(sellCount);
											</script>
			                            </td>
			                            <td style="text-align: center; vertical-align: middle;">${dsCartList.PRODUCT_NAME}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsCartList.PRODUCT_UNIT_PRICE}원</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsCartList.CART_COUNT}</td>
			                         </tr>
			                         <input type="hidden" value="${dsCartList.PRODUCT_CODE}" class="code">
			                        </c:forEach>
			                    </tbody>
			                </table>
			            </div>
			            <div style="float: right;">총 ${dsCart.TOTAL_COUNT}권, 총 금액 : ${dsCart.TOTAL_PRICE}&emsp;
			            	<button class="btn btn-success btn-lg" onclick="fn_allbuy('${dsCart.TOTAL_COUNT}', '${dsCart.TOTAL_PRICE}', '${dsCart.EMAIL}', '${dsCart.NICK_NAME}',
			            	'${dsCart.PHONE_NUM}', '${dsCart.ADDRESS}', '${dsCart.POST_NUM}')">결제</button>
			            </div>
			            <!-- /.table-responsive -->
			        </div>
			        <!-- /.panel-body -->
			    </div>
			    <!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
      <button class="btn btn-success btn-lg" style="float: right;" onclick="fn_back()">뒤로가기</button>
	</div>
<jsp:include page="/common/foot.jsp"></jsp:include>
</body>
</html>