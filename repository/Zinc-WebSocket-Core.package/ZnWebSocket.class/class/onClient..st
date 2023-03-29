instance creation
onClient: client
	"Create and return a functioning ZnWebSocket object based on an HTTP client,
	assuming the initial upgrade handshake was executed. The validity of the response is checked.
	Signals a ZnWebSocketFailed error when unsuccessful."

	(self isValidWebSocketResponse: client)
		ifTrue: [
			^ (self onStream: client connection)
				role: #client;
				yourself ]
		ifFalse: [
			client close.
			(ZnWebSocketFailed response: client response) signal ]