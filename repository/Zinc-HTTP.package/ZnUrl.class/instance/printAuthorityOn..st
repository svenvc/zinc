printing
printAuthorityOn: stream
	self hasHost ifTrue: [ 
		stream nextPut: $/; nextPut: $/. 
		self encode: self host on: stream ].
	self hasPort ifTrue: [ 
		stream nextPut: $:; print: self port ]
