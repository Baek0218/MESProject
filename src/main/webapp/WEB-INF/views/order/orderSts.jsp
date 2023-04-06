<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 -->
<%@ include file="../inc/header.jsp"%><!-- 지우면안됨 -->
<style type="text/css">

 table {
      width: 1125px;  
   } 

th,td{
border-bottom: 1px solid black;
padding: 10px;
}
#th {
	font-weight: bold;
}

#con {
	text-align: center;
}

#con:hover{
	background-color : #e1e1e1;
	cursor:pointer;
}



h1{
	font-weight: bold;
}

.search_bar tr, td{
 border:0px;
}

table#search {
 border:1px solid;
}

table#detail {
 border:1px solid;
}
table#info {
 border:1px solid;
}


#btn{
      width: 1125px; 
	text-align: right;
 
}
#pagination{
      width: 1125px;  
text-align: center;
}

#num:hover{
	background-color : #e1e1e1;
}

.form-control{
	width:150px;
	background-image: url('${pageContext.request.contextPath}/resources/image/calendar.png');
	background-repeat: no-repeat;
	background-position: 98%;
	border: 1px solid;
}

#pcd {
	background-image: url('${pageContext.request.contextPath}/resources/image/magnifying-glass.png');
	background-repeat: no-repeat;
	background-position: 98%;
	border: 1px solid;
}

#pnm {
	background-color: #EAEAEA;
	border: 1px solid;
}



</style>
</head>
<body>

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">


function openItemList(b){
        window.open("${pageContext.request.contextPath }/order/itemList","popup", "width=500, height=500,left=100, top=100");
    }
function openUserList(b){
        window.open("${pageContext.request.contextPath }/order/userList","popup", "width=500, height=500,left=100, top=100");
    }
function openClntList(b){
        window.open("${pageContext.request.contextPath }/order/clntList","popup", "width=500, height=500,left=100, top=100");
    }
// function openContent(){
//         window.open("${pageContext.request.contextPath}/order/content?ordId=","${odto.ordId}","popup", "width=500, height=500,left=100, top=100");
//     }

// "'${pageContext.request.contextPath}/order/content?ordId=${odto.ordId}'"


$(function() {
	$("#sOdate").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
           ,showButtonPanel: true // 캘린더 하단에 버튼 패널 표시
           ,currentText: '오늘' // 오늘 날짜로 이동하는 버튼 패널
           ,closeText: '닫기' // 닫기 버튼 패널
           ,onClose: function ( selectedDate ) {
        	   // 창이 닫힐 때 선택된 날짜가 endDate의 minDate가 됨
        	   $("input[name='edate']").datepicker("option", "minDate", selectedDate );
           }
	});
});


$(function() {
	$("#sDdate").datepicker({
		 dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,maxDate: 0 // 0 : 오늘 날짜 이후 선택 X
           ,showButtonPanel: true // 캘린더 하단에 버튼 패널 표시
           ,currentText: '오늘' // 오늘 날짜로 이동하는 버튼 패널
           ,closeText: '닫기' // 닫기 버튼 패널
           ,onClose: function ( selectedDate ) {
        	   // 창이 닫힐 때 선택된 날짜가 endDate의 minDate가 됨
        	   $("input[name='edate']").datepicker("option", "minDate", selectedDate );
           }
	});
});


  
$(document).ready(function () {
	// class = "brown" 클릭했을 때 "클릭"
	$('.search').click(function () {
	
	// 자바스크립트 배열(json) <= DB에서 가져옴
	var arr = [
			   {"subject":"제목1","date":"2023-01-01"},
			   {"subject":"제목2","date":"2023-01-02"},
			   {"subject":"제목3","date":"2023-01-03"}
			  ];
	
	// 초기화
	$('table').html('');
	
	$.ajax({
		url:'${pageContext.request.contextPath}/board/listjson', 			// json형태로 들고옴 (페이지에 가서)
		dataType:'json',			// json형태로 받아옴 (json형태)
		success:function(arr){ 		// json형태로 만든 arr를 가져옴
		
					// 반복해서 출력 .each()
					// arr 배열을 반복하겠다 반복할때의 기능은 어떻게 할건지?
					$.each(arr,function(index, item){
					// 클릭을 하면 0,1,2번 배열을 반복함
//	 				alert(index);
//	 				alert(item.subject);
//	 				alert(item.date);

					// 변수이기에 +로 연결시켜줘야 함
					// 기존내용 없애고 그자리에 새로 넣기, 마지막 게 나옴 ,하나에 덮어서 써진다
//	 				$('table').html('<tr><td class="contxt"><a href="#">'+item.subject+'</a></td><td>'+item.date+'</td></tr>');
					
					// 추가하겠다는 함수 다시 사용 (html -> append로 바꾸기)
					$('table').append('<tr><td class="contxt"><a href="#">'+item.subject+'</a></td><td>'+item.date+'</td></tr>');
				});
			}
		});
	});
});



