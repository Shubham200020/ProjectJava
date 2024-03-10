<%@page import="view.bean.search"%>
<%@page import="java.lang.foreign.SymbolLookup"%>
<%@page import="login.verifyDetels"%>
<%@page import="login.Conndav"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<jsp:include page="bootstrap.jsp"></jsp:include>
<link rel="stylesheet" href="coatch.css">
</head>
<body>
<%
Connection conn;
conn=Conndav.conn();
String id=null;
id=(String)session.getAttribute("id");
if(id!=null ){
%>


<div class="conNav">
	
<nav class="navbar navbar-expand-lg navbar-light bg-light cssNav">
  <a class="navbar-brand" href="#home">Cricket</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.html#home">Home </a>
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
          <a class="dropdown-item" href="control.jsp">Action <span class="sr-only">(current)</span></a>
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
	<table class="table border border-light">
	<tr class="container" >
	<th width="100%">
		<div class="container">
			<h1>DashBoard</h1>
		</div>
		</th>
	</tr>
	<tr>
	
		<td rowspan="5" width="30%">
		<div class="container p-3 mb-2 bg-secondary text-white ">
			<p>Menu</p>
			<!-- Link1 Update Name-->
			<%
			if(!id.equals("0")){
			%>
			
			<form action="control.jsp" method="post">
			<input type="hidden" value="name" name="action">
			
			<input class="container p-3 mb-2 bg-success text-white text-white link" width="100%" type="submit" value="Update Name">
			</form>
			
				<!-- Link2 Update Password-->
			<form action="control.jsp" method="post">
			<input type="hidden" value="password" name="action">
			
			<input class="container p-3 mb-2 bg-success text-white text-white link" width="100%" type="submit" value="Update Password">
			</form>
			<!-- Link3 Update Email-->
		
			
			<form action="control.jsp" method="post">
			<input type="hidden" value="email" name="action">
			
			<input class="container p-3 mb-2 bg-success text-white text-white link" width="100%" type="submit" value="Update Email">
			</form>
			<!-- Link4 Update Name-->
			<%}
			
			if(id.equals("2") || id.equals("3")){
			%>
			<form action="control.jsp" method="post">
			<input type="hidden" value="delete" name="action">
			<input class="container p-3 mb-2 bg-success text-white text-white link" width="100%" type="submit" value="Remove User">
			</form>
			<form action="control.jsp" method="post">
			<input type="hidden" value="date" name="action">
			<input class="container p-3 mb-2 bg-success text-white text-white link" width="100%" type="submit" value="Update DATE">
			</form>
			<%} %>
			</div>
			</td>
			<td> 
			<div class="container">
		
		</div>	
		</td>
		
	</tr>
	<tr>
	<!-- Display Name -->
	<td>	
	
		<%
		String eml=(String)session.getAttribute("email");
		String nsql="select ID,NAME,PHONE_NUMBER,EMAIL_ID from players where EMAIL_ID = ?";
		PreparedStatement ps=conn.prepareStatement(nsql);
		ps.setString(1, eml);
		ResultSet rs=null;
		rs=ps.executeQuery();
		while(rs.next()){
		%> 	
		<h1>Welcome <%=rs.getString(2).toUpperCase() %></h1>
		<%} %>
	</td>
	</tr>
	<tr>
			<%
			String action=null;
			action=request.getParameter("action");
			ps=conn.prepareStatement(nsql);
			ps.setString(1, eml);
			rs=ps.executeQuery();
			if(action!=null)
			if(action.matches("name")){	
				rs.next();
			%>
			<td>
			<div class="container py-5 h-100">
		 <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">
            <div class="mb-md-5 mt-md-4 pb-5">
            
             <h2 class="fw-bold mb-2 text-uppercase">update Name<br> <%=rs.getString("name") %></h2>
			<form action="Action" method="post">
			<label for="name">Enter Name</label>
			<input type="text" id="name" name="changename" placeholder="Enter Name" class="form-control">
			<label for="password">Enter Password</label>
			<input type="password" id="password" class="form-control" placeholder="Enter Password" name="changepassword">
				<input type="hidden" value="name" name="action">
				<div class="form-outline form-white mb-4">
			<input type="submit" value="UPDATE Name" class="container p-3 mb-2 bg-success text-white text-white link"></div>
			</form>	
			</div>
			</div>
			</div>
			</div>
			</div>
			</div>
			</td>
				<%}
				else if(action.matches("password")){
					rs.next();
				%>
				<td>
			<div class="container py-5 h-100">
		 	<div class="row d-flex justify-content-center align-items-center h-100">
      		<div class="col-12 col-md-8 col-lg-6 col-xl-5">
        	<div class="card bg-dark text-white" style="border-radius: 1rem;">
          	<div class="card-body p-5 text-center">
            <div class="mb-md-5 mt-md-4 pb-5">
             <h2 class="fw-bold mb-2 text-uppercase">update Password<br> <%=rs.getString("name") %></h2>
			<form action="Action" method="post">
				<label for="oldpassword">Enter Old Password</label>
				<input type="password" id="oldpassword" class="form-control" placeholder="Enter old Password" name="oldpassword">
				<label for="newpassword">Enter New Password</label>
				<input type="text" placeholder="Enter New Password" class="form-control" name="newpassword" id="newpassword">
				<label for="conformpassword">Conform Password</label>
				<input type="password" placeholder="Conform New Password" class="form-control" id="conformpassword" name="conformpassword">
				<input type="hidden" value="password" name="action">
				<input type="hidden" value="<%=rs.getInt(1) %>" name="email">
				<div class="form-outline form-white mb-4">
			<input type="submit" value="UPDATE" class="container p-3 mb-2 bg-success text-white text-white link"></div>
			</form>	
			</div>
			</div>
			</div>
			</div>
			</div>
			</div>
			</td>
				
			<%}
			else if(action.matches("email")){
				rs.next();
			%>
					<td>
			<div class="container py-5 h-100">
		 <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">
            <div class="mb-md-5 mt-md-4 pb-5">
              <h2 class="fw-bold mb-2 text-uppercase">update Email<br><%=rs.getString("name") %></h2>
			<form action="Action" method="post">
			<label for="email">Enter New Email</label>
				<input type="email" class="form-control" name="email" id="email"  placeholder="Enter Email" required="required">
				<label for="password">Enter Password</label>
				<input type="password" class="form-control" name="pass" placeholder="Enter Password" required="required" id="password">
				<input type="hidden" value="emails" name="action">
			<input type="hidden" value="<%=rs.getInt("id") %>" name="id">
				<div class="form-outline form-white mb-4">
			<input type="submit" value="UPDATE" class="container p-3 mb-2 bg-success text-white text-white link"></div>
			</form>	
			</div>
			</div>
			</div>
			</div>
			</div>
			</div>
			</td>
			
			<%} 
			else if(action.matches("delete")){
				
			%>
			<td>
			<div class="container py-5 h-100">
		 <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">
            <div class="mb-md-5 mt-md-4 pb-5">
              <h2 class="fw-bold mb-2 text-uppercase"> </h2>
			<form action="Action" method="post">
				<input type="hidden" value="name" name="action">
			<input type="hidden" value="${id1}" name="email">
				<div class="form-outline form-white mb-4">
			<input type="submit" value="UPDATE" class="container p-3 mb-2 bg-success text-white text-white link"></div>
			</form>	
			</div>
			</div>
			</div>
			</div>
			</div>
			</div>
			</td>
			<%
			}
			else if(action.matches("date")){
			%>
			
			<%} %>
	</tr>
	<%
	if(id.equals("0")){
	%>
	<tr >
	<td rowspan="1">
	<%
	 eml=(String)session.getAttribute("email");
	 nsql="select ID,NAME,PHONE_NUMBER,EMAIL_ID from players where DEP_ID = ? ";
	 ps=conn.prepareStatement(nsql);
	ps.setInt(1, 2);
	rs=ps.executeQuery();
	while(rs.next()){
	%>
	<h1>Contact <%=rs.getString(2).toUpperCase() %></h1>
	<p>Phone Number <%=rs.getString(3) %></p>
	</td>
	
	</tr>
	<%}} %>
	<%
	if(id.equals("2") || id.equals("3")){
	%>
	</table>
	<div class="row">
		<div class="col-4">
		<form action="control.jsp" method="post">
			<input type="hidden" value="show" name="tab">
				<input class="container p-3 mb-2 bg-success text-white text-white link" width="100%" type="submit" value="Show Table">
				</form>
	</div>
	<div class="col-4">
		<form action="control.jsp">
			<input type="hidden" value="hide" name="tab">
			
			<input class="container p-3 mb-2 bg-success text-white text-white link" width="100%" type="submit" value="close table">
		</form>
				
	</div>
	<div class="col-4">
		<form action="control.jsp" method="post">
		
			<div class="input-group">
			<select class="form-select" aria-label="Default select example" name="selects">
				<option class="input-group" value="null" selected>select</option>
				<option class="input-group" value="email">Email</option>
				<option class="input-group" value="phonrnumbrt">Phone Number</option>
				<option class="input-group" value="name">Name</option>
			</select>
  		<input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" name="data"/>
  		<button type="submit" class="btn btn-outline-primary" data-mdb-ripple-init>search</button>
		</div>
		</form>
		
	</div>
	</div>
	<%
		String select,data;
		boolean verify;
		select=request.getParameter("selects");
		data=request.getParameter("data");
		verifyDetels vd=new verifyDetels();
		if(data!=null){
			
			if(select.matches("phonrnumbrt")){
				
				 rs=null;
				rs=search.searchByPhone(data);	
		%>
	<!-- Search By Phone Number -->
		<table class="table">
		<tr>
		<th>Name</th>
		<th>Phone</th>
		<th>Email</th>
		<th>Action</th>
		</tr>
		<%
		while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString(2).toUpperCase() %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td>
			<form action="control.jsp">
				<input type="hidden" value="<%=rs.getInt(1) %>" name="id">
				<input type="hidden" value="<%=rs.getString(2) %>" name="name">
				<input class="container p-3 mb-2 bg-success text-white text-white link" width="100%" type="submit" value="update Department">
			</form>
		</td>
		</tr>
		<%} %>
		</table>
		<!-- Search By Email -->
		<%
			}
			else if(select.matches("email")){
				 rs=null;		
				rs=search.searchByEmail(data);
			%>
			
		<table class="table">
		<tr>
		<th>Name</th>
		<th>Phone</th>
		<th>Email</th>
		<th>Action</th>
		</tr>
		<%
		while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString(2).toUpperCase() %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td>
			<form action="control.jsp">
				
				<input type="hidden" value="<%=rs.getInt(1) %>" name="id">
				<input type="hidden" value="<%=rs.getString(2) %>" name="name">
				<input class="container p-3 mb-2 bg-success text-white text-white link" width="100%" type="submit" value="update Department">
			</form>
		</td>
		</tr>
		<%} %>
		</table>
		<!-- Search BY Name -->
	<%
			}else if(select.matches("name")){
		String sql="select ID,NAME,PHONE_NUMBER,EMAIL_ID from players ";

		 ps=conn.prepareStatement(sql);
		Boolean fr=false;
		 rs=null;
		data=data.toLowerCase();
		String name;
		rs=ps.executeQuery();
	%>
	<table class="table">
		<tr>
		<th>Name</th>
		<th>Phone</th>
		<th>Email</th>
		<th>Action</th>
		</tr>
		<%
		while(rs.next()){
			name=rs.getString(2).toLowerCase();
			if(name.startsWith(data)){
		%>
		<tr>
		<td><%=rs.getString(2).toUpperCase() %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td>
			<form action="control.jsp">
				<input type="hidden" value="<%=rs.getInt(1) %>" name="id">
				<input type="hidden" value="<%=rs.getString(2) %>" name="name">
				<input class="container p-3 mb-2 bg-success text-white text-white link" width="100%" type="submit" value="update Department">
			</form>
		</td>
		</tr>
		<%} }%>
		</table>
	
	<%} %>
	<%			
		}
		String tab;
		tab=request.getParameter("tab");
		if(tab!=null)
		if(tab.matches("show")){
		conn=Conndav.conn();
		String sql="select ID,NAME,PHONE_NUMBER,EMAIL_ID from players where DEP_ID is null";
		Statement st;
		st=conn.createStatement();
		rs=st.executeQuery(sql);
	%>
	<!-- Total Table -->
	<table class="table">
		<tr>
		<th>Name</th>
		<th>Phone</th>
		<th>Email</th>
		<th>Action</th>
		</tr>
		<%
		while(rs.next()){
		%>
		<tr>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td>
			<form action="control.jsp">
				<input type="hidden" value="<%=rs.getInt(1) %>" name="id">
				<input type="hidden" value="<%=rs.getString(2) %>" name="name">
				<input class="container p-3 mb-2 bg-success text-white text-white link" width="100%" type="submit" value="update Department">
			</form>
		</td>
		</tr>

		<%} 
		}
		String id1,name;
		name=request.getParameter("name");
		id1=request.getParameter("id");
		if(id1!=null){
		%>

		<div class="container py-5 h-100">
		 <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
        <div class="card bg-dark text-white" style="border-radius: 1rem;">
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">

              <h2 class="fw-bold mb-2 text-uppercase"> <%=name %></h2>
			<form action="Action" method="post">
				<input type="hidden" value="update" name="action">
				<input type="hidden" value="<%=id1 %>" name="id">
				<select class="justify-content-center bg-dark text-white h=50%" name="select" required>
					<%
						String sql;
						sql="select * from departments";
						Statement st;
						st=conn.createStatement();
						rs=st.executeQuery(sql);
						while(rs.next()){
					%>
			
				<option value="<%=rs.getInt(1) %>"  class="fw-bold mb-2 text-uppercase bg-dark text-white"><%=rs.getString(2)%></option>
			
				<%
					}
				%>
				</select>
			<div class="form-outline form-white mb-4">
			<input type="submit" value="UPDATE" class="container p-3 mb-2 bg-success text-white text-white link"></div>
			</form>	
			</div>
			</div>
			</div>
			</div>
			</div>
			</div>
			</table>
			<%}	
		}}
		else{ %>
		<jsp:forward page="login.jsp"></jsp:forward>
		<%} %>
</body>
</html>