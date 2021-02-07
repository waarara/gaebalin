<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="productListPop.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>BOOK</title>

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

    </script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<br><br><br>
	<div class="container">
		<div class="page-header">
			<h1>인기 도서</h1>
		</div>
				<div class="col-md-13">
			    <div class="panel panel-default">
			        <!-- /.panel-heading -->
			        <div class="panel-body">
			            <div class="table-responsive">
			                <table class="table table table-bordered table-hover" id="dataTables-example">
			                    <thead>
			                        <tr>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">표지</th>
			                            <th style="text-align: center; vertical-align: middle; width: 80px;">제목</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">저자</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">출간일</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">분류</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">가격</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">재고</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${dsProductListPop}" var="dsProductListPop" varStatus="productIdx">
				                         <tr>
				                            <td style="text-align: center; vertical-align: middle;">
				                            <a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductListPop.PRODUCT_CODE}">
				                            <!-- 이미지 사이즈 width만 되고 heigt은 안먹음 --><img name="image" width="80px" height="140px" src="${context}/javaImg/${dsProductListPop.PRODUCT_IMAGE}" class="img-thumbnail"></a>
												<script type="text/javascript">
												 	var productCategoryCd = '${dsProductListPop.PRODUCT_CATEGORY_CD}';
	
												 	if(productCategoryCd == 'JA'){
														imageFolder = "javaImg";
													}else if(productCategoryCd == 'PY'){
														imageFolder = "pythonImg";
													}else if(productCategoryCd == 'ED'){
														imageFolder = "educationImg";
													}else if(productCategoryCd == 'CC'){
														imageFolder = "clanguageImg";
													}
													path = $("img[name='image']").eq('${productIdx.index}').attr("src");
	
													existFolder = path.split("/")[1];
													$("img[name='image']").eq('${productIdx.index}').attr("src", path.replace(existFolder, imageFolder));
												</script>
				                            </td>
				                            <td style="text-align: center; vertical-align: middle;">
				                            <a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductListPop.PRODUCT_CODE}">${dsProductListPop.PRODUCT_NAME}</a>
				                            </td>
				                            <td style="text-align: center; vertical-align: middle;">${dsProductListPop.PRODUCT_INFO}</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsProductListPop.PRODUCT_DATE}</td>
				                            <td style="text-align: center; vertical-align: middle;">[${dsProductListPop.PRODUCT_CATEGORY_CD_NM}]</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsProductListPop.PRODUCT_UNIT_PRICE}원</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsProductListPop.PRODUCT_COUNT}권</td>
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
	
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>