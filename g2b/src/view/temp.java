package view;

//gson library
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

//komoran library
import kr.co.shineware.nlp.komoran.constant.DEFAULT_MODEL;
import kr.co.shineware.nlp.komoran.core.Komoran;
import kr.co.shineware.nlp.komoran.model.KomoranResult;
import kr.co.shineware.nlp.komoran.model.Token;

//httpComponent-client library
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.entity.mime.MultipartEntityBuilder;
import org.apache.hc.client5.http.entity.mime.StringBody;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.ContentType;
import org.apache.hc.core5.http.HttpEntity;
import org.apache.hc.core5.http.ParseException;
import org.apache.hc.core5.http.io.entity.EntityUtils;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class temp {

    public static void main(String[] args) throws Exception {


        String input = "나는 자랑스러운 태극기 앞에 자유롭고 정의로운 대한민국의 무궁한 영광을 위하여 충성을 다할 것을 굳게 다짐합니다.";
        input = preprocess(input);										// 입력 문자열 전처리

        ArrayList<String> morphList = doKomoran(input);							// komoran 형태소 분석

        JsonElement element = XML_str_JSON(morphList);							// XML에서 String으로, String에서 JSON으로 변환

        input = element.toString();										// JSON을 출력하기 위한 String 변수 input
        mkTxtFile(input, "C:\\Users\\ehdru\\Desktop/20200626_komoran_국립국어원_우리말샘_http_노동경.txt");		// 텍스트 파일 출력
    }

    public static String preprocess(String input) {
        input = StringReplace(input);										// 특수문자 제거
        input = input.replaceAll(System.getProperty("line.separator"), "");						// 개행문자 제거
        input = input.trim();											// 좌우 빈칸 삭제
        return input;
    }

    public static String StringReplace(String str) {
        String match = "[^\uAC00-\uD7A3\\s]";								// 한글이 아닌 문자 모두 삭제
        str = str.replaceAll(match, "");
        return str;
    }

    public static String StringReplace2(String str) {
        String match = "[^\uAC00-\uD7A3.\\s]";								// 한글과 점이 아닌 문자 모두 삭제
        str = str.replaceAll(match, "");
        return str;
    }

    public static ArrayList<String> doKomoran(String input) {
        Komoran komoran = new Komoran(DEFAULT_MODEL.STABLE);						// Komoran 객체 생성

        KomoranResult analyzeResultList = komoran.analyze(input);						// Komoran input String 분석 객체 생성
        List<Token> tokenList = analyzeResultList.getTokenList();							// 분석 결과를 담을 Token List 생성

        ArrayList<String> morphList = new ArrayList<>();							// String ArrayList 생성
        for (Token token : tokenList) {
            if (!token.getMorph().equals("")) {
                morphList.add(token.getMorph());								// ArrayList로 Morph담기
            }
        }
        return morphList;
    }

    private static String getAPI(ArrayList<String> morphList, int j) throws IOException {

        String content = "";
        CloseableHttpClient httpclient = HttpClients.createDefault();							// httpClient 객체 생성

        HttpPost httppost = new HttpPost("https://stdict.korean.go.kr/api/search.do");				// 참조 url 경로

        StringBody key = new StringBody("14F296AB6ADF1D06A38A8F1B1BF75207", ContentType.TEXT_PLAIN);		// 서비스 키
        StringBody q = new StringBody(morphList.get(j), ContentType.TEXT_PLAIN.withCharset("UTF-8"));		// String Parameter

        HttpEntity reqEntity = MultipartEntityBuilder.create()							// Request Entity로 서비스키와 파라미터 값 담기
                .addPart("key", key)
                .addPart("q", q)
                .build();

        httppost.setEntity(reqEntity);										// 파라미터가 담긴 엔티티 메소드
        CloseableHttpResponse response = httpclient.execute(httppost);						// 요청 결과를 담는 객체 response

        try {
            System.out.println("Response Code : " + response.getCode());						// 응답 코드 출력(200 : 완료)
            HttpEntity resEntity = response.getEntity();								// 응답 값을 담은 httpEntity 객체 resEntity
            if (resEntity != null) {
                String charset = "UTF-8";
                content = EntityUtils.toString(response.getEntity(), charset);						// 응답을 String으로 담는 content
            }
            EntityUtils.consume(resEntity);
        } catch (ParseException parseException) {
            parseException.printStackTrace();
        } finally {
            response.close();
        }
        return content;											// 응답 값 반환 String content
    }

    public static JsonElement XML_str_JSON(ArrayList<String> morphList) throws ParserConfigurationException, IOException, SAXException {
        String result = "{\n\"channel\":\n\t[";								// JSON의 형태를 가진 String 생성
        for (int j = 0; j < morphList.size(); j++) {
            String content = getAPI(morphList, j);								// API 참조하고 ArrayList morphList로 담기

            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();				// XML을 파싱하기 위한 객체 준비
            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
            InputStream inptSrc = new ByteArrayInputStream(content.getBytes());
            Document doc = dBuilder.parse(inptSrc);

            NodeList nList = doc.getElementsByTagName("item");							// item 태그를 nodeList로 받아오기
            for (int temp = 0; temp < nList.getLength(); temp++) {
                Node nNode = nList.item(temp);									// 순서대로 item을 노드 처리
                if (nNode.getNodeType() == Node.ELEMENT_NODE) {

                    Element eElement = (Element) nNode;								// 작업할 노드의 형식을 Element로 변환
                    if (getTagValue("word", eElement) != null) {							// Element에서 word, pos, definition, type 가져오기
                        result = result + ",\n\t\t{" + "\n\t\t\t\"word\":\"" + (getTagValue("word", eElement).trim() + "\",\n\t\t\t\"pos\":\"" + getTagValue("pos", eElement).trim() + "\",\n\t\t\t\"definition\":\"" + StringReplace2(getTagValue("definition", eElement).trim()) + "\",\n\t\t\t\"type\":\"" + getTagValue("type", eElement).trim() + "\"\n\t\t}");
                    }    // if end
                }    // if end
            }    // for end

            StringBuilder builder = new StringBuilder(result);							// 불필요한 컴마 제거
            builder.setCharAt(15, ' ');
            result = builder.toString();
        }
        result = result + "\n\t]\n}";

        JsonParser parser = new JsonParser();									// JSON형태를 가진 String result를 JSON으로 조립하기
        JsonElement element = parser.parse(result);

        return element;											// JSON Element 반환
    }

    private static String getTagValue(String tag, Element eElement) {						// 태그의 값을 가져오는 메소드
        NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
        Node nValue = (Node) nlList.item(0);
        if (nValue == null)
            return null;
        return nValue.getNodeValue();
    }

    public static void mkTxtFile(String result, String fileP) throws IOException {					// 지정 경로로 텍스트 저장
        BufferedOutputStream bs = null;
        try {
            bs = new BufferedOutputStream(new FileOutputStream(fileP));
            bs.write(result.getBytes());
        } catch (Exception e) {
            e.getStackTrace();
            // TODO: handle exception
        } finally {
            bs.close();
        }
    }
}
