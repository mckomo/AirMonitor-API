FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /app
WORKDIR /app
ADD Gemfile /myapp/Gemfile
RUN bundle install
ADD . /app