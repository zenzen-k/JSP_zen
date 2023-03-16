<%@page import="myPkg.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
select.jsp(수정 클릭 num=번호) -> updateForm.jsp<br>
updateProc.jsp(실패 num=번호) -> updateForm.jsp<br>

<%
	int num = Integer.parseInt(request.getParameter("num")); // 넘어올떄의 이름을 쓰면됨! x=~ 으로 넘어왔다면 여기에 x를 작성
	System.out.println("updateForm.jsp num : " + num);
	
	EmplDao edao = new EmplDao();
	EmplBean eb =  edao.getEmplByNum(num);
	
	System.out.println("Name : " +  eb.getName());
	System.out.println("Deptno : " +  eb.getDeptno());
	System.out.println("Salary : " +  eb.getSalary());
%>

<form action="updateProc.jsp" method='post'>
	<!-- type="hidden"으로 하면 보이지 않는다. -->
	<!-- disabled="disabled" 는 보이면서 수정할 수 없게 하지만, proc로 값이 넘어가지 못한다. -->
	<input  type="hidden" name="num" value="<%=num%>"> <!-- 또는 eb.getNum() -->
	이름 : <input type="text" name="name" value="<%=eb.getName()%>"><br><br>
	부서번호 : 
	<select name="deptno">
		<%
			// 부서번호가 가져온 값과 같을 때 selected 속성을 부여한다.
			for(int i=1; i<=3; i++){
			%>
				<option value="<%=i%>" <% if(i==eb.getDeptno()){%>selected<%}%>><%=i%></option>
			<%
			}
		%>
	</select><br><br>
	급여 : <input type="text" name="salary" value="<%=eb.getSalary()%>"><br><br>
	
	<input type="submit" value="수정">
</form>