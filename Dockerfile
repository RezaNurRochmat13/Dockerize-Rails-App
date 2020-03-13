FROM ruby:2.4.1-alpine
LABEL maintainer="Manggala Pramuditya W manggala@qiscus.co"
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
RUN apk update && apk --update --no-cache add ruby \
    ruby-irb \
    ruby-json \
    ruby-io-console \
    libstdc++ \
    tzdata \
    nodejs \
    curl \
    libcurl \
    curl-dev \
    postgresql-dev bash
COPY . /usr/src/app/
WORKDIR /usr/src/app/
RUN apk --update add --virtual build-dependencies build-base ruby-dev openssl-dev \
    libc-dev linux-headers && \
    gem install bundler -v 2.0.2 && \
    cd /usr/src/app/ ; bundle install && \
    apk del build-dependencies
WORKDIR /usr/src/app
EXPOSE 3000
ENTRYPOINT [ "sh", "./entrypoint.sh" ]
