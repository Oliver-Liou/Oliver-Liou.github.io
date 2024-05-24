---
layout: post
title: Docker Compose 安裝與操作(Linux)
keywords: [Docker, Docker Compose, docker-compose, 安裝, 操作, Linux]
date: 2024-05-24
subtitle: 如何在 Linux 中使用 Docker Compose 進行部屬 Docker。
description: 如何在 Linux 中使用 Docker Compose 進行部屬 Docker。
author: Oliver Liu
banner:
    image: 'assets/images/docker-icon.png'
    opacity: 0.9
image: 'assets/images/docker-icon.png'
categories: Docker
tags: [Docker, Docker Compose]
last_modified_at: 2024-05-24
--- 


## 安裝

- 首先，確保你安裝了 curl：
```sh
sudo apt-get update
sudo apt-get install -y curl
```
- 下載並安裝 Docker Compose：
```sh
sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```
- 為了確保 Docker Compose 命令可以被系統識別並執行，請將 /usr/local/bin 目錄加入到你的 PATH 環境變數中（如果它還沒有添加）：
- 編輯你的 shell 設定檔（如 .bashrc 或 .bash_profile）並新增以下行：
```sh
export PATH=/usr/local/bin:$PATH
```
- 重新載入 shell 設定檔：
```sh
source ~/.bashrc
# 或者
source ~/.bash_profile
```

- 驗證 Docker Compose 是否安裝成功：
```sh
sudo docker-compose --version
```

## 範例
建立以下設定檔為參考用範例並將網頁檔放入，如/dist/spa。
- 建立 docker-compose.yml:

```yml
version: '3'

services:
  frontend:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8087:80"
    restart: always
    volumes:
      - ./dist/spa:/app # 選擇要讀取的位置，可更新後直接重啟
```

- 建立 Dockerfile:

```Dockerfile
FROM nginx

RUN mkdir -p /app
COPY nginx.conf /etc/nginx/nginx.conf
```

-  建立 nginx.conf:

```nginx
worker_processes 1;

events { 
    worker_connections 1024; 
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    sendfile        on;
    keepalive_timeout  65;

    server {
        listen       80;
        server_name  localhost;

        location / {
            root   /app;
            index  index.html index.htm;
        }

        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   /usr/share/nginx/html;
        }
    }
}
```

## 執行
- 至專案路徑中輸入下方指令：

```sh
 sudo docker-compose up --build
```

## 重啟
- 至專案路徑中輸入下方指令，即可重啟容器：

```sh
sudo docker-compose restart
```

## Docker開機自動啟動

```sh
sudo systemctl enable docker
```

## 管理 Docker 容器

- 進入執行中的 Docker 容器：
    - -i: 進入互動模式(interaactive)，讓 Container 的標準輸入保持打開
    - -t: 配置一個虛擬終端(pseudo-tty)並綁定到 Container 上

```sh
docker exec -it <containerName> bash
docker exec -it <containerName> /bin/bash

# 有些 Image 使用 Alpine Linux，可能沒有 bash，改用 sh
docker exec -it <containerName> /bin/sh
```
- 退出只需輸入 `exit` 。

## 清除沒有執行的 Container、Image 、Network 和 Cache
Options :
- --all , -a : 刪除所有停止的 Container、Image、Network
- --force, -f : 強制刪除不跳出確認提醒
- --volumes : 刪除 Volume
- --filter : 刪除指定 label 的 Container、Image、Network、Volume

```sh
docker system prune <options>
```



## References
- [Docker-compose 安裝](https://hackmd.io/@jimmy801/docker_compose_install)
- [Docker基本操作](https://hackmd.io/@tienyulin/docker2)
