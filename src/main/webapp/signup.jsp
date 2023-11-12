<%@ page import="java.sql.*" %>
<script>
    function showAlert() {

        alert("User with this email already exists");
        window.location.href = "inventory_clerk.html";
    }
</script>
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/authenticator";
    String dbUser = "root";
    String dbPassword = "root";
    out.println("Fu");
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
    String name= request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirm_password = request.getParameter("confirm_password");
    String checkQuery = "SELECT COUNT(*) FROM signup_form WHERE email=?";
    String insertQuery = "INSERT INTO signup_form VALUES (?,?,?,?)";
    if(password.equals(confirm_password)) {
        PreparedStatement ps = null;
        try {
            connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
            ps = connection.prepareStatement(checkQuery);
            ps.setString(1, email);
            ResultSet resultSet = ps.executeQuery();
            resultSet.next();
            int emailCount = resultSet.getInt(1);
            if (emailCount > 0) {
                out.println("<script>showAlert();</script>");
            } else {
                ps = connection.prepareStatement(insertQuery);
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, password);
                ps.setString(4, confirm_password);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    response.sendRedirect("inventory_clerk.html");
                } else {
                    out.print("<p>Error Message</p>");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    else
    {
        out.println("<script>showAlert('Passwords do not match');</script>");
    }
%>
