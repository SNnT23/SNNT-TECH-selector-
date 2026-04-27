#!/bin/bash

# ==================================================
# ███████╗███╗   ██╗███╗   ██╗████████╗████████╗███████╗ ██████╗██╗  ██╗
# ██╔════╝████╗  ██║████╗  ██║╚══██╔══╝╚══██╔══╝██╔════╝██╔════╝██║  ██║
# ███████╗██╔██╗ ██║██╔██╗ ██║   ██║      ██║   █████╗  ██║     ███████║
# ╚════██║██║╚██╗██║██║╚██╗██║   ██║      ██║   ██╔══╝  ██║     ██╔══██║
# ███████║██║ ╚████║██║ ╚████║   ██║      ██║   ██║     ╚██████╗██║  ██║
# ╚══════╝╚═╝  ╚═══╝╚═╝  ╚═══╝   ╚═╝      ╚═╝   ╚═╝      ╚═════╝╚═╝  ╚═╝
# ==================================================
# Script Name    : snnttech Ultimate Selector
# Author         : snnttech
# Version        : 1.0
# Description    : V2Ray, Xray, MTProto, Bot, Backup, Docker, 3x-ui Manager
# ==================================================

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Root check function
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "${RED}❌ ဒီ command ကို root user နဲ့မှ သုံးလို့ရပါတယ်။${NC}"
        exit 1
    fi
}

# Main menu
show_menu() {
    clear
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║         s n n t t e c h   U L T I M A T E                ║"
    echo "║                   S E L E C T O R                         ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo -e "${GREEN}📌 MAIN MENU${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${YELLOW}1)${NC} V2Ray - Install / Manage"
    echo -e "${YELLOW}2)${NC} Xray - Install / Manage"
    echo -e "${YELLOW}3)${NC} MTProto - Install / Manage"
    echo -e "${YELLOW}4)${NC} 3x-UI Panel - Install / Manage"
    echo -e "${YELLOW}5)${NC} Docker - Install / Container Manager"
    echo -e "${YELLOW}6)${NC} Backup & Restore"
    echo -e "${YELLOW}7)${NC} Telegram Bot Setup"
    echo -e "${YELLOW}8)${NC} System Status & Monitoring"
    echo -e "${YELLOW}9)${NC} Service Manager"
    echo -e "${RED}0)${NC} Exit"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    read -p "👉 ကျေးဇူးပြု၍ ရွေးချယ်ပါ (0-9): " choice
}

# ==================== V2RAY ====================
install_v2ray() {
    echo -e "${BLUE}🚀 V2Ray တပ်ဆင်နေပါသည်...${NC}"
    bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
    echo -e "${GREEN}✅ V2Ray တပ်ဆင်ပြီးပါပြီ။${NC}"
    read -p "Enter နှိပ်ပြီး ဆက်ပါ..."
}

# ==================== XRAY ====================
install_xray() {
    echo -e "${BLUE}🚀 Xray တပ်ဆင်နေပါသည်...${NC}"
    bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install
    echo -e "${GREEN}✅ Xray တပ်ဆင်ပြီးပါပြီ။${NC}"
    read -p "Enter နှိပ်ပြီး ဆက်ပါ..."
}

# ==================== MTPROTO ====================
install_mtproto() {
    echo -e "${BLUE}🚀 MTProto တပ်ဆင်နေပါသည်...${NC}"
    apt update && apt install -y git make gcc
    git clone https://github.com/TelegramMessenger/MTProxy
    cd MTProxy
    make
    cd objs/bin
    curl -s https://core.telegram.org/getProxySecret -o proxy-secret
    curl -s https://core.telegram.org/getProxyConfig -o proxy-multi.conf
    echo -e "${GREEN}✅ MTProto ပြင်ဆင်ပြီးပါပြီ။${NC}"
    cd
    read -p "Enter နှိပ်ပြီး ဆက်ပါ..."
}

# ==================== 3X-UI ====================
install_3xui() {
    echo -e "${BLUE}🚀 3x-UI Panel တပ်ဆင်နေပါသည်...${NC}"
    bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
    echo -e "${GREEN}✅ 3x-UI တပ်ဆင်ပြီးပါပြီ။${NC}"
    read -p "Enter နှိပ်ပြီး ဆက်ပါ..."
}

# ==================== DOCKER ====================
install_docker() {
    echo -e "${BLUE}🚀 Docker တပ်ဆင်နေပါသည်...${NC}"
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    systemctl enable docker
    systemctl start docker
    echo -e "${GREEN}✅ Docker တပ်ဆင်ပြီးပါပြီ။${NC}"
    read -p "Enter နှိပ်ပြီး ဆက်ပါ..."
}

docker_menu() {
    clear
    echo -e "${CYAN}🐳 Docker Manager - snnttech${NC}"
    echo "1) Run Nginx Container"
    echo "2) Run MySQL Container"
    echo "3) List All Containers"
    echo "4) Stop Container"
    echo "5) Remove Container"
    echo "6) Back to Main Menu"
    read -p "Select: " docker_choice
    
    case $docker_choice in
        1) docker run -d --name nginx-snnttech -p 8080:80 nginx ;;
        2) docker run -d --name mysql-snnttech -e MYSQL_ROOT_PASSWORD=snnttech123 -p 3306:3306 mysql ;;
        3) docker ps -a ;;
        4) read -p "Container name: " con_name; docker stop $con_name ;;
        5) read -p "Container name: " con_name; docker rm $con_name ;;
        6) return ;;
    esac
    read -p "Enter နှိပ်ပြီး ဆက်ပါ..."
}

