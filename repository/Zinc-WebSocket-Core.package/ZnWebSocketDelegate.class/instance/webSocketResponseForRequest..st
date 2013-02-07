protocol
webSocketResponseForRequest: request
	"Given a valid WebSocket setup request, return the matching server response"
	
	| acceptKey response |
	acceptKey := ZnWebSocketUtils handshake: (request headers at: 'Sec-WebSocket-Key').
	^ ZnWebSocketResponse new
		statusLine: (ZnStatusLine code: 101);
		headers: (self responseHeadersForKey: acceptKey);
		continuation: self continuation;
		yourself
		