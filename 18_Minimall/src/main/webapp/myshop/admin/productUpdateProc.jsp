<%@page import="java.io.File"%>
<%@page import="my.shop.ProductDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.ObjectInputFilter.Config"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- product_update.jsp(입력항목, 기존이미지 -> productUpdateProc.jsp -->

<%
	String configFolder = config.getServletContext().getRealPath("/myshop/images/");

	MultipartRequest mr = new MultipartRequest(request, configFolder, (1024*1024*5), "UTF-8", new DefaultFileRenamePolicy());
	
	//test
	System.out.println("pcategory_fk : " + mr.getParameter("pcategory_fk")); // 앞에서 수정불가(disabled)로 작성해서 넘어가지 않는당
	System.out.println("pname : " + mr.getParameter("pname"));
	System.out.println("pnum : " + mr.getParameter("pnum"));
	System.out.println("pimageold : " + mr.getParameter("pimageold"));
	
	
	/*
	기존 이미지 O, 새로운 이미지 O -> 기존이미지 삭제 후 새이미지 올리기
	기존 이미지 X, 새로운 이미지 O -> 새이미지 올리기
	기존 이미지 O, 새로운 이미지 X -> 기존 이미지 그대로 사용함
	기존 이미지 X, 새로운 이미지 X -> X
	*/
	
	String pimageold = mr.getParameter("pimageold"); // 기존
	String pimage = mr.getFilesystemName("pimage"); // 새로운거
	String img = null;
	
	if(pimageold == null){
		if(pimage != null){ 
			//System.out.println("기존 이미지 X, 새로운 이미지 O");
			img = pimage;
		}
	}else if(pimageold != null){ 
		if(pimage == null){  //
			//System.out.println("기존 이미지 O, 새로운 이미지 X");
			img = pimageold;
		}
		else if(pimage != null){  //
			//System.out.println("기존 이미지 O, 새로운 이미지 O");
			img = pimage;
			
			File delFile = new File(configFolder, pimageold);
			delFile.delete();
		}
	}


	ProductDao pdao = ProductDao.getInstance();
	int cnt = pdao.updateProduct(mr, img); // 입력한 항목과 이미지(새이미지 or 기존)
	
	if(cnt==1){
	%>
		<script>
			alert('수정성공');
			location.href="product_list.jsp";
		</script>	
	<%
	}else{
	%>
		<script>
			alert('수정실패');
			history.go(-1);
		</script>
	<%
	}
%>