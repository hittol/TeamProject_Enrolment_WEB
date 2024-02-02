FROM centos:7

# tomcat 소스 설치를 위한 패키지
RUN yum -y update && yum clean all 
RUN yum -y install wget

# Install JDK
RUN mkdir -p /sw \
    && cd /sw \
    && wget -P /sw --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn/java/jdk/8u381-b09/8c876547113c4e4aab3c868e9e0ec572/jdk-8u381-linux-x64.tar.gz \
    && tar -zxvf jdk-8u381-linux-x64.tar.gz \  
    && rm -f jdk-8u381-linux-x64.tar.gz


# 다운로드 되는 파일의 버전과 일치
ENV JAVA_HOME=/sw/jdk1.8.0_381 
ENV export JAVA_HOME
ENV PATH=$PATH:$JAVA_HOME/bin
ENV export PATH

# Install tomcat
RUN wget -P /sw https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz --no-check-certificate \
  && cd /sw \
  && tar -zvxf apache-tomcat-9.0.85.tar.gz \
  && rm -f apache-tomcat-9.0.85.tar.gz

ENV CATALINA_HOME=/sw/apache-tomcat-9.0.85
ENV PATH=$PATH:$CATALINA_HOME/bin

ADD ./conf/server.xml /sw/apache-tomcat-9.0.85/conf/server.xml
ADD ./conf/context.xml /sw/apache-tomcat-9.0.85/conf/context.xml

COPY ./was /sw/apache-tomcat-9.0.85/webapps/ROOT/

# Insatll MariaDB connector 
RUN wget -P ~/ https://dlm.mariadb.com/1965742/Connectors/java/connector-java-2.7.5/mariadb-java-client-2.7.5.jar  --no-check-certificate \
  && cd ~ \
  && cp -p ~/mariadb-java-client-2.7.5.jar /sw/jdk1.8.0_381/jre/lib \
  && cp -p ~/mariadb-java-client-2.7.5.jar /sw/apache-tomcat-9.0.85/lib

EXPOSE 8009

ENTRYPOINT ["/sw/apache-tomcat-9.0.85/bin/catalina.sh", "run"]

