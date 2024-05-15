<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="com.connection.DbConnection"%>
<%@ page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="cdn.jsp"%>
<style type="text/css">
a {
	visibility: hidden;
}
</style>
</head>
<body>

	<%
	String appPer = (String) session.getAttribute("username");
	Date d = new Date();
	String appDate = d.toString();
	String id = request.getParameter("request_id");
	try {
		Connection con = DbConnection.takeConnection();
		
		String q1 = "update approval set status = 'Declined'  where request_id=" + id;

		PreparedStatement ps1 = con.prepareStatement(q1);

		ps1.execute();

		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	DbConnection.insertRemData(appPer, appDate, id);

	response.sendRedirect("legal.jsp");
	%>

</body>
</html>