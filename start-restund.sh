#!/usr/bin/env bash

sh /restund/util/genha1.sh $RESTUND_USERNAME $RESTUND_REALM $RESTUND_PASSWORD > /etc/restund.auth

LD_LIBRARY_PATH=/re/ restund /etc/restund.conf

exit 0

