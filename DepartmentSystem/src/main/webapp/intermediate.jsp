<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="com.connection.DbConnection" %>
<%

String user = request.getParameter("user");
String pass = request.getParameter("pass");
String role = request.getParameter("role");

boolean status = false;
try{
	Connection con = DbConnection.takeConnection();
	PreparedStatement ps= con.prepareStatement("select * form login where username = ? and password = ?");
	ps.setString(1,user);
	ps.setString(2,pass);
	ResultSet rs = ps.executeQuery();
	if(rs.next()){
		RequestDispatcher rd = request.getRequestDispatcher("loginUser.jsp");
		rd.forward(request,response);
		status = true;
		
	}else{
		response.sendRedirect("login.jsp");
	}
}catch(Exception e){
	
	e.printStackTrace();
	}
session.setAttribute("sts", status);
response.sendRedirect("loginUser.jsp");


%>