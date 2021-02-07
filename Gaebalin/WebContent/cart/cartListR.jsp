<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 
	<meta name="description" content="cartListR.jsp">
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

    $(document).ready(function() {
        $('#dataTables-example').dataTable();
        
        $('.check-all').click(function() {
            $('input[name=buyList]').prop( 'checked', this.checked );
          });

    });

    function check_all(){
    	$('.check-all').click();
    };
    
    function fn_buy(paramCartCode, paramProductCode, paramSellPrice, paramSellCount, paramProductName,
    		paramEmail, paramName, paramTel, paramAddr, paramPost){
    	location.href = "${context}/work/sell/createSell.do?productCode=" + paramProductCode + "&sellPrice=" + paramSellPrice + "&sellCount=" + paramSellCount + "&cartCode=" + paramCartCode + "&fromCart=true";
    };
    
    /*
    function fn_buy(paramCartCode, paramProductCode, paramSellPrice, paramSellCount, paramProductName,
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
		        m_redirect_url : "${context}/work/sell/createSell.do?productCode=" + paramProductCode + "&sellPrice=" + paramSellPrice + "&sellCount=" + paramSellCount + "&cartCode=" + paramCartCode + "&fromCart=true"
		    }, function(rsp) {
		        if ( rsp.success ) {
		            var msg = '결제가 완료되었습니다.';
		            msg += '고유ID : ' + rsp.imp_uid;
		            msg += '상점 거래ID : ' + rsp.merchant_uid;
		            msg += '결제 금액 : ' + rsp.paid_amount;
		            msg += '카드 승인번호 : ' + rsp.apply_num;
			        alert(msg);
		    		location.href = "${context}/work/sell/createSell.do?productCode=" + paramProductCode + "&sellPrice=" + paramSellPrice + "&sellCount=" + paramSellCount + "&cartCode=" + paramCartCode + "&fromCart=true";
		        } else {
		            var msg = '결제에 실패하였습니다.';
		            msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
		        }
		    });	
    	}
    };
    */

    function fn_delete(paramCartCode, paramProductCode, paramSellCount){
    	if(confirm("정말로 삭제하시겠습니까?")){
	    	location.href = "${context}/work/cart/deleteCart.do?cartCode=" + paramCartCode + "&productCode=" + paramProductCode + "&productCount=" + paramSellCount;
    	}
    };
    
    function fn_buyCheck(){
    	var param = {};
    	var buyArray = new Array();
    	
    	$("input[name=buyList]:checked").each(function(i){
    		buyArray.push($(this).val());
    	});
    	
    	param["buyList"] = buyArray;
    	if(confirm("선택한 상품을 구매하시겠습니까?")){
	    	$.ajax({
				url:"${context}/work/cart/ajaxBuyList.do",
				contentType:"application/json",
				dataType:"json",
				data:param,
				traditional:true,
				success:function(result){
					if(result['cartYn'] == 'success'){
						console.log("no error");
						location.href = "${context}/work/cart/cartBuyList.do";
					}else{
						console.log("error!");
					}
				}
			});
    	}
    };
    
    function ajaxCartDelete(){
    	var param = {};
    	var deleteArray = new Array();
    	
    	$("input[name=buyList]:checked").each(function(i){
    		deleteArray.push($(this).val());
    	});
    	
    	param["deleteList"] = deleteArray;
    	if(confirm("선택한 상품을 삭제하시겠습니까?")){
	    	$.ajax({
				url:"${context}/work/cart/ajaxDeleteCart.do",
				contentType:"application/json",
				dataType:"json",
				data:param,
				traditional:true,
				success:function(result){
					if(result['deleteYn'] == 'success'){
						console.log("no error");
						location.reload(true);
					}else{
						console.log("error!");
					}
				}
			});
    	}
    };

    </script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>장바구니</strong>&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span></font></h1>
			<p>${sessionScope.id}님의 장바구니입니다.</p>
		</div>
		<div class="row">
			<button class="btn btn-success btn-sm" style="float: right; margin-right: 3%; margin-bottom : 3%;" onclick="fn_buyCheck()">구매</button>
			<button class="btn btn-success btn-sm" style="float: right; margin-right: 1%;" onclick="ajaxCartDelete()">삭제</button>
			<button class="btn btn-success btn-sm" style="float: right; margin-right: 1%;" onclick="check_all()">모두 선택</button>
			<div class="col-md-12">
			    <div class="panel panel-default">
			        <!-- /.panel-heading -->
			        <div class="panel-body">
			            <div class="table-responsive">
			                <table class="table table-striped table-bordered table-hover" id="">
			                    <thead>
			                        <tr>
			                        	<th style="text-align: center; vertical-align: middle; width: 10px;">No
			                        	<input type="checkbox" name="all" class="check-all"></th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;">상품이미지</th>
			                            <th style="text-align: center; vertical-align: middle; width: 50px;">상품이름</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;">상품단가</th>
			                            <th style="text-align: center; vertical-align: middle; width: 40px;">상품수량</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">결제금액</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${dsCartList}" var="dsCartList" varStatus="cartIdx">
			                         <tr>
			                         	<td style="text-align: center; vertical-align: middle;">${cartIdx.count}<input type="checkbox" name="buyList" value="${dsCartList.CART_CODE}"></td>
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
											</script>
			                            </td>
			                            <td style="text-align: center; vertical-align: middle;">${dsCartList.PRODUCT_NAME}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsCartList.PRODUCT_UNIT_PRICE}원</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsCartList.CART_COUNT}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsCartList.CART_PRICE}원</td>
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
    		  <button class="btn btn-success btn-lg" style="float: right;" onclick="fn_back()">뒤로가기</button>
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
<jsp:include page="/common/foot.jsp"></jsp:include>
</body>
</html>