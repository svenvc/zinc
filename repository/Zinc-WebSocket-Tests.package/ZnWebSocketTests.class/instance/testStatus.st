testing
testStatus
	| webSocket message |
	ZnServer startDefaultOn: 1701.
	ZnServer default 
		delegate: (ZnWebSocketDelegate map: 'ws-status' to: ZnWebSocketStatusHandler new).
	webSocket := ZnWebSocket to: 'ws://localhost:1701/ws-status'.
	message := webSocket readMessage.
	self assert: (#('Pharo' 'memory' 'GC' 'Process') allSatisfy: [ :each | message includesSubstring: each ]).
	webSocket close.
	ZnServer stopDefault.