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
    <title>수강신청사이트</title>
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

                swal.fire({
                    icon : "success",
                    title : "로그인 성공!",
                    text : "로그인되었습니다."

                }).then(function(){
	                location.href='application.jsp?stud_name=<%= stud_name %>' + '&log_id=<%= log_id %>'                  
                })     
                </script>

    <%
            }
            else{
    %>               
                <script type="text/javascript">

                swal.fire({
                    icon : "warning",
                    title : "로그인 실패!",
                    text : "비밀번호를 확인해 주세요."
                }).then(function(){
	                location.href='Main.html'              
                })  

                </script>  
    <%  
            }
        }else{
    %>           
                <script type="text/javascript">

                swal.fire({
                    icon : "warning",
                    title : "로그인 실패!",
                    text : "아이디를 확인해 주세요."
                }).then(function(){
	                location.href='Main.html'              
                })

                </script> 
    <%                   
        }
    %>

</body>
</html> 
