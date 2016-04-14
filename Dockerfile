FROM alpine
COPY run.sh /run.sh
RUN apk add --update privoxy && rm -rf /var/cache/apk/* && \
 	mv /etc/privoxy/config /etc/privoxy/config.example && \
 	chmod +x /run.sh
CMD ["/run.sh"]