accessing
useConnection: connection
	"Hook method overwritten to give the receiver the chance to 
	keep using connection in the current thread/process after the server wrote the response.
	We start a conversation by instanciating a WebSocket and passing it to our continuation."
	
	| webSocket message |
	webSocket := ZnWebSocket onStream: connection.
	self continuation value: webSocket