#!/bin/bash

# Start apache
/usr/sbin/apache2 -D FOREGROUND

# Start salt-minion
/usr/bin/salt-minion
