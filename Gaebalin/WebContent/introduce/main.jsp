<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="main.jsp">
<meta name="viewport"
	conetent="width-device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="${context}/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
<style>
	.sub_menu{
	    display: inline-block;
	}
	
	.sub_menu li{
	    display: inline;
	    font-size: 20px;
        margin-right: 16px;
	    cursor: pointer;
	}
	
	#introduce{
		margin:0 auto;
		padding : 5% 15px;
		max-width: 1200px;
	}
	
	@media all and (min-width:1024px){
		#introduce {
			width:90%;
		}
	}

	@media all and (min-width:1360px){
		#introduce {
			width:85%;
		}
	}
</style>
<title>개발인</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('.mobile_toggle_menu').click(function() {
			$('.mobile_toggle_menu_fade').fadeIn(700);
		});
		$('.toggle_close').click(function() {
			$('.mobile_toggle_menu_fade').fadeOut(700);
		});
		
		$('.HTML').click(function() {
			$('.mobile_toggle_menu_fade').fadeOut(700);
			var offset = $('#HTML').offset();
			$('html').animate({
				scrollTop : offset.top
			}, 400);
		});

		$('.java').click(function() {
			$('.mobile_toggle_menu_fade').fadeOut(700);
			var offset = $('#java').offset();
			$('html').animate({
				scrollTop : offset.top
			}, 400);
		});
		
		$('.python').click(function() {
			$('.mobile_toggle_menu_fade').fadeOut(700);
			var offset = $('#python').offset();
			$('html').animate({
				scrollTop : offset.top
			}, 400);
		});

		$('.bigdata').click(function() {
			$('.mobile_toggle_menu_fade').fadeOut(700);
			var offset = $('#bigdata').offset();
			$('html').animate({
				scrollTop : offset.top
			}, 400);
		});

	});
	
	function fn_wiki(keyword){
		location.href = "https://ko.wikipedia.org/wiki/" + keyword;
	};
