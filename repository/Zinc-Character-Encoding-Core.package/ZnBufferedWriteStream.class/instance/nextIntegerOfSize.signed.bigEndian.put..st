accessing - bytes
nextIntegerOfSize: numberOfBytes signed: signed bigEndian: bigEndian put: value
	"Assuming the receiver is a stream of bytes, write value as the next integer of size numberOfBytes.
	If bigEndian is true, use network byte order, most significant byte first,
	else use little endian order, least significant byte first.
	If signed is true, encode as a two-complement signed value,
	else encode as a plain unsigned value."

	| unsignedValue |
	unsignedValue := (signed and: [ value negative ])
		ifTrue: [ (1 << (numberOfBytes * 8)) + value ]
		ifFalse: [ value ].
	(unsignedValue between: 0 and: (2 ** (numberOfBytes * 8)) - 1)
		ifFalse: [ DomainError signalFrom: 0 to: (2 ** (numberOfBytes * 8)) - 1 ].
	bigEndian
		ifTrue: [
			numberOfBytes to: 1 by: -1 do: [ :index |
				self nextPut: (unsignedValue byteAt: index) ] ]
		ifFalse: [
			1 to: numberOfBytes do: [ :index |
				self nextPut: (unsignedValue byteAt: index) ] ].
	^ value