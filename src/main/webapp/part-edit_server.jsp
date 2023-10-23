<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>       

<%
	String partno = request.getParameter("partno");
	String pname = request.getParameter("pname");
	String status = request.getParameter("status");
	

	String sql = "update part set pname='"+pname+"', status='"+status+"' WHERE partno="+partno;
	ResultSet rs = null;
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection	con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		PreparedStatement pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		out.println("<script>alert('완료');location.href='./';</script>");
	}catch(Exception e){	
		out.println("<script>alert('오류');history.back();</script>");
	}
%>