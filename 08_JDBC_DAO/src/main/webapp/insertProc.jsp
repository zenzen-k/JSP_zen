<%@page import="myPkg.EmplBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>

<!-- jdbc 1, 2 단계완 -->
<jsp:useBean id="edao" class="myPkg.EmplDao"/>

<%
	request.setCharacterEncoding("utf-8");
	
	// 만약 밑에 jsp코드로 객체를 생성해서 값을 넣는다면 아래의 코드는 필요없어진다.
	/* String name = request.getParameter("name");
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	int salary = Integer.parseInt(request.getParameter("salary")); */
	
	/* EmplBean eb = new EmplBean();
	eb.setName(name);
	eb.setDeptno(deptno);
	eb.setSalary(salary); */
	
	/* EmplBean eb = new EmplBean(name, deptno, salary); */
%>
	<!-- eb 객체만드는 방법이 아래와 같은 방법도 있당 -->
	<jsp:useBean id="eb" class="myPkg.EmplBean"/>
	<jsp:setProperty property="*" name="eb"/>
	<!-- 모든set메서드를 호출해도 번호는 넘어오지 않으므로 num에 관한 setter 메서드는 호출되지 않는다. -->
	<%-- 
	<jsp:setProperty property="deptno" name="eb"/>
	<jsp:setProperty property="salary" name="eb"/>
	--%>
<%
	String msg;
	String url;
	
	int cnt = edao.insertEmpl(eb);
	if(cnt>0){
		msg = "삽입 성공";
		url = "select.jsp";
	}else{
		// 이름길이 길면 실패함
		msg = "삽입 실패";
		url = "insertForm.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	/* meta태그를 사용할 수도 있지만 자바스크립트로도 가능하다. history(이전페이지 기억함) location(해당링크이동) */
	location.href = '<%=url%>';
</script>
