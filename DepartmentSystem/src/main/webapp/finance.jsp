<%@page import="java.sql.DriverManager"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="com.connection.DbConnection"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.approve {
	color: green;
	margin-right: 1px;
	border: 2px black solid;
}

.decline {
	color: red;
	border: 2px black solid;
	margin-left: 1px;
}

.link {
	border: 2px black solid;
}
.logout{
position:fixed;
top:10px;
right:30px;
width:260px;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="cdn.jsp"%>
</head>
<body>
	<h1
			style="border: 4px #a881af solid; background-color:#a881af; border-radius:10px; color: black; text-align: center; max-width: fit-content; margin-left: auto; margin-right: auto;">Finance
			DashBoard</h1>
		<div style="text-align:center"><a href="logout.jsp" class = logout style="font-size:x-large; background-color:#dd7973; border:2px #dd7973 solid; border-radius:10px; color: black; text-align: center; max-width: fit-content; margin-left: auto; margin-right: auto;">LogOut</a>
		</div>
	<hr>
	<br>
	<div class="row">
		<div class="col=md-1"></div>
		<div class="col=md-10">
			<table class="table table-hover">
				<tr>
					<th>Request-ID</th>
					<th>Title</th>
					<th>Description</th>
					<th>Request-By</th>
					<th>Request-Date</th>
					<th>Request-Dept</th>
					<th>Approved-By</th>
					<th>Approve-Date</th>
					<th>Status</th>
					<th>Approve/Decline</th>
				</tr>
				<%
				String appPer = (String) session.getAttribute("username");
				Date d = new Date();
				String appDate = d.toString();
				try {
					Connection con = DbConnection.takeConnection();
					String q = "select * from approval";
					PreparedStatement ps = con.prepareStatement(q);
					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
						out.println("<tr>");
						out.println("<td>" + rs.getString(1) + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						out.println("<td>" + rs.getString(4) + "</td>");
						out.println("<td>" + rs.getString(5) + "</td>");
						out.println("<td>" + rs.getString(6) + "</td>");
						out.println("<td>" + rs.getString(7) + "</td>");
						out.println("<td>" + rs.getString(8) + "</td>");
						//out.println("<td>" + rs.getString(9) + "</td>");
						if(rs.getString(9).equals("Approved")){
							out.println("<td style= color:green;>" + rs.getString(9) + "</td>");
							//DbConnection.insertRemData(appPer, appDate,rs.getString(1));
						}else if(rs.getString(9).equals("Declined")){
							out.println("<td style= color:red;>" + rs.getString(9) + "</td>");
						}
						if(rs.getString(9).equals("Pending")){
							out.println("<td>" + rs.getString(9) + "</td>");
							out.println("<td>" + "<a class=approve href = ./approve.jsp?request_id=" + rs.getString(1)
							+ ">Approve</a><a class=decline href = ./decline.jsp?request_id="+rs.getString(1)+">Decline</a>" + "</td>");
						}
						out.println("</tr>");
					}
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
			</table>
		</div>
		<div class="col=md-1"></div>
	</div>
</body>
</html>