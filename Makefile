.PHONY: help build up down restart shell logs clean db-create db-migrate db-reset bundle-install rails-console

# デフォルトターゲット（ヘルプを表示）
help:
	@echo "Available commands:"
	@echo "  make build          - Dockerイメージをビルド"
	@echo "  make up              - コンテナを起動（バックグラウンド）"
	@echo "  make down            - コンテナを停止・削除"
	@echo "  make restart         - コンテナを再起動"
	@echo "  make shell           - webコンテナに入る"
	@echo "  make logs             - コンテナのログを表示"
	@echo "  make clean            - コンテナとボリュームを削除"
	@echo "  make db-create        - データベースを作成"
	@echo "  make db-migrate       - マイグレーションを実行"
	@echo "  make db-reset         - データベースをリセット"
	@echo "  make bundle-install   - bundle installを実行"
	@echo "  make rails-console    - Railsコンソールを起動"

# Dockerイメージをビルド
build:
	docker-compose build

# コンテナを起動（バックグラウンド）
up:
	docker-compose up -d

# コンテナを停止・削除
down:
	docker-compose down

# コンテナを再起動
restart: down up

# webコンテナに入る
shell:
	docker-compose exec web /bin/bash

# コンテナのログを表示
logs:
	docker-compose logs -f

# コンテナとボリュームを削除（データも削除される）
clean:
	docker-compose down -v

# データベースを作成
db-create:
	docker-compose exec web rails db:create

# マイグレーションを実行
db-migrate:
	docker-compose exec web rails db:migrate

# データベースをリセット
db-reset:
	docker-compose exec web rails db:reset

# bundle installを実行
bundle-install:
	docker-compose run --no-deps web bundle install

# Railsコンソールを起動
rails-console:
	docker-compose exec web rails console
