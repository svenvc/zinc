testing
testEchoSecureWebSocketsDotOrg
	| webSocket message |
	webSocket := ZnWebSocket to: 'wss://echo.websocket.org'.
	message := 'Greetings from Pharo Smalltalk @ ', TimeStamp now printString.
	webSocket sendMessage: message.
	self assert: webSocket readMessage equals: message.
	webSocket close.