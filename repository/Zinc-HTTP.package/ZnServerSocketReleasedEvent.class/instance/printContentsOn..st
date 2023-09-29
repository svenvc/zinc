printing
printContentsOn: stream
	super printContentsOn: stream.
	stream << 'Server Socket Released '.
	address
		ifNil: [ stream print: address ]
		ifNotNil: [ address do: [ :each | stream print: each ] separatedBy: [ stream nextPut: $. ] ].
	stream nextPut: $:; print: port