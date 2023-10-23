<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>       
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관리 프로그램</title>
	<style>
		*{margin:0;padding: 0}
		a{color: inherit;text-decoration: none}
		.wrap  {width:1000px;margin: 0 auto;}
		header {width: 100%;height: 70px;background: #00F;color: #FFF;text-align: center;line-height: 70px;}
		nav    {width: 100%;height: 40px;background: #AAF;color: #FFF;line-height: 40px;}
		section{width: 100%;height: 370px;background: #FFF;}
		footer {width: 100%;height: 40px;background: #00F;color: #FFF;text-align: center;line-height: 40px;}
		nav a  {margin-left: 33px;}
		h2     {padding: 22px;text-align: center;}
		p      {padding-left: 11px;}
		form {
			width: 100%;
		}
		
		table{
			width: 70%;
			margin: 0 auto;
		}
		
		table tr{
			text-align: center;
		}
		table a{
			text-decoration: underline;
		}
	</style>
</head>
<body>

	<div class="wrap">
		<header><h1>학과 지원 프로그램</h1></header>
		<nav>
			<a href="new.jsp">학생등록</a>    
			<a href="student.jsp">학생조회/수정</a>    
			<a href="part.jsp">학과조회/수정</a>
			<a href="index.jsp">홈으로</a>
		</nav>
		<section>
			
			<h2>학과 조회</h2>
			
			<table border="1" style="margin-left: auto; margin-right: auto; text-align: center;">
				<tr>
					<th>학번</th>
					<th>학생이름</th>
					<th>과목번호</th>
					<th>과목이름</th>
					<th>수정</th>
				</tr>
				<%
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					PreparedStatement pstmt=con.prepareStatement("select p.partno, p.pname,count(p.partno), p.status from part p, students s WHERE p.partno = s.partno group by p.partno, p.pname ,p.status");
					ResultSet rs = pstmt.executeQuery();
				
					while(rs.next()){	%>	
						<tr>
							<td><%=rs.getString(1) %></td>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(3) %></td>
							<td><%=rs.getInt(4)==1?"지원가능":"지원불가능" %></td>
							<td><a href="./part-edit.jsp?partno=<%=rs.getString(1) %>">수정</a></td>
						</tr>
				<% } %>	
			</table>
		</section>
		<footer><h3>HRDKOREA Copyright©2023</h3></footer>
	</div>
</body>
</html>