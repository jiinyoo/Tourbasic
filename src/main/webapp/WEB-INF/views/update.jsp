<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="uploadOk"  enctype="multipart/form-data">
<input type="hidden" value="${tdto.id}" name="id">
	<table>
		<tr>
			<td>
				제목 
			</td>
			<td>
				<input type="text"  value="${tdto.title}" name="title">
			</td>
		</tr>
		<tr>
			<td>
				작성자
			</td>
			<td>
				<input type="text" value="${tdto.name}" name="name">
			</td>
		<tr>
		<tr>
			<td>
				비밀번호
			</td>
			<td>
				<input type="password" value="${tdto.pwd}" name="pwd">
			</td>
		<tr>
			<td>
				내용
			</td>
			<td>
				<textarea name="content">${tdto.content}</textarea>
			</td>
		</tr>
		<tr>
				<td>이미지</td>
				<c:if test="${!empty  tdto.fname}">
				<td><img src="static/file/${tdto.fname}"  width="40"></td>
				</c:if>
		</tr>
	<tr>
		<td>파일 추가</td>
		<td><input type="file" name="file"  ></td>
	</tr>
		<tr align="center">
			<td colspan="2">
				<input type="submit"  value="수정하기">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>