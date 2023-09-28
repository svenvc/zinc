printing
printContentsOn: stream
	super printContentsOn: stream.
	stream << 'Server Socket Bound '.
	address
		ifNil: [ stream << '<nil>' ]
		ifNotNil: [ address do: [ :each | stream print: each ] separatedBy: [ stream nextPut: $. ] ].
	stream
		nextPut: $:;
		print: port