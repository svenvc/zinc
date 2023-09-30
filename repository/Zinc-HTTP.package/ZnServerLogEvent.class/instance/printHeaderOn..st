printing
printHeaderOn: stream
	super printHeaderOn: stream.
	serverId ifNotNil: [ stream space; << serverId asString ]