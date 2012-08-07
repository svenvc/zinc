private
withServerDo: block
	| server |
	server := ZnServer on: self port.
	[ 
		server start.
		Processor yield.
		self assert: server isRunning & server isListening.
		block cull: server
	] 
		ensure: [ server stop ]