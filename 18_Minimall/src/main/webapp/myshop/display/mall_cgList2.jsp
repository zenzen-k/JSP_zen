<%@page import="my.shop.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="mall_top.jsp"%>
    다른방법!!
    
<h3 style="margin-top: 10px;">Welcome to My Mall</h3>
<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	String cname = request.getParameter("cname");
	
	DecimalFormat df = new DecimalFormat("###,###"); // 000,000 -> 무조건 3자리를 맞춘다. 001,234
	
	ProductDao pdao = ProductDao.getInstance();
	ArrayList<ProductBean> plists = pdao.getProductByCategory(code);
%>


<hr color="green" width="80%">
<font color="red" size="3"><strong><%=cname%></strong></font>
<hr color="green" width="80%">


<%
	if(plists.size()==0){
		out.print("<b>" + cname + " 상품 없습니다.</b>");
	}else{
%>
		<table width="95%" align="center">
		<tr align="center">
		<%
			int count = 0;
			for(ProductBean pb : plists){
				count ++;
				String imgPath = conPath + "/myshop/images/" + pb.getPimage();
		%>
				<td>
					<img src="<%=imgPath%>" width="130" height="130"><br>
					<%=pb.getPname()%>
					<font color="red"><%=df.format(pb.getPrice())%></font>원
					<font color="blue">[<%=df.format(pb.getPoint())%>]</font>point
				</td>
		<%
				if(count % 3 == 0){
					out.print("</tr><tr>");
				}
			}//for
		%>		
		</tr>
		</table>
<%		
	} //else 
%>



<%@ include file="mall_bottom.jsp" %>