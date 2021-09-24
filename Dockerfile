FROM tomcat
RUN apt-get update && apt-get install -y default-jdk maven git \
 && apt-get clean \
 && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /tmp/bf/ \
 && cd /tmp/bf \
 && mvn -T 1C -Dmaven.test.skip package \
 && cp /tmp/bf/target/*.war /usr/local/tomcat/webapps/ \
 && rm -rf /tmp/bf
EXPOSE 8080
CMD ["catalina.sh", "run"]
