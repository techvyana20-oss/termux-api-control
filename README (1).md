# TechVyana2.0 — Termux Toolkit (Improved README)

> **Build your own OSINT & Termux API Toolkit** — a lightweight, beginner-friendly toolkit that combines OSINT utilities, Termux API features and Telegram automation to collect data, create reports, and send them automatically.

## 🚀 Features
- 🔎 **OSINT tools**: integrations with tools like `theHarvester`, `Sherlock`, `Holehe` (where available).
- 📱 **Termux API controls**: access device features (battery status, camera, SMS, etc.).
- 🤖 **Telegram automation**: zip reports and send them to a Telegram chat or channel automatically.
- 🧭 **Simple menu-driven shell interface**: easy to use from Termux.
- ⚖️ **Lightweight & beginner-friendly**: designed to run on Termux without heavy dependencies.

## ⚠️ Disclaimer
This toolkit is for **educational and authorized testing purposes only**. Misuse may be illegal. You are solely responsible for your actions.

## 📦 Requirements
- Termux (Android)
- termux-api package
- git, curl, zip
- Optional OSINT tools depending on usage

## ⚙️ Installation

```bash
pkg update -y && pkg upgrade -y
pkg install -y git curl zip termux-api

git clone https://github.com/techvyana20-oss/termux-api-control.git
cd termux-api-control

chmod +x install.sh
bash install.sh
```

Launch:
```bash
bash ~/termuxapi_toolkit/termuxapi_toolkit.sh
```

Optional shortcut:
```bash
echo 'alias toolkit="bash ~/termuxapi_toolkit/termuxapi_toolkit.sh"' >> ~/.bashrc
source ~/.bashrc
toolkit
```

## 🤖 Telegram Configuration
Edit:
```bash
nano ~/termuxapi_toolkit/config.cfg
```
Add:
```
TELEGRAM_BOT_TOKEN="YOUR_BOT_TOKEN"
TELEGRAM_CHAT_ID="YOUR_CHAT_ID"
```

## 🔜 Coming Soon
- Location tracking (legal & authorized use only)
- Contact listing export
- Device vibration / control options

## 👨‍💻 Author
**Tech Vyana 2.0**  
Telegram: https://t.me/TechVyana2_0
