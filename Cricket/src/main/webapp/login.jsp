<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cricket Form</title>
<jsp:include page="bootstrap.jsp"></jsp:include>
<link rel="stylesheet" href="form.css">
</head>
<body>
<div class="conNav">
<nav class="navbar navbar-expand-lg navbar-light bg-light cssNav">
  <a class="navbar-brand text-light" href="#home">Cricket</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link text-light" href="index.html#home">Home </a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-light" href="index.html#star">STAR</a>
      </li>
       <li class="nav-item">
        <a class="nav-link text-light" href="index.html#about">About</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          MORE
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item text-light" href="#login">Login<span class="sr-only">(current)</span></a>
          <a class="dropdown-item text-light" href="#">Another action</a>
          <div class="dropdown-divider"></div>
        <a class="dropdown-item text-light" href="insert.jsp">Form</a>
         <a class="dropdown-item" href="Action">Log Out</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled text-light" href="#">Shubham</a>
      </li>
    </ul>
    
    
  </div>
</nav>
</div>
<!-- Form -->
<div class="container">
<%
String data=(String)request.getAttribute("data");
%>
	<form action="verify" method="post" align="center">
		<label class="text-light" for="user">Enter Email or Password</label>
		<input type="text" id="user" name="user" class="text-light" placeholder="Enter Email or phone number" required>
		<br>
		<label for="password">Enter Password</label>
		<input type="password" id="password" name="password" placeholder="Enter password" required>
		<br>
		<%
		if(data!=null){
		%>
		<p color="red" class="warning"><%=data %>*</p>
		<%} %>
		<input type="submit" id="sub"value="Login">
	</form>
	</div>
</body>
</html>