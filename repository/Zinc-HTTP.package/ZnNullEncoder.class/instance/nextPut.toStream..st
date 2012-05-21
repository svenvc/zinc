converting
nextPut: character toStream: stream
	| code |
	(code := character charCode) < 256
		ifTrue: [ stream nextPut: code ]
		ifFalse: [ self error: 'Character code outside encoder range' ]