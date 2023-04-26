accessing
next
	^ self atEnd
		ifTrue: [ nil ]
		ifFalse: [
			position := position + 1.
			stream next ]