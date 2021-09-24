FROM tomcat
RUN apt-get update && apt-get install -y default-jdk maven git \
 && apt-get clean \
 && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /tmp/bf/ \
 && cd /tmp/bf \
 && mvn -T 1C -Dmaven.test.skip package \
 && cp /tmp/bf/target/*.war /usr/local/tomcat/webapps/ \
 && cd /tmp \
 && rm -rf /tmp/bf \
 && apt-get remove default-jdk maven git --purge -y \
 && apt-get autoremove --purge -y \
 && rm -rf /var/lib/apt/lists/*
