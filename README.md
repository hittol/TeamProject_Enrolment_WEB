---------------------------------------------------------------------------------------------
                       ☆★ docker-compose up 하기 전 server.xml 파일 설정 ★☆

String dbURL = "jdbc:mariadb://mariadb-host_ip:3306/my_project"; 부분에서 

mariadb-host-ip 부분은 해당 mairadb 의 host ip 주소로 변경해서 저장한 후 build 해주어야 합니다. 

AWS의 경우 RDS 의 endpoint 를 사용해 수정.

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
                      ☆★ http의 conf/workers.properties 파일 host 이름 설정 ★☆
workers.properties 파일의 worker.host 부분에서 

host의 이름은 해당 tomcat 의 고유 이름이여야 합니다. 

( aws의 경우에는 tomcat의 namespace 이름을 지정 )
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
                                 ☆★ mariadb 설정 사항. ★☆
                                 
1. mariaDB 의 admin 의 Host 를 project_tomcat 으로 변경 후 권한 부여

    CREATE USER 'admin'@'project_tomcat' IDENTIFIED BY 'soldesk1.';
    GRANT ALL PRIVILEGES ON my_project TO 'admin'@'project_tomcat';
    FLUSH PRIVILEGES;

   ( 해당 host ip 는 사용하는 host의 inet 주소 지정 )

2. /etc/my.cnf.d/mariadb-server.cnf 에서 bind-address = 0.0.0.0로 설정 ( 주석 해제 )

이후 systemctl restart mariadb 

----------------------------------------------------------------------------------------------
