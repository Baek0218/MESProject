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

	<h2>ǰ�� ��ȸ</h2>
	<form>
		<table>
			<tr>
				<td>ǰ��</td>
				<td><input type="text" name="item_num"></td>
				<td>ǰ��</td>
				<td><input type="text" name="item_nm"></td>
				<td><input type="submit" value="��ȸ"></td>
			</tr>
		</table>

	<table>
		<tr>
			<td>ǰ��</td>
			<td>ǰ��</td>
			<td>����</td>
		</tr>
		<c:forEach var="itemList" items="${itemList }">
			<tr id="con"
				onclick="selectItem('${itemList.itemId }','${itemList.itemNum }','${itemList.itemNm }','${itemList.invntUnit }')">
				<td>${itemList.itemId }</td>
				<td>${itemList.itemNum }</td>
				<td>${itemList.itemNm }</td>
				<td>${itemList.invntUnit }</td>
			</tr>

			<script type="text/javascript">
				function selectItem(a, b, c, d) { // �θ�â���� �� �ѱ��

					opener.document.getElementById("itemId").value = a;
					opener.document.getElementById("itemNum").value = a;
					opener.document.getElementById("itemNm").value = b;
					opener.document.getElementById("invntUnit").value = c;
					window.close();

				}
			</script>



		</c:forEach>

	</table>
	<div id="pagination">

		<!-- 1������ ���� -->
		<c:if test="${pageDTO.currentPage > 1}">
			<a
				href="${pageContext.request.contextPath }/order/itemList?itemNum=${search.itemNum}&itemNm=${search.itemNm}&invntUnit=${search.invntUnit}&pageNum=${pageDTO.currentPage-1}"><</a>
		</c:if>

		<!-- 10������ ���� -->
		<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
			<a
				href="${pageContext.request.contextPath }/order/itemList?itemNum=${search.itemNum}&itemNm=${search.iitemNm}&invntUnit=${search.invntUnit}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
		</c:if>

		<c:forEach var="i" begin="${pageDTO.startPage }"
			end="${pageDTO.endPage }" step="1">
			<a
				href="${pageContext.request.contextPath }/order/itemList?itemNum=${search.itemNum}&itemNm=${search.itemNm}&invntUnit=${search.invntUnit}&pageNum=${i}">${i}</a>
		</c:forEach>

		<!-- 1������ ���� -->
		<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/order/itemList?itemNum=${search.itemNum}&itemNm=${search.itemNm}&invntUnit=${search.invntUnit}&pageNum=${pageDTO.currentPage+1}">></a>
		</c:if>

		<!-- 10������ ���� -->
		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/order/itemList?itemNum=${search.itemNum}&itemNm=${search.itemNm}&invntUnit=${search.invntUnit}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
		</c:if>

	</div>
	
</body>
</html>