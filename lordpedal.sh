#!/bin/bash
#
# http://lordpedal.github.io
# Another fine release by Lordpedal
#
function actualiza_lista {
        wget $M3U_URL -O ./media/Lordpedal.m3u
        return 0
}
# Bucle actualización
while true
do
        sleep 1800 && actualiza_lista
done &
# Inicia Script
actualiza_lista
./xupnpd
