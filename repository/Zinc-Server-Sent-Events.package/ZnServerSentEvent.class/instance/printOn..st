printing
printOn: stream
	| first |
	super printOn: stream.
	stream nextPut: $( .
	first := true.
	#( 'event' 'id' 'retry' 'data' ) 
		do: [ :field |
			(self instVarNamed: field) 
				ifNotNil: [ :value | 
					first ifTrue: [ first := false ] ifFalse: [ stream << ', '  ].
					stream << field; nextPut: $= ; << value ] ].
	stream nextPut: $)