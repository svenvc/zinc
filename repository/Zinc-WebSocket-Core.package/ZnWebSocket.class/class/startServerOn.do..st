instance creation
startServerOn: port do: handler
	"Start and return a new ZnServer listening on port and / for client WebSocket connections.
	After a successful initial handshake, sent #value: to handler with a server side ZnWebSocket instance."
	
	^ self startServerOn: port prefix: nil do: handler  