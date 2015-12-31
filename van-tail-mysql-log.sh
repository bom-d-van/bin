#!/usr/bin/env bash

set -e

trap set_log_off INT

function set_log_off() {
	mysql -u root -e "SET GLOBAL general_log = 'OFF';"
}

mysql -u root -e "SET GLOBAL general_log_file = '/usr/local/var/mysql/Vans-MacBook-Pro.log';"
mysql -u root -e "SET GLOBAL general_log = 'ON';"

tail -f /usr/local/var/mysql/Vans-MacBook-Pro.log