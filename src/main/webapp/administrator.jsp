<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*,java.lang.*" %>
<script>
  function showAlert() {
    alert("Invalid credentials" );
    window.location.href = "administrator.html";
  }
</script>

<%
  String user = request.getParameter("user");
  String pass = request.getParameter("pass");

  // Check if username and password match the desired values
  if ("bhavani chandra".equals(user) && "bhavani_chandra".equals(pass)) {
    response.sendRedirect("administrator_sub.html");
  } else {
    out.println("<script>showAlert();</script>");
  }
%>
