<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/javascript" src="https://cdn.channel.io/plugin/ch-plugin-web.js" charset="UTF-8"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes, width=device-width, height=device-height" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="${context}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${context}/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="${context}/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script>
(function() {
	  var w = window;
	  if (w.ChannelIO) {
		return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
	  }
	  var d = window.document;
	  var ch = function() {
		ch.c(arguments);
	  };
	  ch.q = [];
	  ch.c = function(args) {
		ch.q.push(args);
	  };
	  w.ChannelIO = ch;
	  function l() {
		if (w.ChannelIOInitialized) {
		  return;
		}
		w.ChannelIOInitialized = true;
		var s = document.createElement('script');
		s.type = 'text/javascript';
		s.async = true;
		s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
		s.charset = 'UTF-8';
		var x = document.getElementsByTagName('script')[0];
		x.parentNode.insertBefore(s, x);
	  }
	  if (document.readyState === 'complete') {
		l();
	  } else if (window.attachEvent) {
		window.attachEvent('onload', l);
	  } else {
		window.addEventListener('DOMContentLoaded', l, false);
		window.addEventListener('load', l, false);
	  }
	})();
	ChannelIO('boot', {
	  "pluginKey": "329d6277-4f33-4dc7-b328-5e247a48c705"
	});
</script>
</head>

<body>
<div id="footer">
	<div class="container">
		<div class="fbox1">
		<span class="icon icon-map-marker"></span>
			<span>1234 Fictional Road Suite #789
			<br />Nashville TN 00000</span>
		</div>
		<div class="fbox1">
            <a href='tel:010-4874-8266'><span class="icon icon-phone"></span></a>
			<span>
				Telephone: 010-1234-1234
			</span>
		</div>
		<div class="fbox1">
			<span class="icon icon-envelope"></span>
			<span>businessname@business.com</span>
        </div>
    </div>
</div>
<div id="copyright">
	<p style="font-size : 20px;">서울시 서대문구 거북골로 100 TEL. 010-1111-7777 / FAX. 02-2321-5819</p>
		<p>Copyright &copy;2020 Dev_Library. Allright Reserved.</p>
	<ul class="contact">
        <li><a href="https://stackoverflow.com/" class="icon icon-stack-overflow"><span>Twitter</span></a></li>
		<li><a href="https://github.com/" class="icon icon-github"><span>github</span></a></li>
		<li><a href="https://www.youtube.com/" class="icon icon-youtube"><span>youtube</span></a></li>
		<li><a href="https://www.google.com/" class="icon icon-tumblr"><span>Google+</span></a></li>
		<li><a href="https://www.google.co.kr/drive/" class="icon icon-drive"><span>Gooledrive</span></a></li>
    </ul>
</div>
</body>

</html>