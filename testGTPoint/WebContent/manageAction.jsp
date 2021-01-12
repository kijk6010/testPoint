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
String id = request.getParameter("id");
int eid = Integer.parseInt(id);

String applDate = sf.format(nowTime);
String DB_URL = "jdbc:mysql://localhost:3306/gtpoint";
String DB_USER = "root";
String DB_PASSWORD = "onlyroot";
Connection conn;
PreparedStatement pstmt;

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

String sql ="update managePt set checkEx=1,paymentDate=? where exchangeId="+eid;
pstmt = conn.prepareStatement(sql);
pstmt.setString(1,applDate);
pstmt.executeUpdate();

String sql2 ="insert into exchangePt(userID, applicationDate, aboutExchange, exchangePt, paymentDate) select userId,applicationDate,concat(convert(month(applicationDate),char),'월 신청 포인트 지급'),exchangePt,paymentDate from managePt where exchangeId ="+eid+";";

pstmt = conn.prepareStatement(sql2);
/* pstmt.setString(1, applDate);
pstmt.setInt(2,exPt);
pstmt.setString(3,"2020-02-01");
 */
pstmt.executeUpdate();
pstmt.close();
conn.close();
%>
<script>
alert("지급이 완료 되었습니다.");
location.href='pointManager.jsp';
</script>
</body>
</html>
