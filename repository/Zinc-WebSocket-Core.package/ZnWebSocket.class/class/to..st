instance creation
to: urlObject
	"Attempt to create a new client WebSocket to urlObject.
	Do the initial upgrade handshake and return a functioning ZnWebSocket object.
	Signals a ZnWebSocketFailed error when unsuccessful."
	
	| client |
	client := self webSocketClientTo: urlObject asZnUrl.
	client execute.
	(self isValidWebSocketResponse: client)
		ifTrue: [
			^ (self onStream: client connection)
				role: #client;
				yourself ]
		ifFalse: [
			client close.
			(ZnWebSocketFailed response: client response) signal ]