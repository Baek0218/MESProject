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
				<td><input type="text" name="clntCd"></td>
				<td>�̸�</td>
				<td><input type="text" name="clntNm"></td>
				<td><input type="submit" value="��ȸ"></td>
			</tr>
		</table>
	<table>
		<tr>
			<td>���</td>
			<td>�̸�</td>
		</tr>
		<c:forEach var="clntList" items="${clntList }">
			<tr id="con"
				onclick="selectClnt('${clntList.clntCd }','${clntList.clntNm }','${clntList.clntId }')">
				<td>${clntList.clntCd }</td>
				<td>${clntList.clntNm }</td>
				<td>${clntList.clntId }</td>
			</tr>

			<script type="text/javascript">

        function selectClnt(a,b,c){ // �θ�â���� �� �ѱ��

          opener.document.getElementById("clntCd").value = a;
          opener.document.getElementById("clntNm").value = b;
          opener.document.getElementById("clntId").value = c;
          window.close();

        }

   </script>



		</c:forEach>

	</table>
	<div id="pagination">

		<!-- 1������ ���� -->
		<c:if test="${pageDTO.currentPage > 1}">
			<a
				href="${pageContext.request.contextPath }/order/clntList?clntCd=${search.clntCd}&clntNm=${search.clntNm}&pageNum=${pageDTO.currentPage-1}"><</a>
		</c:if>

		<!-- 10������ ���� -->
		<c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
			<a
				href="${pageContext.request.contextPath }/order/clntList?clntCd=${search.clntCd}&clntNm=${search.clntNm}&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
		</c:if>

		<c:forEach var="i" begin="${pageDTO.startPage }"
			end="${pageDTO.endPage }" step="1">
			<a
				href="${pageContext.request.contextPath }/order/clntList?clntCd=${search.clntCd}&clntNm=${search.clntNm}&pageNum=${i}">${i}</a>
		</c:forEach>

		<!-- 1������ ���� -->
		<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/order/clntList?clntCd=${search.clntCd}&clntNm=${search.clntNm}&pageNum=${pageDTO.currentPage+1}">></a>
		</c:if>

		<!-- 10������ ���� -->
		<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
			<a
				href="${pageContext.request.contextPath }/order/clntList?clntCd=${search.clntCd}&clntNm=${search.clntNm}&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
		</c:if>

	</div>
	</form>
</body>
</html>