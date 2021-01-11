<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%
//POST 방식의 한글처리
request.setCharacterEncoding("UTF-8");

//파라미터 정보 가져오기
String exchangePt = request.getParameter("exchangePt");

int exPt = Integer.parseInt(exchangePt);

String DB_URL = "jdbc:mysql://localhost:3306/gtpoint";
String DB_USER = "root";
String DB_PASSWORD = "onlyroot";
Connection conn;
PreparedStatement pstmt;

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

String sql2 ="insert into exchangePT values (123,'2020-02-01','테스트 데이터',"+exPt+",'2021-02-01');";
pstmt = conn.prepareStatement(sql2);
pstmt.executeUpdate();

String sql ="update userpt set currentPt =currentPt-"+exPt+" where userId = 123";
pstmt = conn.prepareStatement(sql);
pstmt.executeUpdate();



pstmt.close();
conn.close();
%>
<script>
alert("교환 신청이 완료 되었습니다.");
location.href='pointMain.jsp';
</script>
</body>
</html>
