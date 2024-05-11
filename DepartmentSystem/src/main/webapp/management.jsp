<%@page import="com.connection.DbConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="cdn.jsp"%>
<style type="text/css">
.logout{
position:fixed;
top:10px;
right:30px;
width:260px;
}
</style>
</head>
<body>

		<h1
			style="border: 4px #5dbea3 solid; background-color:#5dbea3; border-radius:10px; color: black; text-align: center; max-width: fit-content; margin-left: auto; margin-right: auto;">Management
			DashBoard</h1>
	<div style="text-align:center"><a href="logout.jsp" class = logout style="font-size:x-large; background-color:#dd7973; border:2px #dd7973 solid; border-radius:10px; color: black; text-align: center; max-width: fit-content; margin-left: auto; margin-right: auto;">LogOut</a>
		</div>
	<hr>
<h2
			style=" border: 4px #a881af solid; background-color:#a881af; border-radius:10px; color: black;text-align: center; max-width: fit-content; margin-left: auto; margin-right: auto;">Raise A Request</h2>
	<div
		style="max-width: fit-content; margin-left: auto; margin-right: auto;">
		<form action="InsertRequest.jsp" method="post">
			<table>
				<tr>
					<td>Request Title:</td>
					<td><input type="text" name="req_title" /></td>
				</tr>
				<tr>
					<td>Request Description:</td>
					<td><input type="text" name="req_desc" /></td>
				</tr>
				<tr>
					<td>Raised for Department:</td>
					<td><select name="raise"><option>legal</option>
							<option>management</option>
							<option>finance</option></select></td>
				</tr>
				<tr>
					<td><input type="submit" value="Submit Request for Review." /></td>
				</tr>
			</table>
		</form>
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
				</tr>
				<%
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
						out.println("<td>" + rs.getString(9) + "</td>");
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