function YnCheck(obj) {
	var checked=obj.checked;
	if(checked){
		obj.value="Y";
	}else{
		obj.value="N";
	}
};

alert("성공" + YnCheck(obj));



</script>
<!-- 스크립트 끝. -->

<%-- <c:if test="${empty sessionScope.id }"> --%>
<%-- <c:redirect url="${pageContext.request.contextPath }/login/login"></c:redirect> --%>
<%-- </c:if> --%>


<div class="content_body">
	<!-- 내용시작 -->
	
	<h1>수주관리</h1>
<div class="search_bar">
	<form id="search">
		<div id="btn">
			<button type="submit" id="submit">조회</button>
		</div>
				<br>
			<table id="status">
				<tr>
				<td>수주업체</td>
				<td><input type="text" name="clntNm" id="clntNm" onclick="openClntList()">
					<input type="hidden" name="clntId" id="clntId" value="">
					<input type="hidden" name="clntCd" id="clntCd" value=""></td>
				
				<td>수주일자</td>
				<td><input type="text" id="sOdate" class="form-control" name="sOdate" placeholder="날짜를 선택해주세요" readonly>	</td>

				<td>품번</td>
				<td><input type="text" name="itemNum" id="itemNum"  onclick="openItemList()">
					<input type="hidden" name= "itemNm" id="itemNm"  onclick="openItemList()">	
					<input type="hidden" name="invntUnit" id="invntUnit" value="" >
					<input type="hidden" name="ordQty" id="ordQty" value="" ></td>
				</tr>
				
				<tr>
				<td>담당자</td>
				<td><input type="text" name="userNm" id="userNm" onclick="openUserList()">
					<input type="hidden" name="userId" id="userId"value="">
					<input type="hidden" name="userNum" id="userNum" value="">
					<input type="hidden" name="itemId" id="itemId"  onclick="openItemList()"></td>
				
				<td>납품예정일</td>
				<td><input type="text" id="sDdate" class="form-control" name="sDdate" placeholder="날짜를 선택해주세요" readonly></td>
				<td>출하완료여부</td>
				<td><select name="cmpltYn" id="cmpltYn" > <!-- 조회함, N Y값을 들고와야함 -->
					<option value="">완료여부</option>
					<option value="Y">Y</option>
					<option value="N">N</option>
				</select>
				</tr>
				
			</table>
		</form>
	</div>
<br>
<br>
	<h1>목록</h1>
	<form>

	<table border="1" id="main">
		<div id="btn">
