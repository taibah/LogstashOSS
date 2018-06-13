FROM docker.elastic.co/logstash/logstash-oss:6.3.0

MAINTAINER Justin Henderson justin@hasecuritysolutions.com

USER root
RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-elasticsearch
RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-tld
RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-rest
USER logstash

STOPSIGNAL SIGTERM
