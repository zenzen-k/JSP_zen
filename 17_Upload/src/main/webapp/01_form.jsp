<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
01_form.jsp<br>

<form method="post" action="01_proc.jsp" enctype="multipart/form-data">
	이름 : <input type="text" name="name"><br>
	나이 : <input type="text" name="age"><br>
	파일1 : <input type="file" name="filename1"><br><!--  filename1 = a.jpg  -->
	파일2 : <input type="file" name="filename2"><br><!--  filename2 = b.jpg 글자가 넘어간,-->

	<input type="submit" value="업로드">
</form>

