#!/usr/bin/env bash

sh /restund/util/genha1.sh $RESTUND_USERNAME $RESTUND_PASSWORD $RESTUND_REALM > /etc/restund.auth

LD_LIBRARY_PATH=/re/ restund /etc/restund.conf

exit 0

