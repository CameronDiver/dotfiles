#!/home/cameron/.nvm/versions/node/v8.9.1/bin/coffee
exec = require('child_process').exec

exec 'playerctl status', (err, stdout) ->
	return if err?
	if stdout.trim().toLowerCase() == 'playing'
		exec "playerctl metadata 'xesam:artist' && echo -n ' - ' && playerctl metadata 'xesam:title'", (err, stdout) ->
			return if err?
			#data = JSON.parse(stdout)
			process.stdout.write "  #{stdout} "

