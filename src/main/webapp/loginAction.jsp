<%@ page import="java.sql.*" %>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/greenlightnursery",
        "root",
        "root"
    );

    ps = con.prepareStatement(
        "SELECT * FROM users WHERE email=? AND password=?"
    );
    ps.setString(1, email);
    ps.setString(2, password);

    rs = ps.executeQuery();

    if(rs.next()){
        String role = rs.getString("role");

        // Session start
        session.setAttribute("email", email);
        session.setAttribute("name", rs.getString("name"));
        session.setAttribute("role", role);

        if("admin".equals(role)){
            response.sendRedirect("adminDashboard.jsp");
        } else {
            response.sendRedirect("home.jsp");   // normal user home
        }

    } else {
        response.sendRedirect("signin.jsp?msg=invalid");
    }

}catch(Exception e){
    e.printStackTrace();
    response.sendRedirect("signin.jsp?msg=invalid");
}
finally{
    if(rs!=null) rs.close();
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>
