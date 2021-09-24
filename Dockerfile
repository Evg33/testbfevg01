FROM tomcat
RUN apt-get update && apt-get install -y default-jdk maven git \
 && apt-get clean
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /tmp/bf/
RUN cd /tmp/bf ; mvn -T 1C -Dmaven.test.skip package 
RUN cp /tmp/bf/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
