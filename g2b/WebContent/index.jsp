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
	<h3>나라장터 조회</h3>
	<form action="g2b" method="post">
		시작 날짜<input type="date" name="startDate" /> <input type="time"
			name="startTime" /> 끝 날짜<input type="date" name="endDate" /> <input
			type="time" name="endTime" /> <input type="submit" name="조회" />
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
				<th scope="cols">수요 기관</th>
				<th scope="cols">입찰 방식</th>
				<th scope="cols">계약 방식</th>
				<th scope="cols">담당자</th>
				<th scope="cols">담당자 번호</th>
				<th scope="cols">담당자 메일</th>
				<th scope="cols">접수방식</th>
				<th scope="cols">입찰 개시일자</th>
				<th scope="cols">입찰 마감일자</th>
				<th scope="cols">첨부파일1</th>
				<th scope="cols">첨부파일2</th>
				<th scope="cols">첨부파일명1</th>
				<th scope="cols">첨부파일명2</th>
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
						String dminsttNm = dto.getDminsttNm();
						String bidMethdNm = dto.getBidMethdNm();
						String cntrctCnclsMthdNm = dto.getCntrctCnclsMthdNm();
						String ntceInsttOfclNm = dto.getNtceInsttOfclNm();
						String ntceInsttOfclTelNo = dto.getNtceInsttOfclTelNo();
						String ntceInsttOfclEmailAdrs = dto.getNtceInsttOfclEmailAdrs();
						String cmmnSpldmdAgrmntRcptdocMethd = dto.getCmmnSpldmdAgrmntRcptdocMethd();
						String bidBeginDt = dto.getBidBeginDt();
						String bidClseDt = dto.getBidClseDt();
						String ntceSpecDocUrl1 = dto.getNtceSpecDocUrl1();
						String ntceSpecDocUrl2 = dto.getNtceSpecDocUrl2();
						String ntceSpecFileNm1 = dto.getNtceSpecFileNm1();
						String ntceSpecFileNm2 = dto.getNtceSpecFileNm2();
						String bdgtAmt = dto.getBdgtAmt();
						String mainCnsttyNm = dto.getMainCnsttyNm();

						System.out.println(mainCnsttyNm);
			%>

			<tr>
				<td><%=bidNtceNo%></td>
				<td><%=bidNtceNm%></td>
				<td><%=ntceInsttNm%></td>
				<td><%=dminsttNm%></td>
				<td><%=bidMethdNm%></td>
				<td><%=cntrctCnclsMthdNm%></td>
				<td><%=ntceInsttOfclNm%></td>
				<td><%=ntceInsttOfclTelNo%></td>
				<td><%=ntceInsttOfclEmailAdrs%></td>
				<td><%=cmmnSpldmdAgrmntRcptdocMethd%></td>
				<td><%=bidBeginDt%></td>
				<td><%=bidClseDt%></td>
				<td><%=ntceSpecDocUrl1%></td>
				<td><%=ntceSpecDocUrl2%></td>
				<td><%=ntceSpecFileNm1%></td>
				<td><%=ntceSpecFileNm2%></td>
				<td><%=bdgtAmt%></td>
				<td><%=mainCnsttyNm%></td>
			</tr>
			</ul>
			<%
				}
				}
			%>
		</tbody>
	</table>
</body>

</html>