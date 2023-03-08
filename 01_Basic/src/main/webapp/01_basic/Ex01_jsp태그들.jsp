<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	하하하<br>
	document.write('abc'); <!-- 이건 html코드로 인식함 -->
	
	<!-- 아래처럼 해줘야,, abc만.. -->
	<script type="text/javascript">
		document.write('abc');
	</script>
	
	<br>
	
	String name="홍길동"; <br>
	<!-- 저희 이름은 홍길동입니다 로 출력하고 싶으면? 자바 코드임을 알려줘야 한다. -->
	<% %> <!-- 왼쪽은 자바 코드로 인식하라는 의미다. -->
	<% 
		String name = "홍길동";
	%>
	저희 이름은 <%= name %> 입니다. <!-- 출력할 때는 왼쪽처럼 -->
	
</body>
</html>