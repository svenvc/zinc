testing
isRunning
	"Return true when I am running"

	^ self process isNotNil and: [ self serverSocket isNotNil ]