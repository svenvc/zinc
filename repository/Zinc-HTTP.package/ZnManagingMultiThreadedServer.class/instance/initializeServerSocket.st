private
initializeServerSocket
	super initializeServerSocket.
	self isUsingLimitedAcceptStrategy 
		ifTrue: [
			"Create a Semaphore that counts the available connections that can accept"
			availableConnections := Semaphore new.
			(ZnCurrentOptions at: #maximumNumberOfConcurrentConnections)
				timesRepeat: [ availableConnections signal ] ]