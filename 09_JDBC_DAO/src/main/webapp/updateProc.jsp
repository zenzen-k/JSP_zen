<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateProc.jsp<br>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mdao" class="myPkg.MartDao"/>
<jsp:useBean id="mb" class="myPkg.MartBean"/>
<jsp:setProperty property="*" name="mb"/> <!-- form에서 넘어오는 값을 한묶음으로 setter메서드 -->
<%
	//상품
	if(mb.getProduct() == null){
		mb.setProduct("선택 항목 없음");
	}else{
		String prod = "";
		String[] product = request.getParameterValues("product");
		for(int i=0; i<product.length; i++){
			prod += product[i] + " ";
		}
		mb.setProduct(prod);
	}
	
	//동의여부
	if(mb.getAgree() == null){
		mb.setAgree("동의안함");
	}else{
		mb.setAgree("동의함");
	}
	
	//결제여부
	if(mb.getApprove() == null){
		mb.setApprove("결제X");
	}
	
	//수정메서드 호출
	int cnt = mdao.updateMart(mb);
	
	//결과
	String msg = "수정실패";
	String url = "updateForm.jsp?num=" + mb.getNum(); // get방식형태~
	if(cnt>0){
		msg = "수정성공";
		url = "select.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>