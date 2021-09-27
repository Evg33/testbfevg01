FROM ubuntu:20.04
RUN apt-get update && apt-get install -y default-jdk maven git tomcat9 \
 && apt-get clean \
 && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /tmp/bf/ \
 && cd /tmp/bf \
 && mvn -T 1C -Dmaven.test.skip package \
 && cp /tmp/bf/target/*.war /var/lib/tomcat9/webapps/ \
 && cd /tmp \
 && rm -rf /tmp/bf \
 && apt-get remove default-jdk maven git --purge -y \
 && apt-get autoremove --purge -y \
 && rm -rf /var/lib/apt/lists/*
EXPOSE 8080
#CMD ["catalina.sh", "run"]
