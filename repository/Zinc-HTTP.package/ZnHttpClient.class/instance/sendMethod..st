private
sendMethod: aBlock
	aBlock on: Error do: self errorHandler.
	self isAuthenticationRequired ifTrue: [
		self linkCredentials.
		aBlock on: Error do: self errorHandler ].
	self resetParameters 