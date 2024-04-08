---
layout: post
title: Quasar CLI App with Vite
keywords: [Quasar CLI, Quasar, Node, NVM, NPM]
date: 2024-04-07
subtitle: How to generate the Quasar CLI App with Vite project by Node.
description: How to generate the Quasar CLI App with Vite project by Node.
author: Oliver Liu
banner:
    image: 'assets/images/Quasar_logo.svg'
    opacity: 0.9
image: 'assets/images/Quasar_logo.svg'
categories: Quasar
tags: [Quasar, Node, NVM, NPM]
last_modified_at: 2024-04-07
--- 

## 安裝 NVM 、 NPM
### NVM
**NVM** 是 **Node** 版本安裝/切換工具， [NVM](https://github.com/nvm-sh/nvm) 有提供各種系統的安裝方法，本文以 **Window** 作為開發系統 ，可至 [NVM for Windows](https://github.com/coreybutler/nvm-windows) 進行下載安裝。
- 至 NVM for Windows 網頁後選擇 Download Now!
![NVM安裝1](https://hackmd.io/_uploads/rko68klgA.png)
- 在要下載的版本中選擇 nvm-setup.exe 。
![NVM安裝2](https://hackmd.io/_uploads/B1FgwylgR.png)
- 下載完成後點選 nvm-setup.exe 即可開始安裝。
    - 若存在已安裝的 Node 會確認是否讓 NVM 進行版本控制，這邊選擇是。
    ![NVM安裝3](https://hackmd.io/_uploads/S177dkxeR.png)
    - 出現此畫面代表安裝完成。
    ![NVM安裝4](https://hackmd.io/_uploads/ry8QdJxxA.png)
    - 可在Terminal中下 `nvm -v` 指令確認已安裝的 NVM 版本。
    ![NVM安裝5](https://hackmd.io/_uploads/Bklke91ex0.png)

### NPM
**NPM** 是 **Node Package manager** 的簡稱，是管理 **Node** 套件的工具。
- `nvm list` 確認已安裝的 Node版本。
![NPM安裝1](https://hackmd.io/_uploads/SkXMo1leA.png)
- `nvm install <version>` \<version\> 替換為要安裝的版本號。
![NPM安裝2](https://hackmd.io/_uploads/BJ-o3kgeA.png)
- 輸入 `nvm use 16.20.2` 指令即可將 Node 版本切換為 16.20.2 並輸入  `node -v` 即可確認當前的 Node 版本號。
![NPM安裝3](https://hackmd.io/_uploads/SJHCTyllC.png)

---

## 建置專案

使用 npm 進行 quasar 建置。
- 移至要建立專案的PATH後初始化 quasar。
```terminal
  npm init quasar
```
- 出現下面指示按Enter。
```terminal
  Need to install the following packages:
  create-quasar@1.8.2
  Ok to proceed? (y)
```
![Quasar安裝細節1](https://hackmd.io/_uploads/rygnbeelC.png)

### 建置設定細節
出現建置設定讓使用者進行選擇。
- 相關設定示意圖。
![quasarbuild建置所有設定](https://hackmd.io/_uploads/rysmcwZJC.png)

- What would you like to build?: 
    - App with Quasar CLI, let's go!
    ![Quasar安裝細節2](https://hackmd.io/_uploads/BJXDzlexR.png)
- Project folder: 
    - quasar-test
    ![Quasar安裝細節3](https://hackmd.io/_uploads/SkG_zgelR.png)
- Pick Quasar version: 
    - Quasar v2 (Vue 3 I latest and greatest)
    ![Quasar安裝細節4](https://hackmd.io/_uploads/Hk9Ofgee0.png)
- Pick script type: 
    - Javascript
    ![Quasar安裝細節5](https://hackmd.io/_uploads/H1HoGgxxA.png)
- Pick Quasar App CLI variant: 
    - Quasar App CLI with Vite 2 (stable | v1)
    ![Quasar安裝細節6](https://hackmd.io/_uploads/BJ6WXgexR.png)
- Package name: 
    - quasar-test
    ![Quasar安裝細節7](https://hackmd.io/_uploads/ByCIQxgeC.png)
- Project product name:(must start with letter if building mobile apps)
    - Quasar Test App
    ![Quasar安裝細節8](https://hackmd.io/_uploads/ryvwVeelA.png)
- Project description: 
    - Quasar Test System
    ![Quasar安裝細節9](https://hackmd.io/_uploads/S1dpVxxeA.png)
- Author: 
    - OliverLiu <yancheng199906@gmail.com>
    ![Quasar安裝細節10](https://hackmd.io/_uploads/ryPbreggC.png)
- Pick a Vue component style: 
    - Composition API with \<script setup\>
    ![Quasar安裝細節11](https://hackmd.io/_uploads/r1hHBglxC.png)
- Pick your CSS preprocessor: 
    - Sass with SCSS syntax
    ![Quasar安裝細節12](https://hackmd.io/_uploads/SJGjreelC.png)
- Check the features needed for your project: vue-i18n 為導入多國語言
    - Linting (vite-plugin-checker + ESLint), State Management (Pinia), axios
    ![Quasar安裝細節13](https://hackmd.io/_uploads/Hkgu98gll0.png)
- Pick an ESLint preset:
    - Prettier
    ![Quasar安裝細節14](https://hackmd.io/_uploads/ryugwgxxR.png)
- Install project dependencies? 
    - (recommended) , Yes, use npm
    ![Quasar安裝細節15](https://hackmd.io/_uploads/SyGFPegeA.png)

- 出現以下畫面表示建置完成，若有版本更新也會顯示於 npm notice ，再依據顯示進行操作即可！
![Quasar安裝細節16](https://hackmd.io/_uploads/HkSyYeee0.png)



## 新增tailwindcss

- 打開CMD並移到專案的path中輸入下列指令安裝 tailwindcss
    ```terminal
    npm install -D tailwindcss postcss autoprefixer
    ```
    ![quasartailwindcss安裝1](https://hackmd.io/_uploads/SkZLVUtJC.png)

- 安裝完畢後輸入下方指令會生成config檔
    ```terminal
    npx tailwindcss init -p
    ```
    ![quasartailwindcss安裝2](https://hackmd.io/_uploads/rJxaX8YJR.png)

- 新增 tailwind.config.js 中 content 的路徑來應用tailwind
    ``` js
    content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx,vue}"],
    ``` 
    ![quasartailwindcss安裝3](https://hackmd.io/_uploads/Bk_KrLtJR.png)
- 新增 postcss.config.js 內容，可將 postcss.config.cjs 的 plugins 複製過來做更改並導入 tailwindcss
    ```js
    module.exports = {
      plugins: [
        require("autoprefixer")({
          overrideBrowserslist: [
            "last 4 Chrome versions",
            "last 4 Firefox versions",
            "last 4 Edge versions",
            "last 4 Safari versions",
            "last 4 Android versions",
            "last 4 ChromeAndroid versions",
            "last 4 FirefoxAndroid versions",
            "last 4 iOS versions",
          ],
        }),
        require("tailwindcss"),
      ],
    };
    ```
    ![quasartailwindcss安裝4](https://hackmd.io/_uploads/rkSu8IKk0.png)
- 完成後即可在專案./src/pages/*Page.vue 中使用 tailwindcss
    ![quasartailwindcss安裝5](https://hackmd.io/_uploads/r197u8Kk0.png)
    ![quasartailwindcss安裝6](https://hackmd.io/_uploads/SkDx_UFJR.png)


## Reference 
- [NVM](https://github.com/nvm-sh/nvm)
- [NVM for Windows](https://github.com/coreybutler/nvm-windows)
- [Quasar CLI \| Quasar Framework](https://quasar.dev/start/quasar-cli/#installation-project-scaffolding)
