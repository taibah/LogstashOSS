FROM docker.elastic.co/logstash/logstash-oss:6.2.4

MAINTAINER Justin Henderson justin@hasecuritysolutions.com

USER root
RUN yum install -y wget
RUN wget https://github.com/arvatoaws/logstash-filter-mutate/raw/45672d360f586b8515265867205275e872da0bcd/lib/logstash/filters/mutate.rb -O /usr/share/logstash/vendor/bundle/jruby/2.3.0/gems/logstash-filter-mutate-3.3.1/lib/logstash/filters/mutate.rb
RUN yum remove -y wget
RUN yum clean all -y
RUN rm -rf /var/cache/yum
RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-elasticsearch
RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-tld
RUN /usr/share/logstash/bin/logstash-plugin install logstash-filter-rest
USER logstash

STOPSIGNAL SIGTERM
