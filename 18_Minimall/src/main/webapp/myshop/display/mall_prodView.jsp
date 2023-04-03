<%@page import="java.text.DecimalFormat"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- mall.jsp(이미지클릭, pnum) -> mall_prodView.jsp -->
<!-- mall_chList.jsp(이미지클릭, pnum) -> mall_prodView.jsp -->

<%@ include file="mall_top.jsp" %>

<%
	/* request, response, out, session, config .. */
	
	// ServletContext application = new ServletContext();
	application.setAttribute("flag1", true); // 속성명, 값 flag1 = true;
%>


<script type="text/javascript">
	function goCart(pnum) {
		//alert(pnum);
		// alert(document.f.oqty.value); text가져오기 document 생략가능
		oqty = f.oqty.value; // 주문수량
		//alert(oqty);
		// conPath 는 자바에서 사용하던 변수라서 자바스크립트코드에서 그냥 사용할 수 없다.
		//location.href = conPath + "/myshop/display/mall_cartAdd.jsp";
		if(oqty < 1){
			alert("주문 수량은 1이상 입력하세요");
			location.href="mall.jsp";
			return;
		}
		
		location.href = "<%=conPath%>/myshop/display/mall_cartAdd.jsp?pnum=" + pnum + "&oqty=" + oqty;
	}//goCart
	
	// 즉시주문 눌렀을때
	function goOrder(pnum) {
		// 여기서 도큐먼트 액션 설정이 가능함
		document.f.action ="mall_order.jsp?pnum=" + pnum; // pnum, oqty 
		// 아래form에서 작성한 내용이 넘어감! 따라서 따로 주문수량을 작성해주지 않아도 된당
		// pnum은 따로 넘겨줘야함
		document.f.submit(); // 액션으로 가기위해서는 submit으로 가야함!
	}//goOrder
</script>


<%
	String pnum = request.getParameter("pnum");
	
	ProductDao pdao = ProductDao.getInstance();
	ProductBean pb = pdao.getProductByNum(pnum);
	DecimalFormat df = new DecimalFormat("###,###");
%>

<table class="outline" width="100%" style="margin-top: 20px; border-collapse: collapse;">
	<tr align="center" class="m1">
		<td colspan="2">
			<font color="green" size="3"><b>[<%=pb.getPname()%>] 상품 정보</b></font>
		</td>
	</tr>
	
	<tr class="m3">
		<td align="center" width="50%">
			<img src="<%=conPath%>/myshop/images/<%=pb.getPimage()%>" width="220" height="220">
		</td>
		<td>
			<form name="f" method="post">
			상품번호 : <%=pb.getPnum()%><br>
			상품이름 : <%=pb.getPname()%><br>
			상품가격 : <font color="red"><b><%=df.format(pb.getPrice())%></b></font>원<br>
			상품포인트 : <font color="red"><b>[<%=df.format(pb.getPoint())%>]</b></font> point<br>
			상품개수 : <input type="text" name="oqty" value="1" size="2"> 개<br><br>
			
			<table>
				<tr>
					<td>
						<a href="javascript:goCart(<%=pnum%>)">
							<img src="<%=conPath%>/myshop/images/cartbtn.gif" width="110" height="30">
						</a>
					</td>
					<td>
						<!-- 결제내역서 보기 넘어가야하는데 그전에 장바구니에 상품을 담아놓고 바로! -->
						<a href="javascript:goOrder(<%=pnum%>)">
							<img src="<%=conPath%>/myshop/images/orderbtn.gif" width="110" height="30">
						</a>
					</td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" height="200"  valign="top" style="padding: 20px">
			<b>상품 상세 설명</b>
			<pre><%=pb.getPcontents()%></pre>
		</td>
	</tr>
	
</table>


<%@ include file="mall_bottom.jsp" %>