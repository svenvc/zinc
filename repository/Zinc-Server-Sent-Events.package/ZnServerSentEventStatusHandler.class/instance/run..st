running
run: connection
	"Using Server-Sent Events is simple: keep a reference to the connection, 
	instanciate ZnServerSentEvent objects and use #writeOn: to push them out."
	
	| event status |
	[ 
	  status := self statusString.
	  event := ZnServerSentEvent type: 'status-update' data: status.
	  event writeOn: connection.
	  2 seconds asDelay wait ] repeat