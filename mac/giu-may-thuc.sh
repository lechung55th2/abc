#!/bin/bash
# Keeps the Mac mini from sleeping (display may still turn off) so the bots run 24/7. No sudo.
# Run once on the Mac: bash mac/giu-may-thuc.sh   Undo: bash mac/giu-may-thuc.sh go
set -e
PLIST="$HOME/Library/LaunchAgents/com.chung.nosleep.plist"
DOMAIN="gui/$(id -u)"

if [ "$1" = "go" ]; then
  launchctl bootout "$DOMAIN" "$PLIST" 2>/dev/null || true
  rm -f "$PLIST"
  echo "Da go lenh chong ngu."
  exit 0
fi

mkdir -p "$(dirname "$PLIST")"
cat > "$PLIST" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key><string>com.chung.nosleep</string>
  <key>ProgramArguments</key>
  <array><string>/usr/bin/caffeinate</string><string>-is</string></array>
  <key>RunAtLoad</key><true/>
  <key>KeepAlive</key><true/>
</dict>
</plist>
EOF
launchctl bootout "$DOMAIN" "$PLIST" 2>/dev/null || true
launchctl bootstrap "$DOMAIN" "$PLIST"
sleep 1
if pmset -g assertions | grep -qi caffeinate; then
  echo "OK: may se khong tu ngu nua (man hinh van tat duoc)."
else
  echo "LOI: caffeinate chua chay, xem: launchctl print $DOMAIN/com.chung.nosleep" >&2
  exit 1
fi
