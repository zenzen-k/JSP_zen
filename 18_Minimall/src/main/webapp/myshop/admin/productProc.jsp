<%@page import="my.shop.ProductDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- product_input.jsp -> productProc.jsp<br> -->

<%
	/* request.setCharacterEncoding("utf-8");
	
	String pname = request.getParameter("pname");
	out.print("pname : " + pname); // enctype 지정하면 null 로 넘어온당 */
	
	// 따라서 MultipartRequest를 사용해야하ㅓㅁ!!!!!!!
	
	// 파일접근 방식 2가지 - config, request
	String configFolder = config.getServletContext().getRealPath("/myshop/images/"); // 업로드 파일 모아두기 위한!
	// images 밑에 넣을거다는 의미로 끝에 / 가 붙는당
	String requestFolder = request.getContextPath() + "/myshop/images/";
	
	System.out.println("configFolder : " + configFolder);
	//C:\JSP_zen\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\18_Minimall\
	System.out.println("requestFolder : " + requestFolder);
	///18_Minimall
	
	
	int maxSize = 1024*1024*5; //파일 최대 용량 5MB
	String encoding = "UTF-8"; // 한글방식처리
	
	String msg, url;
	// NumberFormatException
	try{
		// 넘어오는데이터, 선택한 이미지를 올릴 폴더, 최대용량, 외국어처리방식, 동일파일처리방식(뒤에 숫자붙어서 추가되는 방식. - 생략되면 덮어쓰기)
		MultipartRequest mr = new MultipartRequest(request, configFolder, maxSize, encoding, new DefaultFileRenamePolicy());
		
		System.out.println(mr.getParameter("pname")); // 
		System.out.println(mr.getParameter("pimage")); // null
		System.out.println(mr.getFilesystemName("pimage")); // 검정양복2.jpg 추가된이름
		System.out.println(mr.getOriginalFileName("pimage")); // 검정양복.jpg 원래이름
		
		ProductDao pdao = ProductDao.getInstance();
		int cnt = pdao.insertProduct(mr);
		
		if(cnt == 1){
			msg = "등록성공";
			url = "product_list.jsp";
		}else{
			msg = "등록실패";
			url = "product_input.jsp";
		}
	
	}catch(Exception e){
		msg = "가격, 수량은 숫자로 입력하세요";
		url = "product_input.jsp";
	}
%>

<script type="text/javascript">
	alert('<%=msg%>');
	location.href = "<%=url%>";
</script>