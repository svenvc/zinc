private
printAmzHeaders: headers to: stream
	| amzHeaders |
	amzHeaders := OrderedCollection new.
	headers headersDo: [ :key :value |
		(key beginsWith: 'X-Amz')
			ifTrue: [ 
				amzHeaders add: key asLowercase -> value ] ].
	amzHeaders sorted do: [ :each |
		stream 
			nextPutAll: each key; 
			nextPut: $:; 
			nextPutAll: each value; 
			lf ]