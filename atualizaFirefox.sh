#!/bin/bash
#
# script para atualizar o Firefox para a última versão estável disponível no site

function AtualizaFirefox () {

echo -e "\nAguarde, inicializando o atualizador...\n"

TEMPDIR=$(mktemp -d /tmp/firefox_XXXX)

SITE_LINK="https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=pt-BR"

wget -c -q --show-progress "$SITE_LINK" -O ${TEMPDIR}/firefox.tar.bz2

rm -rf /opt/firefox

tar -jxvf ${TEMPDIR}/firefox.tar.bz2 -C /opt/

rm -rf ${TEMPDIR}

echo -e "\nAtualização finalizada!\n"

}

if [ "$(id -u)" = "0" ]; then 
    AtualizaFirefox
    exit 0
else
    echo -e "\nVocê precisa do sudo para executar este script!\n"
    echo -e "Tente novamente com -> sudo ./atualizaFirefox.sh\n"
    exit 1
fi