#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
IZIN=$( curl https://mymasway.github.io/izin | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied...${NC}"
fi

# install text 
apt update -y
apt upgrade -y
apt dist-upgrade -y

# install python
apt -y install ruby
gem install lolcat
apt -y install figlet

# install wget and curl
apt -y install wget curl

clear 

echo '                   Wellcome On My Script                     '
echo '                                                          '
echo '                                                          '
echo '                                                          '
echo '               AutoScript By MasWayVPN             '
echo '              Telegram : t.me/MasWayVPN                  '
sleep 10
clear
echo '============================================='
echo '         Silakan Tunggu sebentar '
echo 'Process Update & Upgrade Sedang Dijalankan '
echo '============================================='
sleep 2
apt update && apt upgrade -y
clear
echo '============================================='
echo '      Process Update & Upgrade Selesai '
echo '============================================='
sleep 2
clear
echo '============================================='
echo '        Process Seterusnya Silakan Tunggu '
echo '============================================='
sleep 2
mkdir /etc/v2ray
mkdir /etc/xray
mkdir /var/lib/premium-script;
mkdir /var/lib/crot-script;
clear
echo '============================================='
echo "Sila Masukkan DOMAIN, Jika Tidak ada KLIK Enter"
echo '============================================='
read -p "Hostname / Domain: " host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "IP=$host" >> /var/lib/crot-script/ipvps.conf
echo "$host" >> /etc/v2ray/domain
clear
echo "IP=" >> /var/lib/MasWayVPN/ipvps.conf
wget https://raw.githubusercontent.com/mymasway/wssc/cf.sh && chmod +x cf.sh && ./cf.sh
echo '============================================='
echo '        Installing SSH & OPENVPN '
echo '============================================='
sleep 5
wget https://raw.githubusercontent.com/mymasway/wssc/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
echo '============================================='
echo '        Installing SSTP '
echo '============================================='
sleep 5
wget https://raw.githubusercontent.com/mymasway/wssc/main/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
echo '============================================='
echo '        Installing ssr '
echo '============================================='
sleep 5
wget https://raw.githubusercontent.com/mymasway/wssc/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
echo '============================================='
echo '        Installing shadowsocksobfs '
echo '============================================='
sleep 5
wget https://raw.githubusercontent.com/mymasway/wssc/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
echo '============================================='
echo '        Installing V2RAY '
echo '============================================='
sleep 5
wget https://raw.githubusercontent.com/mymasway/wssc/main/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
echo '============================================='
echo '        Installing ipsec '
echo '============================================='
sleep 5
wget https://raw.githubusercontent.com/mymasway/wssc/main/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
echo '        Installing XRAY '
echo '============================================='
sleep 5
wget https://raw.githubusercontent.com/mymasway/wssc/main/install-xray.sh && chmod +x install-xray.sh && screen -S xray ./install-xray.sh
echo '============================================='
echo '        Installing Websocket '
echo '============================================='
sleep 5
wget https://raw.githubusercontent.com/mymasway/wssc/main/websocket/websocket.sh && chmod +x websocket.sh && ./websocket.sh
echo '        Installing OHP '
echo '============================================='
sleep 5
wget https://raw.githubusercontent.com/mymasway/wssc/main/ohp/ohp.sh && chmod +x ohp.sh && ./ohp.sh
wget https://raw.githubusercontent.com/mymasway/wssc/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh
echo '============================================='

rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/install-xray.sh
rm -f /root/ipsec.sh
rm -f /root/websocket.sh
rm -f /root/ohp.sh
rm -f /root/set-br.sh
rm -f /root/nf
echo "1.1" > /home/ver

echo "echo '      ꧁DEAR MY LOVE ,Hanya kerna sekali dikhianati꧂             '" >> .profile
echo "echo '          ꧁Aku Menjadi Tak Kenal Apa itu Cinta꧂                 '" >> .profile
echo "echo '                     #CIDRO_BERAT#                              '" >> .profile
clear
echo " "
echo '============================================='
echo "       Installation has been completed!!"
echo '============================================='
sleep 3
echo " "
echo "=================================-MasWay VPN-===========================" | tee -a log-install.txt
echo "MASWAY" | lolcat
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 1443, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - WebSocket Dropbear      : 8880" | tee -a log-install.txt
echo "   - WebSocket OpenSSH       : 2095" | tee -a log-install.txt
echo "   - WebSocket OpenVPN       : 2082" | tee -a log-install.txt
echo "   - WebSocket TLS           : 2088" | tee -a log-install.txt
echo "   - OpenVPN OHP             : 8181"  | tee -a log-install.txt
echo "   - Dropbear OHP            : 8282"  | tee -a log-install.txt
echo "   - OpenSSH OHP             : 8383"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 ,8000 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 8585"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8989"  | tee -a log-install.txt
echo "   - V2RAY VMESS KCP         : 11063"  | tee -a log-install.txt
echo "   - XRAY VLESS XTLS         : 6060"  | tee -a log-install.txt
echo "   - XRAY VLESS SPLICE       : 6060"  | tee -a log-install.txt
echo "   - XRAY VLESS WS XTLS      : 6060"  | tee -a log-install.txt
echo "   - XRAY VLESS None TCP     : 6666"  | tee -a log-install.txt
echo "   - XRAY VLESS TCP          : 6565"  | tee -a log-install.txt
echo "   - XRAY VMESS NONE TCP     : 6464"  | tee -a log-install.txt
echo "   - XRAY VMESS TCP          : 6363"  | tee -a log-install.txt
echo "   - XRAY VMESS KCP          : 6161"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo "   - Trojan GO               : 2096"  | tee -a log-install.txt
echo "   - Netflix Set ON"  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Malaysia (UTC +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON/SET]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 UTC +8" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo ""
echo "   - 1st Dev/Main            : MasWayVPN      "  | tee -a log-install.txt
echo "   - Telegram                : t.me/MasWayVPN "  | tee -a log-install.txt
echo ""

sleep 3
echo '============================================='
echo '      SISTEM AKAN REBOOT SEBENTAR LAGI'
echo '============================================='
echo ""
rm -f /root/setup.sh
rm -f /root/.bash_history
echo " Reboot 15 Sec, Setelah LOGIN, Ketik menu"
sleep 15
reboot
