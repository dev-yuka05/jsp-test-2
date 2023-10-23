<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>       

<%
	String sno = request.getParameter("sno");
	String sname = request.getParameter("sname");
	String partno = request.getParameter("partno");
	

	String sql = "update students set sname='"+sname+"', partno='"+partno+"' WHERE sno="+sno;
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