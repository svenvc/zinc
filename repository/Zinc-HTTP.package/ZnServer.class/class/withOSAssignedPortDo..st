public
withOSAssignedPortDo: block
	"Create and start a new Zinc HTTP Server and pass it to block.
	This server will have an OS assigned free port which can be retrieved
	with #port or #localUrl. After use the server will be stopped."

	| server |
	server := self on: 0.
	[
		server start.
		self assert: server isRunning & server isListening.
		block cull: server
	]
		ensure: [ server stop ]