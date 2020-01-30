FROM ruby:2.4.2-alpine3.6

RUN apk update && apk upgrade
RUN apk add bash
RUN apk add curl-dev ruby-dev build-base git ruby-json openssl

RUN mkdir -p /dotfiles
WORKDIR /dotfiles

COPY . /dotfiles

CMD 'bin/run'
