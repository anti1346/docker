ARG ELASTIC_VERSION

# https://www.docker.elastic.co/
FROM docker.elastic.co/elasticsearch/elasticsearch:${ELASTIC_VERSION}

RUN bin/elasticsearch-plugin install --batch analysis-nori

USER root
RUN bin/elasticsearch-plugin install -batch https://d3g5vo6xdbdb9a.cloudfront.net/downloads/elasticsearch-plugins/opendistro-alerting/opendistro-alerting-1.13.1.0.zip

USER 1000:1000