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
String brid = request.getParameter("bri");
int nc = Integer.parseInt(request.getParameter("nc"));
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/lib","root","root");
PreparedStatement ps=con.prepareStatement("insert into BOOK_COPIES values(?,?,?)");
ps.setString(1, bid);
ps.setString(2, brid);
ps.setInt(3,nc);
int flag=ps.executeUpdate();
%>

<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="bo_cop.html" > Back </a></p>
<% } else {%>
<h3> VALUES NOT INSERTED</h3>
<p> <a href="pub.html" > TRY TO INSERT AGAIN </a></p>

 <%} %>
<center>
<h3>
BOOK ID : <%= bid %> <br>
BRANCH ID : <%= brid %> <br>
NO OF COPIES : <%= nc %> <br>


</h3>
</center>


</body>
</html>