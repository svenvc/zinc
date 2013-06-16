printing
printOn: stream
	self hasScheme ifTrue: [ 
		stream nextPutAll: self scheme; nextPutAll: '://' ].
	self printAuthorityOn: stream.
	self printPathQueryFragmentOn: stream