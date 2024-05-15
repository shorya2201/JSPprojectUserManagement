<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.connection.DbConnection"%>
    <%@page import="java.sql.*"%>
    <%@ page import="java.util.Date" %>

<%
String title = request.getParameter("req_title");
String user = (String)session.getAttribute("username");
String desc = request.getParameter("req_desc");
String raiseFor = request.getParameter("raise");
Date d = new Date();
String date = String.valueOf(d) ;
String pending = "pending";
session.setAttribute("status" , pending);

 DbConnection.insertData(title , desc , raiseFor , user,date);

response.sendRedirect("management.jsp");
%>
