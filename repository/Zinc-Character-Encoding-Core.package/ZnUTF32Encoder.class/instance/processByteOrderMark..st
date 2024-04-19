private
processByteOrderMark: codePoint
	^ (codePoint = self byteOrderMark or: [ codePoint = self byteOrderMarkLE ])
		ifTrue: [
			codePoint = self byteOrderMarkLE 
				ifTrue: [ self swapEndianness ].
			true ]
		ifFalse: [ false ]