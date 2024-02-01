FROM centos:7

# Apache 소스 설치를 위한 패키지
RUN yum -y update && yum clean all
RUN yum -y install httpd httpd-devel gcc* make && yum clean all
RUN yum install -y wget
RUN yum install -y make


# Install mod_jk
RUN wget -P ~ https://dlcdn.apache.org/tomcat/tomcat-connectors/jk/tomcat-connectors-1.2.49-src.tar.gz --no-check-certificate \
      && cd ~ \
      && tar -zxvf tomcat-connectors-1.2.49-src.tar.gz \
      && rm -rf tomcat-connectors-1.2.49-src.tar.gz \
      && cd ~/tomcat-connectors-1.2.49-src/native/ \
      && ./configure --with-apxs=/usr/bin/apxs \
      && make && make install

#Copy enable and load httpd conf files that it locate conf/sites
ADD ./conf/httpd.conf /etc/httpd/conf/httpd.conf
ADD ./conf/mod_jk.conf /etc/httpd/conf/mod_jk.conf
ADD ./conf/workers.properties /etc/httpd/conf/workers.properties
ADD ./conf/uri.properties /etc/httpd/conf/uri.properties

COPY ./htdocs /var/www/html

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart 
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
