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
		form table{
			width: 70%;
			margin: 0 auto;
		}
		
		table tr{
			text-align: center;
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
			<% 
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				PreparedStatement pstmt=con.prepareStatement("select * from part");
				ResultSet rs = pstmt.executeQuery();	
			%>
			<h2>학생 등록</h2>
			<form method="GET" action="./new_server.jsp">	
				<table  border="1">
					<tr><th>학생 번호</th><td><input name="sno" required></td></tr>
					<tr><th>학생 이름</th><td><input name="sname" required></td></tr>
					<tr><th>학과 지원</th><td>
						<select name="partno">
							<%while(rs.next()){ %>
								<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
							<% } %>
						</select>
					</td></tr>
					
					<tr><td colspan=2><input type="submit" value="등록"> 
					<input type="button" value="조회" onclick="location.href='./'">
				</table>	
			</form>
		</section>
		<footer><h3>HRDKOREA Copyright©2023</h3></footer>
	</div>
</body>
</html>