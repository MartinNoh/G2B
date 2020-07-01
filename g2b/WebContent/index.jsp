<%@page import="model.g2bDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나라장터</title>
<link rel="stylesheet" href="css/table.css">
</head>

<body>
	<form action="g2b" class="request-form ftco-animate bg-primary">
		<h2>조회 기간 설정하기</h2>
		<div class="d-flex">
			<div class="form-group mr-2">
				<div>
					<label for="" class="label">From</label>
				</div>
				<div>
					<input type="date" name="startDate" /> <input type="time"
						name="startTime" />
				</div>

			</div>
		</div>
		<div class="d-flex">
			<div class="form-group mr-2">
				<div>
					<label for="" class="label">To</label>
				</div>
				<div>
					<input type="date" name="endDate" /> <input type="time"
						name="endTime" />
				</div>
			</div>
		</div>
		<br />
		<div class="form-group">
			<input type="submit" value="조회" class="btn btn-secondary py-3 px-4">
		</div>
	</form>

	<%
		String startDate = (String) request.getAttribute("startDate");
		String endDate = (String) request.getAttribute("endDate");
	%>
	<ul class="date">
		<li>${startDate}</li>
		<li>${endDate}</li>
	</ul>

	<table class="type11">
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
			</ul>
			<%
				}
				}
			%>
		</tbody>
	</table>
</body>

</html>