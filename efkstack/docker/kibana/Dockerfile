ARG ELASTIC_VERSION

# https://www.docker.elastic.co/
FROM docker.elastic.co/kibana/kibana:${ELASTIC_VERSION}

# Add your kibana plugins setup here
# Example: RUN kibana-plugin install <name|url>
#RUN kibana-plugin install https://d3g5vo6xdbdb9a.cloudfront.net/downloads/kibana-plugins/opendistro-alerting/opendistroAlertingKibana-1.12.0.2.zip
#USER root
RUN bin/kibana-plugin --allow-root install https://d3g5vo6xdbdb9a.cloudfront.net/downloads/kibana-plugins/opendistro-alerting/opendistroAlertingKibana-1.13.0.0.zip
