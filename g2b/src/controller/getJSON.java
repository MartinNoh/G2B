package controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import model.g2bDTO;

public class getJSON {

	// API, Get, JSON, body tag
	public static JsonObject getJsonBodyInfo(int i, String start, String end) throws Exception {

		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/1230000/BidPublicInfoService/getBidPblancListInfoCnstwk");
		urlBuilder.append("?" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("" + i, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "="
				+ "WETz3nldqMWyApLPTPNKw06qUG%2FYt7tNaO3T2ciGb4c%2B8%2FcKTx3z48RT%2BEgcCMICrR6rkBYCOxYRZnIbZ5wE6w%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("inqryDiv", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("inqryBgnDt", "UTF-8") + "=" + URLEncoder.encode(start, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("inqryEndDt", "UTF-8") + "=" + URLEncoder.encode(end, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("bidNtceNo", "UTF-8") + "=" + URLEncoder.encode("", "UTF-8"));
		URL url = new URL(urlBuilder.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");

		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		String str = sb.toString();

		JsonObject jObject = JsonParser.parseString(str).getAsJsonObject();

		JsonObject responseObject = jObject.getAsJsonObject("response");
		JsonObject bodyObject = responseObject.getAsJsonObject("body");

		return bodyObject;
	}

	public ArrayList<g2bDTO> getValueList(String start, String end) throws Exception {

		JsonObject bodyObject = getJsonBodyInfo(1, start, end);
		int totalCount = bodyObject.get("totalCount").getAsInt();

		ArrayList<g2bDTO> al = new ArrayList<>();
		JsonObject bodyObject2 = getJSON.getJsonBodyInfo(totalCount, start, end);
		JsonArray itemsArray = bodyObject2.getAsJsonArray("items");

		for (int j = 0; j < itemsArray.size(); j++) {
			JsonObject jObject = itemsArray.get(j).getAsJsonObject();
			g2bDTO dto = new g2bDTO();
			dto.setBidNtceNo(jObject.get("bidNtceNo").getAsString());
			dto.setBidNtceNm(jObject.get("bidNtceNm").getAsString());
			dto.setNtceInsttNm(jObject.get("ntceInsttNm").getAsString());
			dto.setBidBeginDt(jObject.get("bidBeginDt").getAsString());
			dto.setBidClseDt(jObject.get("bidClseDt").getAsString());
			dto.setBdgtAmt(jObject.get("bdgtAmt").getAsString());
			dto.setMainCnsttyNm(jObject.get("mainCnsttyNm").getAsString());
			dto.setBidNtceDtlUrl(jObject.get("bidNtceDtlUrl").getAsString());
			al.add(dto);
		}

		return al;
	}
}
