testing
testEchoWebSocketsDotOrg
	| webSocket message |
	webSocket := ZnWebSocket to: 'ws://echo.websocket.org'.
	message := 'Greetings from Pharo Smalltalk @ ', DateAndTime now printString.
	webSocket sendMessage: message.
	self assert: webSocket readMessage equals: message.
	webSocket close.