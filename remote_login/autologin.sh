#!/usr/bin/expect
#This script is used to login vis BSLS, that is, ssh to remote machine with current user and no password

if { $argc != 1} {
	send_user "Usage: host username password\n"
	exit
}

set host [lindex $argv 0]

set TERMSERV RELAY_HOST
set USER RELAY_USER

# login to relay
catch {
	spawn ssh ${USER}@$TERMSERV
}


expect "*bash-baidu-ssl*" {
	send "ssh $host\n"
}

interact
