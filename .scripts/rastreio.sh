#!/bin/bash

cd /tmp/

codigo=$1

if [ -z $1 ]; then
··echo -e "ERRO: É preciso inserir um código de rastreio\nExemplo: rastreio.sh PR112318237BR"
··exit
fi

curl -s 'https://www2.correios.com.br/sistemas/rastreamento/ctrl/ctrlRastreamento.cfm?' \
-H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0' \
-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
-H 'Accept-Language: en-US,en;q=0.5' \
--compressed -H 'Referer: https://www2.correios.com.br/sistemas/rastreamento/' \
-H 'Content-Type: application/x-www-form-urlencoded' \
-H 'Connection: keep-alive' \
-H 'Upgrade-Insecure-Requests: 1' \
--data 'acao=track&objetos='$codigo'&btnPesq=Buscar' \
--cookie-jar cookie_file

curl -s 'https://www2.correios.com.br/sistemas/rastreamento/resultado.cfm' \
-H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0' \
-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
-H 'Accept-Language: en-US,en;q=0.5' \
--compressed -H 'Referer: https://www2.correios.com.br/sistemas/rastreamento/' \
-H 'Connection: keep-alive' \
-H 'Upgrade-Insecure-Requests: 1' \
--cookie cookie_file -o dump.html

cat dump.html | tr "\r" "\n" > dump2.html
cat dump2.html | grep "Objeto encami" -A1 -m1 | tail -1
