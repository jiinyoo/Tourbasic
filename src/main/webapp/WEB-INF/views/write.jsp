<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post"  action="writeOk" enctype="multipart/form-data">
<table>
<caption>여행 후기 등록</caption>
<tr>
	<td>
		제목
	</td>
	<td>
		<input type="text" name="title" placeholder="제목">
	</td>	
</tr>

<tr>
	<td>
		이름
	</td>
	<td>
		<input type="text"  name="name"  placeholder="이름">
	</td>
</tr>
<tr>
	<td>
		비밀번호 
	</td>
	<td>
		<input type="password" name="pwd" placeholder="비밀번호">
	</td>
</tr>
<tr>
	<td>
		내용
	</td>
	<td>
		<textarea name="content"></textarea>
	</td>
</tr>
<tr>
	<td>파일 추가</td>
	<td><input type="file" name="file"  ></td>
</tr>
<tr>
	<td colspan="2"  align="center">
		<input type="submit"  value="후기등록">
	</td>
</tr>
</table>
</form>
</body>
</html>