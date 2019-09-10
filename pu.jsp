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
String name = request.getParameter("n");
String city = request.getParameter("c");
String phone = request.getParameter("p");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/lib","root","root");
PreparedStatement ps=con.prepareStatement("insert into PUBLISHER values(?,?,?)");
ps.setString(1, name);
ps.setString(2, city);
ps.setString(3,phone);
int flag=ps.executeUpdate();
%>

<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="pub.html" > Back </a></p>
<% } else {%>
<h3> VALUES NOT INSERTED</h3>
<p> <a href="pub.html" > TRY TO INSERT AGAIN </a></p>

 <%} %>
<center>
<h3>
NAME : <%= name %> <br>
CITY : <%= city %> <br>
PHONE.NO : <%= phone %> <br>


</h3>
</center>


</body>
</html>