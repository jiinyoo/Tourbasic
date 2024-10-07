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
	<td>이름</td>
	<td>제목</td>
	<td>조회수</td>
	<td>작성일</td>
</tr>


<c:forEach items="${tlist}" var="tdto">
<tr>
	<td>${tdto.name }</td>
	<td><a href="readnum?id=${tdto.id}">${tdto.title}</a></td>
	<td>${tdto.readnum }</td>
	<td>${tdto.writeday }</td>
</tr>		
</c:forEach>
<tr>
	<td colspan="4" align="right">
		<a href="write">글쓰기 ${page}</a>
	</td>
</tr>
<tr>
<td colspan="4">
			<c:if test="${pstart!=1}">
			<a href="list?page=${pstart-1}">◁◁</a>	
			</c:if>
			<c:if test="${pstart==1}">
					◁◁
			</c:if>

			<c:if test="${page!=1}">
			<a href="list?page=${page-1}">◁</a>	
			</c:if>
			<c:if test="${page==1}">
			◁	
			</c:if>

	<c:forEach begin="${pstart}" end="${pend}"  var="i">
			<c:if test="${page==i }" >
				<a href="list?page=${i}"><span style="color:red;">${i}</span></a>					
			</c:if>
			<c:if test="${page!=i }">
				<a href="list?page=${i}">${i}</a>
			</c:if>
	</c:forEach>
	<c:if test="${page!=chong}">
			<a href="list?page=${page+1}">▷</a>	
	</c:if>
	<c:if test="${page==chong}">
				▷
	</c:if>
	<c:if test="${page!=chong}">
			<a href="list?page=${pend+1}">▷▷</a>	
	</c:if>
	<c:if test="${page==chong}">
				▷▷
	</c:if>
<td>
</tr>



</table>
</body>
</html>