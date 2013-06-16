protocol
readMessage
	"Read and return a complete message String or ByteArray, joining frames. 
	ConnectionClosed is signalled when the other end closes."
	
	| frame bytes isText |
	frame := self readFrame.
	frame isFinal ifTrue: [ ^ frame contents ].
	isText := frame isText.
	bytes := ByteArray new: frame size * 2 streamContents: [ :output |
		frame writeRawBodyOn: output.
		[ 
			frame := self readFrame.
			self assert: frame isContinuation. 
			frame writeRawBodyOn: output.
			frame isFinal ] whileFalse ].
	^ isText 
		ifTrue: [ ZnUTF8Encoder new decodeBytes: bytes ]
		ifFalse: [ bytes ]