FROM tomcat
RUN apt update
RUN apt install default-jdk maven git -y
RUN mkdir -p /tmp/bf
RUN cd /tmp/bf
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git .
RUN mvn -T 1C -Dmaven.test.skip package 
RUN cp target/*.war /usr/local/tomcat/webapps/
RUN apt clean
EXPOSE 8080
CMD ["catalina.sh", "run"]
