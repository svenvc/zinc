protocol
webSocketClientTo: url
	"Create and return a new ZnClient instance ready for the initial client side WebSocket setup request"
	
	| client |
	self assert: (#(ws wss) includes: url scheme).
	(client := ZnClient new)
		url: url;
		method: #GET;
		headerAt: 'Upgrade' put: 'websocket';
		headerAt: 'Connection' put: 'Upgrade';
		headerAt: 'Sec-WebSocket-Version' put: '13';
		headerAt: 'Sec-WebSocket-Key' put: ZnWebSocketUtils newClientKey.
	^ client   
	