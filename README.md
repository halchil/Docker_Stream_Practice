# はじめに
ストリームリストを作成する

Udemy 【コンテナの実行方法を学び、Ruby on RailsやDjangoといったWebアプリケーションフレームワークを使用した環境構築について学びます。】

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
