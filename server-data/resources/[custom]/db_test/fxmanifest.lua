fx_version 'cerulean'
game 'gta5'

name "db_test"
description "For testing db connection"
author "Omininola"
version "1.0"

shared_scripts {
	'shared/*.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server/*.lua'
}
