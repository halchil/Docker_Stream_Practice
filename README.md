# はじめに
ストリームリストを作成する

Udemy 【コンテナの実行方法を学び、Ruby on RailsやDjangoといったWebアプリケーションフレームワークを使用した環境構築について学びます。】

事前準備として、GitHubにpushするための設定を行う。
GitHubの認証情報を永続的に保存する

```
git config --global credential.helper store
```

その後、1回 git push をしてアカウント名と [パーソナルアクセストークン（PAT）] を入力すると、~/.git-credentials に保存されて、以後は聞かれなくなります。

# 26. walesayコンテナの実行
walesayコンテナは非推奨だったので、Pythonのコマンドで代替

docker run --rm python bash -c 'pip install cowsay && python3 -m cowsay -t "Hello!"'

docker run python bash -c 'python3 --version'
Python 3.13.3
mainte@dev-machine:~$ docker run python bash -c 'pip list'
Package Version

# 28.Dockerイメージの管理
docker images
タグ付け
```
docker tag [元のイメージ名] [新しいイメージ名]
```
```
docker inspect [イメージ名]
```
```
docker rmi [イメージ名]
```
タグの名称を指定した場合は、untagされる

```
docker pull [イメージ名]
```
※タグ名を省略した場合は、latestタグが取得される。ただし、最新のイメージにlatestというタグが付いているとは限らない

# 30.Dockerfile
まずは、作業環境の用意から、
GitHubリポジトリ作成
clone
vscode接続  ssh [user名]@xxx.xxx.xxx.xxx
dockerfile

```
FROM debian:bullseye

# cowsay と fortune-mod をインストール（fortunes は fortune-mod に置き換え）
RUN apt-get update && apt-get install -y \
    cowsay \
    fortune-mod \
    && ln -s /usr/games/fortune /usr/bin/fortune \
    && ln -s /usr/games/cowsay /usr/bin/cowsay

# 実行時に fortune を cowsay で表示
CMD ["bash", "-c", "fortune | cowsay"]

```

自分で打つ。
```
docker build -t fortune-cow .
```
-t fortune-cow     # このイメージに「fortune-cow」という名前（タグ）をつける

.  # Dockerfile がある場所を指定（ここではカレントディレクトリ）


/usr/games/ にインストールされることがあるので、/usr/bin/ にシンボリックリンクを貼ってます（PATHに入ってない可能性がある）。

CMD を ["bash", "-c", "fortune | cowsay"] という JSON形式 にすることで、警告（JSONArgsRecommended）も解消。