<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.sql.*" %>
<%
 String id = request.getParameter("id");
 String point = request.getParameter("point");

 try{
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gtpoint", "root", "onlyroot");
 	 Statement stmt = conn.createStatement();
 	 
 	 int i=stmt.executeUpdate("update userpt set currentPt =currentPt-"+point+"where userId ="+id);
 	 out.println("데이터 업데이트 성공!");
 }
 catch(Exception e){
	 System.out.print(e);
	 e.printStackTrace();
 }
%>
