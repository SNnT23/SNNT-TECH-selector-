#!/bin/bash

# ===========================================
# Script Name    : snnttech Selector
# Author         : snnttech
# Description    : ကိုယ်ပိုင် tool/vpn selector
# ===========================================

clear
echo "================================"
echo "     snnttech SELECTOR v1.0     "
echo "================================"
echo "1) OpenVPN ချိတ်ဆက်ရန်"
echo "2) SSH ဆက်သွယ်ရန်"
echo "3) System သတင်းအချက်အလက်"
echo "4) Ping စစ်ဆေးရန်"
echo "5) Exit"
echo "================================"
read -p "ကျေးဇူးပြု၍ ရွေးချယ်ပါ (1-5): " choice

case $choice in
    1)
        echo "OpenVPN ချိတ်ဆက်ရန် config ထည့်ပါ..."
        read -p "Config file path: " config_path
        sudo openvpn --config "$config_path"
        ;;
    2)
        read -p "SSH server IP: " ssh_ip
        read -p "Username: " ssh_user
        ssh "$ssh_user@$ssh_ip"
        ;;
    3)
        echo "=== System Info ==="
        echo "Uptime: $(uptime)"
        echo "Memory: $(free -h)"
        echo "Disk: $(df -h)"
        ;;
    4)
        read -p "IP or Domain to ping: " target
        ping -c 4 "$target"
        ;;
    5)
        echo "Exiting... ကျေးဇူးတင်ပါတယ်။"
        exit 0
        ;;
    *)
        echo "မှားယွင်းသော ရွေးချယ်မှုပါ။ ကျေးဇူးပြု၍ ပြန်ရွေးပါ။"
        ;;
esac