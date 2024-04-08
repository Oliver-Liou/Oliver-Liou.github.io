---
layout: post
title: 生成 SSH Key 並設定連結 Git
keywords: [Git, SSH, SSH Key]
date: 2024-03-20
subtitle: How to generate the ssh key and using it to clone the git repository.
description: How to generate the ssh key and using it to clone the git repository.
author: Oliver Liu
banner:
    image: 'assets/images/SSH-Key-link-git-Logo.png'
    opacity: 0.9
image: 'assets/images/SSH-Key-link-git-Logo.png'
categories: markdown
tags: [Git, SSH]
last_modified_at: 2024-03-20
--- 


## 生成電腦 SSH 金鑰
### windows系統
- 打開 **cmd** 輸入下方指令查看有沒有ssh鑰匙檔。
    ![sourcetree_ssh_setting11](https://hackmd.io/_uploads/ryaKly_Ra.png)

	```
	cd %HOMEPATH%
	dir .ssh
	```
	or
	        
	```
	dir %HOMEDRIVE%%HOMEPATH%\.ssh
	```

- 若金鑰不存在就打下列的指令生成ssh密鑰。
	```
	ssh-keygen -t rsa -C "your_emial@examle.com"
	```
    "your_emial@examle.com" 輸入你的git帳號。

- 接下來只要 Enter 保持預設值即可。

- 生成完畢後會在 userpath/.ssh 中生成SSH Key。
    - id_rsa 為密鑰。
    - id_rsa.pub 為公鑰。

### linux系統/Sourcetree
- 打開**Terminal** 
![sourcetree_ssh_setting9](https://hackmd.io/_uploads/H1ZbRCwR6.png)


- 鍵入下方指令查看有沒有ssh鑰匙檔。
![sourcetree_ssh_setting10](https://hackmd.io/_uploads/HkbqA0vRT.png)
	```
	ls -al ~/.ssh
	```

- 若金鑰不存在就打下列的指令生成ssh密鑰。
	```
	ssh-keygen -t rsa -C "your_emial@examle.com"
	```
    "your_emial@examle.com" 輸入你的git帳號。

- 接下來只要 Enter 保持預設值即可。

- 生成完畢後會在 userpath/.ssh 中生成SSH Key。
    - id_rsa 為密鑰。
    - id_rsa.pub 為公鑰。

## 設定金鑰

### Sourcetree
- Tools -> **Options** 開啟設定。
![sourcetree_ssh_setting1](https://hackmd.io/_uploads/H1AgFpPR6.png)

- 在 General 中設定 **SSH Client Configuration** 內容。
    - SSH Key 選擇電腦所產出的ssh密鑰id_rsa。
    - SSH Client 選擇OpenSSH作為連接方式。
![sourcetree_ssh_setting2](https://hackmd.io/_uploads/H1_ZF6vRT.png)
- 設定完畢點及右下方OK即可完成設定。

### Gitlab

- 點選使用者圖示選擇 Edit profile 進入編輯個人資料的畫面。
![sourcetree_ssh_setting3](https://hackmd.io/_uploads/rkV5naPAa.png)

- 選擇 SSH Keys 點擊 Add new key 新增 SSH Key 公鑰。
![sourcetree_ssh_setting4](https://hackmd.io/_uploads/SJ-xMJ_RT.png)


- 輸入鑰新增 SSH Key 的資訊。
    - Key 貼上 id_rsa.pub 的文字。
    - Title 可輸入這個 SSH Key 的名子，例如 Company PC Key。
    - Usage type 這邊使用預設驗證與登入用。
    - Expiration date 此組 SSH Key 的有效期限，可以設置為空變更為無期限。
![sourcetree_ssh_setting5](https://hackmd.io/_uploads/rJZqM0P0p.png)

- 輸入完成後按下 Add key 即可完成新增。

## Clone Repo 到本地
這邊使用 Sourcetree 進行操作。

### 取得SSH Url
#### Gitlab
- 到專案中點擊 Code 複製 Clone with SSH 中的 Url。
![sourcetree_ssh_setting6](https://hackmd.io/_uploads/rkjt_CvCp.png)

### Clone

- 打開 Sourcetree 點選 Clone 後，將 SSH Url 貼上。
![sourcetree_ssh_setting7](https://hackmd.io/_uploads/HyyUoCvRa.png)

- 貼上 SSH Url 後點選旁邊空白處會自動完成所有欄位，等待 Clone 亮起並點選即可完成Clone。
![sourcetree_ssh_setting8](https://hackmd.io/_uploads/HJTIjRPAT.png)
- 恭喜你完成上面幾點操作後，在此 Clone 的專案可以不用登入 Git 並進行 Git 相關操作！

![8-1.thumb128]({{ site.baseurl }}/assets/images/post/Git-SSH-setting/8-1.thumb128.png)

