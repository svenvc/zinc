writing
writeOn: stream
	| encoder  |
	encoder := ZnCharacterWriteStream on: stream.
	#( 'data' 'event' 'id' 'retry' ) do: [ :field |
		(self instVarNamed: field) 
			ifNotNil: [ :value | 
				encoder << field; nextPut: $: ; << value; << String crlf ] ].
	encoder << String crlf; flush.
	ZnCurrentServer value 
		ifNotNil: [ :server | server logServerGeneric: 'Wrote ', self printString ]