<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*,java.lang.*" %>
<script>
  function showAlert() {
    alert("Invalid credentials" );
    window.location.href = "inventory_clerk.html";
  }
</script>
<%
  String jdbcUrl = "jdbc:mysql://localhost:3306/authenticator;";
  String dbUser = "root";
  String dbPassword = "root";

  Connection connection = null;

  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
    out.println("Connected successfully!");
  } catch (Exception e) {
    e.printStackTrace();
    e.getMessage();
  }
%>
<%
  String user=request.getParameter("user");
  String pass=request.getParameter("pass");
  Connection con=null;
  PreparedStatement ps=null;
  String query= "SELECT * FROM signup_form WHERE name=? AND password=?";
  try
  {
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/authenticator","root","root");
    ps=con.prepareStatement(query);
    ps.setString(1,user);
    ps.setString(2,pass);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
      response.sendRedirect("clerk_sub.html");
    } else {

      out.println("<script>showAlert();</script>");
    }
  }
  catch (Exception e)
  {
    out.print(e);
  }

%>