printing
printPathQueryFragmentOn: stream
	self printPathOn: stream.
	self hasQuery
		ifTrue: [ self printQueryOn: stream ].
	self hasFragment
		ifFalse: [ ^ self ].
	stream nextPut: $#.
	self encode: self fragment on: stream