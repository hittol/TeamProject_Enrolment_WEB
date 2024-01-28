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
        //MariaDB 준비
        Connection conn = null;
        String dbURL = "jdbc:mariadb://mariadb-host_ip:3306/my_project";
        String dbID = "admin";
        String dbPwd = "soldesk1.";      
        //MariaDB 연동
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbID, dbPwd);
    %>

    <%
        //MariaDB에서 값 받아오기
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String sex = request.getParameter("sex");

        PreparedStatement pstmt = null;
        //DB에 값 저장하기
        try {
            String sql = "insert into students(stu_id,password,nam,date,gen) values(?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            pstmt.setString(3, name);
            pstmt.setString(4, birthday);
            pstmt.setString(5, sex);
            pstmt.executeUpdate();     
    %>            
        <script type="text/javascript">
            alert("회원가입을 축하합니다.\n확인을 누르면 로그인창으로 돌아갑니다.");
            location.href='Main.html'
        </script>
   <%                        
        } catch(SQLException ex) {
            System.out.println("오류가 발생했습니다. 잠시 뒤 다시 가입해주세요");
        } finally {
            if(pstmt != null) {
                pstmt.close();
            }
            if(conn != null){
                conn.close();
            }
        }
    %>
</body>
</html> 
