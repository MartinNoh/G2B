package view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.getInfo;
import model.g2bDTO;

@WebServlet("/g2b")
public class g2b extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");

		String startDate = request.getParameter("startDate");
		String startTime = request.getParameter("startTime");
		startDate = onlyNumber(startDate + startTime);

		String endDate = request.getParameter("endDate");
		String endTime = request.getParameter("endTime");
		endDate = onlyNumber(endDate + endTime);

		getInfo getInfo = new getInfo();
		ArrayList<g2bDTO> al;

		try {
			al = getInfo.getValueList(startDate, endDate);

			g2bDTO dto = al.get(10);

			request.setAttribute("bidNtceNo", dto.getBidNtceNo());
			request.setAttribute("bidNtceNm", dto.getBidNtceNm());
			request.setAttribute("ntceInsttNm", dto.getNtceInsttNm());
			request.setAttribute("dminsttNm", dto.getDminsttNm());
			request.setAttribute("bidMethdNm", dto.getBidMethdNm());
			request.setAttribute("cntrctCnclsMthdNm", dto.getCntrctCnclsMthdNm());
			request.setAttribute("ntceInsttOfclNm", dto.getNtceInsttOfclNm());
			request.setAttribute("ntceInsttOfclTelNo", dto.getNtceInsttOfclTelNo());
			request.setAttribute("ntceInsttOfclEmailAdrs", dto.getNtceInsttOfclEmailAdrs());
			request.setAttribute("cmmnSpldmdAgrmntRcptdocMethd", dto.getCmmnSpldmdAgrmntRcptdocMethd());
			request.setAttribute("bidBeginDt", dto.getBidBeginDt());
			request.setAttribute("bidClseDt", dto.getBidClseDt());
			request.setAttribute("ntceSpecDocUrl1", dto.getNtceSpecDocUrl1());
			request.setAttribute("ntceSpecDocUrl2", dto.getNtceSpecDocUrl2());
			request.setAttribute("ntceSpecFileNm1", dto.getNtceSpecFileNm1());
			request.setAttribute("ntceSpecFileNm2", dto.getNtceSpecFileNm2());
			request.setAttribute("bdgtAmt", dto.getBdgtAmt());
			request.setAttribute("mainCnsttyNm", dto.getMainCnsttyNm());

			request.setAttribute("startDate", startDate);
			request.setAttribute("endDate", endDate);
		} catch (Exception e) {
			e.printStackTrace();
		}

		ServletContext context = getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/index.jsp");

		dispatcher.forward(request, response);
	}

	private String onlyNumber(String str) {
		String match = "[^0-9\\s]";
		str = str.replaceAll(match, "");
		return str;
	}

}
