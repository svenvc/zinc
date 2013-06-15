reading
readFrom: stream
	| byte size mask |
	(byte := stream next) ifNil: [ ConnectionClosed signal ].
	final := (byte bitAt: 8) = 1.
	opcode := byte bitAnd: 127.
	(byte := stream next) ifNil: [ ConnectionClosed signal ].
	masked := (byte bitAt: 8) = 1.
	size := byte bitAnd: 127.
	size < 126
		ifFalse: [
			size = 126
				ifTrue: [ size := (stream next: 2) asInteger ]
				ifFalse: [ size := (stream next: 8) asInteger ].
			size = 0 ifTrue: [ ConnectionClosed signal ] ].
	self readBodyOfSize: size from: stream