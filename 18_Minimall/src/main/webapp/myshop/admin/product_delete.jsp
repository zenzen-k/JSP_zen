<%@page import="java.io.File"%>
<%@page import="my.shop.ProductBean"%>
<%@page import="my.shop.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- product_delete.jsp -->

<%
	String pnum = request.getParameter("pnum");
	
	ProductDao pdao = ProductDao.getInstance();
	
	// 이미지 삭제
	String configFolder = config.getServletContext().getRealPath("/");
	String delPath = configFolder+"myshop/images/";
	// System.out.println(configFolder);
	
	//ProductBean pb = pdao.getProductByNum(pnum);
	//pb.getPimage();
	String pimage = request.getParameter("pimage");
	System.out.println("pimage : " + pimage);
	
	File delFile = null;
	File dir = new File(delPath); // delPath는 String  이었지만 파일객체를 만듬으로써 폴더가 됨.
	// delPath는 dir이 관리하는 폴더가 됨
	
	if(pimage != null){
		delFile = new File(dir,pimage); // 파일 객체를 만들면서 dir 폴더 밑에 있는 pimage 라는 파일이 됨
		System.out.println("delFile : " + delFile);
		
		// delFile.exists() -> 해당 폴더에 이미지파일이 존재하는지? boolean 리턴함. 존재하면 참이 된다
		if(delFile.exists()){
			if(delFile.delete()){ // delFile.delete() -> 삭제해라. boolean 리턴. 삭제성공시 true
				%>
				<script type="text/javascript">
					alert("이미지 파일 삭제 성공");
				</script>
				<%
			}
		}
	}
	
	int cnt = pdao.productDelete(pnum);
	String msg = "삭제 실패";
	if(cnt == 1){
		msg = "삭제 성공";
	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="product_list.jsp";
</script>