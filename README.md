# TechVyana-TermuxToolkit

Build Your Own OSINT & Termux API Toolkit 🔍

In this project, learn how to create your own Termux-powered toolkit — combining OSINT tools, Termux API features, and Telegram automation!

## 🚀 Features
- Gather information using OSINT tools (theHarvester, Sherlock, Holehe)
- Run device controls via Termux API (Battery, Camera, SMS, etc.)
- Automatically zip and send reports to Telegram
- Beautiful menu interface in shell
- Lightweight and beginner-friendly

## ⚙️ Installation
```bash
pkg update -y && pkg upgrade -y
pkg install -y git curl zip termux-api
git clone https://github.com/TechVyana/TechVyana-TermuxToolkit
cd TechVyana-TermuxToolkit
chmod +x install.sh
bash install.sh
```

## 📡 Send Reports to Telegram
Edit `send_report_to_telegram.sh` with your bot token and chat ID:
```bash
BOT_TOKEN="your_bot_token_here"
CHAT_ID="your_chat_id_here"
bash send_report_to_telegram.sh
```

## 🧠 Coming Soon
- Location tracking via Termux API
- Contact listing
- Device vibration control

## ⚠️ Disclaimer
This toolkit is for **educational purposes only**. The author is not responsible for misuse or damage caused by this tool.

---
👨‍💻 Created by **Tech Vyana**
📢 Telegram: [t.me/TechVyana2_0](https://t.me/TechVyana2_0)
