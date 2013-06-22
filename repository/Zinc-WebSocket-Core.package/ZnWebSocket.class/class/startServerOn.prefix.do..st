instance creation
startServerOn: port prefix: prefix do: handler
	"Start and return a new ZnServer listening on port and /prefix for client WebSocket connections.
	After a successful initial handshake, sent #value: to handler with a server side ZnWebSocket instance."
	
	^ (ZnServer on: port)
		delegate: (ZnWebSocketDelegate map: prefix to: handler);
		start;
		yourself