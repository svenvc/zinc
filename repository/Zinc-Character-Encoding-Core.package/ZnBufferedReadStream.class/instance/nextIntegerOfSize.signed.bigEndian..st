accessing - bytes
nextIntegerOfSize: numberOfBytes signed: signed bigEndian: bigEndian
	"Assuming the receiver is a stream of bytes, read the next integer of size numberOfBytes.
	If bigEndian is true, use network byte order, most significant byte first,
	else use little endian order, least significant byte first.
	If signed is true, interpret as a two-complement signed value,
	else interpret as a plain unsigned value."

	| value |
	value := 0.
	bigEndian
		ifTrue: [
			(numberOfBytes - 1) * 8 to: 0 by: -8 do: [ :shift |
				value := value + (self next bitShift: shift) ] ]
		ifFalse: [
			0 to: (numberOfBytes - 1) * 8 by: 8 do: [ :shift |
				value := value + (self next bitShift: shift) ] ].
	^ (signed and: [ (value bitAt: numberOfBytes * 8) = 1 ])
		ifTrue: [ value - (1 << (numberOfBytes * 8)) ]
		ifFalse: [ value ]