private
processByteOrderMark: word
	^ (word = self byteOrderMark or: [ word = self byteOrderMarkLE ])
		ifTrue: [
			word = self byteOrderMarkLE 
				ifTrue: [ self swapEndianness ].
			true ]
		ifFalse: [ false ]