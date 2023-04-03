<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall_top.jsp(code, cname) -> mall_cgList.jsp -->
<%@ include file="mall_top.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	String cname = request.getParameter("cname");
	
	DecimalFormat df = new DecimalFormat("###,###"); // 000,000 -> 무조건 3자리를 맞춘다. 001,234
	
	ProductDao pdao = ProductDao.getInstance();
	ArrayList<ProductBean> plists = pdao.getAllProduct();
%>

<h3 style="margin-top: 10px;">Welcome to My Mall</h3>
<hr color="green" width="80%">
<font color="red" size="3"><strong><%=cname%></strong></font>
<hr color="green" width="80%">

<table width="95%" align="center">
	<tr>
<%
	int count = 0;
	boolean flag = false;
	for(ProductBean pb : plists){
		if(pb.getPcategory_fk().contains(code)){
			count ++;
			flag = true;
		%>
			<td align="center">
				<a href="mall_prodView.jsp?pnum=<%=pb.getPnum()%>"><img src="<%=conPath%>/myshop/images/<%=pb.getPimage()%>" width="100" height="100"></a><br>
				<%=pb.getPname()%><br>
				<font color="red"><%=df.format(pb.getPrice())%></font>원<br>
				[<font color="blue"><%=df.format(pb.getPoint())%></font>]point
			</td>
		
		<%
		}
		if(count%3 == 0){
			out.print("</tr><tr>");
		}
	}
	if(!flag){
		out.print("<td align='center'><b>등록된 상품이 없습니다</b><br><br></td>");
	}
%>
	</tr>	
</table>

<%@ include file="mall_bottom.jsp" %>