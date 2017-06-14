FROM java:8
VOLUME /tmp
ADD oz-rest-spring-boot*.jar oz-rest-spring-boot.jar
ADD cacerts /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/cacerts
RUN sh -c 'touch /oz-rest-spring-boot.jar'
ENV JAVA_OPTS="-Xmx256m -Xms128m"
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /oz-rest-spring-boot.jar"]
