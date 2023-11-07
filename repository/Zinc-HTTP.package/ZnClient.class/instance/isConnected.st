testing
isConnected
	"Return true if I hold an open HTTP connection."

	^ connection isNotNil and: [ connection isConnected ]