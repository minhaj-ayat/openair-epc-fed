#!/bin/bash

cd /openair-spgwc

PREFIX='/openair-spgwc/etc'

MY_APN='apn1.carrier.com'
MY_PRIMARY_DNS='8.8.8.8'
MY_SECONDARY_DNS='8.8.4.4'

declare -A SPGWC_CONF

SPGWC_CONF[@PID_DIRECTORY@]='/var/run'
SPGWC_CONF[@SGW_INTERFACE_NAME_FOR_S11@]='eth0'
SPGWC_CONF[@PGW_INTERFACE_NAME_FOR_SX@]='eth0'
SPGWC_CONF[@SGW_IP_FOR_S5_S8_CP@]=127.0.0.11/8
SPGWC_CONF[@PGW_IP_FOR_S5_S8_CP@]=127.0.0.12/8
SPGWC_CONF[@DEFAULT_DNS_IPV4_ADDRESS@]=$MY_PRIMARY_DNS
SPGWC_CONF[@DEFAULT_DNS_SEC_IPV4_ADDRESS@]=$MY_SECONDARY_DNS
SPGWC_CONF[@DEFAULT_APN@]=$MY_APN
SPGWC_CONF[@UE_IP_ADDRESS_POOL@]='12.1.1.2 - 12.1.1.254'
SPGWC_CONF[@PUSH_PROTOCOL_OPTION@]='yes'

for K in "${!SPGWC_CONF[@]}"; do 
  egrep -lRZ "$K" $PREFIX | xargs -0 -l sed -i -e "s|$K|${SPGWC_CONF[$K]}|g"
done

exit 0
