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
    <title>수강신청 | 수강신청사이트</title>
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

        String stu_id = request.getParameter("stu_id");
        String cls_code_1 = request.getParameter("code1");
        String cls_code_2 = request.getParameter("code2");        
        String cls_code_3 = request.getParameter("code3");
        String cls_code_4 = request.getParameter("code4"); 
        String cls_code_5 = request.getParameter("code5");  

        PreparedStatement pstmt = null;       

        try {                    
            String sql = "insert into students_cls(code,stu_id) values(?,?)";
            pstmt = conn.prepareStatement(sql);

            if(!cls_code_1.equals("1")){
                pstmt.setString(1, cls_code_1);
                pstmt.setString(2, stu_id);
                pstmt.executeUpdate();
            }
            if(!cls_code_2.equals("1")){
                pstmt.setString(1, cls_code_2);
                pstmt.setString(2, stu_id);
                pstmt.executeUpdate();
            }
            if(!cls_code_3.equals("1")){
                pstmt.setString(1, cls_code_3);
                pstmt.setString(2, stu_id);
                pstmt.executeUpdate();
            }
            if(!cls_code_4.equals("1")){
                pstmt.setString(1, cls_code_4);
                pstmt.setString(2, stu_id);
                pstmt.executeUpdate();
            }
            if(!cls_code_5.equals("1")){
                pstmt.setString(1, cls_code_5);
                pstmt.setString(2, stu_id);
                pstmt.executeUpdate();
            }            
              
    %>            
        <script type="text/javascript">

            swal.fire({
                icon : "success",
                title : "저장이 완료되었습니다.",
                text : "메인화면으로 이동합니다."

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
