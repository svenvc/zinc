accessing
value: webSocket
	"I implement a simple chat room service as a server:
	distributing incoming messages to all known clients"
	
	[
		self register: webSocket.
		webSocket runWith: [ :message |
			webSocket logGeneric: 'Received message: ', message printString.
			self distributeMessage: message ] ] 
		on: NetworkError 
		do: [
			webSocket logGeneric: 'Network error, cleaning up'.
			self unregister: webSocket ]