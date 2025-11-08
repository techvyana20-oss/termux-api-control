#!/usr/bin/env bash
# install_termuxapi.sh (Final User-Input Version)
set -e
echo "Installing Termux-API Toolkit dependencies..."
pkg update -y && pkg upgrade -y
pkg install -y git python curl jq zip termux-api

# create project folder
DIR="$HOME/termuxapi_toolkit"
mkdir -p "$DIR"
echo "[*] Creating toolkit in $DIR"

# main menu script
cat > "$DIR/termuxapi_toolkit.sh" <<'TOOL'
#!/usr/bin/env bash
# termuxapi_toolkit.sh - Termux:API demo toolkit
DIR="$(cd "$(dirname "$0")" && pwd)"
OUTROOT="$HOME/TermuxAPI_Reports"
OUTDIR="$OUTROOT/$(date +%F_%H%M%S)"
mkdir -p "$OUTDIR"

function pause(){ read -p "Press ENTER to continue..."; }

function send_to_telegram(){
  echo "=============================="
  echo "📤 Send Report to Telegram"
  echo "=============================="
  read -p "Enter your Telegram Bot Token: " BOT_TOKEN
  read -p "Enter your Telegram Chat ID: " CHAT_ID

  LATEST=$(ls -dt $OUTROOT/*/ 2>/dev/null | head -n1)
  ZIPFILE="$OUTROOT/latest_report.zip"

  if [ -z "$LATEST" ]; then
    echo "❌ No reports found in $OUTROOT"
    echo "Run the toolkit first to create one."
    pause
    return
  fi

  echo "[*] Zipping latest report..."
  cd "$OUTROOT"
  zip -r "$ZIPFILE" "$(basename "$LATEST")" >/dev/null

  echo "[*] Sending report to Telegram..."
  curl -s -F chat_id="$CHAT_ID" \
       -F document=@"$ZIPFILE" \
       "https://api.telegram.org/bot${BOT_TOKEN}/sendDocument" >/dev/null \
  && echo "✅ Report sent successfully!" \
  || echo "❌ Failed to send. Check BOT_TOKEN or CHAT_ID."
  pause
}

while true; do
  clear
  echo "=============================="
  echo "  Termux-API Toolkit - Demo"
  echo "=============================="
  echo "1) Battery info"
  echo "2) Location (🚧 Coming Soon)"
  echo "3) Take a photo (camera)"
  echo "4) Record audio (mic)"
  echo "5) Text-to-Speech (TTS)"
  echo "6) Speech-to-Text (STT)"
  echo "7) Send SMS (test only)"
  echo "8) Show contacts (🚧 Coming Soon)"
  echo "9) Create notification"
  echo "10) Vibrate phone (🚧 Coming Soon)"
  echo "11) Open URL in browser"
  echo "12) Get clipboard"
  echo "13) 📤 Send latest report to Telegram"
  echo "14) Exit"
  echo ""
  read -p "Choice [1-14]: " c
  case $c in
    1)
      echo "[*] Battery status:"
      termux-battery-status | jq . | tee "$OUTDIR/battery.json"
      pause ;;
    2)
      echo "🚧 Location feature coming soon..."
      pause ;;
    3)
      echo "[*] Taking photo (camera)..."
      F="$OUTDIR/photo_$(date +%s).jpg"
      termux-camera-photo -c 0 "$F" && echo "Saved: $F"
      pause ;;
    4)
      echo "[*] Recording 8s audio (mic)..."
      F="$OUTDIR/rec_$(date +%s).3gp"
      termux-microphone-record -l 8 -o "$F" && echo "Saved: $F"
      pause ;;
    5)
      read -p "Enter text to speak: " T
      termux-tts-speak "$T"
      echo "Spoken: $T"
      pause ;;
    6)
      echo "[*] Listening (speech-to-text)... Speak now."
      termux-speech-to-text > "$OUTDIR/stt_$(date +%s).txt"
      echo "Captured:"
      cat "$OUTDIR/"*.txt
      pause ;;
    7)
      read -p "Enter destination phone number (with country code): " NUM
      read -p "Enter message text: " MSG
      echo "[!] Sending SMS to $NUM (test only)"
      termux-sms-send -n "$NUM" "$MSG"
      echo "Sent (may be logged on device)."
      pause ;;
    8)
      echo "🚧 Contacts feature coming soon..."
      pause ;;
    9)
      read -p "Notification title: " NT
      read -p "Notification text: " NX
      termux-notification --title "$NT" --content "$NX" --id 1
      echo "Notification created"
      pause ;;
    10)
      echo "🚧 Vibrate feature coming soon..."
      pause ;;
    11)
      read -p "URL to open (http...): " URL
      termux-open-url "$URL"
      echo "Opened $URL"
      pause ;;
    12)
      echo "[*] Clipboard text:"
      termux-clipboard-get | tee "$OUTDIR/clipboard.txt"
      pause ;;
    13)
      send_to_telegram ;;
    14)
      echo "👋 Goodbye."
      exit 0 ;;
    *)
      echo "Invalid option."
      sleep 1 ;;
  esac
done
TOOL

chmod +x "$DIR/termuxapi_toolkit.sh"

echo ""
echo "✅ Installation complete!"
echo "👉 Run your toolkit using:"
echo "   $DIR/termuxapi_toolkit.sh"
