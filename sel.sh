#!/bin/bash

# ==================================================
# ███████╗███╗   ██╗███╗   ██╗████████╗████████╗███████╗ ██████╗██╗  ██╗
# ██╔════╝████╗  ██║████╗  ██║╚══██╔══╝╚══██╔══╝██╔════╝██╔════╝██║  ██║
# ███████╗██╔██╗ ██║██╔██╗ ██║   ██║      ██║   █████╗  ██║     ███████║
# ╚════██║██║╚██╗██║██║╚██╗██║   ██║      ██║   ██╔══╝  ██║     ██╔══██║
# ███████║██║ ╚████║██║ ╚████║   ██║      ██║   ██║     ╚██████╗██║  ██║
# ╚══════╝╚═╝  ╚═══╝╚═╝  ╚═══╝   ╚═╝      ╚═╝   ╚═╝      ╚═════╝╚═╝  ╚═╝
# ==================================================
# Script Name    : snnttech ULTIMATE SELECTOR
# Author         : snnttech
# Version        : 2.0
# Description    : V2Ray, Xray, MTProto, 3x-UI, Docker, Backup, Bot, 
#                 WireGuard, OpenVPN, Shadowsocks, NPM, Portainer, FTP
# ==================================================

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Root check function
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "${RED}❌ ဒီ command ကို root user နဲ့မှ သုံးလို့ရပါတယ်။${NC}"
        exit 1
    fi
}

# Show main menu
show_menu() {
    clear
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════════╗"
    echo "║              s n n t t e c h   U L T I M A T E                   ║"
    echo "║                      S E L E C T O R  v2.0                       ║"
    echo "╚══════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo -e "${GREEN}📌 MAIN MENU${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${YELLOW}1)${NC} V2Ray - Install / Manage"
    echo -e "${YELLOW}2)${NC} Xray - Install / Manage"
    echo -e "${YELLOW}3)${NC} MTProto - Install / Manage"
    echo -e "${YELLOW}4)${NC} 3x-UI Panel - Install / Manage"
    echo -e "${YELLOW}5)${NC} Docker - Install / Container Manager"
    echo -e "${YELLOW}6)${NC} Backup & Restore"
    echo -e "${YELLOW}7)${NC} Telegram Bot Setup"
    echo -e "${YELLOW}8)${NC} System Status & Monitoring"
    echo -e "${YELLOW}9)${NC} Service Manager"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━ EXTRA TOOLS ━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${YELLOW}10)${NC} WireGuard - Install / Manage"
    echo -e "${YELLOW}11)${NC} OpenVPN - Install / Manage"
    echo -e "${YELLOW}12)${NC} Shadowsocks - Install / Manage"
    echo -e "${YELLOW}13)${NC} Nginx Proxy Manager (NPM)"
    echo -e "${YELLOW}14)${NC} Portainer (Docker Web UI)"
    echo -e "${YELLOW}15)${NC} FTP Server (vsftpd) Setup"
    echo -e "${RED}0)${NC} Exit"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    read -p "👉 ကျေးဇူးပြု၍ ရွေးချယ်ပါ (0-15): " choice
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
send_message(f"✅ snnttech Server Online\\nHostname: {hostname}\\nIP: {ip}")
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

# ==================== WIREGUARD ====================
install_wireguard() {
    echo -e "${BLUE}🔒 WireGuard တပ်ဆင်နေပါသည်...${NC}"
    apt update && apt install -y wireguard
    cd /etc/wireguard
    umask 077
    wg genkey | tee privatekey | wg pubkey > publickey
    echo -e "${GREEN}✅ WireGuard တပ်ဆင်ပြီးပါပြီ။${NC}"
    echo -e "${YELLOW}Private Key: $(cat privatekey)${NC}"
    echo -e "${YELLOW}Public Key: $(cat publickey)${NC}"
    read -p "Enter နှိပ်ပြီး ဆက်ပါ..."
}

