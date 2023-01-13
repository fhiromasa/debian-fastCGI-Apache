# This is FastCGI MovableType Docker Environment

## 事前準備

1. `.env.example`を`.env`にコピーする
1. MovableType の zip ファイルを`cgi-bin`で解凍する
1. 解凍された`cgi-bin/MT*`ディレクトリを`cgi-bin/mt`にリネームする
1. `docker/web/mt-config.cgi`を`cgi-bin/mt/mt-config.cgi`にコピーする

## docker ビルド & ラン

コマンド実行

```
docker compose up -d --build
```

## web アクセス

http://localhost:8080/mt/

## mailhog アクセス

http://localhost:8025

## Directory 説明

```
/root
├ /cgi-bin # /var/www/cgi-bin にマウントしてる. mt ファイルを置いとくところ.
├ /html    # /var/www/html にマウントしてる. mt の html 出力ディレクトリかつ Web ルート.
└ /docker  # docker コンテナ立ち上げ時に必要なファイル群
	├ /web   # Dockerfile, apache 設定ファイル
	└ /db    # DB のデータ永続化
```
