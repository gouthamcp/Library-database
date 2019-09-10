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
int card_no = Integer.parseInt(request.getParameter("cn"));
String dateout = request.getParameter("do");
String duedate = request.getParameter("dd");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/lib","root","root");
PreparedStatement ps=con.prepareStatement("insert into BOOK_LENDING values(?,?,?,?,?)");
ps.setString(1, bid);
ps.setString(2, brid);
ps.setInt(3, card_no);
ps.setString(4,dateout);
ps.setString(5,duedate);
int flag=ps.executeUpdate();
%>

<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="bo_lend.html" > Back </a></p>
<% } else {%>
<h3> VALUES NOT INSERTED</h3>
<p> <a href="book.html" > STUDENT INSERT </a></p>

 <%} %>
<center>
<h3>
BOOK ID : <%= bid %> <br>
BRANCH ID : <%= brid %> <br>
CARD NO : <%= card_no %> <br>
DATE OUT : <%= dateout %> <br>
DUE DATE : <%= duedate %> <br>

</h3>
</center>


</body>
</html>