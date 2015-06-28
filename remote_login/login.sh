#!/usr/bin/expect
# This script is used for autologin to $host with @username and @password through relay machine.

if { $argc != 3} {
	send_user "Usage: host username password\n"
	exit
}

set host [lindex $argv 0]
set user [lindex $argv 1]
set pw [lindex $argv 2]

set TERMSERV RELAY_HOST	 #relay machine hostname
set USER RELAY_USERNAME	 #username for relay machine
set PASS RELAY_PASSWORD  #password for relay machine

# login to relay
catch {
	spawn ssh ${USER}@$TERMSERV
}
expect "*assword:*" {
	send "${PASS}\n"
}

#change *bash-baidu-ssl to some word show on the relay after login
expect "*bash-baidu-ssl*" {
	send "ssh ${user}@$host\n"
}

expect "*assword:*" {
	send "$pw\n"
}
interact
