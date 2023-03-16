<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
insertForm(입력6가지) -> insertProc.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mdao" class="myPkg.MartDao"/>
<jsp:useBean id="mb" class="myPkg.MartBean"/>
<jsp:setProperty property="*" name="mb"/>
<%
	
	if(mb.getProduct()==null){
		mb.setProduct("선택 항목 없음");
		//System.out.println("1");
	}else{
		String[] product = request.getParameterValues("product");
		String pro = "";
		for(int i=0; i<product.length; i++){
			pro += product[i] + " ";
		}
		mb.setProduct(pro);
	}
	if(mb.getApprove()==null){
		mb.setApprove("결제X");
	}
	if(mb.getAgree() == null){
		mb.setAgree("동의안함");
	}else{
		mb.setAgree("동의함");
	}
	

	int cnt = mdao.insertMart(mb);
	String url = "insertForm.jsp";
	String msg = "삽입실패";
	if(cnt>0){
		msg = "삽입성공";
		url = "select.jsp";
		// alert 안할거면 response.sendRedirect("select.jsp");
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>