<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">
#con:hover {
	background-color: #e1e1e1;
	cursor: pointer;
}

#pagination {
	text-align: center;
}
</style>
</head>
<body>

	<h2>����� ��ȸ</h2>
	<form>
		<table>
			<tr>
				<td>���</td>
				<td><input type="text" name="userNum"></td>
				<td>�̸�</td>
				<td><input type="text" name="userName"></td>
				<td><input type="submit" value="��ȸ"></td>
			</tr>
		</table>
	</form>
	<table>
		<tr>
			<td>ǰ��</td>
			<td>ǰ��</td>
		</tr>
		<c:forEach var="userList" items="${userList }">
			<tr id="con"
				onclick="selectUser('${userList.userNum }','${userList.userName }')">
				<td>${userList.userNum }</td>
				<td>${userList.userName }</td>
			</tr>

			<script type="text/javascript">
				function selectUser(a, b) { // �θ�â���� �� �ѱ��

					opener.document.getElementById("userNum").value = a
					opener.document.getElementById("userName").value = b
					window.close();

				}
			</script>



		</c:forEach>

	</table>
	<div id="pagination">

		<!-- 1������ ���� -->
		<c:if test="${pageDTO.currentPage > 1}">
			<a
				href="${pageContext.request.contextPath }/order/userList?userNum=${search.userNum}&userName=${search.userName}&pageNum=${pageDTO.currentPage-1}"><</a>
		</c:if>

		<!-- 10������ ���� -->
		<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
			<a
				href="${pageContext.request.contextPath }/order/userList?userNum=${search.userNum}&userName=${search.userName}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
		</c:if>

		<c:forEach var="i" begin="${pageDTO.startPage }"
			end="${pageDTO.endPage }" step="1">
			<a
				href="${pageContext.request.contextPath }/order/userList?userNum=${search.userNum}&userName=${search.userName}&pageNum=${i}">${i}</a>
		</c:forEach>

		<!-- 1������ ���� -->
		<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/order/userList?userNum=${search.userNum}&userName=${search.userName}&pageNum=${pageDTO.currentPage+1}">></a>
		</c:if>

		<!-- 10������ ���� -->
		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/order/userList?userNum=${search.userNum}&userName=${search.userName}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
		</c:if>

	</div>
</body>
</html>