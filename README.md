---------------------------------------------------------------------------------------------
                        ☆★ docker-compose up 하기 전 jsp 파일 설정 ★☆

String dbURL = "jdbc:mariadb://mariadb-host_ip:3306/my_project"; 부분에서 

mariadb-host-ip 부분은 해당 mairadb 의 host ip 주소로 변경해서 저장한 후 build 해주어야 합니다. 

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


※ 만약 그래도 안될 경우 -  'admin'@'*' 으로 생성해서 해볼것

----------------------------------------------------------------------------------------------
