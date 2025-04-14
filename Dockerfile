FROM debian:bullseye

# cowsay と fortune-mod をインストール（fortunes は fortune-mod に置き換え）
RUN apt-get update && apt-get install -y \
    cowsay \
    fortune-mod \
    && ln -s /usr/games/fortune /usr/bin/fortune \
    && ln -s /usr/games/cowsay /usr/bin/cowsay

# 実行時に fortune を cowsay で表示
CMD ["bash", "-c", "fortune | cowsay"]
