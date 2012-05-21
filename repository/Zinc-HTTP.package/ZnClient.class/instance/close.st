initialize-release
close
	"Close any HTTP network connection that I might have kept open."
	
	connection ifNotNil: [ 
		connection close.
		connection := nil.
		state := #closed ].
	lastUsed := nil