#!/usr/bin/env node
const exec = require('child_process').exec

exec('feh --randomize --bg-fill ~/Wallpapers/*')

setInterval(() => {
	exec('feh --randomize --bg-fill ~/Wallpapers/*')
}, 15*60*1000)
