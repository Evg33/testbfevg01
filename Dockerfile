FROM ubuntu:20.04
ENV CATALINA_HOME=/usr/share/tomcat9
ENV CATALINA_BASE=/var/lib/tomcat9
ENV CATALINA_TMPDIR=/tmp
ENV PATH="/usr/share/tomcat9/bin/:${PATH}" 
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y tzdata && ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
RUN apt-get install -y default-jdk maven git tomcat9 && apt-get clean
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /tmp/bf/ \
 && cd /tmp/bf \
 && mvn -T 1C -Dmaven.test.skip package
RUN cp /tmp/bf/target/*.war /var/lib/tomcat9/webapps/ \
 && cd /tmp \
 && rm -rf /tmp/bf \
 && apt-get remove default-jdk maven git --purge -y \
 && apt-get autoremove --purge -y \
 && rm -rf /var/lib/apt/lists/*
EXPOSE 8080
CMD ["catalina.sh", "run"]
