<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="login.Conndav"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dash Board</title>
<jsp:include page="bootstrap.jsp"></jsp:include>

</head>
<body>
<h1>Hello</h1>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
	<%
		String name;
		name=request.getParameter("data");
		Cookie[] cookies = request.getCookies();
		Connection conn;
		conn=Conndav.conn();
		Statement st;
		PreparedStatement ps;
		if(name.equals("Bowler"))
		{//Bowling
	%>
	<!-- Bowling -->
	<h1 align="center">Bowling</h1>
	
	
	
	<%
		}
		else if(name.equals("Batsman")){
			//Batsman
		%>
		<!-- Batsman -->
	<h1 align="center">Batsman</h1>
	<%
	}
		else if(name.equals("player")){
			//player
		%>
		<!-- player -->
		<h1 align="center">player</h1>
		<%} %>
	
	
</body>
</html>