I am ZnWebSocket, a bi-directional, full-duplex communication channel over a single TCP connection.

WebSockets send reliable messages to each other, a String or ByteArrat.
Each message is one-way (does not have a direct synchroneous reply). 
Each party, both client and/or server can take the initiative.

This implementation follows RFC 6455. See also:

	http://en.wikipedia.org/wiki/Websockets
	http://tools.ietf.org/html/rfc6455

Here is a client side example taking to a public echo service: 

| webSocket |
webSocket := ZnWebSocket to: 'ws://echo.websocket.org'.
[ webSocket 
	sendMessage: 'Pharo Smalltalk using Zinc WebSockets !';
	readMessage ] ensure: [ webSocket close ].

Here is the same example using secure web sockets:

| webSocket |
webSocket := ZnWebSocket to: 'wss://echo.websocket.org'.
[ webSocket 
	sendMessage: 'Pharo Smalltalk using Zinc WebSockets & Zodiac !';
	readMessage ] ensure: [ webSocket close ].

Here is how to start a local server running in the image implementing the same echo service:

ZnWebSocket startServerOn: 8080 do: ZnWebSocketEchoHandler new.

A full inline implementation of the echo handler would look like:

ZnWebSocket 
	startServerOn: 8080 
	do: [ :webSocket | 
		[ 
			webSocket runWith: [ :message |
				self crLog: 'Received message: ', message printString, ' echoing...'.
				webSocket sendMessage: message ] ] 
			on: ConnectionClosed 
			do: [ self crLog: 'Ignoring connection close, done' ] ].

Part of Zinc HTTP Components.