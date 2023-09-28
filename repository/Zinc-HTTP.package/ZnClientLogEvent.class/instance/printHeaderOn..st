printing
printHeaderOn: stream
	super printHeaderOn: stream.
	clientId ifNotNil: [ stream space; << clientId ]