# ==================== OPENVPN ====================
install_openvpn() {
    echo -e "${BLUE}🔓 OpenVPN တပ်ဆင်နေပါသည်...${NC}"
    apt update && apt install -y openvpn
    wget https://git.io/vpn -O openvpn-install.sh
    bash openvpn-install.sh
    echo -e "${GREEN}✅ OpenVPN တပ်ဆင်ပြီးပါပြီ။${NC}"
    read -p "Enter နှိပ်ပြီး ဆက်ပါ..."
}

# ==================== SHADOWSOCKS ====================
install_shadowsocks() {
    echo -e "${BLUE}🌐 Shadowsocks တပ်ဆင်နေပါသည်...${NC}"
    apt update && apt install -y shadowsocks-libev
    cat > /etc/shadowsocks-libev/config.json <<EOF
{
    "server": "0.0.0.0",
    "server_port": 8388,
    "password": "snnttech-ss-$(openssl rand -hex 4)",
    "method": "chacha20-ietf-poly1305",
    "fast_open": true
}
EOF
    systemctl restart shadowsocks-libev
    systemctl enable shadowsocks-libev
    echo -e "${GREEN}✅ Shadowsocks တပ်ဆင်ပြီးပါပြီ။${NC}"
    cat /etc/shadowsocks-libev/config.json
    read -p "Enter နှိပ်ပြီး ဆက်ပါ..."
}

# ==================== NGINX PROXY MANAGER ====================
install_npm() {
    echo -e "${BLUE}🚀 Nginx Proxy Manager တပ်ဆင်နေပါသည်...${NC}"
    apt update && apt install -y docker-compose
    mkdir -p /root/npm
    cd /root/npm
    cat > docker-compose.yml <<EOF
version: '3'
services:
  npm:
    image: jc21/nginx-proxy-manager:latest
    restart: unless-stopped
    ports:
      - 80:80
      - 81:81
      - 443:443
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
EOF
    docker-compose up -d
    echo -e "${GREEN}✅ Nginx Proxy Manager တပ်ဆင်ပြီးပါပြီ။${NC}"
    echo -e "${YELLOW}Access: http://$(curl -s ifconfig.me):81${NC}"
    echo -e "${YELLOW}Default Login: admin@example.com / changeme${NC}"
    read -p "Enter နှိပ်ပြီး ဆက်ပါ..."
}

# ==================== PORTAINER ====================
install_portainer() {
    echo -e "${BLUE}🐳 Portainer တပ်ဆင်နေပါသည်...${NC}"
    docker volume create portainer_data
    docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v portainer_data:/data \
      portainer/portainer-ce:latest
    echo -e "${GREEN}✅ Portainer တပ်ဆင်ပြီးပါပြီ။${NC}"
    echo -e "${YELLOW}Access: https://$(curl -s ifconfig.me):9443${NC}"
    read -p "Enter နှိပ်ပြီး ဆက်ပါ..."
}

# ==================== FTP SERVER ====================
install_ftp() {
    echo -e "${BLUE}📁 FTP Server (vsftpd) တပ်ဆင်နေပါသည်...${NC}"
    apt update && apt install -y vsftpd
    cp /etc/vsftpd.conf /etc/vsftpd.conf.bak
    cat > /etc/vsftpd.conf <<EOF
listen=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
xferlog_enable=YES
connect_from_port_20=YES
chroot_local_user=YES
allow_writeable_chroot=YES
pasv_enable=YES
pasv_min_port=10000
pasv_max_port=10100
EOF
    systemctl restart vsftpd
    systemctl enable vsftpd
    useradd -m ftpuser -s /bin/bash
    echo "ftpuser:snnttech123" | chpasswd
    echo -e "${GREEN}✅ FTP Server တပ်ဆင်ပြီးပါပြီ။${NC}"
    echo -e "${YELLOW}FTP User: ftpuser${NC}"
    echo -e "${YELLOW}FTP Password: snnttech123${NC}"
    echo -e "${YELLOW}Port: 21${NC}"
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
        10) install_wireguard ;;
        11) install_openvpn ;;
        12) install_shadowsocks ;;
        13) 
            if ! command -v docker &> /dev/null; then
                install_docker
            fi
            install_npm ;;
        14)
            if ! command -v docker &> /dev/null; then
                install_docker
            fi
            install_portainer ;;
        15) install_ftp ;;
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