</script>
</head>
<c:set var="homeUrl">${context}/work/product/goMain.do</c:set>
<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div id="introduce">
        <h2>IT 소개</h2>
        <p>&nbsp;정보기술(IT, Information Technology)은 전기 통신, 방송, 컴퓨팅(정보처리, 컴퓨터 네트워크, 컴퓨터 하드웨어, 컴퓨터 소프트웨어, 멀티미디어), 통신망 등 사회 기반을
		형성하는 유형 및 무형의 기술 분야이다.
		<br>&nbsp;메소포타미아의 수메르인들이 기원전 3,000년 즈음에 글쓰기를 발달시킨 이후로 인류는 정보를 저장, 
		이용하여 왔으나 현대의 "정보기술"이라는 용어는 하버드 비즈니스 리뷰에서 출판된 1958년 문건에 저자 Leavitt와 Whisle이 "새로운 기술은 하나의 확립된 이름을 아직 갖추지 않고 있다. 
		우리는 이를 정보기술(IT)로 부르겠습니다."라고 언급한 데에서 처음 등장하였다.
		넓은 의미의 정보통신 기술이란 데이터의 수집, 가공, 저장, 검색, 송신, 수신 등 정보 유통의 모든 과정에 사용되는 기술 수단을 총체적으로 표현하는 개념이다.
		<br>&nbsp;여기서는 수많은 정보 기술 중 개발자에게 필요한 HTML, JAVA, Python, 빅데이터에 대해서 설명 해볼려고 한다.
        </p>
        <ul class="sub_menu">
            <li class="HTML" style="color: blue;">HTML5</li>
            <li class="java" style="color: red;">JAVA</li>
            <li class="python" style="color: green;">Python</li>
            <li class="bigdata" style="color: darkred;">빅데이터</li>
        </ul>
        <br>
        <section id="HTML">
	        <h2>HTML란?</h2>
	        <hr>
	        <p style="font-size: 16px;">&nbsp;HTML (Hypertext Markup Language,하이퍼텍스트 마크업 언어)는 프로그래밍 언어는 아니고, 우리가 보는 웹페이지가 어떻게
	            구조화되어 있는지 브라우저로 하여금 알 수 있도록 하는 마크업 언어입니다. 이는 개발자로 하여금 복잡하게도 간단하게도 프로그래밍 할 수 있습니다. 
            <br>&nbsp;HTML은 elements로 구성되어 있으며, 이들은 적절한 방법으로 나타내고 실행하기 위해 각 컨텐츠의 여러 부분들을 감싸고 마크업 합니다. 
            tags 는 웹 상의 다른 페이지로 이동하게 하는 하이퍼링크 내용들을 생성하거나, 단어를 강조하는 등의 역할을 합니다.&emsp;
	         </p>
	        <input type="button" value="Learn More" onclick="javascript:void(window.open('https://ko.wikipedia.org/wiki/HTML', '_sub'))"
	        style="color: blue; font-weight: bold;" />&emsp;
	        <input type="button" value="체험하기" onclick="javascript:void(window.open('https://www.w3schools.com/html/tryit.asp?filename=tryhtml_default', '_sub'))"
	        style="font-weight: bold;">
	        <br><br><p><a href="javascript:void(window.open('https://developer.mozilla.org/ko/docs/Web/HTML/HTML5', '_sub'))">공식 사이트로 가기</a></p>
        </section>
        <br>
        <section id="java">
	        <h2>JAVA란?</h2>
	        <hr>
	        <p style="font-size: 16px;">&nbsp;자바의 개발자들은 유닉스 기반의 배경을 가지고 있었기 때문에 문법적인 특성은 파스칼이 아닌 C++의 조상인 C 언어와 비슷하다. 자바를 다른 컴파일언어와
	            구분 짓는 가장 큰 특징은 컴파일된 코드가 플랫폼 독립적이라는 점이다. <br>&nbsp;자바 컴파일러는 자바 언어로 작성된 프로그램을 바이트코드라는 특수한 바이너리 형태로 변환한다. 
	            바이트코드를 실행하기 위해서는 JVM(자바 가상 머신, Java Virtual Machine)이라는 특수한 가상 머신이 필요한데, 이 가상 머신은 자바 바이트코드를 어느 플랫폼에서나 동일한 형태로 실행시킨다. 
	            때문에 자바로 개발된 프로그램은 CPU나 운영 체제의 종류에 관계없이 JVM을 설치할 수 있는 시스템에서는 어디서나 실행할 수 있으며, 이 점이 웹 애플리케이션의 특성과 맞아떨어져 폭발적인 인기를 끌게 되었다.&emsp;
	        </p>
	        <input type="button" value="Learn More" 
	        onclick="javascript:void(window.open('https://ko.wikipedia.org/wiki/%EC%9E%90%EB%B0%94_(%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D_%EC%96%B8%EC%96%B4)', '_sub'))"
	        style="color: red; font-weight: bold;" />&emsp;
	        <input type="button" value="체험하기" 
	        onclick="javascript:void(window.open('https://www.w3schools.com/java/showjava.asp?filename=demo_helloworld', '_sub'))"
	        style="font-weight: bold;">
			<br><br><p><a href="javascript:void(window.open('https://www.oracle.com/kr/java/', '_sub'))">공식 사이트로 가기</a></p>
        </section>
        <br>
        <section id="python">
	        <h2>Python이란?</h2>
	        <hr>
	        <p style="font-size: 16px;">
	        &nbsp;파이썬은 초보자부터 전문가까지 사용자층을 보유하고 있다. 동적 타이핑(dynamic typing) 범용 프로그래밍 언어로, 펄 및 루비와 자주 비교된다. 다양한 플랫폼에서 쓸 수 있고,
		        라이브러리(모듈)가 풍부하여, 대학을 비롯한 여러 교육 기관, 연구 기관 및 산업계에서 이용이 증가하고 있다. 
	        <br>&nbsp;또한 파이썬은 순수한 프로그램 언어로서의 기능 외에도 다른 언어로 쓰인 모듈들을 연결하는 풀언어(glue language)로써 자주 이용된다. 
		        실제 파이썬은 많은 상용 응용 프로그램에서 스크립트 언어로 채용되고 있다. 도움말 문서도 정리가 잘 되어 있으며, 유니코드 문자열을 지원해서 다양한 언어의 문자 처리에도 능하다.&emsp;
			</p>
	        <input type="button" value="Learn More" onclick="javascript:void(window.open('https://ko.wikipedia.org/wiki/%ED%8C%8C%EC%9D%B4%EC%8D%AC', '_sub'))"
	        style="color: green; font-weight: bold;" />&emsp;
	        <input type="button" value="체험하기" onclick="javascript:void(window.open('https://www.w3schools.com/python/trypython.asp?filename=demo_helloworld', '_sub'))"
	        style="font-weight: bold;">
	        <br><br><p><a href="javascript:void(window.open('https://www.python.org/', '_sub'))">공식 사이트로 가기</a></p>
        </section>
        <br>
        <section id="bigdata">
	        <h2>빅데이터란?</h2>
	        <hr>
	        <p style="font-size: 16px;">
	        &nbsp;빅 데이터(영어: big data)란 기존 데이터베이스 관리도구의 능력을 넘어서는 대량(수십 테라바이트)의 정형 또는 심지어 데이터베이스 형태가 아닌 비정형의 데이터 집합조차 포함한 데이터로부터
		        가치를 추출하고 결과를 분석하는 기술이다. 즉, 기존의 데이터 베이스로는 처리하기 어려울 정도로 방대한 양의 데이터를 의미한다.
	        <br>&nbsp;수 테라바이트의 용량을 지닌 위키백과의 텍스트 및 이미지 자료는 빅 데이터의 고전적 사례에 속한다.
	        <br>&nbsp;전세계 저장 매체 용량의 증가 및 디지털화로 다양한 종류의 대규모 데이터에 대한 생성, 수집, 분석, 표현을 그 특징으로 하는 빅 데이터 기술의 발전은 
       		다변화된 현대 사회를 더욱 정확하게 예측하여 효율적으로 작동케 하고 개인화된 현대 사회 구성원마다 맞춤형 정보를 제공, 관리, 분석 가능케 하며 과거에는 불가능했던 기술을 실현시키기도 한다.&emsp;
	        </p>
	        <input type="button" value="Learn More" onclick="javascript:void(window.open('https://ko.wikipedia.org/wiki/%EB%B9%85_%EB%8D%B0%EC%9D%B4%ED%84%B0', '_sub'))"
	        style="color: darkred; font-weight: bold;" />&emsp;
	        <input type="button" value="체험하기" onclick="javascript:void(window.open('http://10.61.67.81:6060', '_blank','width=480, height=600'))"
	        style="font-weight: bold;">
        </section>
		<br>
    </div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>