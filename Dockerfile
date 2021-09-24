FROM tomcat
RUN apt update
RUN apt install default-jdk maven git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /tmp/bf/
RUN cd /tmp/bf ; mvn -T 1C -Dmaven.test.skip package 
RUN cp /tmp/bf/target/*.war /usr/local/tomcat/webapps/
RUN apt clean
EXPOSE 8080
CMD ["catalina.sh", "run"]
