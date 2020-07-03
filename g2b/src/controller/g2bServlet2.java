package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.g2bDTO;

@WebServlet("/g2b")
public class g2bServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");

		Calendar date = Calendar.getInstance();
		SimpleDateFormat today = new SimpleDateFormat("yyyyMMddhhmm");
		today.format(date.getTime());
		
		String startDate = request.getParameter("startDate");
		String startTime = request.getParameter("startTime");
		String endDate = today.format(date.getTime());
		String endTime = request.getParameter("endTime");
		
		System.out.println(startDate);
		System.out.println(startTime);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(endTime);
		
		startDate = onlyNumber(startDate + startTime);
		endDate = onlyNumber(endDate + endTime);

		getJSON getJSON = new getJSON();
		ArrayList<g2bDTO> al;
		try {
			al = getJSON.getValueList(startDate, endDate);
			request.setAttribute("alSize", Integer.toString(al.size()));
			request.setAttribute("al", al);
			
			request.setAttribute("start", startDate);
			request.setAttribute("end", endDate);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		;
		getServletConfig().getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

	private String onlyNumber(String str) {
		String match = "[^0-9\\s]";
		str = str.replaceAll(match, "");
		return str;
	}

}
