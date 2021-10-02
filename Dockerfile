FROM ruby:2.6.5
# ベースにするイメージを指定

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim
# RailsのインストールやMySQLへの接続に必要なパッケージをインストール

RUN mkdir /badsearch
# コンテナ内にmyappディレクトリを作成

WORKDIR /badsearch
# 作成したmyappディレクトリを作業用ディレクトリとして設定

COPY Gemfile /badsearch/Gemfile
COPY Gemfile.lock /badsearch/Gemfile.lock
# ローカルの Gemfile と Gemfile.lock をコンテナ内のmyapp配下にコピー

RUN bundle install
# コンテナ内にコピーした Gemfile の bundle install

COPY . /badsearch
# ローカルのmyapp配下のファイルをコンテナ内のmyapp配下にコピー