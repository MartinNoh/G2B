<%@page import="model.g2bDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link rel="stylesheet" href="CSS/index.css">

<title>나라장터</title>
</head>

<body role="document">



	<!-- Fixed navbar -->
	<nav class="navbar navbar-fixed-top navbar-expand-sm">
	<div class="content" align="center">
		<br />
		<h4>나라장터 조회하기</h4>
		<form action="g2bServelt">
			<table class="date">
				<tr>
					<td>From</td>
					<td>To</td>
				</tr>
				<tr>
					<td><input type="date" name="startDate" /> <input type="time"
						name="startTime" /></td>
					<td><input type="date" name="endDate" /> <input type="time"
						name="endTime" /></td>
				</tr>
			</table>
			<br />
			<p>
				<button class="btn btn-lg btn-success" type="submit">번호</button>
			</p>
		</form>
		<form action="g2bServelt">
			<p>
				<button class="btn btn-lg btn-success" type="submit">기간</button>
			</p>
		</form>
	</div>
	</nav>

	<%
		String start = (String) request.getAttribute("start");
		String end = (String) request.getAttribute("end");
		String alSize = (String) request.getAttribute("alSize");
	%>
	<br />
	<table class="table content table-hover">
		<thead>
			<%
				StringBuffer strBff = new StringBuffer();

				if (start == null || end == null) {
					start = "";
					end = "";
				} else {
					strBff.append(start.substring(0, 4));
					strBff.append(".");
					strBff.append(start.substring(4, 6));
					strBff.append(".");
					strBff.append(start.substring(6, 8));
					strBff.append(" ");
					strBff.append(start.substring(8, 10));
					strBff.append(":");
					strBff.append(start.substring(10, 12));
					strBff.append(" ~ ");
					strBff.append(end.substring(0, 4));
					strBff.append(".");
					strBff.append(end.substring(4, 6));
					strBff.append(".");
					strBff.append(end.substring(6, 8));
					strBff.append(" ");
					strBff.append(end.substring(8, 10));
					strBff.append(":");
					strBff.append(end.substring(10, 12));
				}
				if (alSize == null)
					alSize = "";
			%>
			<tr>
				<td>조회기간</td>
				<td colspan="6"><%=strBff.toString()%></td>
			</tr>
			<tr>
				<td>총 조회수</td>
				<td colspan="6"><%=alSize%></td>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>공고 번호</th>
				<th>공고명</th>
				<th>공고 기관</th>
				<th>입찰 개시일자</th>
				<th>입찰 마감일자</th>
				<th>공고 예산</th>
				<th>주공종명</th>
			</tr>
		</thead>
		<tbody>

			<%
				ArrayList<g2bDTO> al = (ArrayList<g2bDTO>) request.getAttribute("al");

				if (al != null) {
					for (g2bDTO dto : al) {
						String bidNtceNo = dto.getBidNtceNo();
						String bidNtceNm = dto.getBidNtceNm();
						String ntceInsttNm = dto.getNtceInsttNm();
						String bidBeginDt = dto.getBidBeginDt();
						String bidClseDt = dto.getBidClseDt();
						String bdgtAmt = dto.getBdgtAmt();
						String mainCnsttyNm = dto.getMainCnsttyNm();
						String bidNtceDtlUrl = dto.getBidNtceDtlUrl();
			%>

			<tr>
				<td><%=bidNtceNo%></td>
				<td><a class="g2bLink" href="<%=bidNtceDtlUrl%>"><%=bidNtceNm%></a></td>
				<td><%=ntceInsttNm%></td>
				<td><%=bidBeginDt%></td>
				<td><%=bidClseDt%></td>
				<td><%=bdgtAmt%></td>
				<td><%=mainCnsttyNm%></td>
			</tr>

			<%
				}
				}
			%>

		</tbody>
	</table>



	<!-- essential jquery -->
	<script src="//code.jquery.com/jquery.min.js"></script>

	<!-- essential BootStrap -->
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>

</html>