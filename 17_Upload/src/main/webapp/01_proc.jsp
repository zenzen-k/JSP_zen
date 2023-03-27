<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
01_proc.jsp<br>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String filename1 = request.getParameter("filename1");
	String filename2 = request.getParameter("filename2");
%>

name : <%=name%> <br> <!-- null -->
age : <%=age%> <br> <!-- null -->
filename1 : <%=filename1%> <br> <!-- null -->
filename2 : <%=filename2%> <br> <!-- null -->


<%

	int maxSize = 1024 * 1024 * 5; // 5MB
	String saveFolder = "img";
	String encoding = "UTF-8";

	/* ServletConfig config = new ServletConfig(); */
	/* ServletContext sc = config.getServletContext();
	String s = sc.getRealPath("/"); */
	String configFolder = config.getServletContext().getRealPath("/img");
	System.out.println("configFolder : " + configFolder);
	// C:\JSP_zen\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\17_Upload\img

	String requestFolder = request.getContextPath() + "/" + saveFolder;
	// C:\JSP_zen\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\17_Upload\img
	System.out.println("requestFolder : " + requestFolder);
	
	
	MultipartRequest mr = null;
	
	// form에서 넘어오는 정보가 request 객체 안에 담김.
	// MultipartRequest(넘어오는정보, 경로, 최대사이즈, 한글처리)
	mr = new MultipartRequest(request, configFolder, maxSize, encoding, new DefaultFileRenamePolicy());
%>

이름 : <%=mr.getParameter("name") %>
나이 : <%=mr.getParameter("age") %>
파일 1 : <%=mr.getParameter("filename1") %>
파일 2 : <%=mr.getParameter("filename2") %>


<%
	// Enumeration -> 제너릭타입이다.
	// getFileNames 여러가지 파일을 담을 수 있는 메서드
	Enumeration<String> files = mr.getFileNames(); // 파일의 이름을 가져와서 files에 넣음
	// files 가 관리하는 것 : filename1, filename2 
	
	
	while(files.hasMoreElements()){ // 요소가 있다면
		String file = files.nextElement(); // files의 각 요소들을 file에 넣음
		System.out.println("file : " + file);
		
		// mr.getFilesystemName(filename1); 직접쓸거면 이렇게
		String fileName = mr.getFilesystemName(file);
		System.out.println("fileName : " + fileName);
		
		
		String org = mr.getOriginalFileName(file);
		System.out.println("org : " + org);
		System.out.println("---------");
		
		String path = requestFolder + "\\" + fileName;
%>
		<img src="<%=path%>" width="200" height="200"><br>		
<%	
	}
%>
