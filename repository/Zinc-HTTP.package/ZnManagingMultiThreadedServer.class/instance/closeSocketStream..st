private
closeSocketStream: socketStream
	super closeSocketStream: socketStream.
	self lock critical: [
		self connections remove: socketStream ifAbsent: [ ].
		"we cannot use #isUsingLimitedAcceptStrategy as we are sometimes called outside bound process variables"
		availableConnections
			ifNotNil: [
				"Give back the available connection slot"
				availableConnections signal ] ]