FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim

RUN mkdir /badsearch

WORKDIR /badsearch

ADD Gemfile /badsearch/Gemfile
ADD Gemfile.lock /badsearch/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /badsearch

RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids

CMD ["rails", "server", "-b", "0.0.0.0"]