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
String auth_name = request.getParameter("ba");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/lib","root","root");
PreparedStatement ps=con.prepareStatement("insert into BOOK_AUTHORS values(?,?)");
ps.setString(1, bid);
ps.setString(2, auth_name);
int flag=ps.executeUpdate();
%>

<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="book_auth.html" > Back </a></p>
<% } else {%>
<h3> VALUES NOT INSERTED</h3>
<p> <a href="pub.html" > TRY TO INSERT AGAIN </a></p>

 <%} %>
<center>
<h3>
BOOK ID : <%= bid %> <br>
AUTHOR NAME : <%= auth_name %> <br>



</h3>
</center>


</body>
</html>