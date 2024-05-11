<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="cdn.jsp" %>
</head>
<body>
<div class="container" align = "center">
<h1
			style="border: 4px #5dbea3 solid; background-color:#5dbea3; border-radius:10px; color: black; text-align: center; max-width: fit-content; margin-left: auto; margin-right: auto;">User Login</h1>
<form action=loginUser.jsp method="post">
<table>
<tr><td>Enter Name: </td><td><input type="text" name = "user" /></td></tr>
<tr><td>Enter Password: </td><td><input type="password" name = "pass" /></td></tr>
<tr><td>Select Role: </td><td><select name = "role"><option>legal</option><option>management</option><option>finance</option></select></td></tr>
<tr><td> <input type="submit" value="Login" /></td><td><input type="reset"/></td></tr>
</table>
</form>
</div>
</body>
</html>