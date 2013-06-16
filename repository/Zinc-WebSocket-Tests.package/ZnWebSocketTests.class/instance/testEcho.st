testing
testEcho
	| webSocket message |
	ZnServer startDefaultOn: 1701.
	ZnServer default 
		delegate: (ZnWebSocketDelegate map: 'ws-echo' to: ZnWebSocketEchoHandler new).
	webSocket := ZnWebSocket to: 'ws://localhost:1701/ws-echo'.
	message := 'Greetings from Pharo Smalltalk @ ', TimeStamp now printString.
	webSocket sendMessage: message.
	self assert: webSocket readMessage equals: message.
	webSocket close.
	ZnServer stopDefault.