<!-- 			<button type="submit" id="cancle" name="cancle">수주취소</button> -->
<!-- 			<button type="submit" id="submit">수주변경</button> -->
			<button type="submit" id="submit" onclick="location.href='${pageContext.request.contextPath}/order/orderInsert">수주마감</button>
		</div>
		<tr id="th">
			<th></th>
			<th>수주번호</th>
			<th>수주업체</th>
			<th>수주일자</th>
			<th>담당자</th>
			<th>품번</th>
			<th>품명</th>
			<th>단위</th>
			<th>납품예정일</th>
			<th>수주량</th>
			<th>완료여부</th>
		</tr>
		
			<c:forEach var="odto" items="${orderStsList}">
			<tr>			
				<td><input name="checkYn" id="checkYn" onchange="YnCheck(this);" type="checkbox"></td>
				<td onclick="location.href='${pageContext.request.contextPath}/order/content?ordId=${odto.ordId}'">${odto.ordNum}</td>
				<td onclick="location.href='${pageContext.request.contextPath}/order/content?ordId=${odto.ordId}'">${odto.clntNm}</td>
				<td onclick="location.href='${pageContext.request.contextPath}/order/content?ordId=${odto.ordId}'">${odto.sOdate}</td>
				<td onclick="location.href='${pageContext.request.contextPath}/order/content?ordId=${odto.ordId}'">${odto.userNm}</td>
				<td onclick="location.href='${pageContext.request.contextPath}/order/content?ordId=${odto.ordId}'">${odto.itemNum}</td>
				<td onclick="location.href='${pageContext.request.contextPath}/order/content?ordId=${odto.ordId}'">${odto.itemNm}</td>
				<td onclick="location.href='${pageContext.request.contextPath}/order/content?ordId=${odto.ordId}'">${odto.invntUnit}</td>
				<td onclick="location.href='${pageContext.request.contextPath}/order/content?ordId=${odto.ordId}'">${odto.sDdate}</td>
				<td onclick="location.href='${pageContext.request.contextPath}/order/content?ordId=${odto.ordId}'">${odto.ordQty}</td>
				<td>${odto.cmpltYn}</td>
				</tr>
			</c:forEach>
  </table>
  	</form>
    <br>
    <div id="pagination">
<!--     1페이지 이전 -->
	<c:if test="${pageDTO.currentPage > 1}">
	<a href="${pageContext.request.contextPath }/order/orderSts?ordNum=${search.ordNum}&clntNm=${search.clntNm}&sOdate=${search.sOdate}&userNm=${search.userNm }
	&itemNum=${search.itemNum }&itemNm=${search.itemNm }&invntUnit=${search.invntUnit }&sDdate=${search.sDdate}&ordQty=${search.ordQty }&cmpltYn=${search.cmpltYn }
	&pageNum=${pageDTO.currentPage-1}"><</a>
	</c:if>

<!-- 10페이지 이전 -->
	 <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	<a href="${pageContext.request.contextPath }/order/orderSts?ordNum=${search.ordNum}&clntNm=${search.clntNm}&sOdate=${search.sOdate}&userNm=${search.userNm }
	&itemNum=${search.itemNum }&itemNm=${search.itemNm }&invntUnit=${search.invntUnit }&sDdate=${search.sDdate}&ordQty=${search.ordQty }&cmpltYn=${search.cmpltYn }
	&pageNum=${pageDTO.startPage-PageDTO.pageBlock}"><<</a>
	</c:if>
	
	<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath }/order/orderSts?ordNum=${search.ordNum}&clntNm=${search.clntNm}&sOdate=${search.sOdate}&userNm=${search.userNm }
	&itemNum=${search.itemNum }&itemNm=${search.itemNm }&invntUnit=${search.invntUnit }&sDdate=${search.sDdate}&ordQty=${search.ordQty }&cmpltYn=${search.cmpltYn }
	&pageNum=${i}">${i}</a> 
	</c:forEach>

<!-- 1페이지 다음	 -->
	<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/order/orderSts?ordNum=${search.ordNum}&clntNm=${search.clntNm}&sOdate=${search.sOdate}&userNm=${search.userNm }
	&itemNum=${search.itemNum }&itemNm=${search.itemNm }&invntUnit=${search.invntUnit }&sDdate=${search.sDdate}&ordQty=${search.ordQty }&cmpltYn=${search.cmpltYn }
	&pageNum=${pageDTO.currentPage+1}">></a>
	</c:if>

<!-- 10페이지 다음 -->
 	<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	<a href="${pageContext.request.contextPath }/order/orderSts?ordNum=${search.ordNum}&clntNm=${search.clntNm}&sOdate=${search.sOdate}&userNm=${search.userNm }
	&itemNum=${search.itemNum }&itemNm=${search.itemNm }&invntUnit=${search.invntUnit }&sDdate=${search.sDdate}&ordQty=${search.ordQty }&cmpltYn=${search.cmpltYn }
	&pageNum=${pageDTO.startPage + pageDTO.pageBlock}">>></a>
	</c:if>
	</div>
<br>

</div>
</body>
<!-- 푸터 -->
<%@ include file="../inc/footer.jsp"%><!-- 지우면안됨 -->
