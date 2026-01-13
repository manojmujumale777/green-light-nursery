<%@ page import="java.sql.*" %>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobile = request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String password = request.getParameter("password");
String address = request.getParameter("address");
String city = request.getParameter("city");
String state = request.getParameter("state");
String country = request.getParameter("country");

Connection con = null;
PreparedStatement ps = null;
PreparedStatement check = null;
ResultSet rs = null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/greenlightnursery",
        "root",
        "root"
    );

    // 🔍 Check if email already exists
    check = con.prepareStatement("SELECT email FROM users WHERE email=?");
    check.setString(1, email);
    rs = check.executeQuery();

    if(rs.next()){
        // 👉 Email already registered
        response.sendRedirect("signup.jsp?msg=exists");
    } 
    else{
        // 👉 New user insert
        ps = con.prepareStatement(
          "INSERT INTO users(name,email,mobile,securityQuestion,answer,password,address,city,state,country) VALUES(?,?,?,?,?,?,?,?,?,?)"
        );

        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, mobile);
        ps.setString(4, securityQuestion);
        ps.setString(5, answer);
        ps.setString(6, password);
        ps.setString(7, address);
        ps.setString(8, city);
        ps.setString(9, state);
        ps.setString(10, country);

        ps.executeUpdate();
        response.sendRedirect("signup.jsp?msg=valid");
    }

}catch(Exception e){
    e.printStackTrace();
    response.sendRedirect("signup.jsp?msg=invalid");
}
finally{
    try{
        if(rs!=null) rs.close();
        if(check!=null) check.close();
        if(ps!=null) ps.close();
        if(con!=null) con.close();
    }catch(Exception e){}
}
%>
