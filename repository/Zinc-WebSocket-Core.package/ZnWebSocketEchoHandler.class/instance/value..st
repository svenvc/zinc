accessing
value: webSocket
	"I implement an echo service conversation as a server:
	reading messages and echoing them back until ConnectionClosed"
	
	[ 
		webSocket runWith: [ :message |
			webSocket log info: [ 'Received message: ', message printString, ', echoing' ].
			webSocket sendMessage: message ] ] 
		on: ConnectionClosed 
		do: [ webSocket log debug: 'Ignoring connection close, done' ]