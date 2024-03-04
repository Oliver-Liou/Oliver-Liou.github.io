---
layout: post
title: Telegram Bot
date: 2023-10-19
description: 如何建立 Telegram Bot 並透過 Node.js 使用
tags: [Message , Node.js]
cover: 'assets/images/Telegram-Coin-Logo.jpg'
last_modified_at: 2024-02-17
--- 

## 使用 BotFather 建立 Telegram Bot
- 打開 Telegram，在搜尋框輸入 @BotFather，點擊第一項的搜尋結果。  
    ![BotFather](https://hackmd.io/_uploads/Bk5linasp.png)  

- 輸入 /start 會出現支援的指令說明。  
    ![start](https://hackmd.io/_uploads/rJ1_nhToa.png)  

- 輸入 /newbot 建立機器人。  
    ![newbot](https://hackmd.io/_uploads/SJ_Manpsa.png)  
    
- 輸入機器人的名稱  

    - 必須以bot結尾。  
    ![命名規則1](https://hackmd.io/_uploads/ByN41TTsp.png)  
	
    - 若有人重複使用會請你重新設置。  
    ![命名規則2](https://hackmd.io/_uploads/B13E1pTj6.png)  
	

- 創建成功會取得 **機器人名稱** & **token**。  
    ![Done](https://hackmd.io/_uploads/rJkie6Ti6.png)  

- 在 Telegram 搜尋機器人就可以找到你所創建的機器人。  

## 獲取群組ID的方法
- 首先需要將創建好的機器人加入聊天群組。  

- 在瀏覽器中輸入 https://api.telegram.org/bot[your_token]/getUpdates  
    - [your_token] 改為在創建時獲得的token  

- 會回傳一段 JSON。  
    - "chat" object 中 group_ID 即是群組的 ChatID  
```
{
	"update_id":8393,
	"message":
    {
			"message_id":3,
			"from":{"id":7474,"first_name":"AAA"},
			"chat":{"id":<group_ID>,"title":""},
			"date":25497,
			"new_chat_participant":{"id":71,"first_name":"Name","username":"YourBotName"}
    }
}
```
    - If you created the new group with the bot and you only get {“ok”:true,“result”:[]}。  
```
{
	"ok": true,
    "result": []
}
```
    - remove and add the bot again to the group。  
    

## Node.js Coding
- 建立一個資料夾名為【nodejsbot】，然後在命令行介面使用 cd 指令進入該資料夾

	```	js
	$ cd nodejsbot
	```
- npm 指令作初始化，這會自動建立一個 package.json 方便管理 npm 的 library 。過程中不停按 Enter 即可。
	``` js
		npm init
	```
- 安裝Telegram Bot API 程式庫
	``` js
		npm install node-telegram-bot-api --save

		or

		npm install --save-dev @types/node-telegram-bot-api
	```
    
- 在程式中應用  

	``` js
	var TelegramBot = require('node-telegram-bot-api');
	var token = '(your_token)';
	var groupId = '(your_groupId)' ;
	//括號裡面的內容需要改為獲得的Token與groupId
	var bot = new TelegramBot(token, {polling: true});
	//使用Long Polling的方式與Telegram伺服器建立連線
	//收到Start訊息時會觸發這段程式
	bot.onText(/\/start/, function (msg) {
		var chatId = msg.chat.id; //用戶的ID
		var resp = '你好'; //括號裡面的為回應內容，可以隨意更改
		bot.sendMessage(chatId, resp); //發送訊息的function
	});
	
	//收到/cal開頭的訊息時會觸發這段程式
	bot.onText(/\/cal (.+)/, function (msg, match) {
		var fromId = msg.from.id; //用戶的ID
		var resp = match[1].replace(/[^-()\d/*+.]/g, '');
		// match[1]的意思是 /cal 後面的所有內容
		resp = '計算結果為: ' + eval(resp);
		// eval是用作執行計算的function
		bot.sendMessage(fromId, resp); //發送訊息的function
	});

	setInterval(() => {
		bot.sendMessage( groupId, "加薪可不可以" ); //發送訊息的function
		console.log("Salary Up Up!");
	}, 5000);
	```

## 參考資料 
- [Node.js Telegram Bot API](https://github.com/yagop/node-telegram-bot-api)  
- [API Reference](https://github.com/yagop/node-telegram-bot-api/blob/master/doc/api.md)  
