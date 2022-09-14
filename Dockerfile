FROM alpine:3.14

#Create dir where you gonna store the codes
WORKDIR /bin
#copy files from the current directory to the previously created (exe1)
COPY APIweather.sh /bin/APIweather.sh

COPY root /var/spool/cron/crontabs/root

RUN apk update
RUN apk add curl
RUN apk add jq
RUN apk add  bash
RUN apk add --no-cache apache2


#RUN mkdir /run/apache2

RUN  chmod +x /bin/APIweather.sh

ENTRYPOINT crond -l 2 -f
EXPOSE 8080
CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND"]

