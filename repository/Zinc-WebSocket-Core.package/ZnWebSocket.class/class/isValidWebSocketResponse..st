protocol
isValidWebSocketResponse: client
	"Return true when client contains a valid WebSocket response for its WebSocket request"

	| acceptKey response |
	acceptKey := ZnWebSocketUtils handshake: (client request headers at: 'Sec-WebSocket-Key').
	response := client response.
	^ response code = 101
		and: [
			(response headers at: 'Upgrade') asLowercase = 'websocket' 
				and: [
					(ZnWebSocketUtils containsConnectionUpgrade: response headers)
						and: [ 
							(response headers at: 'Sec-WebSocket-Accept') = acceptKey ] ] ]