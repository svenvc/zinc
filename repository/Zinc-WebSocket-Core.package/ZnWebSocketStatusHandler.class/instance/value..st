accessing
value: webSocket
	"I stream status messages to a WebSocket client, once every second 
	until ConnectionClosed or no longer isConnected"
	
	[ 
		webSocket logGeneric: 'Started status streaming'.
		[ 
			webSocket sendMessage: self status.
			1 second asDelay wait.
			webSocket isConnected ] whileTrue ] 
		on: ConnectionClosed 
		do: [ webSocket logGeneric: 'Ignoring connection close' ].
	webSocket logGeneric: 'Stopping status streaming' 