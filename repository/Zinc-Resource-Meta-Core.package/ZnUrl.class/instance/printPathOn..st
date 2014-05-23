printing
printPathOn: stream
	self hasPath ifFalse: [ ^ stream nextPut: $/ ].
 	segments do: [ :each | 
		stream nextPut: $/.
		each == #/
			ifFalse: [ 
				self encode: each on: stream ] ]