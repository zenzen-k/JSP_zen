<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- loginProc.jsp -> /myshop/display/mall.jsp -->

<%@ include file="mall_top.jsp" %>

<%
	String[] spec = {"HIT", "NEW", "BEST", "::NORMAL::"};
	ProductDao pdao = ProductDao.getInstance();
	
	DecimalFormat df = new DecimalFormat("###,###");
%>
	<h3 style="margin-top: 10px;">Welcome to My Mall</h3>
		
		<%
		for(int i=0; i<spec.length; i++){
		// include -> 즉, 코드자체를 붙여넣기 했으므로 동일한 변수이름을 사용할 숭 벗다, -> lists
			ArrayList<ProductBean> plists = pdao.getProductByPspec(spec[i]);
			%>
			<hr color="green" width="80%">
			<font color="red" size="3"><strong><%=spec[i]%></strong></font>
			<hr color="green" width="80%">
			<%
			if(plists.size()==0){
				out.println("<b>" + spec[i] + "상품 없습니다.</b><br><br>");
			}else{
			%>
				<table width="95%" align="center" cellpadding="0">
				<tr>
					<%
					int count = 0;
					for(ProductBean pb : plists){
						count ++;
						String imgPath = request.getContextPath() + "/myshop/images/" + pb.getPimage();
					%>
						<td align="center">
							<a href="mall_prodView.jsp?pnum=<%=pb.getPnum()%>"><img src="<%=imgPath%>" width="80" height="80"></a><br>
							<%=pb.getPname()%><br>
							<font color="red"><%=df.format(pb.getPrice())%></font>원<br>
							[<font color="blue"><%=df.format(pb.getPoint())%></font>]point
						</td>
					<%
						if(count%3 == 0){
							out.println("</tr><tr>");
						}
					}
					%>
				</tr>
				</table>
			<%
			}
		} //for
		%>	

<%@ include file="mall_bottom.jsp" %>