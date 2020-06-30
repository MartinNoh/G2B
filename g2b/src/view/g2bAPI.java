package view;

import java.util.ArrayList;

import controller.getInfo;
import model.g2bDTO;
public class g2bAPI {

	public static void main(String[] args) throws Exception {

		String startDate = "202006011400";
		String endDate = "202006011459";
		
		getInfo getInfo = new getInfo();
		ArrayList<g2bDTO> al = getInfo.getJsonValue(startDate, endDate);
		g2bDTO dto = al.get(10);
		
		System.out.println(dto.getBidNtceNo());
		System.out.println(dto.getBidNtceNm());
		System.out.println(dto.getNtceInsttNm());
		System.out.println(dto.getDminsttNm());
		System.out.println(dto.getBidMethdNm());
		System.out.println(dto.getCntrctCnclsMthdNm());
		System.out.println(dto.getNtceInsttOfclNm());
		System.out.println(dto.getNtceInsttOfclTelNo());
		System.out.println(dto.getNtceInsttOfclEmailAdrs());
		System.out.println(dto.getCmmnSpldmdAgrmntRcptdocMethd());
		System.out.println(dto.getBidBeginDt());
		System.out.println(dto.getBidClseDt());
		System.out.println(dto.getNtceSpecDocUrl1());
		System.out.println(dto.getNtceSpecDocUrl2());
		System.out.println(dto.getNtceSpecFileNm1());
		System.out.println(dto.getNtceSpecFileNm2());
		System.out.println(dto.getBdgtAmt());
		System.out.println(dto.getMainCnsttyNm());
	}
}