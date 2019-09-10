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
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/lib","root","root");
				String query="select card_no from book_lending where Date_out between '2011-01-17' and '2021-04-17' group by card_no having count(*)>1";
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(query);%>
				<h3> CARD NUMBER </h3>
				
				<% while(rs.next())
				{
						String bid=rs.getString("Card_no");
						out.println("<br/>");%>
						<h2><%=bid %>&nbsp&nbsp&nbsp </h2>
						
				<% }
			}
			catch(Exception e)
			{
				System.out.println("e="+e);
			}
		
%>
</body>
</html>