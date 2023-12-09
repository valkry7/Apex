#!/bin/bash
# COLOR VALIDATION
clear
y='\033[1;33m' #yellow
BGX="\033[42m"
CYAN="\033[96m"
z="\033[95;1m"
f="\033[1;97;41m"
G="\033[92m"
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
purple="\033[1;95m"
YELL='\033[0;33m'

# underline
UPU='\033[5;35m'
UCY='\033[5;36m'
UWH='\033[5;37m'
#INTALLER-UDP
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d-%m-%Y')
TIMEZONE=$(printf '%(%H-%M-%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
izinsc="https://raw.githubusercontent.com/valkry7/Apex/ZX/REGISTRASI"
# USERNAME
rm -f /usr/bin/user
username=$(curl ${izinsc} | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# validity
rm -f /usr/bin/e
valid=$(curl ${izinsc} | grep $MYIP | awk '{print $3}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear
# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status Expired Or Active
Info="(${green}Active${NC})"
Error="(${RED}Expired${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl ${izinsc} | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#Status
clear
# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="🟢"
else
   status_ssh="🔴"
fi

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="🟢"
else
    status_ws_epro="🔴"
fi

# STATUS SERVICE HAPROXY
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="🟢"
else
   status_haproxy="🔴"
fi

# STATUS SERVICE XRAY
if [[ $xray_service == "running" ]]; then 
   status_xray="🟢"
else
   status_xray="🔴"
fi

# STATUS SERVICE NGINX
if [[ $nginx_service == "running" ]]; then 
   status_nginx="🟢"
else
   status_nginx="🔴"
fi

# STATUS SERVICE Dropbear
if [[ $dropbear_service == "running" ]]; then 
   status_dropbear="🟢"
else
   status_dropbear="🔴"
fi
# //
# // Log account
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx/2
# //
r="\033[1;31m"  # merah
a="ACCOUNT" 
BWH='\033[1;36'
clear
echo -e " "
echo -e " ${z}┌──────────────────────────────────────────────────────────┐${NC}"
echo -e " ${z}│$NC${BWC}                          ⎿LT⏋                            $NC${z}│$NC"
echo -e " ${z}└──────────────────────────────────────────────────────────┘${NC}"
echo -e " ${z}┌──────────────────────────────────────────────────────────┐${NC}"
echo -e " ${z}│$NC   ${W}OS ${NC}         : $MODEL${NC}"
echo -e " ${z}│$NC   ${W}RAM ${NC}        : $tram / $uram MB $NC"
echo -e " ${z}│$NC   ${W}DATE ${NC}       : $DATEVPS${NC}"
echo -e " ${z}│$NC   ${W}TIME ${NC}       : $TIMEZONE${NC}"
echo -e " ${z}│$NC   ${W}IP VPS ${NC}     : $IPVPS${NC}"
echo -e " ${z}│$NC   ${W}UPTIME ${NC}     : $SERONLINE${NC}"
echo -e " ${z}│$NC   ${W}DOMAIN ${NC}     : $domain${NC}"
echo -e " ${z}└──────────────────────────────────────────────────────────┘${NC}"
echo -e " ${z}┌──────────────────────────────────────────────────────────┐${NC}"
echo -e " ${k}│ SSH : $status_ssh  NGINX : $status_nginx  WS : $status_ws_epro  PROXY : $status_haproxy XRAY : $status_xray DROPB : $status_dropbear"
echo -e " ${z}└──────────────────────────────────────────────────────────┘${NC}"
echo -e "       ───────────────────────────────────────────────${NC}" | lolcat 
echo -e "             SSH/OPENVPN/UDP :$NC $ssh1" "$a"
echo -e "             VMESS/WS/GRPC   :$NC $vma" "$a"
echo -e "             VLESS/WS/GRPC   :$NC $vla" "$a"
echo -e "             TROJAN/WS/GRPC  :$NC $trb" "$a"
echo -e "             SHADOW/WS/GRPC  :$NC $ssa" "$a"
echo -e "       ───────────────────────────────────────────────${NC}" | lolcat 
#echo -e " ${z}╭════════════════╮╭══════════════════╮╭════════════════════╮${NC}"
#echo -e " ${z}│ ${NC} SSH     : $status_ssh"        "NGINX    : $status_nginx" "         XRAY    : $status_xray          ${z}│$NC" 
#echo -e " ${z}│ ${NC} WS-ePRO : $status_ws_epro"    "DROPBEAR : $status_dropbear" "      HAPROXY : $status_haproxy       ${z}│$NC" 
#echo -e " ${z}╰════════════════╯╰══════════════════╯╰════════════════════╯${NC}"
echo -e "          ${z}┌─────────────────────────────────────────┐${NC}"
echo -e "          ${z}│$NC Status  : $sts"
echo -e "          ${z}│$NC Client  : $username "
echo -e "          ${z}│$NC Expiry  : $exp ${NC} / $green $certifacate ${NC}Days"
echo -e "          ${z}└─────────────────────────────────────────┘${NC}"
echo -e " ${z}┌──────────────────────────────────────────────────────────┐${NC}"
echo -e " ${z}│$NC ${G}01.)${NC} ssh OPENVPN ${NC}         ${G}07.)${NC} Backup / Restore            ${NC} ${z}│${NC}"
echo -e " ${z}│$NC ${G}02.)${NC} Xray / Vmess ${NC}        ${G}08.)${NC} Gotop x Ram                 ${NC} ${z}│${NC}"    
echo -e " ${z}│$NC ${G}03.)${NC} xray / Vless ${NC}        ${G}09.)${NC} Restart All Service         ${NC} ${z}│${NC}"   
echo -e " ${z}│$NC ${G}04.)${NC} Tr / Trojan ${NC}         ${G}10.)${NC} Tele Bot                    ${NC} ${z}│${NC}" 
echo -e " ${z}│$NC ${G}05.)${NC} ss - LIBEV ${NC}          ${G}11.)${NC} Update Version.Sc           ${NC} ${z}│${NC}"
echo -e " ${z}│$NC ${G}06.)${NC} Triall Acc ${NC}          ${G}12.)${NC} Extra Menu                  ${NC} ${z}│${NC}"
echo -e " ${z}└──────────────────────────────────────────────────────────┘${NC}"
echo -e "          ────────────────────────────────────────────${NC}" | lolcat 
echo -e " "
echo -e " "
read -p " options [ 1 / 12 ] >  " opt
echo -e ""
case $opt in
1 | 01)
clear
m-sshws
;;
2 | 02)
clear
m-vmess
;;
3 | 03)
clear
m-vless
;;
4 | 04)
clear
m-trojan
;;
5 | 05)
clear
m-ssws
;;
6 | 06)
clear
m-trial
;;
7 | 07)
clear
menu-backup
;;
8 | 08)
clear
gotop
;;
9 | 09)
clear
restart
;;
10) | 10)
clear
m-bot
;;
11) | 11)
clear
wget -q https://raw.githubusercontent.com/valkry7/Apex/ZX/update.sh
chmod +x update.sh
./update.sh
;;
12) | 12)
clear
extra-menu
;;
0 | 00)
exit
;;
x)
menu
;;
*) clear ;
echo -e ""
menu
;;
esac
