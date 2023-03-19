<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertProc.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="bdao" class="DTO.BookDao"/>
<jsp:useBean id="bb" class="DTO.BookBean"/>
<jsp:setProperty property="*" name="bb"/>
<%
// 출판사
String[] bookstore = request.getParameterValues("bookstore");
String bs = "";
for(int i=0; i<bookstore.length; i++){
	bs += bookstore[i] + " ";
}
bb.setBookstore(bs);


// 수정작업
int cnt = bdao.insertBook(bb);

// 결과
String msg = "삽입실패";
String url = "insertForm.jsp";

if(cnt>0){
	msg = "삽입성공";
	url = "select.jsp";
}
%>

<script type="text/javascript">
alert("<%=msg%>");
location.href="<%=url%>";
</script>