<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="./webimages/tappagelogo.png" rel="shortcut icon" />
    <link href="./webimages/tappagelogo.png" rel="apple-touch-icon"/>
    <title>회원가입 | 수강신청사이트</title>
</head>

<script src="sweetalert.min.js"></script>

<body>  
    <%
		Connection conn = null;

        Context initCtx = new InitialContext();
        Context envCtx = (Context)initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("project_mariadb");

        conn = ds.getConnection();
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
            swal.fire({
                icon : "success",
                title : "회원가입을 축하합니다!",
                text : "확인을 누르면 로그인창으로 돌아갑니다."
            }).then(function(){
	                location.href='Main.html'                  
            })   

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
