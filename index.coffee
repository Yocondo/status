conf = require './package.json'
gitInfo = (require 'git-info')()

applicationInfo =
	id: conf.name
	version: conf.version
	startupTime: new Date

getStatus = ->
	gitInfo.then (git) ->
		{
			snapshotTimestamp: new Date
			applicationInfo: applicationInfo
			git: git
		}

module.exports =
	install: (server) -> server.controller 'GET', '/status', getStatus
