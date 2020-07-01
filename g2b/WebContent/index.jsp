<%@page import="model.g2bDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

	<ul class="attribute">
		<li><%=bidNtceNo%></li>
		<li><%=bidNtceNm%></li>
		<li><%=ntceInsttNm%></li>
		<li><%=dminsttNm%></li>
		<li><%=bidMethdNm%></li>
		<li><%=cntrctCnclsMthdNm%></li>
		<li><%=ntceInsttOfclNm%></li>
		<li><%=ntceInsttOfclTelNo%></li>
		<li><%=ntceInsttOfclEmailAdrs%></li>
		<li><%=cmmnSpldmdAgrmntRcptdocMethd%></li>
		<li><%=bidBeginDt%></li>
		<li><%=bidClseDt%></li>
		<li><%=ntceSpecDocUrl1%></li>
		<li><%=ntceSpecDocUrl2%></li>
		<li><%=ntceSpecFileNm1%></li>
		<li><%=ntceSpecFileNm2%></li>
		<li><%=bdgtAmt%></li>
		<li><%=mainCnsttyNm%></li>
	</ul>
	<%
		}
		}
	%>

</body>

</html>