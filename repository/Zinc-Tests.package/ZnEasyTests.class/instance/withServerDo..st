private
withServerDo: block
	| server |
	server := ZnServer on: self port.
	[ 
		server start.
		self assert: server isRunning & server isListening.
		block cull: server
	] 
		ensure: [ server stop ]