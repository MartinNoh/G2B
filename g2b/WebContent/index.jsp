<%@page import="model.g2bDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="index.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>나라장터</title>
</head>

<body>
	<br />
	<br />
	<div align="center">
		<form action="g2b">
			<table>
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
			<br /> <input type="submit" value="조회">
		</form>
	</div>

	<br />
	<br />
	<br />
	<br />
	<%
		String alSize = (String) request.getAttribute("alSize");
	%>
	<h2 class="alSize" align="center">총 조회수 : ${alSize}</h2>
	<br />

	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="cols">공고 번호</th>
				<th scope="cols">공고명</th>
				<th scope="cols">공고 기관</th>
				<th scope="cols">입찰 개시일자</th>
				<th scope="cols">입찰 마감일자</th>
				<th scope="cols">공고 예산</th>
				<th scope="cols">주공종명</th>
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
</body>

</html>