<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*,java.lang.*" %>
<script>
  function showAlert() {
    alert("Invalid credentials" );
    window.location.href = "inventory_clerk.html";
  }
</script>

<%
  String user = request.getParameter("user");
  String pass = request.getParameter("pass");

  // Check if username and password match the desired values
  if ("hemanth".equals(user) && "hemanth".equals(pass)) {
    response.sendRedirect("manager_sub.html");
  } else {
    out.println("<script>showAlert();</script>");
  }
%>
