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
	<table>
		<tr>
			<td>
				제목 
			</td>
			<td>
				${tdto.title}
			</td>
		</tr>
		<tr>
			<td>
				작성자
			</td>
			<td>
				${tdto.name}
			</td>
		<tr>
			<td>
				내용
			</td>
			<td>
				${tdto.content}
			</td>
		</tr>
		<tr>
				<td>이미지</td>
				<c:if test="${!empty  tdto.fname}">
				<td><img src="static/file/${tdto.fname}"  width="40"></td>
				</c:if>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="button" value="목록"  onclick="location.href='/list'">
				<input type="button" value="수정"  onclick="location.href='/update?id=${tdto.id}'">
				<input type="button" value="삭제" onclick="location.href='/delete?id=${tdto.id}'">
			</td>
		</tr>
	</table>
</body>
</html>