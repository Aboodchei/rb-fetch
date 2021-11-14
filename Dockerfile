FROM ruby:2.7.1

RUN gem install nokogiri

RUN mkdir /usr/rb-fetch
WORKDIR /usr/rb-fetch
COPY . /usr/rb-fetch

RUN chmod 755 fetch
