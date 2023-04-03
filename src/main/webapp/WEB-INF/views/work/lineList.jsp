<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lineList</title>
<style type="text/css">

#con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}

#pagination{
text-align: center;
}
</style>
</head>

<body>
	<h2>라인 조회</h2>
	<form>
		<table>
			<tr>
				<td>라인명</td>
				<td><input type="text" name="lineName"></td>
				<td><input type="submit" value="조회"></td>
			</tr>
		</table>
	</form>
	<table>
		<tr>
			<th>-</th>
			<th>라인명</th>
			<th>공정</th>
			<th>작업장</th>
			<th>사용여부</th>
		</tr>
		<c:forEach var="lineList" items="${getLineList}">
			<tr id="con"
				onclick="selectline('${lineList.lineId}','${lineList.lineName}','${lineList.proCode}','${lineList.linePlace}','${lineList.useChoice}')">
				<td>${lineList.lineId}</td>
				<td>${lineList.lineName}</td>
				<td>${lineList.proCode}</td>
				<td>${lineList.linePlace}</td>
				<td>${lineList.useChoice}</td>
			</tr>

			<script type="text/javascript">
				function selectline(a, b, c, d, e) { // 부모창으로 값 넘기기
					
					opener.document.getElementById("lineId").value = a
					opener.document.getElementById("lineName").value = b
					opener.document.getElementById("proCode").value = c
					opener.document.getElementById("linePlace").value = d
					opener.document.getElementById("useChoice").value = e
					window.close();
				
				}
			</script>

		</c:forEach>
	</table>
</body>
</html>