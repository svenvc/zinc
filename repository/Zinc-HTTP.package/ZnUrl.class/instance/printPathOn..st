printing
printPathOn: stream
	segments isNil ifTrue: [ ^ stream nextPut: $/ ].
 	segments do: [ :each | 
		stream nextPut: $/.
		each == #/
			ifFalse: [ 
				self encode: each on: stream ] ] 