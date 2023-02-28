instance creation
to: urlObject config: block
	"Attempt to create a new client WebSocket to urlObject.
	Execute block to further configure the HTTP client before the upgrade request.
	Do the initial upgrade handshake and return a functioning ZnWebSocket object.
	Signals a ZnWebSocketFailed error when unsuccessful."

	| client |
	client := self webSocketClientTo: urlObject asZnUrl.
	block value: client.
	client execute.
	^ self onClient: client