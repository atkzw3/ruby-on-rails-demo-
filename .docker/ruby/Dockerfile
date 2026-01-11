FROM ruby:3.4.8

# 必要なパッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y \
    nodejs \
    default-mysql-client \
    build-essential \
    libmariadb-dev \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリの設定
WORKDIR /demo_app

# GemfileとGemfile.lockをコピー（存在する場合）
COPY Gemfile* /demo_app/

# bundle installを実行（Gemfileが存在する場合）
RUN if [ -f Gemfile ]; then bundle install; fi

# アプリケーションのコードをコピー
COPY . /demo_app

# ポート3000を公開
EXPOSE 3000

# デフォルトコマンド（docker-compose.ymlで上書き可能）
CMD ["rails", "server", "-b", "0.0.0.0"]

