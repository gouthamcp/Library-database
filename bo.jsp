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
String bid = request.getParameter("i");
String title = request.getParameter("t");
String pub_name = request.getParameter("pn");
int pub_year = Integer.parseInt(request.getParameter("py"));
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/lib","root","root");
PreparedStatement ps=con.prepareStatement("insert into BOOK values(?,?,?,?)");
ps.setString(1, bid);
ps.setString(2, title);
ps.setString(3,pub_name);
ps.setInt(4, pub_year);
int flag=ps.executeUpdate();
%>

<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="book.html" > Back </a></p>
<% } else {%>
<h3> VALUES NOT INSERTED</h3>
<p> <a href="book.html" > STUDENT INSERT </a></p>

 <%} %>
<center>
<h3>
BOOK ID : <%= bid %> <br>
TITLE : <%= title %> <br>
PUBLISHER NAME : <%= pub_name %> <br>
PUBLICATION YEAR : <%= pub_year %> <br>


</h3>
</center>


</body>
</html>