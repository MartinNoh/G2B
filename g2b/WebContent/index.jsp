<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String startDate = (String) request.getAttribute("startDate");
	String endDate = (String) request.getAttribute("endDate");
	String bidNtceNo = (String) request.getAttribute("bidNtceNo");
	String bidNtceNm = (String) request.getAttribute("bidNtceNm");
	String ntceInsttNm = (String) request.getAttribute("ntceInsttNm");
	String dminsttNm = (String) request.getAttribute("dminsttNm");
	String bidMethdNm = (String) request.getAttribute("bidMethdNm");
	String cntrctCnclsMthdNm = (String) request.getAttribute("cntrctCnclsMthdNm");
	String ntceInsttOfclNm = (String) request.getAttribute("ntceInsttOfclNm");
	String ntceInsttOfclTelNo = (String) request.getAttribute("ntceInsttOfclTelNo");
	String ntceInsttOfclEmailAdrs = (String) request.getAttribute("ntceInsttOfclEmailAdrs");
	String cmmnSpldmdAgrmntRcptdocMethd = (String) request.getAttribute("cmmnSpldmdAgrmntRcptdocMethd");
	String bidBeginDt = (String) request.getAttribute("bidBeginDt");
	String bidClseDt = (String) request.getAttribute("bidClseDt");
	String ntceSpecDocUrl1 = (String) request.getAttribute("ntceSpecDocUrl1");
	String ntceSpecDocUrl2 = (String) request.getAttribute("ntceSpecDocUrl2");
	String ntceSpecFileNm1 = (String) request.getAttribute("ntceSpecFileNm1");
	String ntceSpecFileNm2 = (String) request.getAttribute("ntceSpecFileNm2");
	String bdgtAmt = (String) request.getAttribute("bdgtAmt");
	String mainCnsttyNm = (String) request.getAttribute("mainCnsttyNm");
%>
</head>

<body>
	<h3>나라장터 조회</h3>
	<form action="g2b" method="post">
		시작 날짜<input type="datetimepicker" name="startDate" /> <input
			type="time" name="startTime" /> 끝 날짜<input type="datetimepicker"
			name="endDate" /> <input type="time" name="endTime" /> <input
			type="submit" name="조회" />
	</form>



	<ul class="Date">
		<li>${startDate}</li>
		<li>${endDate}</li>
		<li>${bidNtceNo}</li>
		<li>${bidNtceNm}</li>
		<li>${ntceInsttNm}</li>
		<li>${dminsttNm}</li>
		<li>${bidMethdNm}</li>
		<li>${cntrctCnclsMthdNm}</li>
		<li>${ntceInsttOfclNm}</li>
		<li>${ntceInsttOfclTelNo}</li>
		<li>${ntceInsttOfclEmailAdrs}</li>
		<li>${cmmnSpldmdAgrmntRcptdocMethd}</li>
		<li>${bidBeginDt}</li>
		<li>${bidClseDt}</li>
		<li>${ntceSpecDocUrl1}</li>
		<li>${ntceSpecDocUrl2}</li>
		<li>${ntceSpecFileNm1}</li>
		<li>${ntceSpecFileNm2}</li>
		<li>${bdgtAmt}</li>
		<li>${mainCnsttyNm}</li>
	</ul>

	<script type="text/javascript">
		$('#datetimepicker').datetimepicker();
	</script>

</body>

<!-- this should go after your </body> -->
<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/ >
<script src="script/jquery.js"></script>
<script src="script/jquery.datetimepicker.full.min.js"></script>

</html>