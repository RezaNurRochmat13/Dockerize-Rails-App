FROM ruby:2.4.1-alpine

LABEL maintainer="Rejak Nur Rochmat rezanur@uii.ac.id"

RUN apk update && apk --update --no-cache add ruby \ 
    ruby-irb \
    ruby-json \
    ruby-io-console \ 
    libstdc++ \
    tzdata \
    nodejs \
    curl \
    libcurl \
    curl-dev

COPY . /usr/src/app/

WORKDIR /usr/src/app/

RUN rm Gemfile.lock

WORKDIR /

RUN apk --update add --virtual build-dependencies build-base ruby-dev openssl-dev \
    postgresql-dev libc-dev linux-headers && \
    gem install bundler && \
    cd /usr/src/app/ ; bundle install && \
    apk del build-dependencies

WORKDIR /usr/src/app

EXPOSE 3000

CMD ["rails", "s", "-b", "0.0.0.0"]
