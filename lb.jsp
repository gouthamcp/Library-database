<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String bid = request.getParameter("bi");
String bname = request.getParameter("bn");
String place = request.getParameter("p");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/lib","root","root");
PreparedStatement ps=con.prepareStatement("insert into LIBRARY_BRANCH values(?,?,?)");
ps.setString(1, bid);
ps.setString(2, bname);
ps.setString(3,place);

int flag=ps.executeUpdate();
%>

<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="lib_branch.html" > Back </a></p>
<% } else {%>
<h3> VALUES NOT INSERTED</h3>
<p> <a href="book.html" > STUDENT INSERT </a></p>

 <%} %>
<center>
<h3>
BRANCH ID : <%= bid %> <br>
BRANCH NAME : <%= bname %> <br>
PLACE : <%= place %> <br>


</h3>
</center>


</body>
</html>