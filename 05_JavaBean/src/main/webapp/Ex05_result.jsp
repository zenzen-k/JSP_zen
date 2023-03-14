<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

Ex05_result.jsp<br>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="b" class="myPkg.Ex05_Bean"/>
<jsp:setProperty property="*" name="b"/>

이름 : <jsp:getProperty property="name" name="b"/><br>
비번 : <jsp:getProperty property="password" name="b"/><br><br>

[과목별 점수]<br>
<%
	String[] subject = {"국어","영어","수학","과학","음악"};
	int[] jumsu = b.getJumsu(); // b.getJumsu() : 첫번째 방의 주소. 
	int sum = 0;
	for(int i=0; i<subject.length; i++){
		out.print(subject[i] + " : " + jumsu[i] + "<br>");
		sum += jumsu[i];
	}
%>
합계 : <%=sum %><br><br>

[걸그룹 정보]<br>
<%
	String[] group = b.getGroup();
	for(int i=0; i<group.length; i++){
		out.print(group[i] + " ");
	}
	
	// 확장 for문
	for(String x : group){
		out.print(x + " ");
	}
%>