<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.park.db.*" %>

<%
	BoardDTO board = (BoardDTO)request.getAttribute("boarddata");
%>

<!DOCTYPE html>
<html>
<head>
	<title>지도정보</title>
</head>

<body>



<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">지도 상세 정보</td>
	</tr>
	
	
	<tr>
		<td>
			<div align="center">이름</div>
		</td>
		<td>
		<%=board.getParking_name()%>
		</td>
	</tr>
	
	<tr>
		<td>
			<div align="center">파킹타입</div>
		</td>
		<td>
		<%=board.getParking_type_nm()%>
		</td>
	</tr>
	
	<tr>
		<td>
			<div align="center">주소</div>
		</td>
		<td>
		<%=board.getAddr()%>
		</td>
	</tr>
	
	
	
	
	
	
	
	
	<tr align="center" valign="middle">
		<td colspan="5"><a href="./BoardSearch.bo">[목록]</a></td>
	</tr>
</table>	


			




</body>
</html>