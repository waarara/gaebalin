<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.JSONObject"%>
<%
    //커넥션 선언
    Connection con = null;
	String URL = "jdbc:oracle:thin:@localhost:1521:orcl";

	String ID = "gaebalin";

	String PW = "gaebalin";

    try {
        //드라이버 호출, 커넥션 연결
        Class.forName("oracle.jdbc.driver.OracleDriver");    
        con = DriverManager.getConnection(URL, ID, PW);
 
        //ResultSet : 쿼리문에 대한 반환값
        ResultSet rs = null;
 
        //DB에서 뽑아온 데이터(JSON) 을 담을 객체. 후에 responseObj에 담기는 값
        List barlist = new LinkedList();
      
        String query = "SELECT * FROM TB_SELL";
        PreparedStatement pstm = con.prepareStatement(query);
 
        rs = pstm.executeQuery();
        
        //ajax에 반환할 JSON 생성
        JSONObject responseObj = new JSONObject();
        JSONObject barObj = null;
        
        //소수점 2번째 이하로 자름
        DecimalFormat f1 = new DecimalFormat("");
        //rs의 다음값이 존재할 경우
        while (rs.next()) {
            float SELL_COUNT = rs.getFloat("SELL_COUNT");
            float SELL_PRICE = rs.getFloat("SELL_PRICE");
            String SELL_DATE = rs.getString("SELL_DATE");
            barObj = new JSONObject();
            barObj.put("SELL_COUNT", (int)SELL_COUNT);
            barObj.put("SELL_PRICE", (int)SELL_PRICE);
            barObj.put("SELL_DATE", SELL_DATE);
            barlist.add(barObj);
        }
 
        responseObj.put("barlist", barlist);
        out.print(responseObj.toString());
 
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
 
    }
%>