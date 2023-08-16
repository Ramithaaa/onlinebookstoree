FROM ubuntu AS IMG
RUN apt update && apt install maven git -y
RUN git clone https://github.com/Ramithaaa/onlinebookstoree.git
RUN cd onlinebookstoree && mvn install



FROM tomcat:8-jdk11 
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=IMG onlinebookstoree/target/onlinebookstore.war /usr/local/tomcat/webapps/ROOT.war 
EXPOSE 8080
CMD ["catalina.sh","run"]
