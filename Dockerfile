FROM ruby:2.3.0
RUN apt-get update -qq && apt-get install -y build-essential postgresql-client libpq-dev nodejs
RUN mkdir /diner
WORKDIR /diner
ADD Gemfile /diner/Gemfile
ADD Gemfile.lock /diner/Gemfile.lock
RUN bundle install
ADD . /diner