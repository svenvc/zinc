printing
printContentsOn: stream
	super printContentsOn: stream.
	stream << ' Connection Rejected '.
	address ifNotNil: [
		address do: [ :each | stream print: each ] separatedBy: [ stream nextPut: $. ] ]