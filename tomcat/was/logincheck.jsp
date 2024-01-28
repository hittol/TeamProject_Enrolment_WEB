<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SignUpProcess</title>
</head>

<body>  
    <%
        Connection conn = null;
        String dbURL = "jdbc:mariadb://mariadb-host_ip:3306/my_project";
        String dbID = "admin";
        String dbPwd = "soldesk1.";      
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbID, dbPwd);
    %>
    
    <%
        request.setCharacterEncoding("UTF-8");

        String log_id = request.getParameter("log_id");
        String pwd = request.getParameter("pwd");
        String stud_name = null;

        PreparedStatement pstmt = null;
        pstmt = conn.prepareStatement("SELECT stu_id, password, nam FROM students where stu_id = ?");
        pstmt.setString(1, log_id);

        ResultSet rs = null;
        rs = pstmt.executeQuery();

        if(rs.next()){
            if(pwd.equals(rs.getString("password"))){
                stud_name = rs.getString("nam");
    %>

                <script type="text/javascript">
                alert("수강신청 사이트에 오신것을 환영합니다!\n확인을 누르면 수강신청 창으로 이동합니다.")
                location.href='application.jsp?stud_name=<%= stud_name %>' + '&log_id=<%= log_id %>'      
                </script>

    <%
            }
            else{
    %>            
                <script type="text/javascript">
                alert("비밀번호가 틀렸습니다.")
                location.href='Main.html'
                </script>  
    <%  
            }
        }else{
    %>           
                <script type="text/javascript">
                alert("아이디가 틀렸습니다.")
                location.href='Main.html'
                </script> 
    <%                   
        }
    %>

</body>
</html> 
