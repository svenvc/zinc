accessing
value: webSocket
	"I implement a simple chat room service as a server:
	distributing incoming messages to all known clients"
	
	[
		self register: webSocket.
		webSocket runWith: [ :message |
			webSocket log info: [ 'Received message: ', message printString ].
			self distributeMessage: message ] ] 
		on: ConnectionClosed 
		do: [
			webSocket log debug: 'Connection close, cleaning up'.
			self unregister: webSocket ]