# ==================== BACKUP ====================
backup_menu() {
    clear
    echo -e "${CYAN}💾 Backup & Restore - snnttech${NC}"
    echo "1) Backup Xray Config"
    echo "2) Backup V2Ray Config"
    echo "3) Backup 3x-UI Database"
    echo "4) Restore Backup"
    echo "5) Back to Main Menu"
    read -p "Select: " backup_choice
    
    mkdir -p /root/snnttech-backup
    
    case $backup_choice in
        1) cp /usr/local/etc/xray/*.json /root/snnttech-backup/ 2>/dev/null && echo "✅ Xray backup done" ;;
        2) cp /usr/local/etc/v2ray/*.json /root/snnttech-backup/ 2>/dev/null && echo "✅ V2Ray backup done" ;;
        3) cp /etc/3x-ui/*.db /root/snnttech-backup/ 2>/dev/null && echo "✅ 3x-UI backup done" ;;
        4) echo "Restore function - သင်ကိုယ်တိုင် /root/snnttech-backup ကနေ restore လုပ်ပါ" ;;
        5) return ;;
    esac
    read -p "Enter နှိပ်ပြီး ဆက်ပါ..."
}

# ==================== TELEGRAM BOT ====================
setup_bot() {
    echo -e "${BLUE}🤖 Telegram Bot Setup${NC}"
    read -p "Bot Token ထည့်ပါ: " bot_token
    read -p "Chat ID ထည့်ပါ: " chat_id
    
    cat > /root/snnttech-bot.py <<EOF
import requests
import subprocess

TOKEN = "$bot_token"
CHAT_ID = "$chat_id"

def send_message(text):
    url = f"https://api.telegram.org/bot{TOKEN}/sendMessage"
    data = {"chat_id": CHAT_ID, "text": text}
    requests.post(url, data=data)

# System Info
hostname = subprocess.getoutput("hostname")
ip = subprocess.getoutput("curl -s ifconfig.me")
send_message(f"✅ snnttech Server Online\nHostname: {hostname}\nIP: {ip}")
EOF
    
    python3 /root/snnttech-bot.py
    echo -e "${GREEN}✅ Bot setup completed!${NC}"
    read -p "Enter နှိပ်ပြီး ဆက်ပါ..."
}

# ==================== SYSTEM STATUS ====================
system_status() {
    clear
    echo -e "${CYAN}📊 System Status - snnttech${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${GREEN}Uptime:${NC} $(uptime -p)"
    echo -e "${GREEN}CPU:${NC} $(top -bn1 | grep "Cpu(s)" | awk '{print $2}')%"
    echo -e "${GREEN}Memory:${NC} $(free -h | awk '/^Mem:/ {print $3"/"$2}')"
    echo -e "${GREEN}Disk:${NC} $(df -h / | awk 'NR==2 {print $3"/"$2}')"
    echo -e "${GREEN}Services:${NC}"
    systemctl is-active xray >/dev/null 2>&1 && echo "  ✅ Xray: active" || echo "  ❌ Xray: inactive"
    systemctl is-active v2ray >/dev/null 2>&1 && echo "  ✅ V2Ray: active" || echo "  ❌ V2Ray: inactive"
    docker ps --format "  🐳 {{.Names}}: {{.Status}}" 2>/dev/null
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    read -p "Enter နှိပ်ပြီး ဆက်ပါ..."
}

# ==================== SERVICE MANAGER ====================
service_manager() {
    clear
    echo -e "${CYAN}⚙️ Service Manager - snnttech${NC}"
    echo "1) Restart Xray"
    echo "2) Restart V2Ray"
    echo "3) Restart 3x-UI"
    echo "4) Restart Docker"
    echo "5) View Xray Log"
    echo "6) View V2Ray Log"
    echo "7) Back to Main Menu"
    read -p "Select: " service_choice
    
    case $service_choice in
        1) systemctl restart xray && echo "✅ Xray restarted" ;;
        2) systemctl restart v2ray && echo "✅ V2Ray restarted" ;;
        3) systemctl restart 3x-ui && echo "✅ 3x-UI restarted" ;;
        4) systemctl restart docker && echo "✅ Docker restarted" ;;
        5) journalctl -u xray -n 20 ;;
        6) journalctl -u v2ray -n 20 ;;
        7) return ;;
    esac
    read -p "Enter နှိပ်ပြီး ဆက်ပါ..."
}

# ==================== MAIN LOOP ====================
while true; do
    show_menu
    case $choice in
        1) install_v2ray ;;
        2) install_xray ;;
        3) install_mtproto ;;
        4) check_root; install_3xui ;;
        5) 
            if ! command -v docker &> /dev/null; then
                install_docker
            fi
            docker_menu
            ;;
        6) backup_menu ;;
        7) setup_bot ;;
        8) system_status ;;
        9) service_manager ;;
        0) 
            echo -e "${GREEN}ကျေးဇူးတင်ပါတယ်။ နောက်မှပြန်တွေ့မယ်။${NC}"
            exit 0
            ;;
        *) 
            echo -e "${RED}မှားယွင်းသော ရွေးချယ်မှုပါ။${NC}"
            sleep 1
            ;;
    esac
done
