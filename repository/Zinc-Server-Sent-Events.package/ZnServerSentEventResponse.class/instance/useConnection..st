accessing
useConnection: connection
	"Hook method overwritten to give the receiver the chance to 
	keep using connection in the current thread/process after the server wrote the response.
	We pass control to our handler."
	
	[ handler run: connection ]
		on: ConnectionClosed, ConnectionTimedOut
		do: [ "ignore" ]