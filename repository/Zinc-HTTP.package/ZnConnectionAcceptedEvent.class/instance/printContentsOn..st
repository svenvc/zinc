printing
printContentsOn: stream
	super printContentsOn: stream.
	stream << ' Connection Accepted '.
	address ifNotNil: [
		address do: [ :each | stream print: each ] separatedBy: [ stream nextPut: $. ] ]