# This is FastCGI MovableType Docker Environment

## 事前準備

1. `.env.example`を`.env`にコピーする
1. MovableType の zip ファイルを`cgi-bin`で解凍する
1. 解凍された`cgi-bin/MT*`ディレクトリを`cgi-bin/mt`にリネームする
1. `docker/web/mt-config.cgi`を`cgi-bin/mt/mt-config.cgi`にコピーする

## docker ビルド & ラン

コマンド実行

```
# docker image ビルド
docker compose build --no-cache

# docker container 起動
docker compose up -d
```

## web アクセス

http://localhost:8080/mt/

## mailhog アクセス

http://localhost:8025

## 不具合について

### cgi の実行権限がない場合

web にアクセスした時 500 エラーが出るのでコマンドを実行して権限を編集する

```
# login docker container
docker exec --interactive --tty web bash

# change file permission
chmod 775 /var/www/cgi-bin
chmod 755 /var/www/cgi-bin/mt
chmod 755 /var/www/cgi-bin/mt/mt-*.cgi
chmod 766 /var/www/html
```

## Directory 説明

```
/root
├ /cgi-bin	# web の /var/www/cgi-bin にマウントしてる. mt ファイルを置いとくところ.
├ /html	# web の /var/www/html にマウントしてる. mt の html 出力ディレクトリかつ Web ルート.
└ /docker	# docker コンテナ立ち上げ時に必要なファイル群
	├ /web	# Dockerfile, apache 設定ファイル
	├ /mailhog	# mailhog の /tmp にマウントしてる. mailhogの永続化
	└ /db	# db の /var/lib/mysql にマウントしてる. データベースのデータ永続化のため.
```
