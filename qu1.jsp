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
				String query="select b.Book_id,b.title,b.Pub_Name,a.Author_Name,c.No_of_copies,c.Branch_id from BOOK b, BOOK_AUTHORS a,BOOK_COPIES c where b.Book_id=a.Book_id and b.Book_id=c.Book_id";
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(query);%>
				<h2> BOOK ID	-TITLE	-PUBL NAME	-NO OF COPIES	-AUTH NAME	-BRANCH ID"</h2>
				
				<% while(rs.next())
				{
						String bid=rs.getString("Book_id");
						String title=rs.getString("Title");
						String pubn=rs.getString("Pub_Name");
						int nc=rs.getInt("No_of_copies");
						String an=rs.getString("Author_Name");
						String bri=rs.getString("Branch_id");
						out.println("<br/>");%>
						<p><%=bid %>&nbsp&nbsp&nbsp<%=title %>&nbsp&nbsp&nbsp<%=pubn %>&nbsp&nbsp&nbsp&nbsp<%=nc %>&nbsp&nbsp&nbsp&nbsp<%=an%>&nbsp&nbsp&nbsp&nbsp <%=bri %> </p>
						
				<% }
			}
			catch(Exception e)
			{
				System.out.println("e="+e);
			}
		
%>
</body>
</html>