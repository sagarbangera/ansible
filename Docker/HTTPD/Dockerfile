FROM centos:7

# Installing httpd
RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
RUN echo "Sagar Bangera Web Docker Container" > /var/www/html/index.html

# Starting httpd service

COPY auth_basic.conf /

CMD ["/run-httpd.sh"]
