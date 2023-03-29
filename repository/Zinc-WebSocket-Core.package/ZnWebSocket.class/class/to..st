instance creation
to: urlObject
	"Attempt to create a new client WebSocket to urlObject.
	Do the initial upgrade handshake and return a functioning ZnWebSocket object.
	Signals a ZnWebSocketFailed error when unsuccessful."

	^ self to: urlObject config: [ :httpClient | ]