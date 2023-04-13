FROM ruby:3.1.0-slim

# 必要なライブラリのインストール
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential && \
    # pkg-config && \
      # libpq-dev \
      # nodejs \
      # yarn
    rm -rf /var/lib/apt/lists/*
# bundlerのインストール
RUN gem install bundler

# プロジェクトの作成・設定
WORKDIR /rspec-example-1
ADD Gemfile ./Gemfile
ADD Gemfile.lock ./Gemfile.lock
# RUN bundle lock --add-platform x86_64-linux
RUN bundle install
ADD . /rspec-example-1

# ポートの設定
EXPOSE 3000

# サーバの起動コマンド
CMD ["bin/dev"]
