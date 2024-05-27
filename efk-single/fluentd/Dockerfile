FROM fluentd

USER root

RUN apk update \
 && apk add --no-cache \
        ca-certificates \
        ruby ruby-irb ruby-etc ruby-webrick \
        geoip-dev \
        tini \
 && apk add --no-cache --virtual .build-deps \
        build-base \
        ruby-dev gnupg \
        sudo ruby-dev \
 && apk del .build-deps

RUN echo 'gem: --no-document' >> /etc/gemrc

RUN gem install fluent-plugin-elasticsearch \
 && gem install fluent-plugin-rewrite-tag-filter \
 && gem install fluent-plugin-multi-format-parser \
 && gem install fluent-plugin-forest \
 && gem install fluent-plugin-syslog \
 && gem install fluent-plugin-remote_syslog \
 && gem install fluent-plugin-detect-exceptions \
 && gem install fluent-plugin-jq \
 && gem install fluent-plugin-s3 \
 && gem install fluent-plugin-td \
 && gem install fluent-plugin-td-monitoring \
 && gem install fluent-plugin-webhdfs \
 # Add plugins you want to use
 # && gem install fluent-plugin-geoip \
 && gem sources --clear-all

RUN rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /usr/lib/ruby/gems/*/cache/*.gem
