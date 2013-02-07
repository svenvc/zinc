writing
writeOn: stream
	| byte size |
	byte := (final ifTrue: [ 128 ] ifFalse: [ 0 ]) + opcode.
	stream nextPut: byte.
	byte := (masked ifTrue: [ 128 ] ifFalse: [ 0 ]).
	(size := self size) < 126
		ifTrue: [ stream nextPut: (byte + size) ]
		ifFalse: [
			size < 65536
				ifTrue: [ stream nextPut: (byte + 126); nextPutAll: (size asByteArrayOfSize: 2) ]
				ifFalse: [
					self assert: size < (2 raisedTo: 31).
					stream nextPut: (byte + 127); nextPutAll: (size asByteArrayOfSize: 8) ] ].
	self writeBodyOfSize: size on: stream 