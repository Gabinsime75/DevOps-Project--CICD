FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapp.dist/*  /usr/local/tomcat/webapp
COPY ./*.war /usr/local/tomcat/webapp

