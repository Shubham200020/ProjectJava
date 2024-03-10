<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="login.Conndav"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bootstrap.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" href="photo/Sports.png">
<title>Player Form</title>
</head>
<body>
<div class="conNav">
	
<nav class="navbar navbar-expand-lg navbar-light bg-light cssNav">
  <a class="navbar-brand" href="#home">Cricket</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.html#home">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="index.html#star">STAR</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="index.html#about">About</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          MORE
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="login.jsp">Login</a>
          <a class="dropdown-item" href="control.jsp">Action</a>
          <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="insert.jsp">Form</a>
         <a class="dropdown-item" href="Action">Log Out</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Shubham</a>
      </li>
    </ul>
    
    
  </div>
</nav>
</div>

<!-- Nav Bar -->


 <div class=" jumbotron text-center">
	<h1 align="center">Login Form</h1>
	</div>
	<hr>
        <%
        	Connection conn;
        	conn=Conndav.conn();
        	ResultSet rs;
        	Statement st;
        	st=conn.createStatement();
        	int i;
        	String phone,password,email;
        	phone=(String)request.getAttribute("phone");
        	email=(String)request.getAttribute("email");
        	password=(String) request.getAttribute("password");
        %>
       <div class="container">
 		<form action="players" method="post">
 		<div class="form-group">
    	<label for="name">Name</label>
    	<input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name" name="name" required >
    	<small id="emailHelp" class="form-text text-muted">Name</small>
  		</div>
  		<div class="form-group">
    	<label for="exampleInputEmail1">Email address</label>
   	 	<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email" required >
    	<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    	<%
    		if(email!=null){
    	%><br>
    	<small id="emailHelp" class="form-text text-muted " ><p class="text-danger"><b><%=email %>*</b></p></small>
  		</div>
  		<%} %>
  <div class="form-group">
    <label for="exampleInputPassword1">Phone Number</label>
    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Phone Number" name="phone" required >
  </div>
  	<%
    	if(phone!=null){
    	%>
    	<small id="emailHelp" class="form-text text-muted " ><p class="text-danger"><b><%=phone %>*</b></p></small>
  		</div>
  		<%} %>
 
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password" required >
  </div>
  <div class="form-group">

    <labsel for="exampleInputPassword1"><b>Conform Password</b></label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Phone Number" name="repassword" required >
<%
    		if(password!=null){
    	%>
    	<small id="emailHelp" class="form-text text-muted " ><p class="text-danger"><b><%=password %>*</b></p></small>
  		</div>
  		<%} %>
  </div>
     
 <div class="form-group"><b>CITY</b></div>
  <select class="form-select" aria-label="Default select example" name="city" required >
    <option selected>Select City</option>
   <%
    	st=conn.createStatement();
    		i=0;
    	rs=st.executeQuery("select * from city  where city_id != 0 ORDER BY CITY_NAME ");
 		while(rs.next())
 		{
    %>
  <option value=<%=rs.getString(1) %>><%=rs.getString(2).toUpperCase() %></option>
 <%} 
 		rs=st.executeQuery("select * from city where city_id = 0");
 		while(rs.next())
 		{
 %>
 <option value=<%=rs.getString(1) %>><%=rs.getString(2).toUpperCase() %></option>
 <%} %>
</select>
 <div class="form-group">
	<label for="birthday">DATE Of Birth:</label>
	<input type="date" id="birthday" name="birthday" class="form-control" name="dob" required>
</div>
    <div class="form-group"><b>Role</b></div>
  	<%
	i=0;
  	String s1,s2,s3,s4,s5;
    		s1="select r.roles_id,r1.role_name,r2.role_name";
    		s2=" from role r1 inner join roles r";
    		s3=" on r1.role_id=r.role_id1";
    		s4=" inner join role r2";
    		s5=" on r2.role_id=r.role_id2";
    		String sql=s1+s2+s3+s4+s5;
    		String ck;
    		 
  	rs=st.executeQuery(sql);
    while(rs.next()){
    	 ck="ck"+Integer.toString(i);
    	  	i++;
    	%>
  	<div class="form-check">
    <input type="radio" class="form-check-input" id=<%=ck %> value=<%=rs.getString(1) %> name="roles" required >
    <label class="form-check-label" for=<%=ck %>><%=rs.getString(2).toUpperCase()+" , "+rs.getString(3).toUpperCase() %></label>
  </div>
  <%
  }
  %>
  <div class="form-group"><b>Side</b></div>
  <%
  i=0;
  	rs=st.executeQuery("select * from sides");
    while(rs.next()){
    	 ck="sd"+Integer.toString(i);
    	 i++;
  %>
  <div class="form-check">
  <input type="radio" class="form-check-input" id=<%=ck %> value=<%=rs.getString(1) %> name="side" required >
    <label class="form-check-label" for=<%=ck %>><%=rs.getString(2).toUpperCase()+"  " %></label>
  
  </div>
  <%
  }
  %>

   <button type="submit" class="btn btn-primary">Submit</button>
 		</form>
 </div>
 
 <!-- Form -->
</body>
</html>